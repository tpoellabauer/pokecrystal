	object_const_def
	const ROUTE13_COOLTRAINER_M1
	const ROUTE13_COOLTRAINER_F1
	const ROUTE13_COOLTRAINER_F2
	const ROUTE13_COOLTRAINER_F3
	const ROUTE13_COOLTRAINER_F4
	const ROUTE13_COOLTRAINER_M2
	const ROUTE13_BEAUTY1
	const ROUTE13_BEAUTY2
	const ROUTE13_BIKER
	const ROUTE13_COOLTRAINER_M3

Route13_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: CoolTrainerM sprite, BIRD_KEEPER class.
TrainerRoute13CoolTrainerM1:
	trainer BIRD_KEEPER, DUKE, EVENT_BEAT_ROUTE_13_TRAINER_0, Route13CoolTrainerM1SeenText, Route13CoolTrainerM1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13CoolTrainerM1AfterBattleText
	waitbutton
	closetext
	end

; Gen 1: CoolTrainerF sprite, JR.TRAINER(F) class.
TrainerRoute13CoolTrainerF1:
	trainer JR_TRAINER_F, JR_TRAINER_F_5, EVENT_BEAT_ROUTE_13_TRAINER_1, Route13CoolTrainerF1SeenText, Route13CoolTrainerF1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13CoolTrainerF1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13CoolTrainerF2:
	trainer JR_TRAINER_F, JR_TRAINER_F_6, EVENT_BEAT_ROUTE_13_TRAINER_2, Route13CoolTrainerF2SeenText, Route13CoolTrainerF2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13CoolTrainerF2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13CoolTrainerF3:
	trainer JR_TRAINER_F, JR_TRAINER_F_7, EVENT_BEAT_ROUTE_13_TRAINER_3, Route13CoolTrainerF3SeenText, Route13CoolTrainerF3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13CoolTrainerF3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13CoolTrainerF4:
	trainer JR_TRAINER_F, JR_TRAINER_F_8, EVENT_BEAT_ROUTE_13_TRAINER_4, Route13CoolTrainerF4SeenText, Route13CoolTrainerF4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13CoolTrainerF4AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13CoolTrainerM2:
	trainer BIRD_KEEPER, FELIX, EVENT_BEAT_ROUTE_13_TRAINER_5, Route13CoolTrainerM2SeenText, Route13CoolTrainerM2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13CoolTrainerM2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13Beauty1:
	trainer BEAUTY, TIFFANY, EVENT_BEAT_ROUTE_13_TRAINER_6, Route13Beauty1SeenText, Route13Beauty1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13Beauty1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13Beauty2:
	trainer BEAUTY, NADIA, EVENT_BEAT_ROUTE_13_TRAINER_7, Route13Beauty2SeenText, Route13Beauty2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13Beauty2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13Biker:
	trainer BIKER, SPIKE, EVENT_BEAT_ROUTE_13_TRAINER_8, Route13BikerSeenText, Route13BikerBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13BikerAfterBattleText
	waitbutton
	closetext
	end

TrainerRoute13CoolTrainerM3:
	trainer BIRD_KEEPER, OSCAR, EVENT_BEAT_ROUTE_13_TRAINER_9, Route13CoolTrainerM3SeenText, Route13CoolTrainerM3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route13CoolTrainerM3AfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13TrainerTips2:
	jumptext Route13TrainerTips2Text

Route13Sign:
	jumptext Route13SignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

Route13CoolTrainerM1SeenText:
	text "My bird #MON"
	line "want to scrap!"
	done

Route13CoolTrainerM1BeatenText:
	text "My"
	line "bird combo lost?"
	prompt

Route13CoolTrainerM1AfterBattleText:
	text "My #MON look"
	line "happy even though"
	cont "they lost."
	done

Route13CoolTrainerF1SeenText:
	text "I'm told I'm good"
	line "for a kid!"
	done

Route13CoolTrainerF1BeatenText:
	text "Ohh!"
	line "I lost!"
	prompt

Route13CoolTrainerF1AfterBattleText:
	text "I want to become"
	line "a good trainer."
	cont "I'll train hard."
	done

