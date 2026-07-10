	object_const_def
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_COOLTRAINER_F1
	const ROUTE25_YOUNGSTER3
	const ROUTE25_COOLTRAINER_F2
	const ROUTE25_HIKER1
	const ROUTE25_HIKER2
	const ROUTE25_HIKER3

Route25_MapScripts:
	def_scene_scripts
	scene_script Route25Noop1Scene, SCENE_ROUTE25_NOOP
	scene_script Route25Noop2Scene, SCENE_ROUTE25_MISTYS_DATE

	def_callbacks

Route25Noop1Scene:
	end

Route25Noop2Scene:
	end

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement1
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement1
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement1
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement2
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement2
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement2
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

; Gen 1 Route 25 trainer roster, ported from pokeredDisassembly/data/maps/objects/Route25.asm +
; scripts/Route25.asm + text/Route25.asm. Sprite vs battle-class follows Gen 1 exactly: the two
; SPRITE_COOLTRAINER_F NPCs battle as OPP_LASS, and the SPRITE_COOLTRAINER_M NPC battles as
; OPP_JR_TRAINER_M (row 2 of Gen 1's JrTrainerMData, a row Gen 1 itself shares with a Route 24
; trainer -- reuses the same JR_TRAINER_M_6 const/data already added for Route24). Gen 1's Hiker
; class has no dedicated Gen 2 sprite; substituted with SPRITE_POKEFAN_M (same convention as
; Route9's Hikers).
TrainerYoungsterBenny:
	trainer YOUNGSTER, BENNY, EVENT_BEAT_ROUTE_25_TRAINER_0, YoungsterBennySeenText, YoungsterBennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterTodd:
	trainer YOUNGSTER, TODD, EVENT_BEAT_ROUTE_25_TRAINER_1, YoungsterToddSeenText, YoungsterToddBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterToddAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerMRoute25:
	trainer JR_TRAINER_M, JR_TRAINER_M_6, EVENT_BEAT_ROUTE_25_TRAINER_2, CooltrainerMRoute25SeenText, CooltrainerMRoute25BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMRoute25AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerFHeather:
	trainer LASS, HEATHER, EVENT_BEAT_ROUTE_25_TRAINER_3, CooltrainerFHeatherSeenText, CooltrainerFHeatherBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFHeatherAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterLucas:
	trainer YOUNGSTER, LUCAS, EVENT_BEAT_ROUTE_25_TRAINER_4, YoungsterLucasSeenText, YoungsterLucasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterLucasAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerFNancy:
	trainer LASS, NANCY, EVENT_BEAT_ROUTE_25_TRAINER_5, CooltrainerFNancySeenText, CooltrainerFNancyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFNancyAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRoute25_1:
	trainer HIKER, HIKER_ROUTE25_1, EVENT_BEAT_ROUTE_25_TRAINER_6, HikerRoute25_1SeenText, HikerRoute25_1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRoute25_1AfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRoute25_2:
	trainer HIKER, HIKER_ROUTE25_2, EVENT_BEAT_ROUTE_25_TRAINER_7, HikerRoute25_2SeenText, HikerRoute25_2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRoute25_2AfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRoute25_3:
	trainer HIKER, HIKER_ROUTE25_3, EVENT_BEAT_ROUTE_25_TRAINER_8, HikerRoute25_3SeenText, HikerRoute25_3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRoute25_3AfterBattleText
	waitbutton
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_25_HIDDEN_ETHER

Route25HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_25_HIDDEN_ELIXER

Route25MistysDateLeavesMovement1:
	big_step DOWN
	step_end

Route25MistysDateLeavesMovement2:
	big_step DOWN
	big_step DOWN
	step_end

Route25MistyApproachesPlayerMovement1:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyApproachesPlayerMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement1:
	step DOWN
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement2:
	step UP
	step LEFT
	step_end

Route25MistyLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "MISTY: Aww! Why"
	line "did you have to"

	para "show up and bug us"
	line "now?"

	para "Do you know what"
	line "they call people"
	cont "like you?"

	para "Pests! You heard"
	line "me right, pest!"

	para "…"

	para "…Oh? Those BADGES"
	line "you have… Are they"
	cont "JOHTO GYM BADGES?"

	para "If you have eight,"
	line "you must be good."

	para "OK, then. Come to"
	line "CERULEAN GYM."

	para "I'll be happy to"
	line "take you on."

	para "I'm MISTY, the"
	line "GYM LEADER in"
	cont "CERULEAN."
	done

YoungsterBennySeenText:
	text "Local trainers"
	line "come here to"
	cont "practice!"
	done

YoungsterBennyBeatenText:
	text "You're"
	line "decent."
	done

YoungsterBennyAfterBattleText:
	text "All #MON have"
	line "weaknesses. It's"
	cont "best to raise"
	cont "different kinds."
	done

YoungsterToddSeenText:
	text "Dad took me to a"
	line "great party on"
	cont "S.S.ANNE at"
	cont "VERMILION CITY!"
	done

YoungsterToddBeatenText:
	text "I'm"
	line "not mad!"
	done

YoungsterToddAfterBattleText:
	text "On S.S.ANNE, I"
	line "saw trainers from"
	cont "around the world."
	done

CooltrainerMRoute25SeenText:
	text "I'm a cool guy."
	line "I've got a girl"
	cont "friend!"
	done

CooltrainerMRoute25BeatenText:
	text "Aww,"
	line "darn..."
	done

CooltrainerMRoute25AfterBattleText:
	text "Oh well. My girl"
	line "will cheer me up."
	done

CooltrainerFHeatherSeenText:
	text "Hi! My boy"
	line "friend is cool!"
	done

CooltrainerFHeatherBeatenText:
	text "I was in"
	line "bad condition!"
	done

CooltrainerFHeatherAfterBattleText:
	text "I wish my guy was"
	line "as good as you!"
	done

YoungsterLucasSeenText:
	text "I knew I had to"
	line "fight you!"
	done

YoungsterLucasBeatenText:
	text "I knew"
	line "I'd lose too!"
	done

YoungsterLucasAfterBattleText:
	text "If your #MON"
	line "gets confused or"
	cont "falls asleep,"
	cont "switch it!"
	done

CooltrainerFNancySeenText:
	text "My friend has a"
	line "cute #MON."
	cont "I'm so jealous!"
	done

CooltrainerFNancyBeatenText:
	text "I'm"
	line "not so jealous!"
	done

CooltrainerFNancyAfterBattleText:
	text "You came from MT."
	line "MOON? May I have"
	cont "a CLEFAIRY?"
	done

HikerRoute25_1SeenText:
	text "I just got down"
	line "from MT.MOON,"
	cont "but I'm ready!"
	done

HikerRoute25_1BeatenText:
	text "You"
	line "worked hard!"
	done

HikerRoute25_1AfterBattleText:
	text "Drat!"
	line "A ZUBAT bit me"
	cont "back in there."
	done

HikerRoute25_2SeenText:
	text "I'm off to see a"
	line "#MON collector"
	cont "at the cape!"
	done

HikerRoute25_2BeatenText:
	text "You"
	line "got me."
	done

HikerRoute25_2AfterBattleText:
	text "The collector has"
	line "many rare kinds"
	cont "of #MON."
	done

HikerRoute25_3SeenText:
	text "You're going to"
	line "see BILL? First,"
	cont "let's fight!"
	done

HikerRoute25_3BeatenText:
	text "You're"
	line "something."
	done

HikerRoute25_3AfterBattleText:
	text "The trail below"
	line "is a shortcut to"
	cont "CERULEAN CITY."
	done

BillsHouseSignText:
	text "SEA COTTAGE"
	line "BILL lives here!"
	done

UnusedBillsHouseSignText: ; unreferenced
	text "BILL'S HOUSE"
	done

Route25_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 45,  3, BILLS_HOUSE, 1

	def_coord_events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	def_bg_events
	bg_event 43,  3, BGEVENT_READ, BillsHouseSign
	bg_event 38,  3, BGEVENT_ITEM, Route25HiddenEther
	bg_event 10,  1, BGEVENT_ITEM, Route25HiddenElixer

	def_object_events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 14,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterBenny, -1
	object_event 18,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterTodd, -1
	object_event 24,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerMRoute25, -1
	object_event 18,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerFHeather, -1
	object_event 32,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterLucas, -1
	object_event 37,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerFNancy, -1
	object_event  8,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerRoute25_1, -1
	object_event 23,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerRoute25_2, -1
	object_event 13,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerRoute25_3, -1
