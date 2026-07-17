	object_const_def
	const ROUTE7UNDERGROUNDPATHENTRANCE_MIDDLE_AGED_MAN

Route7UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

Route7UndergroundPathEntranceMiddleAgedManScript:
	jumptextfaceplayer Route7UndergroundPathEntranceMiddleAgedManText

Route7UndergroundPathEntranceMiddleAgedManText:
	text "I heard a sleepy"
	line "POKEMON appeared"

	para "near CELADON"
	line "CITY."
	done

Route7UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_7, 7
	warp_event  4,  7, ROUTE_7, 7
	warp_event  4,  3, UNDERGROUND_PATH_ROUTE_78, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7UndergroundPathEntranceMiddleAgedManScript, -1
