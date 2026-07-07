	object_const_def
	const ROCKETHIDEOUTB1F_ROCKET1
	const ROCKETHIDEOUTB1F_ROCKET2
	const ROCKETHIDEOUTB1F_ROCKET3
	const ROCKETHIDEOUTB1F_ROCKET4
	const ROCKETHIDEOUTB1F_ROCKET5

RocketHideoutB1F_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutB1FRocket1Script:
	faceplayer
	opentext
	writetext RocketHideoutB1FRocket1PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB1FRocket1DefeatedText, RocketHideoutB1FRocket1VictoryText
	setlasttalked ROCKETHIDEOUTB1F_ROCKET1
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B1F_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_0
	opentext
	writetext RocketHideoutB1FRocket1AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB1FRocket2Script:
	faceplayer
	opentext
	writetext RocketHideoutB1FRocket2PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB1FRocket2DefeatedText, RocketHideoutB1FRocket2VictoryText
	setlasttalked ROCKETHIDEOUTB1F_ROCKET2
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B1F_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_1
	opentext
	writetext RocketHideoutB1FRocket2AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB1FRocket3Script:
	faceplayer
	opentext
	writetext RocketHideoutB1FRocket3PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB1FRocket3DefeatedText, RocketHideoutB1FRocket3VictoryText
	setlasttalked ROCKETHIDEOUTB1F_ROCKET3
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B1F_3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_2
	opentext
	writetext RocketHideoutB1FRocket3AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB1FRocket4Script:
	faceplayer
	opentext
	writetext RocketHideoutB1FRocket4PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB1FRocket4DefeatedText, RocketHideoutB1FRocket4VictoryText
	setlasttalked ROCKETHIDEOUTB1F_ROCKET4
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B1F_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_3
	opentext
	writetext RocketHideoutB1FRocket4AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB1FRocket5Script:
	faceplayer
	opentext
	writetext RocketHideoutB1FRocket5PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB1FRocket5DefeatedText, RocketHideoutB1FRocket5VictoryText
	setlasttalked ROCKETHIDEOUTB1F_ROCKET5
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B1F_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
	opentext
	writetext RocketHideoutB1FRocket5AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB1FRocket1PreBattleText:
	text "Who are you? How"
	line "did you get here?"
	done

RocketHideoutB1FRocket1DefeatedText:
	text "Oww!"
	line "Beaten!"
	done

RocketHideoutB1FRocket1VictoryText:
	text "No! How could I"
	line "lose?"
	done

RocketHideoutB1FRocket1AfterBattleText:
	text "Are you dissing"
	line "TEAM ROCKET?"
	done

RocketHideoutB1FRocket2PreBattleText:
	text "You broke into"
	line "our operation?"
	done

RocketHideoutB1FRocket2DefeatedText:
	text "Burnt!"
	done

RocketHideoutB1FRocket2VictoryText:
	text "Hahaha!"
	line "You're weak!"
	done

RocketHideoutB1FRocket2AfterBattleText:
	text "You're not going"
	line "to get away with"
	cont "this, brat!"
	done

RocketHideoutB1FRocket3PreBattleText:
	text "Intruder alert!"
	done

RocketHideoutB1FRocket3DefeatedText:
	text "I"
	line "can't do it!"
	done

RocketHideoutB1FRocket3VictoryText:
	text "Pathetic!"
	done

RocketHideoutB1FRocket3AfterBattleText:
	text "SILPH SCOPE?"
	line "I don't know"
	cont "where it is!"
	done

RocketHideoutB1FRocket4PreBattleText:
	text "Why did you come"
	line "here?"
	done

RocketHideoutB1FRocket4DefeatedText:
	text "This"
	line "won't do!"
	done

RocketHideoutB1FRocket4VictoryText:
	text "You fool!"
	done

RocketHideoutB1FRocket4AfterBattleText:
	text "OK, I'll talk!"
	line "Take the elevator"
	cont "to see my BOSS!"
	done

RocketHideoutB1FRocket5PreBattleText:
	text "Are you lost, you"
	line "little rat?"
	done

RocketHideoutB1FRocket5DefeatedText:
	text "Why...?"
	done

RocketHideoutB1FRocket5VictoryText:
	text "Better luck next"
	line "time!"
	done

RocketHideoutB1FRocket5AfterBattleText:
	text "Uh-oh, that fight"
	line "opened the door!"
	done

RocketHideoutB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  2, ROCKET_HIDEOUT_B2F, 1
	warp_event 21,  2, CELADON_GAME_CORNER, 1 ; NEEDS-MAP: no secret staircase wired into CeladonGameCorner yet, lands at its front door
	warp_event 24, 19, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 21, 24, ROCKET_HIDEOUT_B2F, 4
	warp_event 25, 19, ROCKET_HIDEOUT_ELEVATOR, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 26,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB1FRocket1Script, -1
	object_event 12,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB1FRocket2Script, -1
	object_event 18, 17, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB1FRocket3Script, -1
	object_event 15, 25, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB1FRocket4Script, -1
	object_event 28, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB1FRocket5Script, -1
