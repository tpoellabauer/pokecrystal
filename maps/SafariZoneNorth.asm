	object_const_def
	const SAFARIZONENORTH_PROTEIN
	const SAFARIZONENORTH_TM_SKULL_BASH

SafariZoneNorth_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneNorthProteinScript:
	jumptextfaceplayer SafariZoneNorthProteinText

SafariZoneNorthTMSkullBashScript:
	jumptextfaceplayer SafariZoneNorthTMSkullBashText

SafariZoneNorthRestHouseSign:
	jumptext SafariZoneNorthRestHouseSignText

SafariZoneNorthTrainerTips1Sign:
	jumptext SafariZoneNorthTrainerTips1Text

SafariZoneNorthSign:
	jumptext SafariZoneNorthSignText

SafariZoneNorthTrainerTips2Sign:
	jumptext SafariZoneNorthTrainerTips2Text

SafariZoneNorthTrainerTips3Sign:
	jumptext SafariZoneNorthTrainerTips3Text

; GATED (NEEDS SHARED-TABLE WORK) x2: Gen 1 item balls (PROTEIN, TM SKULL
; BASH). Each needs a new EVENT_ flag in constants/event_flags.asm plus the
; itemball/giveitem macros. Left as inert flavor text.
SafariZoneNorthProteinText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like a"
	line "PROTEIN."
	done

SafariZoneNorthTMSkullBashText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like an"
	line "old TM."
	done

SafariZoneNorthRestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneNorthTrainerTips1Text:
	text "TRAINER TIPS"

	para "The SECRET HOUSE"
	line "is still ahead!"
	done

SafariZoneNorthSignText:
	text "AREA 2"
	done

SafariZoneNorthTrainerTips2Text:
	text "TRAINER TIPS"

	para "#MON hide in"
	line "tall grass!"

	para "Zigzag through"
	line "grassy areas to"
	cont "flush them out."
	done

SafariZoneNorthTrainerTips3Text:
	text "TRAINER TIPS"

	para "Win a free HM for"
	line "finding the"
	cont "SECRET HOUSE!"
	done

SafariZoneNorth_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 35, SAFARI_ZONE_WEST, 1
	warp_event  3, 35, SAFARI_ZONE_WEST, 2
	warp_event  8, 35, SAFARI_ZONE_WEST, 3
	warp_event  9, 35, SAFARI_ZONE_WEST, 4
	warp_event 20, 35, SAFARI_ZONE_CENTER, 5
	warp_event 21, 35, SAFARI_ZONE_CENTER, 6
	warp_event 39, 30, SAFARI_ZONE_EAST, 1
	warp_event 39, 31, SAFARI_ZONE_EAST, 2
	warp_event 35,  3, SAFARI_ZONE_NORTH_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 36,  4, BGEVENT_READ, SafariZoneNorthRestHouseSign
	bg_event  4, 25, BGEVENT_READ, SafariZoneNorthTrainerTips1Sign
	bg_event 13, 31, BGEVENT_READ, SafariZoneNorthSign
	bg_event 19, 33, BGEVENT_READ, SafariZoneNorthTrainerTips2Sign
	bg_event 26, 28, BGEVENT_READ, SafariZoneNorthTrainerTips3Sign

	def_object_events
	object_event 25,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthProteinScript, -1
	object_event 19,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthTMSkullBashScript, -1
