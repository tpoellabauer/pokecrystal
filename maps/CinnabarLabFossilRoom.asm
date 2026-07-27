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
	getitemname STRING_BUFFER_3, DOME_FOSSIL
	writetext CinnabarLabFossilRoomScientist1SeesFossilText
	waitbutton
	writetext CinnabarLabFossilRoomTakesFossilText
	waitbutton
	takeitem DOME_FOSSIL
	setevent EVENT_REVIVED_FOSSIL_AT_LAB
	givepoke KABUTO, 30
	getmonname STRING_BUFFER_3, KABUTO
	sjump .Revived

.ReviveHelix:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	getitemname STRING_BUFFER_3, HELIX_FOSSIL
	writetext CinnabarLabFossilRoomScientist1SeesFossilText
	waitbutton
	writetext CinnabarLabFossilRoomTakesFossilText
	waitbutton
	takeitem HELIX_FOSSIL
	setevent EVENT_REVIVED_FOSSIL_AT_LAB
	givepoke OMANYTE, 30
	getmonname STRING_BUFFER_3, OMANYTE
	sjump .Revived

.ReviveAmber:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	getitemname STRING_BUFFER_3, OLD_AMBER
	writetext CinnabarLabFossilRoomScientist1SeesFossilText
	waitbutton
	writetext CinnabarLabFossilRoomTakesFossilText
	waitbutton
	takeitem OLD_AMBER
	setevent EVENT_REVIVED_FOSSIL_AT_LAB
	givepoke AERODACTYL, 30
	getmonname STRING_BUFFER_3, AERODACTYL
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
	text "No! Is too bad!"
	done

CinnabarLabFossilRoomTakesFossilText:
	text "So! You hurry and"
	line "give me that!"

	para "<PLAYER> handed"
	line "over "
	text_ram wStringBuffer3
	text "!"
	prompt

CinnabarLabFossilRoomScientist1SeesFossilText:
	text "Oh! That is"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "It is fossil of"
	line "@"
	text_ram wStringBuffer3
	text ", a"
	cont "#MON that is"
	cont "already extinct!"

	para "My Resurrection"
	line "Machine will make"
	cont "that #MON live"
	cont "again!"
	done

CinnabarLabFossilRoomRevivedText:
	text "Where were you?"

	para "Your fossil is"
	line "back to life!"

	para "It was @"
	text_ram wStringBuffer3
	text ""
	line "like I think!"
	prompt

CinnabarLabFossilRoomPartyFullText:
	text "You have too many"
	line "#MON!"

	para "Come back when you"
	line "have room!"
	done

CinnabarLabFossilRoomAlreadyRevivedText:
	text "Aiyah! You come"
	line "again!"
	done

CinnabarLabFossilRoomScientist1GoForAWalkText:
	text "I take a little"
	line "time!"

	para "You go for walk a"
	line "little while!"
	done

CinnabarLabFossilRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 5
	warp_event  3,  7, CINNABAR_LAB, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarLabFossilRoomScientist1Script, -1
	object_event  7,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarLabFossilRoomScientist2Script, -1
