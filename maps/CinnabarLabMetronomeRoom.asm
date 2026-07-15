	object_const_def
	const CINNABARLABMETRONOMEROOM_SCIENTIST1
	const CINNABARLABMETRONOMEROOM_SCIENTIST2

; Gen 1 Cinnabar Lab Metronome Room, ported from pokered data/maps/objects/CinnabarLabMetronomeRoom.asm.
; Gen1's TM35 (Metronome) has no Gen2 TM slot -> TM_SWAGGER substitute (same substitution
; class as SILPH_CO_5F/7F's TM_TAKE_DOWN/TM_SWORDS_DANCE subs, see parity-static whitelist).
CinnabarLabMetronomeRoom_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarLabMetronomeRoomScientist1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_LAB_TM_METRONOME
	iftrue .AlreadyGot
	writetext CinnabarLabMetronomeRoomScientist1Text
	promptbutton
	verbosegiveitem TM_SWAGGER
	iffalse .BagFull
	setevent EVENT_CINNABAR_LAB_TM_METRONOME
	closetext
	end

.AlreadyGot:
	writetext CinnabarLabMetronomeRoomScientist1ExplanationText
	waitbutton
	closetext
	end

.BagFull:
	writetext CinnabarLabMetronomeRoomScientist1NoRoomText
	waitbutton
	closetext
	end

CinnabarLabMetronomeRoomScientist2Script:
	jumptextfaceplayer CinnabarLabMetronomeRoomScientist2Text

CinnabarLabMetronomeRoomPCKeyboardScript:
	jumptext CinnabarLabMetronomeRoomPCText

CinnabarLabMetronomeRoomPCMonitorScript:
	jumptext CinnabarLabMetronomeRoomPCText

CinnabarLabMetronomeRoomAmberPipeScript:
	jumptext CinnabarLabMetronomeRoomAmberPipeText

CinnabarLabMetronomeRoomScientist1Text:
	text "Tch-tch-tch!"
	line "I made a cool TM!"

	para "It can cause all"
	line "kinds of fun!"
	done

CinnabarLabMetronomeRoomScientist1ExplanationText:
	text "Tch-tch-tch!"
	line "That's the sound"
	cont "of my TM!"

	para "It tweaks your"
	line "#MON's brain"
	cont "into using moves"
	cont "it doesn't know!"
	done

CinnabarLabMetronomeRoomScientist1NoRoomText:
	text "Your pack is"
	line "crammed full!"
	done

CinnabarLabMetronomeRoomScientist2Text:
	text "EEVEE can evolve"
	line "into 1 of 3 kinds"
	cont "of #MON."
	done

CinnabarLabMetronomeRoomPCText:
	text "There's an e-mail"
	line "message!"

	para "..."

	para "The 3 legendary"
	line "bird #MON are"
	cont "ARTICUNO, ZAPDOS"
	cont "and MOLTRES."

	para "Their whereabouts"
	line "are unknown."

	para "We plan to explore"
	line "the cavern close"
	cont "to CERULEAN."

	para "From: #MON"
	line "RESEARCH TEAM"

	para "..."
	done

CinnabarLabMetronomeRoomAmberPipeText:
	text "An amber pipe!"
	done

CinnabarLabMetronomeRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 4
	warp_event  3,  7, CINNABAR_LAB, 4

	def_coord_events

	def_bg_events
	bg_event  0,  4, BGEVENT_READ, CinnabarLabMetronomeRoomPCKeyboardScript
	bg_event  1,  4, BGEVENT_READ, CinnabarLabMetronomeRoomPCMonitorScript
	bg_event  2,  1, BGEVENT_READ, CinnabarLabMetronomeRoomAmberPipeScript

	def_object_events
	object_event  7,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarLabMetronomeRoomScientist1Script, -1
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarLabMetronomeRoomScientist2Script, -1
