	object_const_def
	const ROUTE3_SUPER_NERD
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_COOLTRAINER_F1
	const ROUTE3_YOUNGSTER3
	const ROUTE3_COOLTRAINER_F2
	const ROUTE3_YOUNGSTER4
	const ROUTE3_YOUNGSTER5
	const ROUTE3_COOLTRAINER_F3

Route3_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBugCatcherMerton:
	trainer BUG_CATCHER, MERTON, EVENT_BEAT_ROUTE_3_TRAINER_0, BugCatcherMertonSeenText, BugCatcherMertonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherMertonAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterGrant:
	trainer YOUNGSTER, GRANT, EVENT_BEAT_ROUTE_3_TRAINER_1, YoungsterGrantSeenText, YoungsterGrantBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGrantAfterBattleText
	waitbutton
	closetext
	end

TrainerLassPenny:
	trainer LASS, PENNY, EVENT_BEAT_ROUTE_3_TRAINER_2, LassPennySeenText, LassPennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassPennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDallas:
	trainer BUG_CATCHER, DALLAS, EVENT_BEAT_ROUTE_3_TRAINER_3, BugCatcherDallasSeenText, BugCatcherDallasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDallasAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMolly:
	trainer LASS, MOLLY, EVENT_BEAT_ROUTE_3_TRAINER_4, LassMollySeenText, LassMollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMollyAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterGrady:
	trainer YOUNGSTER, GRADY, EVENT_BEAT_ROUTE_3_TRAINER_5, YoungsterGradySeenText, YoungsterGradyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGradyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherCole:
	trainer BUG_CATCHER, COLE, EVENT_BEAT_ROUTE_3_TRAINER_6, BugCatcherColeSeenText, BugCatcherColeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherColeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassSavannah:
	trainer LASS, SAVANNAH, EVENT_BEAT_ROUTE_3_TRAINER_7, LassSavannahSeenText, LassSavannahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassSavannahAfterBattleText
	waitbutton
	closetext
	end

Route3SuperNerdScript:
	faceplayer
	opentext
	writetext Route3SuperNerdText
	waitbutton
	closetext
	end

Route3Sign:
	jumptext Route3SignText

BugCatcherMertonSeenText:
	text "Hey! I met you in"
	line "VIRIDIAN FOREST!"
	done

BugCatcherMertonBeatenText:
	text "You beat me again!"
	done

BugCatcherMertonAfterBattleText:
	text "There are other"
	line "kinds of #MON"
	cont "than those found"
	cont "in the forest!"
	done

YoungsterGrantSeenText:
	text "Hi! I like shorts!"
	line "They're comfy and"
	cont "easy to wear!"
	done

YoungsterGrantBeatenText:
	text "I don't believe"
	line "it!"
	done

YoungsterGrantAfterBattleText:
	text "Are you storing"
	line "your #MON on"
	cont "PC? Each BOX can"
	cont "hold 20 #MON!"
	done

LassPennySeenText:
	text "You looked at me,"
	line "didn't you?"
	done

LassPennyBeatenText:
	text "You're mean!"
	done

LassPennyAfterBattleText:
	text "Quit staring if"
	line "you don't want to"
	cont "fight!"
	done

BugCatcherDallasSeenText:
	text "Are you a trainer?"
	line "Let's fight!"
	done

BugCatcherDallasBeatenText:
	text "If I had new"
	line "#MON I would've"
	cont "won!"
	done

BugCatcherDallasAfterBattleText:
	text "If a #MON BOX"
	line "on the PC gets"
	cont "full, just switch"
	cont "to another BOX!"
	done

LassMollySeenText:
	text "That look you"
	line "gave me, it's so"
	cont "intriguing!"
	done

LassMollyBeatenText:
	text "Be nice!"
	done

LassMollyAfterBattleText:
	text "Avoid fights by"
	line "not letting"
	cont "people see you!"
	done

YoungsterGradySeenText:
	text "Hey! You're not"
	line "wearing shorts!"
	done

YoungsterGradyBeatenText:
	text "Lost! Lost!"
	line "Lost!"
	done

YoungsterGradyAfterBattleText:
	text "I always wear"
	line "shorts, even in"
	cont "winter!"
	done

BugCatcherColeSeenText:
	text "You can fight my"
	line "new #MON!"
	done

BugCatcherColeBeatenText:
	text "Done like dinner!"
	done

BugCatcherColeAfterBattleText:
	text "Trained #MON"
	line "are stronger than"
	cont "the wild ones!"
	done

LassSavannahSeenText:
	text "Eek! Did you"
	line "touch me?"
	done

LassSavannahBeatenText:
	text "That's it?"
	done

LassSavannahAfterBattleText:
	text "ROUTE 4 is at the"
	line "foot of MT.MOON."
	done

Route3SuperNerdText:
	text "Whew... I better"
	line "take a rest..."
	cont "Groan..."

	para "That tunnel from"
	line "CERULEAN takes a"
	cont "lot out of you!"
	done

Route3SignText:
	text "ROUTE 3"
	line "MT.MOON AHEAD"
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 52,  1, MOUNT_MOON, 1

	def_coord_events

	def_bg_events
	bg_event 59,  9, BGEVENT_READ, Route3Sign

	def_object_events
	object_event 57, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route3SuperNerdScript, -1
	object_event 10,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherMerton, -1
	object_event 14,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterGrant, -1
	object_event 16,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerLassPenny, -1
	object_event 19,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherDallas, -1
	object_event 23,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerLassMolly, -1
	object_event 22,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterGrady, -1
	object_event 24,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 6, TrainerBugCatcherCole, -1
	object_event 33, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerLassSavannah, -1
