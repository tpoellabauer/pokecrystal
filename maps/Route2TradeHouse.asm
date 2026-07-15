	object_const_def
	const ROUTE2TRADEHOUSE_SCIENTIST
	const ROUTE2TRADEHOUSE_GAMEBOY_KID

; Gen 1 Route 2 Trade House, ported from pokered data/maps/objects/Route2TradeHouse.asm.
; The Gameboy Kid's TRADE_FOR_MARCEL (ABRA -> nicknamed MR_MIME) is wired as
; NPC_TRADE_MARCEL (constants/npc_trade_constants.asm + data/events/npc_trades.asm).
Route2TradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route2TradeHouseScientistScript:
	jumptextfaceplayer Route2TradeHouseScientistText

Route2TradeHouseGameboyKidScript:
	faceplayer
	opentext
	trade NPC_TRADE_MARCEL
	waitbutton
	closetext
	end

Route2TradeHouseScientistText:
	text "A fainted #MON"
	line "can't fight. But"
	cont "it can still use"
	cont "moves like CUT!"
	done

Route2TradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; Front door; Route2's Gen1-geometry warp list (issue #44) has this map's own
	; slot at #4.
	warp_event  2,  7, ROUTE_2, 4
	warp_event  3,  7, ROUTE_2, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2TradeHouseScientistScript, -1
	object_event  4,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2TradeHouseGameboyKidScript, -1
