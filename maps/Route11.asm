	object_const_def
	const ROUTE11_GAMBLER1
	const ROUTE11_GAMBLER2
	const ROUTE11_YOUNGSTER1
	const ROUTE11_SUPER_NERD1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_GAMBLER3
	const ROUTE11_GAMBLER4
	const ROUTE11_YOUNGSTER3
	const ROUTE11_SUPER_NERD2
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: SuperNerd1/2 here are Gen 1's ENGINEER class (unique to Route 11, only 2 in the
; whole game); subbed to the existing SUPER_NERD class since the overworld sprite is
; SPRITE_SUPER_NERD anyway and adding a whole new 2-trainer class isn't worth the pic/AI wiring.
TrainerRoute11Gambler1:
	trainer GAMBLER, GAMBLER_3, EVENT_BEAT_ROUTE_11_TRAINER_0, Route11Gambler1SeenText, Route11Gambler1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11Gambler2:
	trainer GAMBLER, GAMBLER_4, EVENT_BEAT_ROUTE_11_TRAINER_1, Route11Gambler2SeenText, Route11Gambler2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11Youngster1:
	trainer YOUNGSTER, DEREK, EVENT_BEAT_ROUTE_11_TRAINER_2, Route11Youngster1SeenText, Route11Youngster1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11SuperNerd1:
	trainer SUPER_NERD, WALT_ROUTE11, EVENT_BEAT_ROUTE_11_TRAINER_3, Route11SuperNerd1SeenText, Route11SuperNerd1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11SuperNerd1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11Youngster2:
	trainer YOUNGSTER, MASON, EVENT_BEAT_ROUTE_11_TRAINER_4, Route11Youngster2SeenText, Route11Youngster2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11Gambler3:
	trainer GAMBLER, GAMBLER_5, EVENT_BEAT_ROUTE_11_TRAINER_5, Route11Gambler3SeenText, Route11Gambler3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11Gambler4:
	trainer GAMBLER, GAMBLER_6, EVENT_BEAT_ROUTE_11_TRAINER_6, Route11Gambler4SeenText, Route11Gambler4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler4AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11Youngster3:
	trainer YOUNGSTER, TYSON, EVENT_BEAT_ROUTE_11_TRAINER_7, Route11Youngster3SeenText, Route11Youngster3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11SuperNerd2:
	trainer SUPER_NERD, LENNY, EVENT_BEAT_ROUTE_11_TRAINER_8, Route11SuperNerd2SeenText, Route11SuperNerd2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11SuperNerd2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute11Youngster4:
	trainer YOUNGSTER, BRAD_ROUTE11, EVENT_BEAT_ROUTE_11_TRAINER_9, Route11Youngster4SeenText, Route11Youngster4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster4AfterBattleText
	waitbutton
	closetext
	end

Route11DiglettsCaveSign:
	jumptext Route11DiglettsCaveSignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

Route11Gambler1SeenText:
	text "Win, lose or draw!"
	done

Route11Gambler1BeatenText:
	text "Atcha!"
	line "Didn't go my way!"
	prompt

Route11Gambler1AfterBattleText:
	text "#MON is life!"
	line "And to live is to"
	cont "gamble!"
	done

Route11Gambler2SeenText:
	text "Competition! I"
	line "can't get enough!"
	done

Route11Gambler2BeatenText:
	text "I had"
	line "a chance!"
	prompt

Route11Gambler2AfterBattleText:
	text "You can't be a"
	line "coward in the"
	cont "world of #MON!"
	done

Route11Youngster1SeenText:
	text "Let's go, but"
	line "don't cheat!"
	done

Route11Youngster1BeatenText:
	text "Huh?"
	line "That's not right!"
	prompt

Route11Youngster1AfterBattleText:
	text "I did my best! I"
	line "have no regrets!"
	done

Route11SuperNerd1SeenText:
	text "Careful!"
	line "I'm laying down"
	cont "some cables!"
	done

Route11SuperNerd1BeatenText:
	text "That"
	line "was electric!"
	prompt

Route11SuperNerd1AfterBattleText:
	text "Spread the word"
	line "to save energy!"
	done

Route11Youngster2SeenText:
	text "I just became a"
	line "trainer! But, I"
	cont "think I can win!"
	done

Route11Youngster2BeatenText:
	text "My"
	line "#MON couldn't!"
	prompt

Route11Youngster2AfterBattleText:
	text "What do you want?"
	line "Leave me alone!"
	done

Route11Gambler3SeenText:
	text "Fwahaha! I have"
	line "never lost!"
	done

Route11Gambler3BeatenText:
	text "My"
	line "first loss!"
	prompt

Route11Gambler3AfterBattleText:
	text "Luck of the draw!"
	line "Just luck!"
	done

Route11Gambler4SeenText:
	text "I have never won"
	line "before…"
	done

Route11Gambler4BeatenText:
	text "I saw"
	line "this coming…"
	prompt

Route11Gambler4AfterBattleText:
	text "It's just luck."
	line "Luck of the draw."
	done

Route11Youngster3SeenText:
	text "I'm the best in"
	line "my class!"
	done

Route11Youngster3BeatenText:
	text "Darn!"
	line "I need to make my"
	cont "#MON stronger!"
	prompt

Route11Youngster3AfterBattleText:
	text "There's a fat"
	line "#MON that"
	cont "comes down from"
	cont "the mountains."

	para "It's strong if"
	line "you can get it."
	done

Route11SuperNerd2SeenText:
	text "Watch out for"
	line "live wires!"
	done

Route11SuperNerd2BeatenText:
	text "Whoa!"
	line "You spark plug!"
	prompt

Route11SuperNerd2AfterBattleText:
	text "Well, better get"
	line "back to work."
	done

Route11Youngster4SeenText:
	text "My #MON should"
	line "be ready by now!"
	done

Route11Youngster4BeatenText:
	text "Too"
	line "much, too young!"
	prompt

Route11Youngster4AfterBattleText:
	text "I better go find"
	line "stronger ones!"
	done

Route11DiglettsCaveSignText:
	text "DIGLETT's CAVE"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  5, DIGLETTS_CAVE_ROUTE_11, 1

	def_coord_events

	def_bg_events
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive
	bg_event  1,  5, BGEVENT_READ, Route11DiglettsCaveSign

	def_object_events
	object_event 10, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerRoute11Gambler1, -1
	object_event 26,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerRoute11Gambler2, -1
	object_event 13,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute11Youngster1, -1
	object_event 36, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerRoute11SuperNerd1, -1
	object_event 22,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute11Youngster2, -1
	object_event 45,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerRoute11Gambler3, -1
	object_event 33,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerRoute11Gambler4, -1
	object_event 43,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute11Youngster3, -1
	object_event 45, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerRoute11SuperNerd2, -1
	object_event 22, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute11Youngster4, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
