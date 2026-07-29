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
; Once beaten, disarmed and scene switches to noop. Type-counter starter branch added +
; retargeted to the real Gen1 S.S. Anne roster (Rival2Data's 1st tier, Lv16-20) via the
; RIVAL1_SSANNE_* trainer parties -- previously hardcoded to the wrong (Route 22, Lv8/9) tier
; with no starter branching at all.
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
	checkevent EVENT_CHOSE_CHARMANDER
	iftrue .Charmander
	checkevent EVENT_CHOSE_SQUIRTLE
	iftrue .Squirtle
	; you chose Bulbasaur (or, defensively, nothing) -> rival's Charmander line
	loadtrainer RIVAL1, RIVAL1_SSANNE_CHARMANDER
	sjump .Fight
.Squirtle:
	loadtrainer RIVAL1, RIVAL1_SSANNE_BULBASAUR
	sjump .Fight
.Charmander:
	loadtrainer RIVAL1, RIVAL1_SSANNE_SQUIRTLE
.Fight:
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
	text "This ship, she is"
	line "a luxury liner"
	cont "for trainers!"

	para "At every port, we"
	line "hold parties with"
	cont "invited trainers!"
	done

SSAnne2FRivalBeforeText:
	text "<RIVAL>: Bonjour!"
	line "<PLAYER>!"

	para "Imagine seeing"
	line "you here!"

	para "<PLAYER>, were you"
	line "really invited?"

	para "So how's your"
	line "#DEX coming?"

	para "I already caught"
	line "40 kinds, pal!"

	para "Different kinds"
	line "are everywhere!"

	para "Crawl around in"
	line "grassy areas!"
	done

SSAnne2FRivalAfterText:
	text "<RIVAL>: I heard"
	line "there was a CUT"
	cont "master on board."

	para "But, he was just a"
	line "seasick, old man!"

	para "But, CUT itself is"
	line "really useful!"

	para "You should go see"
	line "him! Smell ya!"
	done

SSAnne2FRivalDefeatedText:
	text "Humph!"

	para "At least you're"
	line "raising your"
	cont "#MON!"
	done

SSAnne2FRivalVictoryText:
	text "<PLAYER>! What are"
	line "you, seasick?"

	para "You should shape"
	line "up, pal!"
	done

SSAnne2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, SS_ANNE_2F_ROOMS, 1
	warp_event 13, 11, SS_ANNE_2F_ROOMS, 3
	warp_event 17, 11, SS_ANNE_2F_ROOMS, 5
	warp_event 21, 11, SS_ANNE_2F_ROOMS, 7
	warp_event 25, 11, SS_ANNE_2F_ROOMS, 9
	warp_event 29, 11, SS_ANNE_2F_ROOMS, 11
	warp_event  2,  4, SS_ANNE_1F, 9
	warp_event  2, 12, SS_ANNE_3F, 2
	warp_event 36,  4, SS_ANNE_CAPTAINS_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  7, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FWaiterScript, -1
	object_event 36,  4, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRivalScript, EVENT_FOUGHT_BLUE_SSANNE
