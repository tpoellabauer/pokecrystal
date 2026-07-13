; GetOptionPointer.Pointers indexes
	const_def
	const OPT_TEXT_SPEED    ; 0
	const OPT_BATTLE_SCENE  ; 1
	const OPT_BATTLE_STYLE  ; 2
	const OPT_SOUND         ; 3
	const OPT_PRINT         ; 4
	const OPT_MENU_ACCOUNT  ; 5
	const OPT_FRAME         ; 6
	const OPT_MUSIC         ; 7 ; Gen 1 Kanto on Crystal: original vs ported Red soundtrack
	const OPT_CANCEL        ; 8
DEF NUM_OPTIONS EQU const_value ; 9

; Gen 1 Kanto on Crystal: the options list no longer fits in one screen (a 9th
; option was added), so the menu scrolls -- only VISIBLE_OPTIONS are shown at once
; and the view follows the cursor, like Red's item list. Each option still occupies
; two rows (a label row and, one below it, its value); OPTION_ROW_HEIGHT is that 2.
DEF VISIBLE_OPTIONS EQU 7
DEF OPTION_ROW_HEIGHT EQU 2
DEF OPTIONS_TOP_ROW EQU 2 ; label row of the first visible option
DEF MAX_OPTIONS_SCROLL EQU NUM_OPTIONS - VISIBLE_OPTIONS

_Option:
; BUG: Options menu fails to clear joypad state on initialization (see docs/bugs_and_glitches.md)
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox

	xor a
	ld [wJumptableIndex], a
	ld [wOptionsScrollPosition], a
	call DrawOptionsScreen

; Leave hBGMapMode enabled so per-frame wTilemap->VRAM auto-transfer stays on: the
; in-place value redraws (e.g. toggling an option with left/right) write to wTilemap
; and rely on this to reach the screen. DrawOptionsScreen turns it off around its own
; multi-write full redraw to avoid tearing, then the caller re-enables it here.
	ld a, 1
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and PAD_START | PAD_B
	jr nz, .ExitOptions
	call OptionsControl ; up/down; carry if the cursor moved
	jr c, .moved
	call GetOptionPointer ; left/right on the selected option; carry if Cancel+A
	jr c, .ExitOptions
	call Options_UpdateCursorPosition
	jr .delay

.moved
; the cursor moved (and possibly scrolled the view): repaint the whole list
	call UpdateOptionScroll
	call DrawOptionsScreen
	ld a, 1
	ldh [hBGMapMode], a ; re-enable auto-transfer (see the init block above)
	call WaitBGMap

.delay
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	ret

UpdateOptionScroll:
; Recompute the scroll offset so the selected option (wJumptableIndex) stays on
; screen, centered where possible. Returns carry set if the offset changed.
; scroll = clamp(cursor - VISIBLE_OPTIONS / 2, 0, MAX_OPTIONS_SCROLL)
	ld a, [wJumptableIndex]
	sub VISIBLE_OPTIONS / 2
	jr nc, .nonneg
	xor a
.nonneg
	cp MAX_OPTIONS_SCROLL + 1
	jr c, .clamped
	ld a, MAX_OPTIONS_SCROLL
.clamped
	ld hl, wOptionsScrollPosition
	cp [hl]
	jr z, .unchanged
	ld [hl], a
	scf
	ret

.unchanged
	and a
	ret

DrawOptionsScreen:
; Repaint the visible slice of the options list: label + value for each of the
; VISIBLE_OPTIONS options starting at wOptionsScrollPosition, plus scroll arrows.
	xor a
	ldh [hBGMapMode], a ; write only to wTilemap; the caller transfers afterward
	call ClearOptionsArea
	ld a, [wJumptableIndex]
	push af ; preserve the real selection across the per-option draw loop

	ld c, 0 ; slot within the visible window (0 .. VISIBLE_OPTIONS-1)
.loop
	ld a, [wOptionsScrollPosition]
	add c
	cp NUM_OPTIONS
	jr nc, .done ; fewer than VISIBLE_OPTIONS options remain
	ld [wJumptableIndex], a ; the option to draw (value routines read this)

	push bc
	call GetOptionLabel     ; de = label string for wJumptableIndex
	call OptionsLabelCoord ; hl = label coord (preserves de)
	call PlaceString
	xor a
	ldh [hJoyLast], a       ; no input -> value routine only draws
	call GetOptionPointer   ; draw this option's value
	pop bc

	inc c
	ld a, c
	cp VISIBLE_OPTIONS
	jr c, .loop
