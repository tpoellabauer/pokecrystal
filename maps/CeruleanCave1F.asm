; Cerulean Cave 1F
; Gen 1 source: pokeredDisassembly/scripts/CeruleanCave1F.asm
; Entrance (4, 11) added to CeruleanCity.asm -- was missing, same root cause as Seafoam Islands'
; dead-end entrance (Gen 1's "LAST_MAP" is just a return-to-source-map shorthand that resolves to
; a concrete warp_event on the adjacent map, not a special mechanic).

	object_const_def
	const CERULEANCAVE1F_FULL_RESTORE
	const CERULEANCAVE1F_MAX_ELIXER
	const CERULEANCAVE1F_NUGGET

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave1FFullRestoreBall:
	itemball FULL_RESTORE

CeruleanCave1FMaxElixerBall:
	itemball MAX_ELIXER

CeruleanCave1FNuggetBall:
	itemball NUGGET

CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24, 17, CERULEAN_CITY, 7
	warp_event 25, 17, CERULEAN_CITY, 7
	warp_event 27,  1, CERULEAN_CAVE_2F, 1
	warp_event 23,  7, CERULEAN_CAVE_2F, 2
	warp_event 18,  9, CERULEAN_CAVE_2F, 3
	warp_event  7,  1, CERULEAN_CAVE_2F, 4
	warp_event  1,  3, CERULEAN_CAVE_2F, 5
	warp_event  3, 11, CERULEAN_CAVE_2F, 6
	warp_event  0,  6, CERULEAN_CAVE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FFullRestoreBall, EVENT_CERULEAN_CAVE_1F_FULL_RESTORE
	object_event 19,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FMaxElixerBall, EVENT_CERULEAN_CAVE_1F_MAX_ELIXER
	object_event  5,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FNuggetBall, EVENT_CERULEAN_CAVE_1F_NUGGET
