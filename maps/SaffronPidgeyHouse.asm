	object_const_def
	const SAFFRONPIDGEYHOUSE_LASS
	const SAFFRONPIDGEYHOUSE_PIDGEY
	const SAFFRONPIDGEYHOUSE_YOUNGSTER
	const SAFFRONPIDGEYHOUSE_PAPER

SaffronPidgeyHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronPidgeyHouseLassScript:
	jumptextfaceplayer SaffronPidgeyHouseLassText

SaffronPidgeyHousePidgeyScript:
	opentext
	writetext SaffronPidgeyHousePidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end

SaffronPidgeyHouseYoungsterScript:
	jumptextfaceplayer SaffronPidgeyHouseYoungsterText

SaffronPidgeyHousePaperScript:
	jumptextfaceplayer SaffronPidgeyHousePaperText

SaffronPidgeyHouseLassText:
	text "Thank you for"
	line "writing. I hope"
	cont "to see you soon!"

	para "Hey! Don't look"
	line "at my letter!"
	done

SaffronPidgeyHousePidgeyText:
	text "PIDGEY: Kurukkoo!"
	done

SaffronPidgeyHouseYoungsterText:
	text "The COPYCAT is"
	line "cute! I'm getting"
	cont "her a # DOLL!"
	done

SaffronPidgeyHousePaperText:
	text "I was given a PP"
	line "UP as a gift."

	para "It's used for"
	line "increasing the PP"
	cont "of techniques!"
	done

SaffronPidgeyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 16
	warp_event  3,  7, SAFFRON_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPidgeyHouseLassScript, -1
	object_event  0,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPidgeyHousePidgeyScript, -1
	object_event  4,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPidgeyHouseYoungsterScript, -1
	object_event  3,  3, SPRITE_PAPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPidgeyHousePaperScript, -1
