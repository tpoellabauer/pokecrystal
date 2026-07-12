	object_const_def
	const VERMILIONCITY_BEAUTY
	const VERMILIONCITY_GAMBLER1
	const VERMILIONCITY_SAILOR1
	const VERMILIONCITY_GAMBLER2
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SAILOR2
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

; Gen 1 Vermilion City, ported from pokeredDisassembly/scripts+text+data/maps/objects/VermilionCity.asm.
; Beauty/Gambler1/Sailor1/Gambler2/Machop/Sailor2 are Gen1's six NPCs (Gambler2+Machop reuse the
; pre-existing "construction machop" pair, repositioned/renamed to match Gen1). Gen1's Sailor1
; ticket gate is simplified to flavor dialogue (the real S.S. Ticket check already happens at
; VermilionPort's boarding script). BigSnorlax/PokefanM are kept GSC-only content wired elsewhere
; (EVENT_FOUGHT_SNORLAX referenced by VictoryRoadGate.asm + VermilionPokecenter1F.asm) --
; see parity_static_whitelist.toml.
VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityBeautyScript:
	jumptextfaceplayer VermilionCityBeautyText

VermilionCityGambler1Script:
	jumptextfaceplayer VermilionCityGambler1Text

VermilionCitySailor1Script:
	jumptextfaceplayer VermilionCitySailor1Text

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySailor2Script:
	jumptextfaceplayer VermilionCitySailor2Text

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionCityNoticeSign:
	jumptext VermilionCityNoticeSignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityBeautyText:
	text "We're careful"
	line "about pollution!"

	para "We've heard"
	line "GRIMER multiplies"
	cont "in toxic sludge!"
	done

VermilionCityGambler1Text:
	text "Did you see the"
	line "S.S.ANNE moored"
	cont "in the harbor?"
	done

VermilionCitySailor1Text:
	text "Welcome to S.S."
	line "ANNE!"

	para "Show the sailor at"
	line "the dock your S.S."
	cont "TICKET to board."
	done

VermilionMachopOwnerText:
	text "My #MON is"
	line "preparing the land"
	cont "for construction."

	para "But I have no"
	line "money to start the"
	cont "project…"
	done

VermilionMachopText1:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "A MACHOP is growl-"
	line "ing while stomping"
	cont "the ground flat."
	done

VermilionCitySailor2Text:
	text "S.S.ANNE is a"
	line "famous luxury"
	cont "cruise ship."

	para "We visit VERMILION"
	line "once a year."
	done

VermilionCitySnorlaxSleepingText:
	text "SNORLAX is snoring"
	line "peacefully…"
	done

VermilionCityRadioNearSnorlaxText:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

VermilionCityBadgeGuyTrainerText:
	text "Skilled trainers"
	line "gather in KANTO."

	para "GYM LEADERS are"
	line "especially strong."

	para "They won't be easy"
	line "to defeat."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "You've started to"
	line "collect KANTO GYM"
	cont "BADGES?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "I guess you'll be"
	line "finished with your"

	para "conquest of KANTO"
	line "GYMS soon."

	para "Let me know if"
	line "you get all eight"
	cont "BADGES."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Congratulations!"

	para "You got all the"
	line "KANTO GYM BADGES."

	para "I've got a reward"
	line "for your efforts."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Having a variety"
	line "of #MON types"

	para "should give you an"
	line "edge in battle."

	para "I'm sure the KANTO"
	line "GYM BADGES will"
	cont "help you."
	done

VermilionCitySignText:
	text "VERMILION CITY"

	para "The Port of"
	line "Exquisite Sunsets"
	done

VermilionCityNoticeSignText:
	text "NOTICE!"

	para "ROUTE 12 may be"
	line "blocked off by a"
	cont "sleeping #MON."

	para "Detour through"
	line "ROCK TUNNEL to"
	cont "LAVENDER TOWN."

	para "VERMILION POLICE"
	done

VermilionGymSignText:
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEADER: LT.SURGE"

	para "The Lightning"
	line "American"
	done

PokemonFanClubSignText:
	text "#MON FAN CLUB"

	para "All #MON Fans"
	line "Welcome!"
	done

VermilionCityPortSignText:
	text "VERMILION HARBOR"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  3, VERMILION_POKECENTER_1F, 1
	warp_event  9, 13, POKEMON_FAN_CLUB, 1
	warp_event 23, 13, VERMILION_MART, 2
	warp_event 12, 19, VERMILION_GYM, 1
	warp_event 23, 19, VERMILION_PIDGEY_HOUSE, 1
	warp_event 18, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 15, 13, VERMILION_TRADE_HOUSE, 1
	warp_event  7,  3, VERMILION_OLD_ROD_HOUSE, 1
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 27,  3, BGEVENT_READ, VermilionCitySign
	bg_event 37, 13, BGEVENT_READ, VermilionCityNoticeSign
	bg_event 24, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12,  3, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event  7, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event  7, 19, BGEVENT_READ, VermilionGymSign
	bg_event 29, 15, BGEVENT_READ, VermilionCityPortSign

	def_object_events
	object_event 19,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCityBeautyScript, -1
	object_event 14,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityGambler1Script, -1
	object_event 19, 30, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCitySailor1Script, -1
	object_event 30,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 29,  9, SPRITE_MACHOP, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 25, 27, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCitySailor2Script, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
