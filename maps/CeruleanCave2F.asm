; Cerulean Cave 2F
; Gen 1 source: pokeredDisassembly/scripts/CeruleanCave2F.asm

	object_const_def
	const CERULEANCAVE2F_PP_UP
	const CERULEANCAVE2F_ULTRA_BALL
	const CERULEANCAVE2F_FULL_RESTORE

CeruleanCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave2FPPUpBall:
	itemball PP_UP

CeruleanCave2FUltraBallBall:
	itemball ULTRA_BALL

CeruleanCave2FFullRestoreBall:
	itemball FULL_RESTORE

CeruleanCave2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29,  1, CERULEAN_CAVE_1F, 3
	warp_event 22,  6, CERULEAN_CAVE_1F, 4
	warp_event 19,  7, CERULEAN_CAVE_1F, 5
	warp_event  9,  1, CERULEAN_CAVE_1F, 6
	warp_event  1,  3, CERULEAN_CAVE_1F, 7
	warp_event  3, 11, CERULEAN_CAVE_1F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event 29,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FPPUpBall, EVENT_CERULEAN_CAVE_2F_PP_UP
	object_event  4, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FUltraBallBall, EVENT_CERULEAN_CAVE_2F_ULTRA_BALL
	object_event 13,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FFullRestoreBall, EVENT_CERULEAN_CAVE_2F_FULL_RESTORE
