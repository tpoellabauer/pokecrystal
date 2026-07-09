	object_const_def
	const LAVENDERMART_CLERK
	const LAVENDERMART_POKEFAN_M
	const LAVENDERMART_ROCKER

LavenderMart_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
	end

LavenderMartPokefanMScript:
	jumptextfaceplayer LavenderMartBaldingGuyText

LavenderMartRockerScript:
	jumptextfaceplayer LavenderMartCooltrainerMText

LavenderMartBaldingGuyText:
	text "I'm searching for"
	line "items that raise"
	cont "the abilities of"
	cont "#MON during a"
	cont "single battle."

	para "X ATTACK, X"
	line "DEFEND, X SPEED"
	cont "and X SPECIAL are"
	cont "what I'm after."

	para "Do you know where"
	line "I can get them?"
	done

LavenderMartCooltrainerMText:
	text "You know REVIVE?"
	line "It revives any"
	cont "fainted #MON!"
	done

LavenderMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartClerkScript, -1
	object_event  6,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderMartPokefanMScript, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartRockerScript, -1
