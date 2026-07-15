	object_const_def
	const SAFARIZONEWESTRESTHOUSE_SCIENTIST
	const SAFARIZONEWESTRESTHOUSE_COOLTRAINER_M
	const SAFARIZONEWESTRESTHOUSE_SILPH_WORKER_F

SafariZoneWestRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneWestRestHouseScientistScript:
	jumptextfaceplayer SafariZoneWestRestHouseScientistText

SafariZoneWestRestHouseCooltrainerMScript:
	jumptextfaceplayer SafariZoneWestRestHouseCooltrainerMText

SafariZoneWestRestHouseSilphWorkerFScript:
	jumptextfaceplayer SafariZoneWestRestHouseSilphWorkerFText

SafariZoneWestRestHouseScientistText:
	text "Tossing ROCKs at"
	line "#MON might"
	cont "make them run,"
	cont "but they'll be"
	cont "easier to catch."
	done

SafariZoneWestRestHouseCooltrainerMText:
	text "Using BAIT will"
	line "make #MON"
	cont "easier to catch."
	done

SafariZoneWestRestHouseSilphWorkerFText:
	text "I hiked a lot, but"
	line "I didn't see any"
	cont "#MON I wanted."
	done

SafariZoneWestRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 8
	warp_event  3,  7, SAFARI_ZONE_WEST, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouseScientistScript, -1
	object_event  0,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouseCooltrainerMScript, -1
	object_event  6,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouseSilphWorkerFScript, -1