.done
	pop af
	ld [wJumptableIndex], a ; restore the real selection

	call DrawOptionsArrows
	call Options_UpdateCursorPosition
	ret

ClearOptionsArea:
; Blank the interior rows the options occupy (rows 1..SCREEN_HEIGHT-2, cols 1..).
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.row
	push hl
	ld b, SCREEN_WIDTH - 2
.col
	ld [hl], ' '
	inc hl
	dec b
	jr nz, .col
	pop hl
	add hl, de
	dec c
	jr nz, .row
	ret

DrawOptionsArrows:
; A ▲ at the top-right when there's more above, ▼ at the bottom-right when there's
; more below -- the same affordance Red's item list uses.
	ld a, [wOptionsScrollPosition]
	and a
	jr z, .no_up
	hlcoord SCREEN_WIDTH - 2, 1
	ld [hl], '▲'
.no_up
	ld a, [wOptionsScrollPosition]
	cp MAX_OPTIONS_SCROLL
	jr nc, .no_down
	hlcoord SCREEN_WIDTH - 2, SCREEN_HEIGHT - 2
	ld [hl], '▼'
.no_down
	ret

OptionsLabelCoord:
; hl = tilemap coord of the label row (col 2) for the current wJumptableIndex,
; accounting for the scroll offset. Row = OPTIONS_TOP_ROW + slot*OPTION_ROW_HEIGHT.
	ld a, [wJumptableIndex]
	ld hl, wOptionsScrollPosition
	sub [hl]
	call .SlotToRowHL
	inc hl ; wTilemap col 1 -> col 2
	inc hl
	ret

.SlotToRowHL:
; a = visible slot; returns hl = wTilemap + (OPTIONS_TOP_ROW + a*OPTION_ROW_HEIGHT) * SCREEN_WIDTH
	add a ; * OPTION_ROW_HEIGHT (2)
	add OPTIONS_TOP_ROW
	ld hl, wTilemap
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ret

OptionsValueCoordHL:
; hl = tilemap coord for the *value* of the current wJumptableIndex (col 11, one
; row below its label). Used by every option's value-printing routine so values
; land at the right scrolled position.
	ld a, [wJumptableIndex]
	ld hl, wOptionsScrollPosition
	sub [hl]
	call OptionsLabelCoord.SlotToRowHL
	ld bc, SCREEN_WIDTH + 11 ; next row, value column (bc, not de: callers stage
	add hl, bc               ; their value string in de before calling here)
	ret

GetOptionLabel:
; de = label string for the option index in wJumptableIndex
	ld a, [wJumptableIndex]
	add a
	ld e, a
	ld d, 0
	ld hl, OptionLabels
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

OptionLabels:
; entries correspond to OPT_* constants
	dw .TextSpeed
	dw .BattleScene
	dw .BattleStyle
	dw .Sound
	dw .Print
	dw .MenuAccount
	dw .Frame
	dw .Music
	dw .Cancel

.TextSpeed:   db "TEXT SPEED@"
.BattleScene: db "BATTLE SCENE@"
.BattleStyle: db "BATTLE STYLE@"
.Sound:       db "SOUND@"
.Print:       db "PRINT@"
.MenuAccount: db "MENU ACCOUNT@"
.Frame:       db "FRAME@"
.Music:       db "MUSIC@"
.Cancel:      db "CANCEL@"

GetOptionPointer:
	jumptable .Pointers, wJumptableIndex

.Pointers:
; entries correspond to OPT_* constants
	dw Options_TextSpeed
	dw Options_BattleScene
	dw Options_BattleStyle
	dw Options_Sound
	dw Options_Print
	dw Options_MenuAccount
	dw Options_Frame
	dw Options_Music
	dw Options_Cancel

	const_def
	const OPT_TEXT_SPEED_FAST ; 0
	const OPT_TEXT_SPEED_MED  ; 1
	const OPT_TEXT_SPEED_SLOW ; 2

Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_TEXT_SPEED_SLOW
	jr c, .Increase
	ld c, OPT_TEXT_SPEED_FAST - 1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_TEXT_SPEED_SLOW + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call OptionsValueCoordHL
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_TEXT_SPEED_* constants
	dw .Fast
	dw .Mid
	dw .Slow

