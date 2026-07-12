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
	closetext
	end

.GotOldRod:
	writetext VermilionOldRodHouseFishingGuruHowsFishingText
	waitbutton
	closetext
	end

VermilionOldRodHouseFishingGuruQuestionText:
	text "Do you like to"
	line "fish?"
	done

VermilionOldRodHouseFishingGuruYesText:
	text "Then take this"
	line "OLD ROD and give"
	cont "it a try!"
	done

VermilionOldRodHouseFishingGuruGiveText:
	text "Fishing is a way"
	line "of life."
	done

VermilionOldRodHouseFishingGuruRefusedText:
	text "That's so"
	line "disappointing."
	done

VermilionOldRodHouseFishingGuruHowsFishingText:
	text "How are the fish"
	line "biting?"
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
