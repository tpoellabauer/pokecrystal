	object_const_def
	const SSANNE2F_WAITER
	const SSANNE2F_RIVAL

SSAnne2F_MapScripts:
	def_scene_scripts
	scene_script SSAnne2FDefaultScene, SCENE_SSANNE2F_DEFAULT
	scene_script SSAnne2FNoop, SCENE_SSANNE2F_AFTER_RIVAL

	def_callbacks

SSAnne2FDefaultScene:
	end

SSAnne2FNoop:
	end

; Waiter NPC on the deck
SSAnne2FWaiterScript:
	jumptextfaceplayer SSAnne2FWaiterText

; Rival encounter: armored by EVENT_FOUGHT_BLUE_SSANNE (armed by Vermilion Port)
; Once beaten, disarmed and scene switches to noop
SSAnne2FRivalScript:
	faceplayer
	opentext
	writetext SSAnne2FRivalBeforeText
	waitbutton
	closetext
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement SSANNE2F_RIVAL, SSAnne2FRivalApproachMovement
	turnobject PLAYER, UP
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SSAnne2FRivalBeforeText
	waitbutton
	closetext
	loadtrainer RIVAL1, RIVAL1_ROUTE22_CHARMANDER
	winlosstext SSAnne2FRivalDefeatedText, SSAnne2FRivalVictoryText
	setlasttalked SSANNE2F_RIVAL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_FOUGHT_BLUE_SSANNE
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext SSAnne2FRivalAfterText
	waitbutton
	closetext
	applymovement SSANNE2F_RIVAL, SSAnne2FRivalExitMovement
	disappear SSANNE2F_RIVAL
	setscene SCENE_SSANNE2F_AFTER_RIVAL
	special HealParty
	playmapmusic
	end

SSAnne2FRivalApproachMovement:
	step UP
	step UP
	step_end

SSAnne2FRivalExitMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

SSAnne2FWaiterText:
	text "The Captain would"
	line "like to see you"
	cont "on the deck."
	done

SSAnne2FRivalBeforeText:
	text "<RIVAL>: Huh?"
	line "<PLAYER>!"

	para "Long time, no"
	line "see!"

	para "I'm taking a ship"
	line "cruise."

	para "Let's battle!"
	done

SSAnne2FRivalAfterText:
	text "<RIVAL>: You"
	line "better hurry!"

	para "We're about to"
	line "set sail!"
	done

SSAnne2FRivalDefeatedText:
	text "Already?"
	done

SSAnne2FRivalVictoryText:
	text "See you around,"
	line "<PLAYER>!"
	done

SSAnne2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SS_ANNE_1F, 7
	warp_event  5,  0, SS_ANNE_3F, 1
	warp_event  8,  0, SS_ANNE_3F, 2
	warp_event 10,  4, SS_ANNE_2F_ROOMS, 1
	warp_event  6,  4, SS_ANNE_2F_ROOMS, 2
	warp_event 15,  4, SS_ANNE_2F_ROOMS, 3
	warp_event 20,  4, SS_ANNE_2F_ROOMS, 4
	warp_event 25,  4, SS_ANNE_2F_ROOMS, 5
	warp_event  2,  5, SS_ANNE_CAPTAINS_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  6, SPRITE_WAITER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FWaiterScript, -1
	object_event  3,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRivalScript, EVENT_FOUGHT_BLUE_SSANNE
