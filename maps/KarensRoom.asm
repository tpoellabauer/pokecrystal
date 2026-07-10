	object_const_def
	const KARENSROOM_LANCE

; Gen 1 Kanto Elite Four, 4th slot: Lance. Ported from pokered scripts/LancesRoom.asm.
; Port slot: this file (KarensRoom) hosts Lance's Room; Johto's Karen has no Kanto equivalent.
; Reuses the existing CHAMPION trainerclass with a new Kanto-tier party (LANCE2,
; model/trainers.toml ChampionGroup) -- same character as Johto's champion, weaker tier here
; since in Kanto he's the 4th Elite Four member, not the champion. Tileset TILESET_GEN1_DOJO
; (matches Red's LancesRoom header). Gen1's door is a 2-tile-wide gate; see model/map_headers.toml.
KarensRoom_MapScripts:
	def_scene_scripts
	scene_script KarensRoomNoopScene, SCENE_KARENSROOM_LOCK_DOOR

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorsCallback

KarensRoomNoopScene:
	end

KarensRoomDoorsCallback:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 2, 6, $31 ; open door (left tile)
	changeblock 3, 6, $32 ; open door (right tile)
.KeepExitClosed:
	endcallback

LanceScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue LanceScript_AfterBattle
	writetext LanceScript_BeforeText
	waitbutton
	closetext
	winlosstext LanceScript_BeatenText, 0
	loadtrainer CHAMPION, LANCE2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext LanceScript_DefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 2, 6, $31 ; open door (left tile)
	changeblock 3, 6, $32 ; open door (right tile)
	refreshmap
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

LanceScript_AfterBattle:
	writetext LanceScript_DefeatText
	waitbutton
	closetext
	end

LanceScript_BeforeText:
	text "LANCE: Well, well,"
	line "I didn't expect"
	cont "any challengers"
	cont "to come this far."

	para "I am LANCE."
	line "I am a dragon"
	cont "master!"
	done

LanceScript_BeatenText:
	text "Unbelievable…"
	line "You're that good?"
	done

LanceScript_DefeatText:
	text "That was great!"
	line "You are magnifi-"
	cont "cent!"

	para "I acknowledge you"
	line "as a worthy"
	cont "trainer."

	para "Go on to the"
	line "CHAMPION!"
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24, 16, BRUNOS_ROOM, 3
	warp_event  5,  0, LANCES_ROOM, 1
	warp_event  6,  0, LANCES_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  1, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LanceScript_Battle, -1
