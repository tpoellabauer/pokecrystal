	object_const_def
	const FUCHSIAGOODRODHOUSE_FISHING_GURU

FuchsiaGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1 FuchsiaGoodRodHouse: the Fishing Guru's older brother gives the GOOD ROD once
; (same EVENT_GOT_GOOD_ROD flag as OlivineGoodRodHouse's Johto guru -- either NPC can
; hand out the single Good Rod).
FuchsiaGoodRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext FuchsiaGoodRodHouseFishingGuruText
	yesorno
	iffalse .Refused
	verbosegiveitem GOOD_ROD
	iffalse .BagFull
	setevent EVENT_GOT_GOOD_ROD
	writetext FuchsiaGoodRodHouseReceivedGoodRodText
	waitbutton
	closetext
	end

.Refused:
	writetext FuchsiaGoodRodHouseThatsSoDisappointingText
	waitbutton
	closetext
	end

.BagFull:
	writetext FuchsiaGoodRodHouseNoRoomText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext FuchsiaGoodRodHouseHowAreTheFishText
	waitbutton
	closetext
	end

FuchsiaGoodRodHouseFishingGuruText:
	text "I'm the FISHING"
	line "GURU's older"
	cont "brother!"

	para "I simply Looove"
	line "fishing!"

	para "Do you like to"
	line "fish?"
	done

FuchsiaGoodRodHouseReceivedGoodRodText:
	text "Grand! I like"
	line "your style!"

	para "Take this and"
	line "fish, young one!"
	done

FuchsiaGoodRodHouseThatsSoDisappointingText:
	text "Oh... That's so"
	line "disappointing..."
	done

FuchsiaGoodRodHouseHowAreTheFishText:
	text "Hello there,"
	line "trainer!"

	para "How are the fish"
	line "biting?"
	done

FuchsiaGoodRodHouseNoRoomText:
	text "Oh no!"

	para "You have no room"
	line "for my gift!"
	done

FuchsiaGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 8
	warp_event  3,  7, FUCHSIA_CITY, 8
	warp_event  2,  0, FUCHSIA_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaGoodRodHouseFishingGuruScript, -1
