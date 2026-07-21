DefaultOptions:
; wOptions: med text speed, Red music+sfx on by default (Gen 1 Kanto on Crystal,
; issue #137: new games silently started on Crystal's own soundtrack)
	db TEXT_DELAY_MED | 1 << MUSIC_SOURCE
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_1
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinterBrightness: normal
	db GBPRINTER_NORMAL
; wOptions2: menu account on
	db 1 << MENU_ACCOUNT

	db $00
	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
