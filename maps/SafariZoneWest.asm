	object_const_def
	const SAFARIZONEWEST_MAX_POTION
	const SAFARIZONEWEST_TM_DOUBLE_TEAM
	const SAFARIZONEWEST_MAX_REVIVE
	const SAFARIZONEWEST_GOLD_TEETH

SafariZoneWest_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneWestMaxPotionScript:
	jumptextfaceplayer SafariZoneWestMaxPotionText

SafariZoneWestTMDoubleTeamScript:
	jumptextfaceplayer SafariZoneWestTMDoubleTeamText

SafariZoneWestMaxReviveScript:
	jumptextfaceplayer SafariZoneWestMaxReviveText

SafariZoneWestGoldTeethScript:
	jumptextfaceplayer SafariZoneWestGoldTeethText

SafariZoneWestRestHouseSign:
	jumptext SafariZoneWestRestHouseSignText

SafariZoneWestFindWardensTeethSign:
	jumptext SafariZoneWestFindWardensTeethSignText

SafariZoneWestTrainerTipsSign:
	jumptext SafariZoneWestTrainerTipsText

SafariZoneWestSign:
	jumptext SafariZoneWestSignText

; GATED (NEEDS SHARED-TABLE WORK) x3: Gen 1 item balls (MAX POTION, TM DOUBLE
; TEAM, MAX REVIVE). Each needs a new EVENT_ flag in constants/event_flags.asm
; plus the itemball/giveitem macros. Left as inert flavor text.
SafariZoneWestMaxPotionText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like a"
	line "MAX POTION."
	done

SafariZoneWestTMDoubleTeamText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like an"
	line "old TM."
	done

SafariZoneWestMaxReviveText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like a"
	line "MAX REVIVE."
	done

; GATED (NEEDS SHARED-TABLE WORK): the Safari Warden's GOLD TEETH quest item.
; In Gen 1 this ball, MainOffice, and WardensHome all share an EVENT_ flag +
; the HM01 CUT reward hand-off. Wiring it needs constants/event_flags.asm,
; giveitem, and cross-map scene/setevent work — all out of scope here. Left
; as inert flavor text; see the REQUEST NOTICE sign below for the quest hook.
SafariZoneWestGoldTeethText:
	text "Something shiny"
	line "is glinting in"
	cont "the grass here..."

	para "Looks like a set"
	line "of GOLD TEETH!"
	done

SafariZoneWestRestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneWestFindWardensTeethSignText:
	text "REQUEST NOTICE"

	para "Please find the"
	line "SAFARI WARDEN's"
	cont "lost GOLD TEETH."
	cont "They're around"
	cont "here somewhere."

	para "Reward offered!"
	line "Contact: WARDEN"
	done

SafariZoneWestTrainerTipsText:
	text "TRAINER TIPS"

	para "Zone Exploration"
	line "Campaign!"

	para "The Search for"
	line "the SECRET HOUSE!"
	done

SafariZoneWestSignText:
	text "AREA 3"
	line "EAST: CENTER AREA"
	done

SafariZoneWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  0, SAFARI_ZONE_NORTH, 1
	warp_event 21,  0, SAFARI_ZONE_NORTH, 2
	warp_event 26,  0, SAFARI_ZONE_NORTH, 3
	warp_event 27,  0, SAFARI_ZONE_NORTH, 4
	warp_event 29, 22, SAFARI_ZONE_CENTER, 3
	warp_event 29, 23, SAFARI_ZONE_CENTER, 4
	warp_event  3,  3, SAFARI_ZONE_SECRET_HOUSE, 1
	warp_event 11, 11, SAFARI_ZONE_WEST_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 12, 12, BGEVENT_READ, SafariZoneWestRestHouseSign
	bg_event 17,  3, BGEVENT_READ, SafariZoneWestFindWardensTeethSign
	bg_event 26,  4, BGEVENT_READ, SafariZoneWestTrainerTipsSign
	bg_event 24, 22, BGEVENT_READ, SafariZoneWestSign

	def_object_events
	object_event  8, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestMaxPotionScript, -1
	object_event  9,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestTMDoubleTeamScript, -1
	object_event 18, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestMaxReviveScript, -1
	object_event 19,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestGoldTeethScript, -1
