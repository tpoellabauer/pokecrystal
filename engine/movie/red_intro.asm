; Gen 1 Kanto on Crystal — ported Gen 1 boot cinematic (VANILLA_RED only).
;
; Faithful-in-content, adapted-in-implementation port of the Red/Blue boot sequence:
;   pokeredDisassembly/engine/movie/{splash,intro,title,title2}.asm
;   pokeredDisassembly/engine/movie/oak_speech/{oak_speech,oak_speech2}.asm
;
; Called from IntroSequence (engine/menus/intro_menu.asm, gated `IF VANILLA_RED`) and from
; NewGame (same file) in place of Crystal's own SplashScreen/CrystalIntro/title and OakSpeech.
;
; Adaptation notes (why this isn't a byte-for-byte transcription):
; - Gen1's DMG palette API (RunPaletteCommand/ldpal/GBFadeOutToWhite) doesn't exist on the GBC-
;   native pokecrystal engine; every fade uses the project's existing DmgToCgbBGPals/ObjPals and
;   RotateThree/FourPalettesLeft/Right (the same primitives pokecrystal's own splash/title/OakSpeech
;   already use for identical narrative beats).
; - Gen1's CheckForUserInterruption (wait N frames, abort early on any button) is reimplemented
;   locally as RedIntro_WaitFrames using this project's JoyTextDelay/hJoyLast idiom (the same one
;   pokecrystal's own SplashScreen already uses).
; - Gengar/Nidorino: the ported gengar.2bpp/red_nidorino_*.2bpp + gengar_*.tilemap are rebuilt
;   byte-identical to pokeredDisassembly's committed originals (verified by this port's byte-diff
;   gate), and placed using the *same* algorithms as pokered's InitIntroNidorinoOAM/
;   UpdateIntroNidorinoOAM/CopyTileIDsFromList (base tile id 0), so the tile-id arithmetic is
;   correct by construction regardless of the RGBGFX --columns/--remove-duplicates tile ordering.
; - Simplifications made because this task is STATIC-VERIFICATION-ONLY (no PyBoy/screenshot check
;   is available to confirm on-screen correctness of pixel-precise raster effects) — see
;   docs/PORT_BACKLOG.md §2 for the full list and rationale:
;     * the copyright/GAME FREAK mascot splash keeps its mascot and three shooting-star tiles static,
;       dropping only their animation, and drops Gengar's progressive multi-stage BG reveal;
;     * the title screen drops the attract-mode random-mon showcase and the rLY-raster-split version
;       text wipe, keeping the logo bounce-in (which pokecrystal's own title already does the same
;       way) and a static "RED VERSION" caption;
;     * no new SFX assets were ported for the per-beat Nidorino hip/hop/lunge cries or the title
;       screen's crash/whoosh stings (audio-music-skill territory, out of scope here); the existing
;       MUSIC_TITLE (-> RedMusic's Music_RedTitleScreen when MUSIC_SOURCE is set) is reused for the
;       title screen; the Nidorino/Gengar battle and splash play without a dedicated music cue since
;       Gen1's MUSIC_INTRO_BATTLE was never part of the original 46-track RedMusic port.
;   None of this has been confirmed visually correct on real hardware or in an emulator — this is a
;   known limitation of the static-only verification available for this change.

; ---------------------------------------------------------------------------
; Entry point (farcall'd from IntroSequence under VANILLA_RED).
; Splash -> Nidorino/Gengar battle -> title screen. Returns once the player presses Start/A.
RedIntroSequence::
	call RedSplashScreen
	call RedIntroBattle
	call RedTitleScreen
	ret

; ---------------------------------------------------------------------------
; Copyright screen + GAME FREAK PRESENTS bumper (ported gfx, static display).
RedSplashScreen:
; This engine leaves the window layer permanently enabled in LCDC (LCDC_DEFAULT,
; home/init.asm) and hides it purely via hWY = SCREEN_HEIGHT_PX (off past the visible
; 144 rows); hWY = 0 instead makes the (blank) window cover the whole screen, hiding
; the background underneath -- confirmed via PyBoy: every frame of the intro rendered
; a uniform blank screen until this was fixed.
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	call ClearSprites
	call ClearBGPalettes
	call ClearTilemap
	call ClearScreen

; Gen 1 Kanto on Crystal: DmgToCgbBGPals/ObjPals (used throughout this file) only
; *reorder* whatever is already staged in wBGPals1/wOBPals1 -- they don't define a
; palette from scratch. Without a preceding GetSGBLayout to populate that staging
; area, wBGPals1 stays at its post-boot default and every beat below renders as a
; uniform blank screen (confirmed via PyBoy: this was the actual bug, not a tile/
; tilemap/window issue -- those were all already correct). SetDefaultBGPAndOBP is
; the DmgToCgbBGPals/ObjPals pair below, done for us; pairing it with GetSGBLayout
; matches pokecrystal's own SplashScreen (engine/movie/splash.asm).
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetDefaultBGPAndOBP

; Red's copyright uses the special tiles from copyright.2bpp plus gamefreak_inc.2bpp
; as three font rows. Keep tile IDs and layout from LoadCopyrightTiles exactly.
	ld de, RedCopyrightGFX
	ld hl, vTiles2 tile $60
	lb bc, BANK(RedCopyrightGFX), RED_COPYRIGHT_TILES
	call Get2bpp
	ld de, RedGameFreakIncGFX
	ld hl, vTiles2 tile ($60 + RED_COPYRIGHT_TILES)
	lb bc, BANK(RedGameFreakIncGFX), RED_GAMEFREAK_INC_TILES
	call Get2bpp
	hlcoord 2, 7
	ld de, RedCopyrightText
	call PlaceString
	call WaitBGMap
	ld c, 90
	call RedIntro_WaitFrames
	call ClearTilemap
	call ClearScreen

; English Red never displays the unused Japanese PRESENTS wordmark. Display its actual
; 2x3 mascot and three small falling-star tiles statically instead.
	ld de, RedGameFreakLogoGFX
	ld hl, vTiles0
	lb bc, BANK(RedGameFreakLogoGFX), RED_GAMEFREAK_LOGO_TILES
	call Get2bpp
	ld de, RedFallingStarGFX
	ld hl, vTiles0 tile RED_GAMEFREAK_LOGO_TILES
	lb bc, BANK(RedFallingStarGFX), RED_FALLING_STAR_TILES
	call Get2bpp
	ld hl, RedGameFreakMascotOAM
	ld de, wShadowOAM
	ld bc, RedGameFreakMascotOAMEnd - RedGameFreakMascotOAM
	call CopyBytes

	ld de, SFX_GAME_FREAK_PRESENTS
	call PlaySFX
	call WaitBGMap
	ld c, 80
	call RedIntro_WaitFrames
	call ClearTilemap
	call ClearScreen
	call ClearSprites
	ret

; ---------------------------------------------------------------------------
; Nidorino vs. Gengar battle-intro animation (ported choreography from PlayIntroScene).
; Gengar is placed on the BG (matching Gen1's own BG/sprite split, and required by the
; 40-OAM-sprite hardware budget once Nidorino's 36-sprite 6x6 grid is also on screen).
; Nidorino is animated via OAM using the exact original per-frame pixel-offset tables.
RedIntroBattle:
	call ClearTilemap
	call ClearScreen
	call ClearSprites
	call ClearBGPalettes

; See RedSplashScreen's comment above: GetSGBLayout must run before DmgToCgbBGPals/
; ObjPals populate wBGPals1/wOBPals1, or these reorder stale/blank data.
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals

; Load Gengar (BG, vTiles2) and all 3 Nidorino animation frames (OAM, vTiles0) up front,
; exactly like Gen1's LoadIntroGraphics.
	ld de, RedGengarGFX
	ld hl, vTiles2
	lb bc, BANK(RedGengarGFX), RED_GENGAR_TILES
	call Get2bpp

	ld de, RedNidorino1GFX
	ld hl, vTiles0
	lb bc, BANK(RedNidorino1GFX), RED_NIDORINO_FRAME_TILES
	call Get2bpp
	ld de, RedNidorino2GFX
	ld hl, vTiles0 tile RED_NIDORINO_FRAME_TILES
	lb bc, BANK(RedNidorino2GFX), RED_NIDORINO_FRAME_TILES
	call Get2bpp
	ld de, RedNidorino3GFX
	ld hl, vTiles0 tile (RED_NIDORINO_FRAME_TILES * 2)
	lb bc, BANK(RedNidorino3GFX), RED_NIDORINO_FRAME_TILES
	call Get2bpp

; Place Gengar's first pose (base tile id 0, matching CopyTileIDsFromList_ZeroBaseTileID).
	ld hl, RedGengarTilemap1
	call RedIntro_PlaceGengar
	call WaitBGMap

; Resting position (skips Gen1's IntroMoveMon camera-pan slide-in ANIMATION -- see file
; header -- but keeps its net FRAMING: over its 40 steps, Gen1's slide accumulates +80
; onto both Nidorino's baseline X and the BG scroll (hSCX), which is what puts Nidorino
; right-of-center facing a left-of-center Gengar. Dropping the animation but not this
; offset left Nidorino scrunched at the far-left screen edge (X 0-48) while Gengar, with
; hSCX still 0, sat pinned to the right edge -- confirmed via PyBoy OAM/hSCX inspection
; (docs/PORT_BACKLOG.md #2). The raise/slash beats' own hSCX shake deltas (MOVE_GENGAR_
; LEFT/RIGHT in Gen1) net to zero across the sequence and stay cut; only this one-time
; slide-in offset actually affects final positioning.
	ld a, 80
	ldh [hSCX], a
	xor a
	ld [wRedIntroNidorinoBaseTile], a
	ld a, 80
	ld [wRedIntroBaseCoordX], a
	ld a, 80
	ld [wRedIntroBaseCoordY], a
	lb bc, 6, 6
	call RedIntro_InitNidorinoOAM
	; Init consumes the seeded display coordinates. Animation tables are incremental
	; offsets, as in Gen1 after its omitted 40-step slide-in, so reset them before
	; RedIntro_UpdateNidorinoOAM starts adding them to existing OAM positions.
	xor a
	ld [wRedIntroBaseCoordX], a
	ld [wRedIntroBaseCoordY], a

	ld c, 40
	call RedIntro_WaitFrames
	ret c

; Nidorino hops in place a couple of times.
	xor a
	ld [wRedIntroNidorinoBaseTile], a
	ld de, RedIntroNidorinoAnim1
	call RedIntro_AnimateNidorino
	ld de, RedIntroNidorinoAnim2
	call RedIntro_AnimateNidorino
	ld c, 20
	call RedIntro_WaitFrames
	ret c

	ld de, RedIntroNidorinoAnim1
	call RedIntro_AnimateNidorino
	ld de, RedIntroNidorinoAnim2
	call RedIntro_AnimateNidorino
	ld c, 30
	call RedIntro_WaitFrames
	ret c

; Gengar raises up (second pose).
	ld hl, RedGengarTilemap2
	call RedIntro_PlaceGengar
	call WaitBGMap
	ld c, 30
	call RedIntro_WaitFrames
	ret c

; Gengar slashes (third pose); Nidorino reels back and lunges.
	ld hl, RedGengarTilemap3
	call RedIntro_PlaceGengar
	call WaitBGMap
	ld a, RED_NIDORINO_FRAME_TILES * 2
	ld [wRedIntroNidorinoBaseTile], a
	ld de, RedIntroNidorinoAnim3
	call RedIntro_AnimateNidorino
	ld c, 30
	call RedIntro_WaitFrames
	ret c

	ld hl, RedGengarTilemap1
	call RedIntro_PlaceGengar
	call WaitBGMap
	ld c, 40
	call RedIntro_WaitFrames
	ret c

	xor a
	ld [wRedIntroNidorinoBaseTile], a
	ld de, RedIntroNidorinoAnim4
	call RedIntro_AnimateNidorino
	ld de, RedIntroNidorinoAnim5
	call RedIntro_AnimateNidorino
	ld c, 20
	call RedIntro_WaitFrames
	ret c

	ld a, RED_NIDORINO_FRAME_TILES * 2
	ld [wRedIntroNidorinoBaseTile], a
	ld de, RedIntroNidorinoAnim6
	call RedIntro_AnimateNidorino
	ld de, RedIntroNidorinoAnim7
	call RedIntro_AnimateNidorino
	ld c, 40
	call RedIntro_WaitFrames

	call RotateThreePalettesRight
	call ClearSprites
	call ClearTilemap
	call ClearScreen
	ret

; hl = 49-byte tile-id table (7x7, base id 0). Places it at BG coord (13, 7), matching
; Gen1's `IntroCopyTiles: hlcoord 13, 7`. de is clobbered.
RedIntro_PlaceGengar:
	push hl
	hlcoord 13, 7
	ld d, h
	ld e, l
	pop hl
	ld b, 7
.row
	push bc
	ld bc, 7
	call CopyBytes ; hl (source) += 7; de (dest, within-row) += 7
	ld a, e
	add SCREEN_WIDTH - 7 ; skip to column 13 of the next BG row
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	pop bc
	dec b
	jr nz, .row
	ret

; d,e = pixel-offset pair; ANIMATION_END (80) terminates. Ported verbatim from
; AnimateIntroNidorino: each step moves Nidorino by (dy, dx) and waits 5 frames. Matches
; the original in not checking for a button-press interruption mid-sequence (only the
; per-beat waits in RedIntroBattle do).
RedIntro_AnimateNidorino:
.loop
	ld a, [de]
	cp RED_ANIMATION_END
	ret z
	ld [wRedIntroBaseCoordY], a
	inc de
	ld a, [de]
	ld [wRedIntroBaseCoordX], a
	push de
	ld c, 6 * 6
	call RedIntro_UpdateNidorinoOAM
	ld c, 5
	call RedIntro_WaitFrames
	pop de
	inc de
	jr .loop

RedIntro_UpdateNidorinoOAM:
	ld hl, wShadowOAM
	ld a, [wRedIntroNidorinoBaseTile]
	ld d, a
.loop
	ld a, [wRedIntroBaseCoordY]
	add [hl]
	ld [hli], a ; Y
	ld a, [wRedIntroBaseCoordX]
	add [hl]
	ld [hli], a ; X
	ld a, d
	ld [hli], a ; tile
	inc hl
	inc d
	dec c
	jr nz, .loop
	ret

; bc = grid (rows, cols), builds the initial 6x6 Nidorino OAM block.
RedIntro_InitNidorinoOAM:
	ld hl, wShadowOAM
	ld d, 0
.loop
	push bc
	ld a, [wRedIntroBaseCoordY]
	ld e, a
.innerLoop
	ld a, e
	add 8
	ld e, a
	ld [hli], a ; Y
	ld a, [wRedIntroBaseCoordX]
	ld [hli], a ; X
	ld a, d
	ld [hli], a ; tile
	ld a, OAM_PRIO
	ld [hli], a ; attributes
	inc d
	dec c
	jr nz, .innerLoop
	ld a, [wRedIntroBaseCoordX]
	add 8
	ld [wRedIntroBaseCoordX], a
	pop bc
	dec b
	jr nz, .loop
	ret

; ---------------------------------------------------------------------------
; Title screen: Nintendo/GAME FREAK small logo, POKEMON logo (with the same bounce-in
; scroll pokecrystal's own TitleScreenEntrance already uses), player + pokeball, "RED
; VERSION" caption, then waits for Start/A.
RedTitleScreen:
	call ClearSprites
	call ClearBGPalettes
	call ClearTilemap
	call ClearScreen

; See RedSplashScreen's comment above.
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetDefaultBGPAndOBP

	xor a
	ldh [hSCX], a
	ld a, 64
	ldh [hSCY], a

; POKEMON logo + "GAME FREAK inc." caption share vTiles2 (BG, base tile id 0 -- the same
; signed-addressing convention Intro_PrepTrainerPic/PrepMonFrontpic already rely on
; elsewhere in this codebase). The player sprite goes in vTiles0 (OAM tiles are always
; unsigned-addressed from tile 0, independent of the BG addressing mode).
	ld de, RedPokemonLogoGFX
	ld hl, vTiles2
	lb bc, BANK(RedPokemonLogoGFX), RED_POKEMON_LOGO_TILES
	call Get2bpp
	ld de, RedGameFreakIncGFX
	ld hl, vTiles2 tile RED_POKEMON_LOGO_TILES
	lb bc, BANK(RedGameFreakIncGFX), RED_GAMEFREAK_INC_TILES
	call Get2bpp
	ld de, RedPlayerGFX
	ld hl, vTiles0
	lb bc, BANK(RedPlayerGFX), RED_PLAYER_TILES
	call Get2bpp

; POKEMON logo, 7 rows x 16 cols, sequential placement (pokemon_logo.2bpp has no
; --columns/--remove-duplicates reorder flag in pokered's own Makefile either, so a plain
; row-major placement reproduces the source image).
	hlcoord 2, 3
	xor a
	ld b, 7
.logo_row
	push hl
	ld c, 16
.logo_col
	ld [hli], a
	inc a
	dec c
	jr nz, .logo_col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .logo_row

; "GAME FREAK inc." caption underneath (single row, tile ids continue after the logo).
	hlcoord 2, 17
	ld a, RED_POKEMON_LOGO_TILES
	ld b, RED_GAMEFREAK_INC_TILES
.caption_loop
	ld [hli], a
	inc a
	dec b
	jr nz, .caption_loop

; Player + pokeball sprite (static; ported OAM layout, 7 rows x 5 cols like DrawPlayerCharacter).
	ld hl, wShadowOAM
	lb de, $60, $5a
	ld b, 7
	xor a
	ld [wRedIntroTitleTile], a
.player_row
	push de
	ld c, 5
.player_col
	ld a, d
	ld [hli], a ; Y
	ld a, e
	ld [hli], a ; X
	ld a, e
	add 8
	ld e, a
	ld a, [wRedIntroTitleTile]
	ld [hli], a ; tile
	inc a
	ld [wRedIntroTitleTile], a
	inc hl
	dec c
	jr nz, .player_col
	pop de
	ld a, d
	add 8
	ld d, a
	dec b
	jr nz, .player_row

; Bounce the logo in from off-screen, same idiom as pokecrystal's own TitleScreenEntrance.
	ld b, 16
.bounce
	ld a, b
	and a
	jr z, .bounce_done
	dec b
	ldh a, [hSCY]
	sub 4
	ldh [hSCY], a
	ld c, 2
	call RedIntro_WaitFrames
	jr .bounce

.bounce_done
	xor a
	ldh [hSCY], a

	hlcoord 2, 9
	ld de, RedVersionText
	call PlaceString

	ld de, MUSIC_TITLE
	call PlayMusic

.wait_for_start
	call DelayFrame
	call GetJoypad
	ldh a, [hJoyDown]
	and PAD_START | PAD_A
	jr z, .wait_for_start

	call ClearSprites
	call ClearBGPalettes
	call ClearTilemap
	call ClearScreen
	ret

RedVersionText:
	db "RED VERSION@"

; Tile IDs $60-$7b are staged at vTiles2 by RedSplashScreen. This is Red's original
; three-line tile layout, not a 19-tile sequential strip.
RedCopyrightText:
	db   $60,$61,$62,$61,$63,$61,$64,$7f,$65,$66,$67,$68,$69,$6a
	next $60,$61,$62,$61,$63,$61,$64,$7f,$6b,$6c,$6d,$6e,$6f,$70,$71,$72
	next $60,$61,$62,$61,$63,$61,$64,$7f,$73,$74,$75,$76,$77,$78,$79,$7a,$7b
	db "@"

; Static English-Red mascot layout, based on GameFreakLogoOAMData. Three star tiles
; stand in for its animated shooting-star/falling-star flourish.
RedGameFreakMascotOAM:
	dbsprite 10,  9, 0, 0, 0, 0
	dbsprite 11,  9, 0, 0, 1, 0
	dbsprite 10, 10, 0, 0, 2, 0
	dbsprite 11, 10, 0, 0, 3, 0
	dbsprite 10, 11, 0, 0, 4, 0
	dbsprite 11, 11, 0, 0, 5, 0
	dbsprite  6, 12, 0, 0, 6, OAM_PAL1
	dbsprite  8, 12, 0, 0, 6, OAM_PAL1
	dbsprite 14, 12, 0, 0, 6, OAM_PAL1
RedGameFreakMascotOAMEnd:

; ---------------------------------------------------------------------------
; Oak's speech (VANILLA_RED replacement for pokecrystal's own Wooper-based OakSpeech,
; called from NewGame in engine/menus/intro_menu.asm).
; Reuses the project's existing pic-display and naming-screen plumbing
; (Intro_PrepTrainerPic / Intro_RotatePalettesLeftFrontpic / Intro_WipeInFrontpic /
; DrawIntroPlayerPic / NamingScreen) instead of re-authoring Gen1's own naming-screen UI;
; only the text and narrative beats are ported. See docs/PORT_BACKLOG.md §2 for why the
; Gen1 "pick a preset name or enter your own" quick-list step (ChoosePlayerName/
; ChooseRivalName's DisplayIntroNameTextBox) was not replicated for the rival slot.
RedOakSpeech::
	farcall InitClock
	call RotateFourPalettesLeft
	call ClearTilemap

	ld de, MUSIC_ROUTE_2
	call PlayMusic

	call RotateFourPalettesRight
	call RotateThreePalettesRight

; "Hello there! ... My name is OAK! ... the POKEMON PROF!"
	xor a
	ld [wCurPartySpecies], a
	ld a, POKEMON_PROF
	ld [wTrainerClass], a
	farcall Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	farcall Intro_RotatePalettesLeftFrontpic

	ld hl, RedOakSpeechText1
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

; Nidorino portrait + cry + "This world is inhabited by creatures called POKEMON!"
	ld a, NIDORINO
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	farcall Intro_WipeInFrontpic

	ld hl, RedOakSpeechText2
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

; "First, what is your name?" -> player naming.
	xor a
	ld [wCurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	farcall Intro_RotatePalettesLeftFrontpic

	ld hl, RedIntroducePlayerText
	call PrintText

	ld b, NAME_PLAYER
	ld de, wPlayerName
	farcall NamingScreen

	ld hl, RedYourNameIsText
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

; "This is my grandson. He's been your rival since you were a baby." -> rival naming.
	xor a
	ld [wCurPartySpecies], a
	ld a, RIVAL1
	ld [wTrainerClass], a
	farcall Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	farcall Intro_RotatePalettesLeftFrontpic

	ld hl, RedIntroduceRivalText
	call PrintText

	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall NamingScreen

	ld hl, RedHisNameIsText
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

; "<PLAYER>! Your very own POKEMON legend is about to unfold! ... Let's go!"
	xor a
	ld [wCurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	farcall Intro_RotatePalettesLeftFrontpic

	ld hl, RedOakSpeechText3
	call PrintText

	ld de, MUSIC_PALLET_TOWN
	call PlayMusic
	ret

; ---------------------------------------------------------------------------
; wait c frames; return with carry set if the player pressed a button (mirrors Gen1's
; CheckForUserInterruption, using this project's own JoyTextDelay/hJoyLast idiom).
RedIntro_WaitFrames:
.loop
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyLast]
	and PAD_BUTTONS
	jr nz, .interrupted
	dec c
	jr nz, .loop
	and a
	ret
.interrupted
	scf
	ret

; ---------------------------------------------------------------------------
; Text (ported verbatim from pokeredDisassembly/data/text/text_2.asm).

RedOakSpeechText1:
	text_far _RedOakSpeechText1
	text_end

RedOakSpeechText2:
	text_far _RedOakSpeechText2A
	text_asm
	ld a, NIDORINO
	call PlayMonCry
	call WaitSFX
	ld hl, RedOakSpeechText2B
	ret

RedOakSpeechText2B:
	text_far _RedOakSpeechText2B
	text_end

RedIntroducePlayerText:
	text_far _RedIntroducePlayerText
	text_end

RedYourNameIsText:
	text_far _RedYourNameIsText
	text_end

RedIntroduceRivalText:
	text_far _RedIntroduceRivalText
	text_end

RedHisNameIsText:
	text_far _RedHisNameIsText
	text_end

RedOakSpeechText3:
	text_far _RedOakSpeechText3
	text_end

_RedOakSpeechText1::
	text "Hello there!"
	line "Welcome to the"
	cont "world of #MON!"

	para "My name is OAK!"
	line "People call me"
	cont "the #MON PROF!"
	prompt

_RedOakSpeechText2A::
	text "This world is"
	line "inhabited by"
	cont "creatures called"
	cont "#MON!@"
	text_end

_RedOakSpeechText2B::
	text_start

	para "For some people,"
	line "#MON are"
	cont "pets. Others use"
	cont "them for fights."

	para "Myself..."

	para "I study #MON"
	line "as a profession."
	prompt

_RedIntroducePlayerText::
	text "First, what is"
	line "your name?"
	prompt

_RedYourNameIsText::
	text "Right! So your"
	line "name is <PLAYER>!"
	prompt

_RedIntroduceRivalText::
	text "This is my grand-"
	line "son. He's been"
	cont "your rival since"
	cont "you were a baby."

	para "...Erm, what is"
	line "his name again?"
	prompt

_RedHisNameIsText::
	text "That's right! I"
	line "remember now! His"
	cont "name is <RIVAL>!"
	prompt

_RedOakSpeechText3::
	text "<PLAYER>!"

	para "Your very own"
	line "#MON legend is"
	cont "about to unfold!"

	para "A world of dreams"
	line "and adventures"
	cont "with #MON"
	cont "awaits! Let's go!"
	done

; ---------------------------------------------------------------------------
; GFX (ported byte-identical to pokeredDisassembly/gfx/{intro,splash,title} — see the
; Makefile RGBGFXFLAGS/tools/gfx overrides added alongside this file for the flags that
; keep rgbgfx's rebuild bit-for-bit identical to Red's committed .2bpp).

DEF RED_ANIMATION_END EQU 80

DEF RED_COPYRIGHT_TILES EQU 19
RedCopyrightGFX:
	INCBIN "gfx/red_splash/copyright.2bpp"

DEF RED_GAMEFREAK_LOGO_TILES EQU 6
RedGameFreakLogoGFX:
	INCBIN "gfx/red_splash/gamefreak_logo.2bpp"

DEF RED_FALLING_STAR_TILES EQU 1
RedFallingStarGFX:
	INCBIN "gfx/red_splash/falling_star.2bpp"

DEF RED_GENGAR_TILES EQU 95
RedGengarGFX:
	INCBIN "gfx/red_intro/gengar.2bpp"

DEF RED_NIDORINO_FRAME_TILES EQU 36
RedNidorino1GFX:
	INCBIN "gfx/red_intro/red_nidorino_1.2bpp"
RedNidorino2GFX:
	INCBIN "gfx/red_intro/red_nidorino_2.2bpp"
RedNidorino3GFX:
	INCBIN "gfx/red_intro/red_nidorino_3.2bpp"

RedGengarTilemap1:
	INCBIN "gfx/red_intro/gengar_1.tilemap"
RedGengarTilemap2:
	INCBIN "gfx/red_intro/gengar_2.tilemap"
RedGengarTilemap3:
	INCBIN "gfx/red_intro/gengar_3.tilemap"

DEF RED_GAMEFREAK_INC_TILES EQU 9
RedGameFreakIncGFX:
	INCBIN "gfx/red_title/gamefreak_inc.2bpp"

DEF RED_POKEMON_LOGO_TILES EQU 112
RedPokemonLogoGFX:
	INCBIN "gfx/red_title/pokemon_logo.2bpp"

DEF RED_PLAYER_TILES EQU 35
RedPlayerGFX:
	INCBIN "gfx/red_title/player.2bpp"

; ---------------------------------------------------------------------------
; Ported pixel-offset choreography (verbatim from pokeredDisassembly/engine/movie/intro.asm
; IntroNidorinoAnimation1-7).

RedIntroNidorinoAnim1:
	db  0, 0
	db -2, 2
	db -1, 2
	db  1, 2
	db  2, 2
	db RED_ANIMATION_END

RedIntroNidorinoAnim2:
	db  0,  0
	db -2, -2
	db -1, -2
	db  1, -2
	db  2, -2
	db RED_ANIMATION_END

RedIntroNidorinoAnim3:
	db   0, 0
	db -12, 6
	db  -8, 6
	db   8, 6
	db  12, 6
	db RED_ANIMATION_END

RedIntroNidorinoAnim4:
	db  0,  0
	db -8, -4
	db -4, -4
	db  4, -4
	db  8, -4
	db RED_ANIMATION_END

RedIntroNidorinoAnim5:
	db  0, 0
	db -8, 4
	db -4, 4
	db  4, 4
	db  8, 4
	db RED_ANIMATION_END

RedIntroNidorinoAnim6:
	db 0, 0
	db 2, 0
	db 2, 0
	db 0, 0
	db RED_ANIMATION_END

RedIntroNidorinoAnim7:
	db -8, -16
	db -7, -14
	db -6, -12
	db -4, -10
	db RED_ANIMATION_END
