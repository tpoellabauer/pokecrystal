	object_const_def
	const SAFARIZONEEAST_FULL_RESTORE
	const SAFARIZONEEAST_MAX_RESTORE
	const SAFARIZONEEAST_CARBOS
	const SAFARIZONEEAST_TM_EGG_BOMB

SafariZoneEast_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneEastFullRestore:
	itemball FULL_RESTORE

SafariZoneEastMaxRestore:
	itemball MAX_POTION

SafariZoneEastCarbos:
	itemball CARBOS

SafariZoneEastTMEggBomb:
	itemball TM_SWIFT ; Gen1 TM_EGG_BOMB (TM39) absent in Gen2

SafariZoneEastRestHouseSign:
	jumptext SafariZoneEastRestHouseSignText

SafariZoneEastTrainerTipsSign:
	jumptext SafariZoneEastTrainerTipsText

SafariZoneEastSign:
	jumptext SafariZoneEastSignText

SafariZoneEastRestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneEastTrainerTipsText:
	text "TRAINER TIPS"

	para "The remaining time"
	line "declines only"
	cont "while you walk!"
	done

SafariZoneEastSignText:
	text "CENTER AREA"
	line "NORTH: AREA 2"
	done

SafariZoneEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, SAFARI_ZONE_NORTH, 7
	warp_event  0,  5, SAFARI_ZONE_NORTH, 8
	warp_event  0, 22, SAFARI_ZONE_CENTER, 7
	warp_event  0, 23, SAFARI_ZONE_CENTER, 7
	warp_event 25,  9, SAFARI_ZONE_EAST_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 26, 10, BGEVENT_READ, SafariZoneEastRestHouseSign
	bg_event  6,  4, BGEVENT_READ, SafariZoneEastTrainerTipsSign
	bg_event  5, 23, BGEVENT_READ, SafariZoneEastSign

	def_object_events
	object_event 21, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastFullRestore, EVENT_SAFARI_ZONE_EAST_FULL_RESTORE
	object_event  3,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastMaxRestore, EVENT_SAFARI_ZONE_EAST_MAX_POTION
	object_event 20, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastCarbos, EVENT_SAFARI_ZONE_EAST_CARBOS
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastTMEggBomb, EVENT_SAFARI_ZONE_EAST_TM_EGG_BOMB