.Fast: db "FAST@"
.Mid:  db "MID @"
.Slow: db "SLOW@"

GetTextSpeed:
; converts TEXT_DELAY_* value in a to OPT_TEXT_SPEED_* value in c,
; with previous/next TEXT_DELAY_* values in d/e
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_SLOW
	jr z, .slow
	cp TEXT_DELAY_FAST
	jr z, .fast
	; none of the above
	ld c, OPT_TEXT_SPEED_MED
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret

.slow
	ld c, OPT_TEXT_SPEED_SLOW
	lb de, TEXT_DELAY_MED, TEXT_DELAY_FAST
	ret

.fast
	ld c, OPT_TEXT_SPEED_FAST
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_MED
	ret

Options_BattleScene:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff

.LeftPressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOff
	jr .ToggleOn

.NonePressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.ToggleOn:
	res BATTLE_SCENE, [hl]
	ld de, .On
	jr .Display

.ToggleOff:
	set BATTLE_SCENE, [hl]
	ld de, .Off

.Display:
	call OptionsValueCoordHL
	call PlaceString
	and a
	ret

.On:  db "ON @"
.Off: db "OFF@"

Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleShift
	jr .ToggleSet

.LeftPressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleSet
	jr .ToggleShift

.NonePressed:
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleSet

.ToggleShift:
	res BATTLE_SHIFT, [hl]
	ld de, .Shift
	jr .Display

.ToggleSet:
	set BATTLE_SHIFT, [hl]
	ld de, .Set

.Display:
	call OptionsValueCoordHL
	call PlaceString
	and a
	ret

.Shift: db "SHIFT@"
.Set:   db "SET  @"

Options_Sound:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit STEREO, [hl]
	jr nz, .SetMono
	jr .SetStereo

.LeftPressed:
	bit STEREO, [hl]
	jr z, .SetStereo
	jr .SetMono

.NonePressed:
	bit STEREO, [hl]
	jr nz, .ToggleStereo
	jr .ToggleMono

.SetMono:
	res STEREO, [hl]
	call RestartMapMusic

.ToggleMono:
	ld de, .Mono
	jr .Display

.SetStereo:
	set STEREO, [hl]
	call RestartMapMusic

.ToggleStereo:
	ld de, .Stereo

.Display:
	call OptionsValueCoordHL
	call PlaceString
	and a
	ret

.Mono:   db "MONO  @"
.Stereo: db "STEREO@"

Options_Music:
; Gen 1 Kanto on Crystal: choose between the original Crystal audio and the ported
; Red music+sfx (wOptions MUSIC_SOURCE bit; see audio/engine.asm _PlayMusic/GetSFXHeader).
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .Toggle
	bit B_PAD_RIGHT, a
	jr nz, .Toggle
	jr .Display

.Toggle:
	ld a, [hl]
	xor 1 << MUSIC_SOURCE
	ld [hl], a
	call RestartMapMusic

.Display:
	bit MUSIC_SOURCE, [hl]
	jr nz, .red
	ld de, .Original
	jr .print
.red
	ld de, .Red
.print
	call OptionsValueCoordHL
	call PlaceString
	and a
	ret

.Original: db "CRYSTAL@"
.Red:      db "RED    @"

	const_def
	const OPT_PRINT_LIGHTEST ; 0
	const OPT_PRINT_LIGHTER  ; 1
	const OPT_PRINT_NORMAL   ; 2
	const OPT_PRINT_DARKER   ; 3
	const OPT_PRINT_DARKEST  ; 4

Options_Print:
	call GetPrinterSetting
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	ld a, c
	cp OPT_PRINT_DARKEST
	jr c, .Increase
	ld c, OPT_PRINT_LIGHTEST - 1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_PRINT_DARKEST + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld [wGBPrinterBrightness], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call OptionsValueCoordHL
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_PRINT_* constants
	dw .Lightest
	dw .Lighter
	dw .Normal
	dw .Darker
	dw .Darkest

