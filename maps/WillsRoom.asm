	object_const_def
	const WILLSROOM_LORELEI

; Gen 1 Kanto Elite Four, 1st slot: Lorelei. Ported from pokered scripts/LoreleisRoom.asm.
; Port slot: this file (WillsRoom) hosts Lorelei's Room; Johto's Will has no Kanto equivalent.
; Reuses the existing EVENT_BEAT_ELITE_4_WILL / EVENT_WILLS_ROOM_EXIT_OPEN flags (same slot,
; new identity) so IndigoPlateauPokecenter1F's Elite-Four-reset callback needs no changes.
WillsRoom_MapScripts:
	def_scene_scripts
	scene_script WillsRoomNoopScene, SCENE_WILLSROOM_LOCK_DOOR

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorsCallback

WillsRoomNoopScene:
	end

WillsRoomDoorsCallback:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 2, 0, $5 ; open door
.KeepExitClosed:
	endcallback

LoreleiScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue LoreleiScript_AfterBattle
	writetext LoreleiScript_BeforeText
	waitbutton
	closetext
	winlosstext LoreleiScript_BeatenText, 0
	loadtrainer LORELEI, LORELEI1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opentext
	writetext LoreleiScript_DefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 2, 0, $5 ; open door
	refreshmap
	closetext
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	end

LoreleiScript_AfterBattle:
	writetext LoreleiScript_DefeatText
	waitbutton
	closetext
	end

LoreleiScript_BeforeText:
	text "LORELEI: Hihihi."

	para "Your #MON will"
	line "be at my mercy"
	cont "with my icy tricks!"

	para "While frozen, they"
	line "can't move!"

	para "Hihihi! Shall I"
	line "give you a chilly"
	cont "reception?"
	done

LoreleiScript_BeatenText:
	text "You beat me…"
	line "It's frigid…"
	done

LoreleiScript_DefeatText:
	text "There are two"
	line "more amazing"
	cont "trainers left."

	para "I doubt you can"
	line "defeat them!"
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  5, 11, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  0, KOGAS_ROOM, 1
	warp_event  5,  0, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoreleiScript_Battle, -1
