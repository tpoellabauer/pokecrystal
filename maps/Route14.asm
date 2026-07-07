	object_const_def
	const ROUTE14_COOLTRAINER_M1
	const ROUTE14_COOLTRAINER_M2
	const ROUTE14_COOLTRAINER_M3
	const ROUTE14_COOLTRAINER_M4
	const ROUTE14_COOLTRAINER_M5
	const ROUTE14_COOLTRAINER_M6
	const ROUTE14_BIKER1
	const ROUTE14_BIKER2
	const ROUTE14_BIKER3
	const ROUTE14_BIKER4
	const ROUTE14_KIM

Route14_MapScripts:
	def_scene_scripts

	def_callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

; Gen 1: all six are CoolTrainerM sprite, BIRD_KEEPER class.
TrainerRoute14CoolTrainerM1:
	trainer BIRD_KEEPER, NEIL, EVENT_BEAT_ROUTE_14_TRAINER_0, Route14CoolTrainerM1SeenText, Route14CoolTrainerM1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14CoolTrainerM1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14CoolTrainerM2:
	trainer BIRD_KEEPER, GARTH, EVENT_BEAT_ROUTE_14_TRAINER_1, Route14CoolTrainerM2SeenText, Route14CoolTrainerM2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14CoolTrainerM2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14CoolTrainerM3:
	trainer BIRD_KEEPER, CLIFF, EVENT_BEAT_ROUTE_14_TRAINER_2, Route14CoolTrainerM3SeenText, Route14CoolTrainerM3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14CoolTrainerM3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14CoolTrainerM4:
	trainer BIRD_KEEPER, WESLEY, EVENT_BEAT_ROUTE_14_TRAINER_3, Route14CoolTrainerM4SeenText, Route14CoolTrainerM4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14CoolTrainerM4AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14CoolTrainerM5:
	trainer BIRD_KEEPER, AUSTIN, EVENT_BEAT_ROUTE_14_TRAINER_4, Route14CoolTrainerM5SeenText, Route14CoolTrainerM5BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14CoolTrainerM5AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14CoolTrainerM6:
	trainer BIRD_KEEPER, BRUCE, EVENT_BEAT_ROUTE_14_TRAINER_5, Route14CoolTrainerM6SeenText, Route14CoolTrainerM6BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14CoolTrainerM6AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14Biker1:
	trainer BIKER, MERLE, EVENT_BEAT_ROUTE_14_TRAINER_6, Route14Biker1SeenText, Route14Biker1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14Biker1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14Biker2:
	trainer BIKER, OTTO, EVENT_BEAT_ROUTE_14_TRAINER_7, Route14Biker2SeenText, Route14Biker2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14Biker2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14Biker3:
	trainer BIKER, RANDY1, EVENT_BEAT_ROUTE_14_TRAINER_8, Route14Biker3SeenText, Route14Biker3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14Biker3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute14Biker4:
	trainer BIKER, CORY, EVENT_BEAT_ROUTE_14_TRAINER_9, Route14Biker4SeenText, Route14Biker4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route14Biker4AfterBattleText
	waitbutton
	closetext
	end

Route14Sign:
	jumptext Route14SignText

Route14CoolTrainerM1SeenText:
	text "You need to use"
	line "TMs to teach good"
	cont "moves to #MON!"
	done

Route14CoolTrainerM1BeatenText:
	text "Not"
	line "good enough!"
	prompt

Route14CoolTrainerM1AfterBattleText:
	text "You have some HMs"
	line "right? #MON"
	cont "can't ever forget"
	cont "those moves."
	done

Route14CoolTrainerM2SeenText:
	text "My bird #MON"
	line "should be ready"
	cont "for battle."
	done

Route14CoolTrainerM2BeatenText:
	text "Not"
	line "ready yet!"
	prompt

Route14CoolTrainerM2AfterBattleText:
	text "They need to learn"
	line "better moves."
	done

Route14CoolTrainerM3SeenText:
	text "TMs are on sale"
	line "in CELADON!"
	cont "But, only a few"
	cont "people have HMs!"
	done

Route14CoolTrainerM3BeatenText:
	text "Aww,"
	line "bummer!"
	prompt

Route14CoolTrainerM3AfterBattleText:
	text "Teach #MON"
	line "moves of the same"
	cont "element type for"
	cont "more power."
	done

Route14CoolTrainerM4SeenText:
	text "Have you taught"
	line "your bird #MON"
	cont "how to FLY?"
	done

Route14CoolTrainerM4BeatenText:
	text "Shot"
	line "down in flames!"
	prompt

Route14CoolTrainerM4AfterBattleText:
	text "Bird #MON are"
	line "my true love!"
	done

Route14CoolTrainerM5SeenText:
	text "Have you heard of"
	line "the legendary"
	cont "#MON?"
	done

Route14CoolTrainerM5BeatenText:
	text "Why?"
	line "Why'd I lose?"
	prompt

Route14CoolTrainerM5AfterBattleText:
	text "The 3 legendary"
	line "#MON are all"
	cont "birds of prey."
	done

Route14CoolTrainerM6SeenText:
	text "I'm not into it,"
	line "but OK! Let's go!"
	done

Route14CoolTrainerM6BeatenText:
	text "I"
	line "knew it!"
	prompt

Route14CoolTrainerM6AfterBattleText:
	text "Winning, losing,"
	line "it doesn't matter"
	cont "in the long run!"
	done

Route14Biker1SeenText:
	text "C'mon, c'mon."
	line "Let's go, let's"
	cont "go, let's go!"
	done

Route14Biker1BeatenText:
	text "Arrg!"
	line "Lost! Get lost!"
	prompt

Route14Biker1AfterBattleText:
	text "What, what, what?"
	line "What do you want?"
	done

Route14Biker2SeenText:
	text "Perfect! I need to"
	line "burn some time!"
	done

Route14Biker2BeatenText:
	text "What?"
	line "You!?"
	prompt

Route14Biker2AfterBattleText:
	text "Raising #MON"
	line "is a drag, man."
	done

Route14Biker3SeenText:
	text "We ride out here"
	line "because there's"
	cont "more room!"
	done

Route14Biker3BeatenText:
	text "Wipe out!"
	prompt

Route14Biker3AfterBattleText:
	text "It's cool you"
	line "made your #MON"
	cont "so strong!"

	para "Might is right!"
	line "And you know it!"
	done

Route14Biker4SeenText:
	text "#MON fight?"
	line "Cool! Rumble!"
	done

Route14Biker4BeatenText:
	text "Blown"
	line "away!"
	prompt

Route14Biker4AfterBattleText:
	text "You know who'd"
	line "win, you and me"
	cont "one on one!"
	done

Route14SignText:
	text "ROUTE 14"
	line "West to FUCHSIA"
	cont "CITY"
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 17, 13, BGEVENT_READ, Route14Sign

	def_object_events
	object_event  4,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14CoolTrainerM1, -1
	object_event 15,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14CoolTrainerM2, -1
	object_event 12, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14CoolTrainerM3, -1
	object_event 14, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14CoolTrainerM4, -1
	object_event 15, 31, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14CoolTrainerM5, -1
	object_event  6, 49, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14CoolTrainerM6, -1
	object_event  5, 39, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14Biker1, -1
	object_event  4, 30, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14Biker2, -1
	object_event 15, 30, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14Biker3, -1
	object_event  4, 31, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute14Biker4, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
