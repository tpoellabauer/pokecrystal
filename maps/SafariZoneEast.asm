	object_const_def
	const SAFARIZONEEAST_FULL_RESTORE
	const SAFARIZONEEAST_MAX_RESTORE
	const SAFARIZONEEAST_CARBOS
	const SAFARIZONEEAST_TM_EGG_BOMB

SafariZoneEast_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneEastFullRestoreScript:
	jumptextfaceplayer SafariZoneEastFullRestoreText

SafariZoneEastMaxRestoreScript:
	jumptextfaceplayer SafariZoneEastMaxRestoreText

SafariZoneEastCarbosScript:
	jumptextfaceplayer SafariZoneEastCarbosText

SafariZoneEastTMEggBombScript:
	jumptextfaceplayer SafariZoneEastTMEggBombText

SafariZoneEastRestHouseSign:
	jumptext SafariZoneEastRestHouseSignText

SafariZoneEastTrainerTipsSign:
	jumptext SafariZoneEastTrainerTipsText

SafariZoneEastSign:
	jumptext SafariZoneEastSignText

; GATED (NEEDS SHARED-TABLE WORK) x4: Gen 1 has real item balls here (FULL
; RESTORE, MAX POTION, CARBOS, TM EGG BOMB — TM_EGG_BOMB doesn't even exist
; in Gen 2's movepool). Each needs a new EVENT_ flag in
; constants/event_flags.asm plus the itemball/giveitem macros. Left as inert
; flavor text.
SafariZoneEastFullRestoreText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like a"
	line "FULL RESTORE."
	done

SafariZoneEastMaxRestoreText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like a"
	line "MAX POTION."
	done

SafariZoneEastCarbosText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like a"
	line "CARBOS."
	done

SafariZoneEastTMEggBombText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like an"
	line "old TM."
	done

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
	object_event 21, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneEastFullRestoreScript, -1
	object_event  3,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneEastMaxRestoreScript, -1
	object_event 20, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneEastCarbosScript, -1
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneEastTMEggBombScript, -1
