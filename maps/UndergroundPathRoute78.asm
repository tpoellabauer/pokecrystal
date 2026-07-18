UndergroundPathRoute78_MapScripts:
	def_scene_scripts

	def_callbacks

UndergroundPathRoute78_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  0,  5, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  9,  4, ROUTE_8_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  9,  5, ROUTE_8_UNDERGROUND_PATH_ENTRANCE, 3

	def_coord_events

	def_bg_events

	def_object_events
