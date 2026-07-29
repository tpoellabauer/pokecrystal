	object_const_def
	const BRUNOSROOM_AGATHA

; Gen 1 Kanto Elite Four, 3rd slot: Agatha. Ported from pokered scripts/AgathasRoom.asm.
; Port slot: this file (BrunosRoom) hosts Agatha's Room; Johto's Bruno moved to KogasRoom's
; slot (2nd, Bruno's own Kanto tier). Brand-new AGATHA trainerclass (no Johto equivalent),
; model/trainers.toml AgathaGroup. Tileset changed to TILESET_GEN1_CEMETERY (matches Red's
; AgathasRoom header) -- see model/map_headers.toml.
BrunosRoom_MapScripts:
	def_scene_scripts
	scene_script BrunosRoomNoopScene, SCENE_BRUNOSROOM_LOCK_DOOR

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorsCallback

BrunosRoomNoopScene:
	end

BrunosRoomDoorsCallback:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 2, 0, $e ; open door
.KeepExitClosed:
	endcallback

AgathaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue AgathaScript_AfterBattle
	writetext AgathaScript_BeforeText
	waitbutton
	closetext
	winlosstext AgathaScript_EndBattleText, 0
	loadtrainer AGATHA, AGATHA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext AgathaScript_AfterBattleText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 2, 0, $e ; open door
	refreshmap
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

AgathaScript_AfterBattle:
	writetext AgathaScript_AfterBattleText
	waitbutton
	closetext
	end

AgathaScript_BeforeText:
	text "I am AGATHA of"
	line "the ELITE FOUR!"

	para "OAK's taken a lot"
	line "of interest in"
	cont "you, child!"

	para "That old duff was"
	line "once tough and"
	cont "handsome! That"
	cont "was decades ago!"

	para "Now he just wants"
	line "to fiddle with"
	cont "his #DEX! He's"
	cont "wrong! #MON"
	cont "are for fighting!"

	para "<PLAYER>! I'll show"
	line "you how a real"
	cont "trainer fights!"
	done

AgathaScript_EndBattleText:
	text "Oh ho!"
	line "You're something"
	cont "special, child!"
	done

AgathaScript_AfterBattleText:
	text "You win! I see"
	line "what the old duff"
	cont "sees in you now!"

	para "I have nothing"
	line "else to say! Run"
	cont "along now, child!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, KOGAS_ROOM, 3
	warp_event  5, 11, KOGAS_ROOM, 4
	warp_event  4,  0, KARENS_ROOM, 1
	warp_event  5,  0, KARENS_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AgathaScript_Battle, -1 ; no dedicated overworld sprite ported
