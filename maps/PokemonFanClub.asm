	object_const_def
	const POKEMONFANCLUB_CHAIRMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_SEEL_FAN
	const POKEMONFANCLUB_PIKACHU_FAN
	const POKEMONFANCLUB_SEEL
	const POKEMONFANCLUB_PIKACHU

PokemonFanClub_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
.HeardSpeechButBagFull:
	verbosegiveitem BIKE_VOUCHER
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	setevent EVENT_GOT_BIKE_VOUCHER
	writetext PokemonFanClubChairmanItsABikeVoucherText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	writetext PokemonFanClubChairmanBagFullText
	waitbutton
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubPikachuFanScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .Better
	writetext PokemonFanClubPikachuFanNormalText
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	sjump .Done

.Better:
	writetext PokemonFanClubPikachuFanBetterText
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

.Done:
	waitbutton
	closetext
	end

PokemonFanClubSeelFanScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Better
	writetext PokemonFanClubSeelFanNormalText
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	sjump .Done

.Better:
	writetext PokemonFanClubSeelFanBetterText
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2

.Done:
	waitbutton
	closetext
	end

PokemonFanClubPikachuScript:
	opentext
	writetext PokemonFanClubPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end

PokemonFanClubSeelScript:
	opentext
	writetext PokemonFanClubSeelText
	cry SEEL
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "I chair the"
	line "#MON FAN CLUB!"

	para "I have collected"
	line "over 100 #MON!"

	para "I'm very fussy"
	line "when it comes to"
	cont "#MON!"

	para "So..."

	para "Did you come"
	line "visit to hear"
	cont "about my #MON?"
	done

PokemonFanClubChairmanRapidashText:
	text "Good!"
	line "Then listen up!"

	para "My favorite"
	line "RAPIDASH..."

	para "It...cute..."
	line "lovely...smart..."
	cont "plus...amazing..."
	cont "you think so?..."
	cont "oh yes...it..."
	cont "stunning..."
	cont "kindly..."
	cont "love it!"

	para "Hug it...when..."
	cont "sleeping...warm"
	cont "and cuddly..."
	cont "spectacular..."
	cont "ravishing..."
	cont "...Oops! Look at"
	cont "the time! I kept"
	cont "you too long!"

	para "Thanks for hearing"
	line "me out! I want"
	cont "you to have this!"
	prompt

PokemonFanClubReceivedBikeVoucherText:
	; `verbosegiveitem BIKE_VOUCHER` prints this receipt at runtime.
	text "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer4
	text "!@"
	text_end

PokemonFanClubChairmanItsABikeVoucherText:
	text "Exchange that for"
	line "a BICYCLE!"

	para "Don't worry, my"
	line "FEAROW will FLY"
	cont "me anywhere!"

	para "So, I don't need a"
	line "BICYCLE!"

	para "I hope you like"
	line "cycling!"
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "Hello, <PLAY_G>!"

	para "Did you come see"
	line "me about my"
	cont "#MON again?"

	para "No? Too bad!"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Oh. Come back"
	line "when you want to"
	cont "hear my story!"
	done

PokemonFanClubChairmanBagFullText:
	text "Make room for"
	line "this!"
	done

PokemonFanClubReceptionistText:
	text "Our CHAIRMAN is"
	line "very vocal about"
	cont "#MON."
	done

PokemonFanClubPikachuFanNormalText:
	text "Won't you admire"
	line "my PIKACHU's"
	cont "adorable tail?"
	done

PokemonFanClubPikachuFanBetterText:
	text "Humph! My PIKACHU"
	line "is twice as cute"
	cont "as that one!"
	done

PokemonFanClubSeelFanNormalText:
	text "I just love my"
	line "SEEL!"

	para "It squeals when I"
	line "hug it!"
	done

PokemonFanClubSeelFanBetterText:
	text "Oh dear!"

	para "My SEEL is far"
	line "more attractive!"
	done

PokemonFanClubPikachuText:
	text "PIKACHU: Chu!"
	line "Pikachu!"
	done

PokemonFanClubSeelText:
	text "SEEL: Kyuoo!"
	done

PokemonFanClubListenSignText:
	text "Let's all listen"
	line "politely to other"
	cont "trainers!"
	done

PokemonFanClubBraggingSignText:
	text "If someone brags,"
	line "brag right back!"
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 2
	warp_event  3,  7, VERMILION_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  6,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	def_object_events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  5,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubSeelFanScript, -1
	object_event  6,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubPikachuFanScript, -1
	object_event  1,  4, SPRITE_LAPRAS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubSeelScript, -1
	object_event  6,  4, SPRITE_PIKACHU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubPikachuScript, -1
