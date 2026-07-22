	object_const_def
	const CINNABARLABFOSSILROOM_SCIENTIST1
	const CINNABARLABFOSSILROOM_SCIENTIST2

; Gen 1 Cinnabar Lab Fossil Room, ported from pokered data/maps/objects/CinnabarLabFossilRoom.asm
; + scripts/CinnabarLabFossilRoom.asm + engine/events/cinnabar_lab.asm (GiveFossilToCinnabarLab).
; Scientist2 runs the native Gen2 trade engine (NPC_TRADE_SAILOR, see data/events/npc_trades.asm).
; Scientist1 is the fossil-revival mechanic (issue #164): hand over a DOME_FOSSIL/HELIX_FOSSIL/
; OLD_AMBER key item and it is consumed and revived into KABUTO/OMANYTE/AERODACTYL at level 30.
; Gen1's three-state give / "go for a walk" / hand-over chain (EVENT_GAVE_FOSSIL_TO_LAB +
; EVENT_LAB_STILL_REVIVING_FOSSIL) is collapsed into a single faithful talk-triggered interaction,
; gated once by EVENT_REVIVED_FOSSIL_AT_LAB, per this port's talk-triggered simplification
; precedent. Now that the items exist, the Museum1F / FuchsiaCity fossil stubs can follow suit.
CinnabarLabFossilRoom_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarLabFossilRoomScientist1Script:
	faceplayer
	opentext
	checkevent EVENT_REVIVED_FOSSIL_AT_LAB
	iftrue .AlreadyRevived
	writetext CinnabarLabFossilRoomScientist1Text
	waitbutton
	checkitem DOME_FOSSIL
	iftrue .ReviveDome
	checkitem HELIX_FOSSIL
	iftrue .ReviveHelix
	checkitem OLD_AMBER
	iftrue .ReviveAmber
	writetext CinnabarLabFossilRoomNoFossilText
	waitbutton
	closetext
	end

.ReviveDome:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext CinnabarLabFossilRoomTakesFossilText
	waitbutton
	takeitem DOME_FOSSIL
	setevent EVENT_REVIVED_FOSSIL_AT_LAB
	givepoke KABUTO, 30
	sjump .Revived

.ReviveHelix:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext CinnabarLabFossilRoomTakesFossilText
	waitbutton
	takeitem HELIX_FOSSIL
	setevent EVENT_REVIVED_FOSSIL_AT_LAB
	givepoke OMANYTE, 30
	sjump .Revived

.ReviveAmber:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext CinnabarLabFossilRoomTakesFossilText
	waitbutton
	takeitem OLD_AMBER
	setevent EVENT_REVIVED_FOSSIL_AT_LAB
	givepoke AERODACTYL, 30
	sjump .Revived

.Revived:
	writetext CinnabarLabFossilRoomRevivedText
	waitbutton
	closetext
	end

.PartyFull:
	writetext CinnabarLabFossilRoomPartyFullText
	waitbutton
	closetext
	end

.AlreadyRevived:
	writetext CinnabarLabFossilRoomAlreadyRevivedText
	waitbutton
	closetext
	end

CinnabarLabFossilRoomScientist2Script:
	faceplayer
	opentext
	trade NPC_TRADE_SAILOR
	waitbutton
	closetext
	end

CinnabarLabFossilRoomScientist1Text:
	text "Hiya!"

	para "I am important"
	line "doctor!"

	para "I study here rare"
	line "#MON fossils!"

	para "You! Have you a"
	line "fossil for me?"
	done

CinnabarLabFossilRoomNoFossilText:
	text "Aww, no fossil?"

	para "Bring me one and"
	line "I bring it to"
	cont "life again!"
	done

CinnabarLabFossilRoomTakesFossilText:
	text "Ooh! A fossil!"

	para "Leave it to me!"

	para "…"

	para "There! Your fossil"
	line "is #MON again!"
	done

CinnabarLabFossilRoomRevivedText:
	text "Take good care of"
	line "it, now!"
	done

CinnabarLabFossilRoomPartyFullText:
	text "You have too many"
	line "#MON!"

	para "Come back when you"
	line "have room!"
	done

CinnabarLabFossilRoomAlreadyRevivedText:
	text "How's that revived"
	line "#MON doing?"

	para "That's the only"
	line "fossil I can do!"
	done

CinnabarLabFossilRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 5
	warp_event  3,  7, CINNABAR_LAB, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarLabFossilRoomScientist1Script, -1
	object_event  7,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarLabFossilRoomScientist2Script, -1
