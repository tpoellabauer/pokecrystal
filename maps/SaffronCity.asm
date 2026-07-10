	object_const_def
	const SAFFRONCITY_ROCKET1
	const SAFFRONCITY_ROCKET2
	const SAFFRONCITY_ROCKET3
	const SAFFRONCITY_ROCKET4
	const SAFFRONCITY_ROCKET5
	const SAFFRONCITY_ROCKET6
	const SAFFRONCITY_ROCKET7
	const SAFFRONCITY_SCIENTIST
	const SAFFRONCITY_SILPH_WORKER_M
	const SAFFRONCITY_SILPH_WORKER_F
	const SAFFRONCITY_GENTLEMAN
	const SAFFRONCITY_PIDGEOT
	const SAFFRONCITY_ROCKER
	const SAFFRONCITY_ROCKET8
	const SAFFRONCITY_ROCKET9

SaffronCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlypointCallback

SaffronCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

; Gen 1 Saffron City is occupied by loitering TEAM ROCKET grunts plus a
; handful of civilians whose dialogue already assumes Silph Co. is cleared
; (Rocket1/4/7 still threaten "SAFFRON belongs to TEAM ROCKET", while the
; Scientist/Silph workers/Rocker talk about Rocket being gone) -- ported
; verbatim, no event gating: Gen 1's own SaffronCity_Script has no checkevent
; on any of these lines either, so the contradiction is faithful to Red, not
; a bug to fix.
SaffronCityRocket1Script:
	jumptextfaceplayer SaffronCityRocket1Text

SaffronCityRocket2Script:
	jumptextfaceplayer SaffronCityRocket2Text

SaffronCityRocket3Script:
	jumptextfaceplayer SaffronCityRocket3Text

SaffronCityRocket4Script:
	jumptextfaceplayer SaffronCityRocket4Text

SaffronCityRocket5Script:
	jumptextfaceplayer SaffronCityRocket5Text

SaffronCityRocket6Script:
	jumptextfaceplayer SaffronCityRocket6Text

SaffronCityRocket7Script:
	jumptextfaceplayer SaffronCityRocket7Text

SaffronCityScientistScript:
	jumptextfaceplayer SaffronCityScientistText

; Gen 1 SPRITE_SILPH_WORKER_M/F have no Gen 2 sprite sheet equivalent; reused
; the same substitutes already established for Silph Co workers elsewhere in
; this project (SafariZoneEastRestHouse/CinnabarMart): Gentleman for M, Pokefan F for F.
SaffronCitySilphWorkerMScript:
	jumptextfaceplayer SaffronCitySilphWorkerMText

SaffronCitySilphWorkerFScript:
	jumptextfaceplayer SaffronCitySilphWorkerFText

SaffronCityGentlemanScript:
	jumptextfaceplayer SaffronCityGentlemanText

SaffronCityPidgeotScript:
	opentext
	writetext SaffronCityPidgeotText
	cry PIDGEOT
	waitbutton
	closetext
	end

SaffronCityRockerScript:
	jumptextfaceplayer SaffronCityRockerText

SaffronCityRocket8Script:
	jumptextfaceplayer SaffronCityRocket8Text

SaffronCityRocket9Script:
	jumptextfaceplayer SaffronCityRocket9Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd PokecenterSignScript

SaffronCityMartSign:
	jumpstd MartSignScript

SaffronCityRocket1Text:
	text "What do you want?"
	line "Get lost!"
	done

SaffronCityRocket2Text:
	text "BOSS said he'll"
	line "take this town!"
	done

SaffronCityRocket3Text:
	text "Get out of the"
	line "way!"
	done

SaffronCityRocket4Text:
	text "SAFFRON belongs"
	line "to TEAM ROCKET!"
	done

SaffronCityRocket5Text:
	text "Being evil makes"
	line "me feel so alive!"
	done

SaffronCityRocket6Text:
	text "Ow! Watch where"
	line "you're walking!"
	done

SaffronCityRocket7Text:
	text "With SILPH under"
	line "control, we can"
	cont "exploit #MON"
	cont "around the world!"
	done

SaffronCityScientistText:
	text "You beat TEAM"
	line "ROCKET all alone?"
	cont "That's amazing!"
	done

SaffronCitySilphWorkerMText:
	text "Yeah! TEAM ROCKET"
	line "is gone!"
	cont "It's safe to go"
	cont "out again!"
	done

SaffronCitySilphWorkerFText:
	text "People should be"
	line "flocking back to"
	cont "SAFFRON now."
	done

SaffronCityGentlemanText:
	text "I flew here on my"
	line "PIDGEOT when I"
	cont "read about SILPH."

	para "It's already over?"
	line "I missed the"
	cont "media action."
	done

SaffronCityPidgeotText:
	text "PIDGEOT: Bi bibii!"
	done

SaffronCityRockerText:
	text "I saw ROCKET"
	line "BOSS escaping"
	cont "SILPH's building."
	done

SaffronCityRocket8Text:
	text "I'm a security"
	line "guard."

	para "Suspicious kids I"
	line "don't allow in!"
	done

SaffronCityRocket9Text:
	text "…"
	line "Snore…"

	para "Hah! He's taking"
	line "a snooze!"
	done

SaffronCitySignText:
	text "SAFFRON CITY"

	para "Shining, Golden"
	line "Land of Commerce"
	done

SaffronGymSignText:
	text "SAFFRON CITY"
	line "#MON GYM"
	cont "LEADER: SABRINA"

	para "The Master of"
	line "Psychic #MON!"
	done

FightingDojoSignText:
	text "Everyone Welcome!"
	line "FIGHTING DOJO"
	done

SilphCoSignText:
	text "SILPH CO."
	line "OFFICE BUILDING"
	done

MrPsychicsHouseSignText:
	text "MR.PSYCHIC'S"
	line "HOUSE"
	done

SaffronCityMagnetTrainStationSignText:
	text "SAFFRON CITY"
	line "MAGNET TRAIN"
	cont "STATION"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	def_object_events
	object_event  7,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket1Script, -1
	object_event 20,  8, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket2Script, -1
	object_event 34,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket3Script, -1
	object_event 13, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket4Script, -1
	object_event 11, 25, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket5Script, -1
	object_event 32, 13, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket6Script, -1
	object_event 18, 30, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket7Script, -1
	object_event  8, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityScientistScript, -1
	object_event 23, 23, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCitySilphWorkerMScript, -1
	object_event 17, 30, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCitySilphWorkerFScript, -1
	object_event 30, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityGentlemanScript, -1
	object_event 31, 12, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityPidgeotScript, -1
	object_event 18,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRockerScript, -1
	object_event 18, 22, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket8Script, -1
	object_event 19, 22, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityRocket9Script, -1
