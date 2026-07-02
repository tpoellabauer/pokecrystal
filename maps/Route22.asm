	object_const_def
	const ROUTE22_RIVAL

; Gen 1 Route 22 first rival battle, ported from pokered scripts/Route22.asm.
; The rival is armed the moment Oak's Lab hands you a starter (EVENT_1ST_ROUTE22_RIVAL_BATTLE,
; also the object's visibility flag). Walking west toward the League gate onto x=29 trips the
; coord event: the rival dashes in from the west, battles you with Pidgey + the type-counter
; starter, then leaves. The 2nd (post-Elite-Four) battle is deferred.
Route22_MapScripts:
	def_scene_scripts
	scene_script Route22DefaultScene, SCENE_ROUTE22_DEFAULT ; default: coord event is armed
	scene_script Route22NoopScene,    SCENE_ROUTE22_NOOP    ; after the battle: disarmed

	def_callbacks

Route22DefaultScene:
	end

Route22NoopScene:
	end

; Fires whenever you step on the League-gate approach. Gated on the arm flag so it is an
; inert no-op until Oak's Lab sets it (Gen 1's EVENT_ROUTE22_RIVAL_WANTS_BATTLE check).
Route22RivalBattleScene:
	checkevent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	iffalse .done
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement ROUTE22_RIVAL, Route22RivalApproachMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route22RivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_CHOSE_CHARMANDER
	iftrue .Charmander
	checkevent EVENT_CHOSE_SQUIRTLE
	iftrue .Squirtle
	; you chose Bulbasaur (or, defensively, nothing) -> rival grabbed Charmander
	loadtrainer RIVAL1, RIVAL1_ROUTE22_CHARMANDER
	sjump .Fight
.Squirtle:
	loadtrainer RIVAL1, RIVAL1_ROUTE22_BULBASAUR
	sjump .Fight
.Charmander:
	loadtrainer RIVAL1, RIVAL1_ROUTE22_SQUIRTLE
.Fight:
	winlosstext Route22RivalDefeatedText, Route22RivalVictoryText
	setlasttalked ROUTE22_RIVAL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route22RivalAfterText
	waitbutton
	closetext
	applymovement ROUTE22_RIVAL, Route22RivalExitMovement
	disappear ROUTE22_RIVAL
	clearevent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	setscene SCENE_ROUTE22_NOOP
	special HealParty
	playmapmusic
.done:
	end

; Talking to the rival before the coord event trips (walking straight into him).
Route22RivalScript:
	faceplayer
	opentext
	writetext Route22RivalBeforeText
	waitbutton
	closetext
	end

Route22RivalApproachMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Route22RivalExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#MON LEAGUE"

	para "VICTORY ROAD"
	line "ENTRANCE"
	done

Route22RivalBeforeText:
	text "<RIVAL>: Hey!"
	line "<PLAYER>!"

	para "You're going to"
	line "#MON LEAGUE?"

	para "Forget it! You"
	line "probably don't"
	cont "have any BADGEs!"

	para "The guard won't"
	line "let you through!"

	para "By the way, did"
	line "your #MON"
	cont "get any stronger?"
	done

Route22RivalAfterText:
	text "I heard #MON"
	line "LEAGUE has many"
	cont "tough trainers!"

	para "I have to figure"
	line "out how to get"
	cont "past them!"

	para "You should quit"
	line "dawdling and get"
	cont "a move on!"
	done

Route22RivalDefeatedText:
	text "Awww!"
	line "You just lucked"
	cont "out!"
	done

Route22RivalVictoryText:
	text "<RIVAL>: What?"
	line "Why do I have 2"
	cont "#MON?"

	para "You should catch"
	cont "some more too!"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	def_coord_events
	coord_event 29,  4, SCENE_ROUTE22_DEFAULT, Route22RivalBattleScene
	coord_event 29,  5, SCENE_ROUTE22_DEFAULT, Route22RivalBattleScene

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
	object_event 25,  5, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22RivalScript, EVENT_1ST_ROUTE22_RIVAL_BATTLE
