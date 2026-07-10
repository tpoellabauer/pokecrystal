	object_const_def
	const KOGASROOM_BRUNO

; Gen 1 Kanto Elite Four, 2nd slot: Bruno. Ported from pokered scripts/BrunosRoom.asm.
; Port slot: this file (KogasRoom) hosts Bruno's Room; Johto's Koga has no Kanto E4 equivalent
; (he's Fuchsia's gym leader instead, see FuchsiaGym.asm KOGA2). Reuses BRUNO's existing
; trainerclass with a new Kanto-tier party (BRUNO2, model/trainers.toml BrunoGroup).
KogasRoom_MapScripts:
	def_scene_scripts
	scene_script KogasRoomNoopScene, SCENE_KOGASROOM_LOCK_DOOR

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorsCallback

KogasRoomNoopScene:
	end

KogasRoomDoorsCallback:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 2, 0, $5 ; open door
.KeepExitClosed:
	endcallback

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BeatenText, 0
	loadtrainer BRUNO, BRUNO2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext BrunoScript_DefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 2, 0, $5 ; open door
	refreshmap
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_DefeatText
	waitbutton
	closetext
	end

BrunoScript_BeforeText:
	text "BRUNO: Hmph!"

	para "Talking is not"
	line "my way, and neith-"
	cont "er is losing!"

	para "The best kind of"
	line "#MON training"
	cont "is with the fists!"
	done

BrunoScript_BeatenText:
	text "Nnnooo!"
	line "How could I lose!"
	done

BrunoScript_DefeatText:
	text "Hmph!"

	para "You are strong."
	line "But there's more"
	cont "of us ahead."
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, WILLS_ROOM, 3
	warp_event  5, 11, WILLS_ROOM, 4
	warp_event  4,  0, BRUNOS_ROOM, 1
	warp_event  5,  0, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
