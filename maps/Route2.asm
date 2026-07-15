	object_const_def
	const ROUTE2_MOON_STONE
	const ROUTE2_HP_UP

Route2_MapScripts:
	def_scene_scripts

	def_callbacks

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2MoonStone:
	itemball MOON_STONE

Route2HPUp:
	itemball HP_UP

Route2SignText:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "PEWTER CITY"
	done

Route2DiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 15, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 12,  9, DIGLETTS_CAVE_ROUTE_2, 1
	warp_event  3, 11, VIRIDIAN_FOREST_NORTH_GATE, 2
	warp_event 15, 19, ROUTE_2_TRADE_HOUSE, 1
	; Gen 1 geometry (issue #44): Route2Gate is one north/south pass-through door
	; pair (not the old 3-slot GSC layout); both physical doors on each side
	; collapse to a single landing slot (5/6), matching Route2Gate's own doors.
	warp_event 16, 35, ROUTE_2_GATE, 1
	warp_event 15, 39, ROUTE_2_GATE, 3
	warp_event  3, 43, VIRIDIAN_FOREST_SOUTH_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  5, 65, BGEVENT_READ, Route2Sign
	bg_event 11, 11, BGEVENT_READ, Route2DiglettsCaveSign

	def_object_events
	object_event 13, 54, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2MoonStone, EVENT_ROUTE_2_MOON_STONE
	object_event 13, 45, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2HPUp, EVENT_ROUTE_2_HP_UP
