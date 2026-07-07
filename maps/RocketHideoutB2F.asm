	object_const_def
	const ROCKETHIDEOUTB2F_ROCKET1

RocketHideoutB2F_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutB2FRocket1Script:
	faceplayer
	opentext
	writetext RocketHideoutB2FRocket1PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB2FRocket1DefeatedText, RocketHideoutB2FRocket1VictoryText
	setlasttalked ROCKETHIDEOUTB2F_ROCKET1
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B2F_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_2_TRAINER_0
	opentext
	writetext RocketHideoutB2FRocket1AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB2FRocket1PreBattleText:
	text "You broke into"
	line "our hideout?"
	done

RocketHideoutB2FRocket1DefeatedText:
	text "I'm down!"
	done

RocketHideoutB2FRocket1VictoryText:
	text "You're no match"
	line "for TEAM ROCKET!"
	done

RocketHideoutB2FRocket1AfterBattleText:
	text "You'll never make"
	line "it past us!"
	done

RocketHideoutB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  2, ROCKET_HIDEOUT_B1F, 1
	warp_event 13,  2, ROCKET_HIDEOUT_B3F, 1
	warp_event  2, 10, ROCKET_HIDEOUT_B1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 18, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB2FRocket1Script, -1
