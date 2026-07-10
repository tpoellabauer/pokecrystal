	object_const_def
	const LANCESROOM_RIVAL
	const LANCESROOM_OAK

; Gen 1 Kanto Elite Four, final battle: the Champion (your rival). Ported from
; pokered scripts/ChampionsRoom.asm. Port slot: this file (LancesRoom) hosts Champion's Room;
; Johto's champion Lance moved to KarensRoom's slot (Lance's Kanto E4 tier). Reuses RIVAL1 (same
; character as every earlier Kanto rival fight) with 3 new starter-dependent final-tier consts
; (model/trainers.toml Rival1Group tail). Simplified from Gen1's auto-walk-in ambush + Oak/Mary
; interview cutscene to a talk-triggered battle + a short Oak congratulations, matching the
; "talk-triggered handoff instead of Gen1 auto-ambush" precedent (see maps-and-scripting skill).
LancesRoom_MapScripts:
	def_scene_scripts
	scene_script LancesRoomNoopScene, SCENE_LANCESROOM_LOCK_DOOR

	def_callbacks

LancesRoomNoopScene:
	end

ChampionScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iftrue ChampionScript_AfterBattle
	writetext ChampionScript_BeforeText
	waitbutton
	closetext
	checkevent EVENT_CHOSE_CHARMANDER
	iftrue .Charmander
	checkevent EVENT_CHOSE_SQUIRTLE
	iftrue .Squirtle
	; you chose Bulbasaur (or, defensively, nothing) -> rival grabbed Charmander
	loadtrainer RIVAL1, RIVAL1_CHAMPION_CHARMANDER
	sjump .Fight
.Squirtle:
	loadtrainer RIVAL1, RIVAL1_CHAMPION_BULBASAUR
	sjump .Fight
.Charmander:
	loadtrainer RIVAL1, RIVAL1_CHAMPION_SQUIRTLE
.Fight:
	winlosstext ChampionScript_BeatenText, 0
	setlasttalked LANCESROOM_RIVAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext ChampionScript_DefeatText
	waitbutton
	closetext
	end

ChampionScript_AfterBattle:
	writetext ChampionScript_DefeatText
	waitbutton
	closetext
	end

OakScript_Congratulate:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iffalse .NotYet
	writetext OakScript_CongratulateText
	waitbutton
	closetext
	end
.NotYet:
	writetext OakScript_GoodLuckText
	waitbutton
	closetext
	end

ChampionScript_BeforeText:
	text "RIVAL: Hey! I've"
	line "been waiting for"
	cont "you!"

	para "Smell ya later!"
	line "I'm still the"
	cont "strongest!"
	done

ChampionScript_BeatenText:
	text "…Impossible…"
	done

ChampionScript_DefeatText:
	text "…Well, I guess"
	line "you're the"
	cont "CHAMPION now."

	para "Smell ya later!"
	done

OakScript_GoodLuckText:
	text "PROF.OAK: Good"
	line "luck in there,"
	cont "<PLAYER>!"
	done

OakScript_CongratulateText:
	text "PROF.OAK: Well"
	line "done, <PLAYER>!"

	para "You've become the"
	line "#MON LEAGUE"
	cont "CHAMPION!"

	para "Go on and enter"
	line "your name in the"
	cont "HALL OF FAME."
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, KARENS_ROOM, 2
	warp_event  4,  7, KARENS_ROOM, 3
	warp_event  3,  0, HALL_OF_FAME, 1
	warp_event  4,  0, HALL_OF_FAME, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ChampionScript_Battle, -1
	object_event  3,  6, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OakScript_Congratulate, -1
