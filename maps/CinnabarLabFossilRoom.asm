	object_const_def
	const CINNABARLABFOSSILROOM_SCIENTIST1
	const CINNABARLABFOSSILROOM_SCIENTIST2

; Gen 1 Cinnabar Lab Fossil Room, ported from pokered data/maps/objects/CinnabarLabFossilRoom.asm.
; Scientist2 runs the native Gen2 trade engine (NPC_TRADE_SAILOR, see data/events/npc_trades.asm).
; Scientist1's fossil-revival mechanic (give a fossil item, come back later for the revived
; #MON) needs DOME_FOSSIL/HELIX_FOSSIL/OLD_AMBER items that don't exist in Gen2 and haven't
; been added anywhere in this port yet -- same gap already noted at Museum1F.asm (OLD_AMBER
; display) and FuchsiaCity.asm (fossil statue, EVENT_GOT_DOME_FOSSIL/EVENT_GOT_HELIX_FOSSIL);
; adding the items is cross-cutting scope (new item table entries + name/attributes/description
; wiring), not part of this room's port. Simplified to flavor-only dialogue, consistent with
; those two precedents.
CinnabarLabFossilRoom_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarLabFossilRoomScientist1Script:
	jumptextfaceplayer CinnabarLabFossilRoomScientist1Text

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