.Lightest: db "LIGHTEST@"
.Lighter:  db "LIGHTER @"
.Normal:   db "NORMAL  @"
.Darker:   db "DARKER  @"
.Darkest:  db "DARKEST @"

GetPrinterSetting:
; converts GBPRINTER_* value in a to OPT_PRINT_* value in c,
; with previous/next GBPRINTER_* values in d/e
	ld a, [wGBPrinterBrightness]
	and a
	jr z, .IsLightest
	cp GBPRINTER_LIGHTER
	jr z, .IsLight
	cp GBPRINTER_DARKER
	jr z, .IsDark
	cp GBPRINTER_DARKEST
	jr z, .IsDarkest
	; none of the above
	ld c, OPT_PRINT_NORMAL
	lb de, GBPRINTER_LIGHTER, GBPRINTER_DARKER
	ret

.IsLightest:
	ld c, OPT_PRINT_LIGHTEST
	lb de, GBPRINTER_DARKEST, GBPRINTER_LIGHTER
	ret

.IsLight:
	ld c, OPT_PRINT_LIGHTER
	lb de, GBPRINTER_LIGHTEST, GBPRINTER_NORMAL
	ret

.IsDark:
	ld c, OPT_PRINT_DARKER
	lb de, GBPRINTER_NORMAL, GBPRINTER_DARKEST
	ret

.IsDarkest:
	ld c, OPT_PRINT_DARKEST
	lb de, GBPRINTER_DARKER, GBPRINTER_LIGHTEST
	ret

Options_MenuAccount:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit MENU_ACCOUNT, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res MENU_ACCOUNT, [hl]
	ld de, .Off
	jr .Display

.ToggleOn:
	set MENU_ACCOUNT, [hl]
	ld de, .On

.Display:
	call OptionsValueCoordHL
	call PlaceString
	and a
	ret

.Off: db "OFF@"
.On:  db "ON @"

Options_Frame:
	ld hl, wTextboxFrame
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr nz, .RightPressed
	jr .Display

.RightPressed:
	ld a, [hl]
	inc a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a

.Save:
	maskbits NUM_FRAMES
	ld [hl], a

.Display:
	call UpdateFrame
	and a
	ret

UpdateFrame:
; Draw "TYPE<n>" as the FRAME option's value, at its (scrolled) value position.
; PlaceString returns bc pointing just past the printed "TYPE" (hl is restored to
; the start), so the frame number goes at bc.
	call OptionsValueCoordHL
	ld de, .TypeString
	call PlaceString
	ld h, b
	ld l, c
	ld a, [wTextboxFrame]
	add '1'
	ld [hl], a
	call LoadFontsExtra
	ret

.TypeString: db "TYPE@"

Options_Cancel:
	ldh a, [hJoyPressed]
	and PAD_A
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret

OptionsControl:
; Move the selection up/down through all NUM_OPTIONS options (wrapping), returning
; carry when it moved so the caller repaints. Scrolling is derived separately from
; the new cursor position (see UpdateOptionScroll).
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp PAD_DOWN
	jr z, .DownPressed
	cp PAD_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp NUM_OPTIONS - 1 ; last option index
	jr nz, .Increase
	ld [hl], 0 ; wrap to first option
	scf
	ret

.Increase:
	inc [hl]
	scf
	ret

.UpPressed:
	ld a, [hl]
	and a
	jr nz, .Decrease
	ld [hl], NUM_OPTIONS ; decrements to the last option index

.Decrease:
	dec [hl]
	scf
	ret

Options_UpdateCursorPosition:
; Clear the cursor column across the visible rows, then draw ▶ at the selected
; option's (scrolled) label row.
	hlcoord 1, OPTIONS_TOP_ROW
	ld de, OPTION_ROW_HEIGHT * SCREEN_WIDTH
	ld c, VISIBLE_OPTIONS
.loop
	ld [hl], ' '
	add hl, de
	dec c
	jr nz, .loop
	ld a, [wJumptableIndex]
	ld hl, wOptionsScrollPosition
	sub [hl]
	call OptionsLabelCoord.SlotToRowHL ; hl = col 0 of the label row
	inc hl ; cursor column (col 1)
	ld [hl], '▶'
	ret
