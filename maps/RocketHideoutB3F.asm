	object_const_def
	const ROCKETHIDEOUTB3F_ROCKET1
	const ROCKETHIDEOUTB3F_ROCKET2

RocketHideoutB3F_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutB3FRocket1Script:
	faceplayer
	opentext
	writetext RocketHideoutB3FRocket1PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB3FRocket1DefeatedText, RocketHideoutB3FRocket1VictoryText
	setlasttalked ROCKETHIDEOUTB3F_ROCKET1
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B3F_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_3_TRAINER_0
	opentext
	writetext RocketHideoutB3FRocket1AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB3FRocket2Script:
	faceplayer
	opentext
	writetext RocketHideoutB3FRocket2PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB3FRocket2DefeatedText, RocketHideoutB3FRocket2VictoryText
	setlasttalked ROCKETHIDEOUTB3F_ROCKET2
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B3F_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_3_TRAINER_1
	opentext
	writetext RocketHideoutB3FRocket2AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB3FRocket1PreBattleText:
	text "Stop right there!"
	done

RocketHideoutB3FRocket1DefeatedText:
	text "Argh!"
	done

RocketHideoutB3FRocket1VictoryText:
	text "TEAM ROCKET is"
	line "unstoppable!"
	done

RocketHideoutB3FRocket1AfterBattleText:
	text "You got lucky that"
	line "time!"
	done

RocketHideoutB3FRocket2PreBattleText:
	text "You shouldn't have"
	line "come down here!"
	done

RocketHideoutB3FRocket2DefeatedText:
	text "No way!"
	done

RocketHideoutB3FRocket2VictoryText:
	text "Now you're done"
	line "for!"
	done

RocketHideoutB3FRocket2AfterBattleText:
	text "Hah! You're just"
	line "delaying the"
	cont "inevitable!"
	done

RocketHideoutB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  2, ROCKET_HIDEOUT_B2F, 2
	warp_event 13, 18, ROCKET_HIDEOUT_B4F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB3FRocket1Script, -1
	object_event 18, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB3FRocket2Script, -1
