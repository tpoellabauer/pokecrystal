; Functions dealing with palettes.

UpdatePalsIfCGB::
; update bgp data from wBGPals2
; update obp data from wOBPals2
; return carry if successful

; check cgb
	ldh a, [hCGB]
	and a
	ret z

UpdateCGBPals::
; return carry if successful
; any pals to update?
	ldh a, [hCGBPalUpdate]
	and a
	ret z
	; fallthrough

DEF PAL_PUSH_COLORS_PER_VBLANK EQU 8

ForceUpdateCGBPals::
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a

; Gen 1 Kanto on Crystal: the grayscale look is baked into every palette at build time
; (constants/grayscale_config.asm, macros/gfx.asm, tools/gbcpal.c) -- wBGPals2/wOBPals2
; already hold the DMG-snapped colors, so there is no runtime color math anymore. The
; hardware push is still done in bounded PAL_PUSH_COLORS_PER_VBLANK-color chunks per
; VBlank, though, tracked by wPalPushCursor (0..64, wraps to 0 to start a fresh push):
; a full 64-color push (128 BGPD/OBPD writes) does not fit the real ~4560-cycle VBlank
; window, and real CGB hardware silently drops writes made past it, leaving palette RAM
; stuck at the cold-boot white default (confirmed on a repro cart). Producers
; (ApplyPals/DmgToCgb*) reset wPalPushCursor to 0 on every retrigger, so a restage is
; always (re-)pushed from the top; each call pushes [0, cursor), so the not-yet-reached
; tail simply keeps whatever hardware already has from the previous completed push
; (already gray) -- never anything wrong, just a few-VBlank pop-in on a fast retrigger.
	ld a, [wPalPushCursor]
	cp 64
	jr nz, .haveCursor
	xor a                ; wrap 64 -> 0: start a fresh push
.haveCursor
	ld e, a               ; e = cursor before this call's chunk (0..64)

	ld a, 64
	sub e
	cp PAL_PUSH_COLORS_PER_VBLANK + 1
	jr c, .gotBatchSize
	ld a, PAL_PUSH_COLORS_PER_VBLANK
.gotBatchSize
	add e
	ld [wPalPushCursor], a ; new cursor (0..64); persists progress

; push BG colors: min(new cursor, 32)
	cp 32 + 1
	jr c, .gotBGCount
	ld a, 32
.gotBGCount
	add a                    ; a = byte count (2 bytes per color)
	ld b, a
	ld hl, wBGPals2
	ld a, BGPI_AUTOINC
	ldh [rBGPI], a
	ld c, LOW(rBGPD)
	ld a, b
	and a
	jr z, .objPush           ; nothing to push yet -> leave BG palette RAM as-is
.bgp
	ld a, [hli]
	ldh [c], a
	dec b
	jr nz, .bgp

; push OBJ colors: max(0, new cursor - 32)
.objPush
	ld a, [wPalPushCursor]
	sub 32
	jr c, .pushDone          ; cursor <= 32 -> no OBJ color to push yet
	jr z, .pushDone
	add a                    ; a = (cursor - 32) * 2 bytes
	ld b, a
	ld hl, wOBPals2
	ld a, OBPI_AUTOINC
	ldh [rOBPI], a
	ld c, LOW(rOBPD)
.obp
	ld a, [hli]
	ldh [c], a
	dec b
	jr nz, .obp
.pushDone

; clear pal update queue -- only once the push has actually reached the full 64
	ld a, [wPalPushCursor]
	cp 64
	jr nz, .notDone
	xor a
	ldh [hCGBPalUpdate], a
.notDone

	pop af
	ldh [rWBK], a

	scf
	ret

DmgToCgbBGPals::
; exists to forego reinserting cgb-converted image data

; input: a -> bgp

	ldh [rBGP], a
	push af

; Don't need to be here if DMG
	ldh a, [hCGB]
	and a
	jr z, .end

	push hl
	push de
	push bc

	ldh a, [rWBK]
	push af

	ld a, BANK(wBGPals2)
	ldh [rWBK], a

