	object_const_def
	const VERMILIONTRADEHOUSE_LITTLE_GIRL

; Gen 1 Vermilion Trade House, ported from pokeredDisassembly/scripts+data/maps/objects/
; VermilionTradeHouse.asm. No GSC equivalent existed; new map (asmkit.newmap, TILESET_GEN1_HOUSE).
; Gen1's DoInGameTradeDialogue(TRADE_FOR_DUX) becomes the `trade` macro against the new
; NPC_TRADE_DUX entry (constants/npc_trade_constants.asm + data/events/npc_trades.asm), following
; the Route2TradeHouse/NPC_TRADE_MARCEL precedent. Gen1's SPRITE_LITTLE_GIRL has no Gen2
; equivalent; substituted with SPRITE_LASS (nearest "young girl" sprite).
VermilionTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionTradeHouseLittleGirlScript:
	faceplayer
	opentext
	trade NPC_TRADE_DUX
	waitbutton
	closetext
	end

VermilionTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 8
	warp_event  3,  7, VERMILION_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionTradeHouseLittleGirlScript, -1
