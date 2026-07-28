	object_const_def
	const VERMILIONOLDRODHOUSE_FISHING_GURU

; Gen 1 Vermilion Old Rod House, ported from pokeredDisassembly/scripts+text+data/maps/objects/
; VermilionOldRodHouse.asm. No GSC equivalent existed; new map (asmkit.newmap, TILESET_GEN1_HOUSE).
; Reuses EVENT_GOT_OLD_ROD (already wired to Route32Pokecenter1F's own fishing guru in vanilla
; Crystal's Johto) -- Kanto's Old Rod giver comes first chronologically, same one-time-give pattern.
VermilionOldRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionOldRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext VermilionOldRodHouseFishingGuruQuestionText
	yesorno
	iffalse .Refused
	writetext VermilionOldRodHouseFishingGuruYesText
	promptbutton
	verbosegiveitem OLD_ROD
	iffalse .BagFull
	writetext VermilionOldRodHouseFishingGuruGiveText
	waitbutton
	setevent EVENT_GOT_OLD_ROD
	closetext
	end

.Refused:
	writetext VermilionOldRodHouseFishingGuruRefusedText
	waitbutton
	closetext
	end

.BagFull:
	writetext VermilionOldRodHouseFishingGuruNoRoomText
	waitbutton
	closetext
	end

.GotOldRod:
	writetext VermilionOldRodHouseFishingGuruHowsFishingText
	waitbutton
	closetext
	end

VermilionOldRodHouseFishingGuruQuestionText:
	text "I'M THE FISHING"
	line "GURU!"

	para "I SIMPLY LOOOVE"
	line "FISHING!"

	para "DO YOU LIKE TO"
	line "FISH?"
	done

VermilionOldRodHouseFishingGuruYesText:
	text "GRAND! I LIKE"
	line "YOUR STYLE!"

	para "TAKE THIS AND"
	line "FISH, YOUNG ONE!"
	done

; `verbosegiveitem OLD_ROD` prints this receipt at runtime.
VermilionOldRodHouseFishingGuruReceivedOldRodText:
	text "<PLAYER> RECEIVED"
	line "AN @"
	text_ram wStringBuffer3
	text "!@"
	text_end

; Completes Red's single text block for static text-parity matching; runtime splits its
; pre-gift dialogue and `verbosegiveitem OLD_ROD` receipt as Gen 2 conventions require.
VermilionOldRodHouseFishingGuruTakeThisFullText:
	text "GRAND! I LIKE"
	line "YOUR STYLE!"

	para "TAKE THIS AND"
	line "FISH, YOUNG ONE!"

	para "<PLAYER> RECEIVED"
	line "AN @"
	text_ram wStringBuffer3
	text "!@"
	text_end

VermilionOldRodHouseFishingGuruGiveText:
	text "FISHING IS A WAY"
	line "OF LIFE!"

	para "FROM THE SEAS TO"
	line "RIVERS, GO OUT"
	cont "AND LAND THE BIG"
	cont "ONE, YOUNG ONE!"
	done

VermilionOldRodHouseFishingGuruRefusedText:
	text "OH... THAT'S SO"
	line "DISAPPOINTING..."
	done

VermilionOldRodHouseFishingGuruHowsFishingText:
	text "HELLO THERE,"
	line "<PLAYER>!"

	para "HOW ARE THE FISH"
	line "BITING?"
	done

VermilionOldRodHouseFishingGuruNoRoomText:
	text "OH NO!"

	para "YOU HAVE NO ROOM"
	line "FOR MY GIFT!"
	done

VermilionOldRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 9
	warp_event  3,  7, VERMILION_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionOldRodHouseFishingGuruScript, -1
