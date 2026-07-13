	object_const_def
	const ROCKETHIDEOUTB2F_ROCKET1
	const ROCKETHIDEOUTB2F_MOON_STONE
	const ROCKETHIDEOUTB2F_NUGGET
	const ROCKETHIDEOUTB2F_TM_HORN_DRILL
	const ROCKETHIDEOUTB2F_SUPER_POTION

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

; Gen1 field itemballs. TM_HORN_DRILL has no Gen2 equivalent -> TM_RETURN substitute
; (Normal-type, SS Anne TM_BODY_SLAM precedent); object_item whitelisted.
RocketHideoutB2FMoonStone:
	itemball MOON_STONE

RocketHideoutB2FNugget:
	itemball NUGGET

RocketHideoutB2FTMHornDrill:
	itemball TM_RETURN

RocketHideoutB2FSuperPotion:
	itemball SUPER_POTION

RocketHideoutB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  8, ROCKET_HIDEOUT_B1F, 1
	warp_event 21,  8, ROCKET_HIDEOUT_B3F, 1
	warp_event 24, 19, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 21, 22, ROCKET_HIDEOUT_B1F, 4
	warp_event 25, 19, ROCKET_HIDEOUT_ELEVATOR, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 20, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB2FRocket1Script, -1
	object_event  1, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FMoonStone, EVENT_ROCKET_HIDEOUT_B2F_MOON_STONE
	object_event 16,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FNugget, EVENT_ROCKET_HIDEOUT_B2F_NUGGET
	object_event  6, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FTMHornDrill, EVENT_ROCKET_HIDEOUT_B2F_TM_HORN_DRILL
	object_event  3, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FSuperPotion, EVENT_ROCKET_HIDEOUT_B2F_SUPER_POTION
