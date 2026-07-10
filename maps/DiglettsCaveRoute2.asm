	object_const_def
	const DIGLETTSCAVEROUTE2_FISHING_GURU

; Gen 1 Diglett's Cave Route 2 entrance vestibule, ported from pokered
; data/maps/objects/DiglettsCaveRoute2.asm (Gen1 map DIGLETTS_CAVE_ROUTE_2). Route2's
; own cave-entrance warp now targets this map (slot 1, the door tiles below) instead
; of DiglettsCave directly; this map's own warp 3 continues into DiglettsCave's warp 1.
DiglettsCaveRoute2_MapScripts:
	def_scene_scripts

	def_callbacks

DiglettsCaveRoute2FishingGuruScript:
	jumptextfaceplayer DiglettsCaveRoute2FishingGuruText

DiglettsCaveRoute2FishingGuruText:
	text "I went to ROCK"
	line "TUNNEL, but it's"
	cont "dark and scary."

	para "If a #MON's"
	line "FLASH could light"
	cont "it up..."
	done

DiglettsCaveRoute2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_2, 5
	warp_event  3,  7, ROUTE_2, 5
	warp_event  4,  4, DIGLETTS_CAVE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DiglettsCaveRoute2FishingGuruScript, -1
