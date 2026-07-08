; Cerulean Cave B1F
; Gen 1 source: pokeredDisassembly/scripts/CeruleanCaveB1F.asm
; Mewtwo (level 70) as a normal wild-encounter object, same pattern as Power Plant's Zapdos and
; Seafoam Islands' Articuno.

	object_const_def
	const CERULEANCAVEB1F_MEWTWO
	const CERULEANCAVEB1F_ULTRA_BALL
	const CERULEANCAVEB1F_MAX_REVIVE

CeruleanCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCaveB1FMewtwo:
	opentext
	writetext CeruleanCaveB1FMewtwoBattleText
	closetext
	cry MEWTWO
	loadwildmon MEWTWO, 70
	startbattle
	ifequal LOSE, .NotBeaten
	disappear CERULEANCAVEB1F_MEWTWO
	setevent EVENT_BEAT_MEWTWO
.NotBeaten:
	reloadmapafterbattle
	end

CeruleanCaveB1FUltraBallBall:
	itemball ULTRA_BALL

CeruleanCaveB1FMaxReviveBall:
	itemball MAX_REVIVE

CeruleanCaveB1FMewtwoBattleText:
	text "Mew!"
	done

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  6, CERULEAN_CAVE_1F, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event 27, 13, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCaveB1FMewtwo, EVENT_BEAT_MEWTWO
	object_event 16,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FUltraBallBall, EVENT_CERULEAN_CAVE_B1F_ULTRA_BALL
	object_event 18,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FMaxReviveBall, EVENT_CERULEAN_CAVE_B1F_MAX_REVIVE
