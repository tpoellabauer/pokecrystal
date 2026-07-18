	object_const_def

Route7_MapScripts:
	def_scene_scripts

	def_callbacks

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CELADON CITY -"
	line "LAVENDER TOWN"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2
	warp_event 11,  9, ROUTE_7_GATE, 3
	warp_event 11, 10, ROUTE_7_GATE, 4
	warp_event 18,  9, ROUTE_7_GATE, 5
	warp_event 18, 10, ROUTE_7_GATE, 6
	warp_event  5, 13, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, Route7UndergroundPathSign

	def_object_events
