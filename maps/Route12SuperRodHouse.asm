	object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

; Ported from pokeredDisassembly scripts/Route12SuperRodHouse.asm +
; text/Route12SuperRodHouse.asm. Gen 1's FISHING GURU's brother gives the SUPER ROD
; (GiveItem + wStatusFlags1 BIT_GOT_SUPER_ROD gate) — NOT ported, see
; "NEEDS SHARED-TABLE WORK" in the port report. Flavor-only dialogue below, faithfully
; ported from the Gen 1 intro line (the branches that reference the item are dropped).
Route12SuperRodHouseFishingGuruScript:
	jumptextfaceplayer Route12SuperRodHouseFishingGuruText

Route12SuperRodHouseFishingGuruText:
	text "I'm the FISHING"
	line "GURU's brother!"

	para "I simply looove"
	line "fishing!"

	para "Do you like to"
	line "fish?"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
