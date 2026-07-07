SSAnneB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnneB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, SS_ANNE_B1F_ROOMS, 1
	warp_event  8,  3, SS_ANNE_B1F_ROOMS, 2
	warp_event 10,  3, SS_ANNE_B1F_ROOMS, 3
	warp_event 12,  3, SS_ANNE_B1F_ROOMS, 4
	warp_event 14,  3, SS_ANNE_B1F_ROOMS, 5
	warp_event  2,  2, SS_ANNE_1F, 8

	def_coord_events

	def_bg_events

	def_object_events
