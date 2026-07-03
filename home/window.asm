ReanchorMap::
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; aka BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ReanchorBGMap_NoOAMUpdate
	call HDMATransferTilemapAndAttrmap_Menu
	call LoadFonts_NoOAMUpdate

	pop af
	rst Bankswitch
	ret

CloseText::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	call .CloseText

	pop af
	ldh [hOAMUpdate], a
	ld hl, wStateFlags
	res TEXT_STATE_F, [hl]
	ret

.CloseText:
	call ClearWindowData
	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	call HDMATransferTilemapAndAttrmap_Menu
	xor a
	ldh [hBGMapMode], a
	call SafeUpdateSprites
	ld a, $90
	ldh [hWY], a
	call UpdatePlayerSprite
	farcall InitMapNameSign
	farcall LoadOverworldFont
	ret

OpenText::
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; aka BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ReanchorBGMap_NoOAMUpdate ; anchor bgmap
	call SpeechTextbox
; Gen 1 Kanto on Crystal: a prior fix here tried loading the font into VRAM BEFORE
; pushing the tilemap (instead of stock's transfer-then-load) to close a real-hardware
; timing race. That reorder has a worse side effect: LoadFonts_NoOAMUpdate's HBlank-DMA
; font/frame transfer (Get1bppViaHDMA -> HDMATransfer1bpp, used because the LCD is still
; on here) reliably corrupts the textbox frame tiles ('┌─┐│└┘' + space, charmap $79-$7f)
; when it runs BEFORE HDMATransferTilemapAndAttrmap_Menu -- confirmed in PyBoy: the six
; border tiles decode to non-doubled-plane garbage bytes in vTiles2 right after this call
; in that order, every time, not just on real hardware. Every other caller of
; LoadFonts_NoOAMUpdate (ReanchorMap above, StartMenu) calls it AFTER its tilemap
; transfer and never corrupts. Restored stock order; the real-hardware stale-font
; flicker this was meant to fix needs a different fix.
	call HDMATransferTilemapAndAttrmap_Menu ; transfer bgmap
	call LoadFonts_NoOAMUpdate ; load font
	pop af
	rst Bankswitch

	ret

HDMATransferTilemapAndAttrmap_Menu::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	farcall _HDMATransferTilemapAndAttrmap_Menu

	pop af
	ldh [hOAMUpdate], a
	ret

SafeUpdateSprites::
	ldh a, [hOAMUpdate]
	push af
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [hOAMUpdate], a

	call UpdateSprites

	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ret

SetCarryFlag:: ; unreferenced
	scf
	ret
