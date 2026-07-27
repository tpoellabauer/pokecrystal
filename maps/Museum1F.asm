	object_const_def
	const MUSEUM1F_SCIENTIST1
	const MUSEUM1F_GAMBLER
	const MUSEUM1F_SCIENTIST2
	const MUSEUM1F_SCIENTIST3
	const MUSEUM1F_OLD_AMBER

Museum1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Museum1FOldAmberCallback

Museum1FOldAmberCallback:
	checkevent EVENT_GOT_OLD_AMBER
	iftrue .HideOldAmber
	endcallback

.HideOldAmber:
	disappear MUSEUM1F_OLD_AMBER
	endcallback

Museum1FScientist1Script:
	faceplayer
	opentext
	checkevent EVENT_BOUGHT_MUSEUM_TICKET
	iftrue .AlreadyBoughtTicket
	writetext Museum1FScientist1WouldYouLikeToComeInText
	yesorno
	iffalse .ComeAgain
	checkmoney YOUR_MONEY, 50
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 50
	setevent EVENT_BOUGHT_MUSEUM_TICKET
	writetext Museum1FScientist1ThankYouText
	waitbutton
	closetext
	end

.AlreadyBoughtTicket:
	writetext Museum1FScientist1TakePlentyOfTimeText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext Museum1FScientist1DontHaveEnoughMoneyText
	waitbutton
	closetext
	end

.ComeAgain:
	writetext Museum1FScientist1ComeAgainText
	waitbutton
	closetext
	end

Museum1FGamblerScript:
	jumptextfaceplayer Museum1FGamblerText

Museum1FScientist2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_AMBER
	iftrue .GotOldAmber
	writetext Museum1FScientist2TakeThisToAPokemonLabText
	promptbutton
	verbosegiveitem OLD_AMBER
	iffalse .NoSpace
	setevent EVENT_GOT_OLD_AMBER
	disappear MUSEUM1F_OLD_AMBER
	closetext
	end

.GotOldAmber:
	writetext Museum1FScientist2GetTheOldAmberCheckText
	waitbutton
	closetext
	end

.NoSpace:
	writetext Museum1FScientist2YouDontHaveSpaceText
	waitbutton
	closetext
	end

Museum1FScientist3Script:
	jumptextfaceplayer Museum1FScientist3Text

; Gen 1's OLD_AMBER display object (SPRITE_OLD_AMBER, no Gen 2 sprite or OLD_AMBER item
; exists) -- kept as the same examinable exhibit at the same tile, flavor text only.
Museum1FOldAmberScript:
	jumptext Museum1FOldAmberText

Museum1FScientist1ComeAgainText:
	text "Come again!"
	done

Museum1FScientist1WouldYouLikeToComeInText:
	text "It's ¥50 for a"
	line "child's ticket."

	para "Would you like to"
	line "come in?"
	done

Museum1FScientist1ThankYouText:
	text "Right, ¥50!"
	line "Thank you!"
	done

Museum1FScientist1DontHaveEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

Museum1FScientist1DoYouKnowWhatAmberIsText:
	text "You can't sneak"
	line "in the back way!"

	para "Oh, whatever!"
	line "Do you know what"
	cont "AMBER is?"
	done

Museum1FScientist1TheresALabSomewhereText:
	text "There's a lab"
	line "somewhere trying"
	cont "to resurrect"
	cont "ancient #MON"
	cont "from AMBER."
	done

Museum1FScientist1AmberIsFossilizedTreeSapText:
	text "AMBER is fossil-"
	line "ized tree sap."
	done

Museum1FScientist1GoToOtherSideText:
	text "Please go to the"
	line "other side!"
	done

Museum1FScientist1TakePlentyOfTimeText:
	text "Take plenty of"
	line "time to look!"
	done

Museum1FGamblerText:
	text "That is one"
	line "magnificent"
	cont "fossil!"
	done

Museum1FScientist2TakeThisToAPokemonLabText:
	text "Ssh! I think that"
	line "this chunk of"
	cont "AMBER contains"
	cont "#MON DNA!"

	para "It would be great"
	line "if #MON could"
	cont "be resurrected"
	cont "from it!"

	para "But, my colleagues"
	line "just ignore me!"

	para "So I have a favor"
	line "to ask!"

	para "Take this to a"
	line "#MON LAB and"
	cont "get it examined!"
	done

; `verbosegiveitem OLD_AMBER` prints this same receipt at runtime.
Museum1FScientist2ReceivedOldAmberText:
	text "<PLAYER> received"
	line "OLD AMBER!@"
	text_end

Museum1FScientist2GetTheOldAmberCheckText:
	text "Ssh! Get the OLD"
	line "AMBER checked!"
	done

Museum1FScientist2YouDontHaveSpaceText:
	text "You don't have"
	line "space for this!"
	done

Museum1FScientist3Text:
	text "We are proud of 2"
	line "fossils of very"
	cont "rare, prehistoric"
	cont "#MON!"
	done

Museum1FOldAmberText:
	text "The AMBER is"
	line "clear and gold!"
	done

Museum1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 6
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7
	warp_event  7,  7, MUSEUM_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FScientist1Script, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Museum1FGamblerScript, -1
	object_event 15,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FScientist2Script, -1
	object_event 17,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FScientist3Script, -1
	object_event 16,  2, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Museum1FOldAmberScript, -1
