	object_const_def
	const CELADONCITY_LITTLE_GIRL
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GIRL
	const CELADONCITY_GRAMPS2
	const CELADONCITY_GRAMPS3
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWRATH
	const CELADONCITY_ROCKET1
	const CELADONCITY_ROCKET2

CeladonCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlypointCallback

CeladonCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityLittleGirlScript:
	jumptextfaceplayer CeladonCityLittleGirlText

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGirlScript:
	jumptextfaceplayer CeladonCityGirlText

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

; Gen 1 gives a TM41 (Softboiled) here; Gen 2's TM41 is a completely
; different move (Sandstorm), so there is no transferable item reward
; (same class of skip as Route 25's Seismic Toss TM -- see PORT_BACKLOG).
; Kept the NPC and greeting, dropped the "here's a gift" promise/giveitem.
CeladonCityGramps3Script:
	jumptextfaceplayer CeladonCityGramps3Text

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrathScript:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityRocket1Script:
	jumptextfaceplayer CeladonCityRocket1Text

CeladonCityRocket2Script:
	jumptextfaceplayer CeladonCityRocket2Text

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityLittleGirlText:
	text "I got my KOFFING"
	line "in CINNABAR!"

	para "It's nice, but it"
	line "breathes poison"
	cont "when it's angry!"
	done

CeladonCityGramps1Text:
	text "Heheh! This GYM"
	line "is great! It's"
	cont "full of women!"
	done

CeladonCityGirlText:
	text "The GAME CORNER"
	line "is bad for our"
	cont "city's image!"
	done

CeladonCityGramps2Text:
	text "Moan! I blew it"
	line "all at the slots!"

	para "I knew I should"
	line "have cashed in my"
	cont "coins for prizes!"
	done

CeladonCityGramps3Text:
	text "Hello, there!"

	para "I've seen you,"
	line "but I never had a"
	cont "chance to talk!"
	done

CeladonCityFisherText:
	text "This is my trusted"
	line "pal, POLIWRATH!"

	para "It evolved from"
	line "POLIWHIRL when I"
	cont "used WATER STONE!"
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: Ribi"
	line "ribit!"
	done

CeladonCityRocket1Text:
	text "What are you"
	line "staring at?"
	done

CeladonCityRocket2Text:
	text "Keep out of TEAM"
	line "ROCKET's way!"
	done

CeladonCitySignText:
	text "CELADON CITY"

	para "The City of"
	line "Rainbow Dreams"
	done

CeladonGymSignText:
	text "CELADON CITY"
	line "#MON GYM"
	cont "LEADER: ERIKA"

	para "The Nature-Loving"
	line "Princess"
	done

CeladonCityDeptStoreSignText:
	text "Find What You"
	line "Need at CELADON"
	cont "DEPT.STORE!"
	done

CeladonCityMansionSignText:
	text "CELADON MANSION"
	done

CeladonCityGameCornerSignText:
if DEF(_CRYSTAL_AU)
	text "The Game Area for"
	line "Grown-ups--CELADON"
	cont "GAME CORNER"
	done
else
	text "The Playground for"
	line "Everybody--CELADON"
	cont "GAME CORNER"
	done
endc

CeladonCityTrainerTipsText:
	text "TRAINER TIPS"

	para "X ACCURACY boosts"
	line "the accuracy of"
	cont "techniques!"

	para "DIRE HIT jacks up"
	line "the likelihood of"
	cont "critical hits!"

	para "Get your items at"
	line "CELADON DEPT."
	cont "STORE!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	def_coord_events

	def_bg_events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event  8, 17, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityLittleGirlScript, -1
	object_event 11, 28, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event 14, 19, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityGirlScript, -1
	object_event 25, 22, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 22, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps3Script, -1
	object_event 32, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 30, 12, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrathScript, -1
	object_event 32, 29, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityRocket1Script, -1
	object_event 42, 14, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityRocket2Script, -1
