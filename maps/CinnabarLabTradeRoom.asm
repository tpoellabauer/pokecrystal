	object_const_def
	const CINNABARLABTRADEROOM_SUPER_NERD
	const CINNABARLABTRADEROOM_GRAMPS
	const CINNABARLABTRADEROOM_BEAUTY

; Gen 1 Cinnabar Lab Trade Room, ported from pokered data/maps/objects/CinnabarLabTradeRoom.asm.
; Gramps and Beauty run the native Gen2 trade engine (NPC_TRADE_DORIS/NPC_TRADE_CRINKLES,
; see data/events/npc_trades.asm) instead of Gen1's predef DoInGameTradeDialogue.
CinnabarLabTradeRoom_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarLabTradeRoomSuperNerdScript:
	jumptextfaceplayer CinnabarLabTradeRoomSuperNerdText

CinnabarLabTradeRoomGrampsScript:
	faceplayer
	opentext
	trade NPC_TRADE_DORIS
	waitbutton
	closetext
	end

CinnabarLabTradeRoomBeautyScript:
	faceplayer
	opentext
	trade NPC_TRADE_CRINKLES
	waitbutton
	closetext
	end

CinnabarLabTradeRoomSuperNerdText:
	text "I found this very"
	line "strange fossil in"
	cont "MT.MOON!"

	para "I think it's a"
	line "rare, prehistoric"
	cont "#MON!"
	done

CinnabarLabTradeRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 3
	warp_event  3,  7, CINNABAR_LAB, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarLabTradeRoomSuperNerdScript, -1
	object_event  1,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarLabTradeRoomGrampsScript, -1
	object_event  5,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CinnabarLabTradeRoomBeautyScript, -1
