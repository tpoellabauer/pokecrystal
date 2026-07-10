	object_const_def
	const DIGLETTSCAVEROUTE11_GAMBLER

; Gen 1 Diglett's Cave Route 11 entrance vestibule, ported from pokered
; data/maps/objects/DiglettsCaveRoute11.asm (Gen1 map DIGLETTS_CAVE_ROUTE_11). Gen1's
; unisex GAMBLER sprite has no Gen2 equivalent (SWIMMER-style substitution, see
; maps-and-scripting skill); subbed SPRITE_GENTLEMAN, matching Route11's own Gambler
; NPCs. Route11's DiglettsCave warp now targets this map (slot 1) instead of
; DiglettsCave directly; this map's own warp 3 continues into DiglettsCave's warp 2.
DiglettsCaveRoute11_MapScripts:
	def_scene_scripts

	def_callbacks

DiglettsCaveRoute11GamblerScript:
	jumptextfaceplayer DiglettsCaveRoute11GamblerText

DiglettsCaveRoute11GamblerText:
	text "What a surprise!"
	line "DIGLETTs dug this"
	cont "long tunnel!"

	para "It goes right to"
	line "VIRIDIAN CITY!"
	done

DiglettsCaveRoute11_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_11, 1
	warp_event  3,  7, ROUTE_11, 1
	warp_event  4,  4, DIGLETTS_CAVE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DiglettsCaveRoute11GamblerScript, -1
