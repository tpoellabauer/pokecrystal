	object_const_def
	const ROUTE8_SUPER_NERD1
	const ROUTE8_GAMBLER1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_LASS1
	const ROUTE8_SUPER_NERD3
	const ROUTE8_LASS2
	const ROUTE8_LASS3
	const ROUTE8_GAMBLER2
	const ROUTE8_LASS4
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSupernerdFrank:
	trainer SUPER_NERD, FRANK, EVENT_BEAT_ROUTE_8_TRAINER_0, SupernerdFrankSeenText, SupernerdFrankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdFrankAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerRoute8a:
	trainer GAMBLER, GAMBLER_7, EVENT_BEAT_ROUTE_8_TRAINER_1, GamblerRoute8aSeenText, GamblerRoute8aBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerRoute8aAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdDuane:
	trainer SUPER_NERD, DUANE, EVENT_BEAT_ROUTE_8_TRAINER_2, SupernerdDuaneSeenText, SupernerdDuaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdDuaneAfterBattleText
	waitbutton
	closetext
	end

TrainerLassNora:
	trainer LASS, NORA, EVENT_BEAT_ROUTE_8_TRAINER_3, LassNoraSeenText, LassNoraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassNoraAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdMorris:
	trainer SUPER_NERD, MORRIS, EVENT_BEAT_ROUTE_8_TRAINER_4, SupernerdMorrisSeenText, SupernerdMorrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdMorrisAfterBattleText
	waitbutton
	closetext
	end

TrainerLassVera:
	trainer LASS, VERA, EVENT_BEAT_ROUTE_8_TRAINER_5, LassVeraSeenText, LassVeraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassVeraAfterBattleText
	waitbutton
	closetext
	end

TrainerLassIris:
	trainer LASS, IRIS, EVENT_BEAT_ROUTE_8_TRAINER_6, LassIrisSeenText, LassIrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassIrisAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerRoute8b:
	trainer GAMBLER, GAMBLER_8, EVENT_BEAT_ROUTE_8_TRAINER_7, GamblerRoute8bSeenText, GamblerRoute8bBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerRoute8bAfterBattleText
	waitbutton
	closetext
	end

TrainerLassOlive:
	trainer LASS, OLIVE, EVENT_BEAT_ROUTE_8_TRAINER_8, LassOliveSeenText, LassOliveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassOliveAfterBattleText
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8

SupernerdFrankSeenText:
	text "You look good at"
	line "#MON, but"
	cont "how's your chem?"
	done

SupernerdFrankBeatenText:
	text "Ow! Meltdown!"
	done

SupernerdFrankAfterBattleText:
	text "I am better at"
	line "school than this!"
	done

GamblerRoute8aSeenText:
	text "All right! Let's"
	line "roll the dice!"
	done

GamblerRoute8aBeatenText:
	text "Drat! Came up"
	line "short!"
	done

GamblerRoute8aAfterBattleText:
	text "Lady Luck's not"
	line "with me today!"
	done

SupernerdDuaneSeenText:
	text "You need strategy"
	line "to win at this!"
	done

SupernerdDuaneBeatenText:
	text "It's not"
	line "logical!"
	done

SupernerdDuaneAfterBattleText:
	text "Go with GRIMER"
	line "first...and..."
	cont "...and...then..."
	done

LassNoraSeenText:
	text "I like NIDORAN, so"
	line "I collect them!"
	done

LassNoraBeatenText:
	text "Why? Why??"
	done

LassNoraAfterBattleText:
	text "When #MON grow"
	line "up they get ugly!"
	cont "They shouldn't"
	cont "evolve!"
	done

SupernerdMorrisSeenText:
	text "School is fun, but"
	line "so are #MON."
	done

SupernerdMorrisBeatenText:
	text "I'll stay with"
	line "school."
	done

SupernerdMorrisAfterBattleText:
	text "We're stuck here"
	line "because of the"
	cont "gates at SAFFRON."
	done

LassVeraSeenText:
	text "MEOWTH is so cute,"
	line "meow, meow, meow!"
	done

LassVeraBeatenText:
	text "Meow!"
	done

LassVeraAfterBattleText:
	text "I think PIDGEY"
	line "and RATTATA"
	cont "are cute too!"
	done

LassIrisSeenText:
	text "We must look"
	line "silly standing"
	cont "here like this!"
	done

LassIrisBeatenText:
	text "Look what you"
	line "did!"
	done

LassIrisAfterBattleText:
	text "SAFFRON's gate"
	line "keeper won't let"
	cont "us through."
	cont "He's so mean!"
	done

GamblerRoute8bSeenText:
	text "I'm a rambling,"
	line "gambling dude!"
	done

GamblerRoute8bBeatenText:
	text "Missed the big"
	line "score!"
	done

GamblerRoute8bAfterBattleText:
	text "Gambling and"
	line "#MON are like"
	cont "eating peanuts!"
	cont "Just can't stop!"
	done

LassOliveSeenText:
	text "What's a cute,"
	line "round and fluffy"
	cont "#MON?"
	done

LassOliveBeatenText:
	text "Stop! Don't be so"
	line "mean to my"
	cont "CLEFAIRY!"
	done

LassOliveAfterBattleText:
	text "I heard that"
	line "CLEFAIRY evolves"
	cont "when it's exposed"
	cont "to a MOON STONE."
	done

Route8LockedDoorText:
	text "It's locked…"
	done

Route8UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CELADON CITY -"
	line "LAVENDER TOWN"
	done

Route8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  4, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4,  5, ROUTE_8_SAFFRON_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, Route8UndergroundPathSign
	bg_event 10,  5, BGEVENT_READ, Route8LockedDoor

	def_object_events
	object_event 13,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdFrank, -1
	object_event 18,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerGamblerRoute8a, -1
	object_event 23,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdDuane, -1
	object_event 16,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 13, TrainerLassNora, -1
	object_event 20,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerSupernerdMorris, -1
	object_event 16,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 14, TrainerLassVera, -1
	object_event 20,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 15, TrainerLassIris, -1
	object_event 31, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 7, TrainerGamblerRoute8b, -1
	object_event 28, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 16, TrainerLassOlive, -1
	object_event 33,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
