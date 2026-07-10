; Gen 1 Safari Warden's GOLD TEETH quest (2026-07-10): this item ball is the quest's start --
; turn-in + HM04 Strength reward live at SafariZoneWardensHome.asm's Warden NPC. GOLD_TEETH
; repurposes the ITEM_32 placeholder slot (precedent: ITEM_DC -> TM_MIMIC). See the REQUEST
; NOTICE sign below for the in-fiction quest hook (SafariZoneWestFindWardensTeethSign).
	object_const_def
	const SAFARIZONEWEST_MAX_POTION
	const SAFARIZONEWEST_TM_DOUBLE_TEAM
	const SAFARIZONEWEST_MAX_REVIVE
	const SAFARIZONEWEST_GOLD_TEETH

SafariZoneWest_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneWestMaxPotion:
	itemball MAX_POTION

SafariZoneWestTMDoubleTeam:
	itemball TM_DOUBLE_TEAM

SafariZoneWestMaxRevive:
	itemball MAX_REVIVE

SafariZoneWestGoldTeethBall:
	itemball GOLD_TEETH

SafariZoneWestRestHouseSign:
	jumptext SafariZoneWestRestHouseSignText

SafariZoneWestFindWardensTeethSign:
	jumptext SafariZoneWestFindWardensTeethSignText

SafariZoneWestTrainerTipsSign:
	jumptext SafariZoneWestTrainerTipsText

SafariZoneWestSign:
	jumptext SafariZoneWestSignText

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
	object_event  8, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneWestMaxPotion, EVENT_SAFARI_ZONE_WEST_MAX_POTION
	object_event  9,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneWestTMDoubleTeam, EVENT_SAFARI_ZONE_WEST_TM_DOUBLE_TEAM
	object_event 18, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneWestMaxRevive, EVENT_SAFARI_ZONE_WEST_MAX_REVIVE
	object_event 19,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneWestGoldTeethBall, EVENT_SAFARI_ZONE_WEST_GOLD_TEETH
