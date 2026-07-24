; issue #178 audit: ROUTE6_POKEFAN_M1 (added vs Red) blocks the underground path, gated on
; EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH -- exactly the flag PowerPlant's Manager sets
; on machine-part return, i.e. this NPC is the questline's payoff. See maps/PowerPlant.asm. Keep,
; won't-fix.
	object_const_def
	const ROUTE6_POKEFAN_M1
	const ROUTE6_COOLTRAINER_M1
	const ROUTE6_COOLTRAINER_F1
	const ROUTE6_YOUNGSTER1
	const ROUTE6_COOLTRAINER_M2
	const ROUTE6_COOLTRAINER_F2
	const ROUTE6_YOUNGSTER2

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

TrainerCooltrainerm1Route6:
	trainer JR_TRAINER_M, JR_TRAINER_M_1, EVENT_BEAT_ROUTE_6_TRAINER_0, Cooltrainerm1Route6SeenText, Cooltrainerm1Route6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route6CooltrainerAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerf1Route6:
	trainer JR_TRAINER_F, JR_TRAINER_F_1, EVENT_BEAT_ROUTE_6_TRAINER_1, Cooltrainerf1Route6SeenText, Cooltrainerf1Route6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route6CooltrainerAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterDexter:
	trainer BUG_CATCHER, DEXTER, EVENT_BEAT_ROUTE_6_TRAINER_2, YoungsterDexterSeenText, YoungsterDexterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterDexterAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerm2Route6:
	trainer JR_TRAINER_M, JR_TRAINER_M_2, EVENT_BEAT_ROUTE_6_TRAINER_3, Cooltrainerm2Route6SeenText, Cooltrainerm2Route6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerm2Route6AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerf2Route6:
	trainer JR_TRAINER_F, JR_TRAINER_F_2, EVENT_BEAT_ROUTE_6_TRAINER_4, Cooltrainerf2Route6SeenText, Cooltrainerf2Route6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerf2Route6AfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterTrey:
	trainer BUG_CATCHER, TREY, EVENT_BEAT_ROUTE_6_TRAINER_5, YoungsterTreySeenText, YoungsterTreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterTreyAfterBattleText
	waitbutton
	closetext
	end

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

Cooltrainerm1Route6SeenText:
	text "Who's there?"
	line "Quit listening in"
	cont "on us!"
	done

Cooltrainerm1Route6BeatenText:
	text "I just can't win!"
	done

Route6CooltrainerAfterBattleText:
	text "Whisper..."
	line "whisper..."
	done

Cooltrainerf1Route6SeenText:
	text "Excuse me! This"
	line "is a private"
	cont "conversation!"
	done

Cooltrainerf1Route6BeatenText:
	text "Ugh! I hate"
	line "losing!"
	done

YoungsterDexterSeenText:
	text "There aren't many"
	line "bugs out here."
	done

YoungsterDexterBeatenText:
	text "No! You're"
	line "kidding!"
	done

YoungsterDexterAfterBattleText:
	text "I like bugs, so"
	line "I'm going back to"
	cont "VIRIDIAN FOREST."
	done

Cooltrainerm2Route6SeenText:
	text "Huh? You want"
	line "to talk to me?"
	done

Cooltrainerm2Route6BeatenText:
	text "I didn't start"
	line "it!"
	done

Cooltrainerm2Route6AfterBattleText:
	text "I should carry"
	line "more #MON with"
	cont "me for safety."
	done

Cooltrainerf2Route6SeenText:
	text "Me? Well, OK."
	line "I'll play!"
	done

Cooltrainerf2Route6BeatenText:
	text "Just didn't"
	line "work!"
	done

Cooltrainerf2Route6AfterBattleText:
	text "I want to get"
	line "stronger! What's"
	cont "your secret?"
	done

YoungsterTreySeenText:
	text "I've never seen"
	line "you around!"
	cont "Are you good?"
	done

YoungsterTreyBeatenText:
	text "You are too"
	line "good!"
	done

YoungsterTreyAfterBattleText:
	text "Are my #MON"
	line "weak? Or, am I"
	cont "just bad?"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 13, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 10,  7, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 19, 15, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 10, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerm1Route6, -1
	object_event 11, 21, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerf1Route6, -1
	object_event  0, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 10, TrainerYoungsterDexter, -1
	object_event 11, 31, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerm2Route6, -1
	object_event 11, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerf2Route6, -1
	object_event 19, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 10, TrainerYoungsterTrey, -1