Route13CoolTrainerF2SeenText:
	text "Wow! Your BADGEs"
	line "are too cool!"
	done

Route13CoolTrainerF2BeatenText:
	text "Not"
	line "enough!"
	prompt

Route13CoolTrainerF2AfterBattleText:
	text "You got those"
	line "BADGEs from GYM"
	cont "LEADERs. I know!"
	done

Route13CoolTrainerF3SeenText:
	text "My cute #MON"
	line "wish to make your"
	cont "acquaintance."
	done

Route13CoolTrainerF3BeatenText:
	text "Wow!"
	line "You totally won!"
	prompt

Route13CoolTrainerF3AfterBattleText:
	text "You have to make"
	line "#MON fight to"
	cont "toughen them up!"
	done

Route13CoolTrainerF4SeenText:
	text "I found CARBOS in"
	line "a cave once."
	done

Route13CoolTrainerF4BeatenText:
	text "Just"
	line "messed up!"
	prompt

Route13CoolTrainerF4AfterBattleText:
	text "CARBOS boosted"
	line "the SPEED of my"
	cont "#MON."
	done

Route13CoolTrainerM2SeenText:
	text "The wind's blowing"
	line "my way!"
	done

Route13CoolTrainerM2BeatenText:
	text "The"
	line "wind turned!"
	prompt

Route13CoolTrainerM2AfterBattleText:
	text "I'm beat. I guess"
	line "I'll FLY home."
	done

Route13Beauty1SeenText:
	text "Sure, I'll play"
	line "with you!"
	done

Route13Beauty1BeatenText:
	text "Oh!"
	line "You little brute!"
	prompt

Route13Beauty1AfterBattleText:
	text "I wonder which is"
	line "stronger, male or"
	cont "female #MON?"
	done

Route13Beauty2SeenText:
	text "Do you want to"
	line "#MON with me?"
	done

Route13Beauty2BeatenText:
	text "It's over"
	line "already?"
	prompt

Route13Beauty2AfterBattleText:
	text "I don't know"
	line "anything about"
	cont "#MON. I just"
	cont "like cool ones!"
	done

Route13BikerSeenText:
	text "What're you"
	line "lookin' at?"
	done

Route13BikerBeatenText:
	text "Dang!"
	line "Stripped gears!"
	prompt

Route13BikerAfterBattleText:
	text "Get lost!"
	done

Route13CoolTrainerM3SeenText:
	text "I always go with"
	line "bird #MON!"
	done

Route13CoolTrainerM3BeatenText:
	text "Out"
	line "of power!"
	prompt

Route13CoolTrainerM3AfterBattleText:
	text "I wish I could"
	line "fly like PIDGEY"
	cont "and PIDGEOTTO…"
	done

Route13TrainerTipsText:
	text "TRAINER TIPS"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

Route13TrainerTips2Text:
	text "TRAINER TIPS"

	para "Use SELECT to"
	line "switch items in"
	cont "the ITEM window!"
	done

Route13SignText:
	text "ROUTE 13"

	para "NORTH TO SILENCE"
	line "BRIDGE"
	done

Route13HiddenPpUp:
	hiddenitem PP_UP, EVENT_ROUTE_13_HIDDEN_PP_UP

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 15, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 33,  5, BGEVENT_READ, Route13TrainerTips2
	bg_event 31, 11, BGEVENT_READ, Route13Sign
	bg_event 16, 13, BGEVENT_ITEM, Route13HiddenCalcium
	bg_event  1, 14, BGEVENT_ITEM, Route13HiddenPpUp

	def_object_events
	object_event 49, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute13CoolTrainerM1, -1
	object_event 48, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute13CoolTrainerF1, -1
	object_event 27,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute13CoolTrainerF2, -1
	object_event 23, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute13CoolTrainerF3, -1
	object_event 50,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute13CoolTrainerF4, -1
	object_event 12,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute13CoolTrainerM2, -1
	object_event 33,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute13Beauty1, -1
	object_event 32,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute13Beauty2, -1
	object_event 10,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute13Biker, -1
	object_event  7, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute13CoolTrainerM3, -1
