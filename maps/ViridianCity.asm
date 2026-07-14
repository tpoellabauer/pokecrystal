	object_const_def
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER
	const VIRIDIANCITY_GIRL
	const VIRIDIANCITY_OLD_MAN_SLEEPY
	const VIRIDIANCITY_YOUNGSTER2

ViridianCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlypointCallback

ViridianCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

; Gen 1's wandering VIRIDIANCITY_OLD_MAN (the one who's had his coffee and offers the
; catch tutorial). Gen 1 runs a scripted BATTLE_TYPE_OLD_MAN demo battle vs a lv5 WEEDLE;
; Gen 2 has no such battle type, so the demo is reduced to his explanation text.
ViridianCityOldMan:
	faceplayer
	opentext
	writetext ViridianCityOldManHadMyCoffeeText
	yesorno
	iftrue .InAHurry
	writetext ViridianCityOldManKnowHowToCatchText
	promptbutton
	writetext ViridianCityOldManWeakenTheTargetText
	waitbutton
	closetext
	end

.InAHurry:
	writetext ViridianCityOldManTimeIsMoneyText
	waitbutton
	closetext
	end

ViridianCityGirlScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KANTO_POKEDEX
	iftrue .GotPokedex
	writetext ViridianCityGirlHasntHadHisCoffeeText
	waitbutton
	closetext
	end

.GotPokedex:
	writetext ViridianCityGirlWhenIGoShopText
	waitbutton
	closetext
	end

; Gen 1's sleeping old man blocking the north exit (SPRITE_GAMBLER_ASLEEP -- no Gen 2
; sleeping sprite exists, so SPRITE_GRAMPS). The pushback itself is the coord_event gate
; below; this is his "private property" line when talked to.
ViridianCityOldManSleepy:
	jumptext ViridianCityOldManSleepyText

ViridianCityYoungster2Script:
	faceplayer
	opentext
	writetext ViridianCityYoungster2AskText
	yesorno
	iffalse .No
	writetext ViridianCityYoungster2CaterpieWeedleText
	waitbutton
	closetext
	end

.No:
	writetext ViridianCityYoungster2OkThenText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	iftrue .LeaderReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.LeaderReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

; Ported from pokered ViridianCityCheckGotPokedexScript: the sleeping old man blocks the
; northern path to Route 2 ("private property!") until you deliver Oak's Parcel and get the
; Pokedex. Coord events at the 3-wide choke (17..19, 9) shove the player back down until
; EVENT_GOT_KANTO_POKEDEX is set (Gen 1 gated on EVENT_GOT_POKEDEX at X=19,Y=9; the Gen 1
; old-man sprite fills the other two lanes, so all three are gated here). Armed SCENE_ALWAYS
; (event-, not scene-, gated). See maps-and-scripting skill.
ViridianCityPokedexGate:
	checkevent EVENT_GOT_KANTO_POKEDEX
	iftrue .open
	opentext
	writetext ViridianCityOldManSleepyText
	waitbutton
	closetext
	applymovement PLAYER, ViridianCityPokedexGatePushbackMovement
.open:
	end

ViridianCityPokedexGatePushbackMovement:
	step DOWN
	step_end

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityTrainerTips1:
	jumptext ViridianCityTrainerTips1Text

ViridianCityTrainerTips2:
	jumptext ViridianCityTrainerTips2Text

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityMartSign:
	jumpstd MartSignScript

ViridianCityOldManHadMyCoffeeText:
	text "Ahh, I've had my"
	line "coffee now and I"
	cont "feel great!"

	para "Sure you can go"
	line "through!"

	para "Are you in a"
	line "hurry?"
	done

ViridianCityOldManKnowHowToCatchText:
	text "I see you're using"
	line "a #DEX."

	para "When you catch a"
	line "#MON, #DEX"
	cont "is automatically"
	cont "updated."

	para "What? Don't you"
	line "know how to catch"
	cont "#MON?"

	para "I'll show you"
	line "how to then."
	done

ViridianCityOldManWeakenTheTargetText:
	text "First, you need"
	line "to weaken the"
	cont "target #MON."
	done

ViridianCityOldManTimeIsMoneyText:
	text "Time is money…"
	line "Go along then."
	done

ViridianCityGirlHasntHadHisCoffeeText:
	text "Oh Grandpa! Don't"
	line "be so mean!"

	para "He hasn't had his"
	line "coffee yet."
	done

ViridianCityGirlWhenIGoShopText:
	text "When I go shop in"
	line "PEWTER CITY, I"

	para "have to take the"
	line "winding trail in"
	cont "VIRIDIAN FOREST."
	done

ViridianCityYoungster2AskText:
	text "You want to know"
	line "about the 2 kinds"

	para "of caterpillar"
	line "#MON?"
	done

ViridianCityYoungster2CaterpieWeedleText:
	text "CATERPIE has no"
	line "poison, but"
	cont "WEEDLE does."

	para "Watch out for its"
	line "POISON STING!"
	done

ViridianCityYoungster2OkThenText:
	text "Oh, OK then!"
	done

ViridianCityGrampsNearGymText:
	text "This #MON GYM"
	line "is always closed."

	para "I wonder who the"
	line "LEADER is?"
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "VIRIDIAN GYM's"
	line "LEADER returned!"
	done

ViridianCityDreamEaterFisherText:
	text "Yawn!"

	para "I must have dozed"
	line "off in the sun."

	para "…I had this dream"
	line "about a DROWZEE"

	para "eating my dream."
	line "Weird, huh?"

	para "Huh?"
	line "What's this?"

	para "Where did this TM"
	line "come from?"

	para "This is spooky!"
	line "Here, you can have"
	cont "this TM."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 contains"
	line "DREAM EATER…"

	para "…Zzzzz…"
	done

ViridianCityYoungsterText:
	text "Those # BALLs"
	line "at your waist!"
	cont "You have #MON!"

	para "It's great that"
	line "you can carry and"

	para "use #MON any"
	line "time, anywhere!"
	done

ViridianCityOldManSleepyText:
	text "You can't go"
	line "through here!"

	para "This is private"
	line "property!"
	done

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "The Eternally"
	line "Green Paradise"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	cont "LEADER: …"

	para "The rest of the"
	line "text is illegible…"
	done

ViridianCityTrainerTips1Text:
	text "TRAINER TIPS"

	para "Catch #MON"
	line "and expand your"
	cont "collection!"

	para "The more you have,"
	line "the easier it is"
	cont "to fight!"
	done

ViridianCityTrainerTips2Text:
	text "TRAINER TIPS"

	para "The battle moves"
	line "of #MON are"

	para "limited by their"
	line "POWER POINTs, PP."

	para "To replenish PP,"
	line "rest your tired"

	para "#MON at a"
	line "#MON CENTER!"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	def_coord_events
	coord_event 17,  9, SCENE_ALWAYS, ViridianCityPokedexGate
	coord_event 18,  9, SCENE_ALWAYS, ViridianCityPokedexGate
	coord_event 19,  9, SCENE_ALWAYS, ViridianCityPokedexGate

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityTrainerTips1
	bg_event 21, 29, BGEVENT_READ, ViridianCityTrainerTips2
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	def_object_events
	object_event 17,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityOldMan, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 13, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
	object_event 17,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityGirlScript, -1
	object_event 18,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityOldManSleepy, -1
	object_event 30, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungster2Script, -1