; copy & reorder bg pal buffer
	ld hl, wBGPals2 ; to
	ld de, wBGPals1 ; from
; order
	ldh a, [rBGP]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, TRUE
	ldh [hCGBPalUpdate], a
; Gen 1 Kanto on Crystal: restart the chunked push (see ApplyPals, engine/gfx/color.asm).
	xor a
	ld [wPalPushCursor], a

	pop af
	ldh [rWBK], a

	pop bc
	pop de
	pop hl
.end
	pop af
	ret

DmgToCgbObjPals::
; exists to forego reinserting cgb-converted image data

; input: d -> obp1
;        e -> obp2

	ld a, e
	ldh [rOBP0], a
	ld a, d
	ldh [rOBP1], a

	ldh a, [hCGB]
	and a
	ret z

	push hl
	push de
	push bc

	ldh a, [rWBK]
	push af

	ld a, BANK(wOBPals2)
	ldh [rWBK], a

; copy & reorder obj pal buffer
	ld hl, wOBPals2 ; to
	ld de, wOBPals1 ; from
; order
	ldh a, [rOBP0]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, TRUE
	ldh [hCGBPalUpdate], a
; Gen 1 Kanto on Crystal: restart the chunked push (see ApplyPals, engine/gfx/color.asm).
	xor a
	ld [wPalPushCursor], a

	pop af
	ldh [rWBK], a

	pop bc
	pop de
	pop hl
	ret

DmgToCgbObjPal0::
	ldh [rOBP0], a
	push af

; Don't need to be here if not CGB
	ldh a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rWBK], a

	ld hl, wOBPals2 palette 0
	ld de, wOBPals1 palette 0
	ldh a, [rOBP0]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
; Gen 1 Kanto on Crystal: restart the chunked push (see ApplyPals, engine/gfx/color.asm).
	xor a
	ld [wPalPushCursor], a

	pop af
	ldh [rWBK], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret

DmgToCgbObjPal1::
	ldh [rOBP1], a
	push af

	ldh a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rWBK], a

	ld hl, wOBPals2 palette 1
	ld de, wOBPals1 palette 1
	ldh a, [rOBP1]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
; Gen 1 Kanto on Crystal: restart the chunked push (see ApplyPals, engine/gfx/color.asm).
	xor a
	ld [wPalPushCursor], a

	pop af
	ldh [rWBK], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret

CopyPals::
; copy c palettes in order b from de to hl

	push bc
	ld c, PAL_COLORS
.loop
	push de
	push hl

; get pal color
	ld a, b
	maskbits 1 << COLOR_SIZE
; 2 bytes per color
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]

; dest
	pop hl
; write color
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
; next pal color
rept COLOR_SIZE
	srl b
endr
; source
	pop de
; done pal?
	dec c
	jr nz, .loop

; de += 8 (next pal)
	ld a, PAL_SIZE
	add e
	jr nc, .ok
	inc d
.ok
	ld e, a

; how many more pals?
	pop bc
	dec c
	jr nz, CopyPals
	ret

ClearVBank1::
	ldh a, [hCGB]
	and a
	ret z

	ld a, 1
	ldh [rVBK], a

	ld hl, STARTOF(VRAM)
	ld bc, SIZEOF(VRAM)
	xor a
	call ByteFill

	ld a, 0
	ldh [rVBK], a
	ret

GSReloadPalettes:: ; dummied out
	ret

ReloadSpritesNoPalettes::
	ldh a, [hCGB]
	and a
	ret z
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a
	ld hl, wBGPals2
	ld bc, (8 palettes) + (2 palettes)
	xor a
	call ByteFill
	pop af
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	call DelayFrame
	ret

LoadOverworldAttrmapPals::
	homecall _LoadOverworldAttrmapPals
	ret

ScrollBGMapPalettes::
	homecall _ScrollBGMapPalettes
	ret
