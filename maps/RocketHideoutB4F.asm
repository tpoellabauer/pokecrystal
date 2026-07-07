	object_const_def
	const ROCKETHIDEOUTB4F_ROCKET1
	const ROCKETHIDEOUTB4F_ROCKET2
	const ROCKETHIDEOUTB4F_ROCKET3
	const ROCKETHIDEOUTB4F_GIOVANNI
	const ROCKETHIDEOUTB4F_LIFT_KEY

RocketHideoutB4F_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutB4FRocket1Script:
	faceplayer
	opentext
	writetext RocketHideoutB4FRocket1PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FRocket1DefeatedText, RocketHideoutB4FRocket1VictoryText
	setlasttalked ROCKETHIDEOUTB4F_ROCKET1
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B4F_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0
	opentext
	writetext RocketHideoutB4FRocket1AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB4FRocket2Script:
	faceplayer
	opentext
	writetext RocketHideoutB4FRocket2PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FRocket2DefeatedText, RocketHideoutB4FRocket2VictoryText
	setlasttalked ROCKETHIDEOUTB4F_ROCKET2
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B4F_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	opentext
	writetext RocketHideoutB4FRocket2AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB4FRocket3Script:
	faceplayer
	opentext
	writetext RocketHideoutB4FRocket3PreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FRocket3DefeatedText, RocketHideoutB4FRocket3VictoryText
	setlasttalked ROCKETHIDEOUTB4F_ROCKET3
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B4F_3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2
	opentext
	writetext RocketHideoutB4FRocket3AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB4FGiovanniScript:
	faceplayer
	opentext
	writetext RocketHideoutB4FGiovanniPreBattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FGiovanniDefeatedText, RocketHideoutB4FGiovanniVictoryText
	setlasttalked ROCKETHIDEOUTB4F_GIOVANNI
	loadtrainer GIOVANNI, GIOVANNI_ROCKET_HIDEOUT
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	opentext
	writetext RocketHideoutB4FGiovanniAfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB4FLiftKeyScript:
	opentext
	writetext RocketHideoutB4FLiftKeyFoundText
	waitbutton
	closetext
	giveitem RARE_CANDY
	iffalse .no_room
	setevent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2
	return
.no_room
	opentext
	writetext RocketHideoutB4FLiftKeyNoRoomText
	waitbutton
	closetext
	end

RocketHideoutB4FRocket1PreBattleText:
	text "You're tougher"
	line "than you look!"
	done

RocketHideoutB4FRocket1DefeatedText:
	text "Ugh!"
	done

RocketHideoutB4FRocket1VictoryText:
	text "Boss, this one's"
	line "strong!"
	done

RocketHideoutB4FRocket1AfterBattleText:
	text "But you'll never"
	line "beat the BOSS!"
	done

RocketHideoutB4FRocket2PreBattleText:
	text "Fool! You've made"
	line "a terrible"
	cont "mistake!"
	done

RocketHideoutB4FRocket2DefeatedText:
	text "Impossible!"
	done

RocketHideoutB4FRocket2VictoryText:
	text "You don't stand a"
	line "chance!"
	done

RocketHideoutB4FRocket2AfterBattleText:
	text "Boss, beat this"
	line "fool!"
	done

RocketHideoutB4FRocket3PreBattleText:
	text "I'm the last line"
	line "of defense!"
	done

RocketHideoutB4FRocket3DefeatedText:
	text "I've failed!"
	done

RocketHideoutB4FRocket3VictoryText:
	text "You won't make it"
	line "past the BOSS!"
	done

RocketHideoutB4FRocket3AfterBattleText:
	text "Good luck getting"
	line "past him!"
	done

RocketHideoutB4FGiovanniPreBattleText:
	text "So, you've made it"
	line "to me!"
	para "I'm GIOVANNI, the"
	line "leader of TEAM"
	cont "ROCKET!"
	para "Prepare yourself!"
	done

RocketHideoutB4FGiovanniDefeatedText:
	text "What?! Defeated by"
	line "a child?!"
	done

RocketHideoutB4FGiovanniVictoryText:
	text "Ha! TEAM ROCKET"
	line "will crush you!"
	done

RocketHideoutB4FGiovanniAfterBattleText:
	text "I'll be back!"
	line "This isn't over!"
	done

RocketHideoutB4FLiftKeyFoundText:
	text "Found a hidden"
	line "RARE CANDY!"
	done

RocketHideoutB4FLiftKeyNoRoomText:
	text "You have no room"
	line "in your BAG!"
	done

RocketHideoutB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 18, ROCKET_HIDEOUT_B3F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FRocket1Script, -1
	object_event 20, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FRocket2Script, -1
	object_event 13, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FRocket3Script, -1
	object_event 13,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FGiovanniScript, -1
	object_event  9, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FLiftKeyScript, EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2
