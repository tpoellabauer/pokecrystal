	object_const_def
	const VIRIDIANSCHOOLHOUSE_BRUNETTE_GIRL
	const VIRIDIANSCHOOLHOUSE_COOLTRAINER_F

ViridianSchoolHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianSchoolHouseBrunetteGirlScript:
	jumptextfaceplayer ViridianSchoolHouseBrunetteGirlText

ViridianSchoolHouseCooltrainerFScript:
	jumptextfaceplayer ViridianSchoolHouseCooltrainerFText

ViridianSchoolHouseBrunetteGirlText:
	text "Whew! I'm trying"
	line "to memorize all"
	cont "my notes."
	done

ViridianSchoolHouseCooltrainerFText:
	text "Okay!"

	para "Be sure to read"
	line "the blackboard"
	cont "carefully!"
	done

ViridianSchoolHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 6
	warp_event  3,  7, VIRIDIAN_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseBrunetteGirlScript, -1
	object_event  4,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseCooltrainerFScript, -1
