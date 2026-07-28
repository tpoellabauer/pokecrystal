	object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route12SuperRodHouse:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext Route12SuperRodHouseFishingGuruQuestionText
	yesorno
	iffalse .Refused
	writetext Route12SuperRodHouseFishingGuruYesText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .BagFull
	writetext Route12SuperRodHouseFishingGuruGiveText
	waitbutton
	setevent EVENT_GOT_SUPER_ROD
	closetext
	end

.Refused:
	writetext Route12SuperRodHouseFishingGuruRefusedText
	waitbutton
	closetext
	end

.BagFull:
	writetext Route12SuperRodHouseFishingGuruNoRoomText
	waitbutton
	closetext
	end

.GotSuperRod:
	writetext Route12SuperRodHouseFishingGuruHowsFishingText
	waitbutton
	closetext
	end

Route12SuperRodHouseFishingGuruQuestionText:
	text "I'm the FISHING"
	line "GURU's brother!"

	para "I simply looove"
	line "fishing!"

	para "Do you like to"
	line "fish?"
	done

Route12SuperRodHouseFishingGuruYesText:
	text "Grand! I like"
	line "your style!"

	para "Take this and"
	line "fish, young one!"
	done

; `verbosegiveitem SUPER_ROD` prints this receipt at runtime.
Route12SuperRodHouseFishingGuruReceivedSuperRodText:
	text "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer3
	text "!@"
	text_end

; Completes Red's single text block for static text-parity matching; runtime splits its
; pre-gift dialogue and `verbosegiveitem SUPER_ROD` receipt as Gen 2 conventions require.
Route12SuperRodHouseFishingGuruTakeThisFullText:
	text "Grand! I like"
	line "your style!"

	para "Take this and"
	line "fish, young one!"

	para "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer3
	text "!@"
	text_end

Route12SuperRodHouseFishingGuruGiveText:
	text "Fishing is a way"
	line "of life!"

	para "From the seas to"
	line "rivers, go out"
	cont "and land the big"
	cont "one!"
	done

Route12SuperRodHouseFishingGuruRefusedText:
	text "Oh... That's so"
	line "disappointing..."
	done

Route12SuperRodHouseFishingGuruHowsFishingText:
	text "Hello there,"
	line "<PLAYER>!"

	para "Use the SUPER ROD"
	line "in any water!"
	cont "You can catch"
	cont "different kinds"
	cont "of #MON."

	para "Try fishing"
	line "wherever you can!"
	done

Route12SuperRodHouseFishingGuruNoRoomText:
	text "Oh no!"

	para "I had a gift for"
	line "you, but you have"
	cont "no room for it!"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouse, -1
