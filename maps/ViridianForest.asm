	object_const_def
	const VIRIDIANFOREST_YOUNGSTER1
	const VIRIDIANFOREST_YOUNGSTER2
	const VIRIDIANFOREST_YOUNGSTER3
	const VIRIDIANFOREST_YOUNGSTER4
	const VIRIDIANFOREST_ANTIDOTE
	const VIRIDIANFOREST_POTION
	const VIRIDIANFOREST_POKE_BALL
	const VIRIDIANFOREST_YOUNGSTER5

; Gen 1 Viridian Forest, ported from pokered data/maps/objects/ViridianForest.asm +
; scripts/ViridianForest.asm. The 3 Bug Catcher battles keep their Gen1 trainer
; numbering (BUG_CATCHER DON/ROB/ED = OPP_BUG_CATCHER 1/2/3 in Gen1), simplified from
; Gen1's shared trainer-header dispatch table to standalone talk-triggered fights
; (precedent: Route22/CinnabarGym).
ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestYoungster1Script:
	jumptextfaceplayer ViridianForestYoungster1Text

ViridianForestYoungster2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	iftrue .Beaten
	writetext ViridianForestYoungster2BattleText
	waitbutton
	closetext
	winlosstext ViridianForestYoungster2EndBattleText, 0
	loadtrainer BUG_CATCHER, DON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	end
.Beaten:
	writetext ViridianForestYoungster2AfterBattleText
	waitbutton
	closetext
	end

ViridianForestYoungster3Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	iftrue .Beaten
	writetext ViridianForestYoungster3BattleText
	waitbutton
	closetext
	winlosstext ViridianForestYoungster3EndBattleText, 0
	loadtrainer BUG_CATCHER, ROB
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	end
.Beaten:
	writetext ViridianForestYoungster3AfterBattleText
	waitbutton
	closetext
	end

ViridianForestYoungster4Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	iftrue .Beaten
	writetext ViridianForestYoungster4BattleText
	waitbutton
	closetext
	winlosstext ViridianForestYoungster4EndBattleText, 0
	loadtrainer BUG_CATCHER, ED
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	end
.Beaten:
	writetext ViridianForestYoungster4AfterBattleText
	waitbutton
	closetext
	end

ViridianForestYoungster5Script:
	jumptextfaceplayer ViridianForestYoungster5Text

ViridianForestAntidoteBall:
	itemball ANTIDOTE

ViridianForestPotionBall:
	itemball POTION

ViridianForestPokeBallBall:
	itemball POKE_BALL

ViridianForestTrainerTips1Sign:
	jumptext ViridianForestTrainerTips1Text

ViridianForestUseAntidoteSign:
	jumptext ViridianForestUseAntidoteSignText

ViridianForestTrainerTips2Sign:
	jumptext ViridianForestTrainerTips2Text

ViridianForestTrainerTips3Sign:
	jumptext ViridianForestTrainerTips3Text

ViridianForestTrainerTips4Sign:
	jumptext ViridianForestTrainerTips4Text

ViridianForestLeavingSign:
	jumptext ViridianForestLeavingSignText

ViridianForestYoungster1Text:
	text "I came here with"
	line "some friends!"

	para "They're out for"
	line "#MON fights!"
	done

ViridianForestYoungster2BattleText:
	text "Hey! You have"
	line "#MON! Come on!"
	cont "Let's battle!"
	done

ViridianForestYoungster2EndBattleText:
	text "No! CATERPIE"
	line "can't cut it!"
	done

ViridianForestYoungster2AfterBattleText:
	text "Ssh! You'll scare"
	line "the bugs away!"
	done

ViridianForestYoungster3BattleText:
	text "Yo! You can't jam"
	line "out if you're a"
	cont "#MON trainer!"
	done

ViridianForestYoungster3EndBattleText:
	text "Huh? I ran out"
	line "of #MON!"
	done

ViridianForestYoungster3AfterBattleText:
	text "Darn! I'm going"
	line "to catch some"
	cont "stronger ones!"
	done

ViridianForestYoungster4BattleText:
	text "Hey, wait up!"
	line "What's the hurry?"
	done

ViridianForestYoungster4EndBattleText:
	text "I give! You're"
	line "good at this!"
	done

ViridianForestYoungster4AfterBattleText:
	text "Sometimes, you"
	line "can find stuff on"
	cont "the ground!"

	para "I'm looking for"
	line "the stuff I"
	cont "dropped!"
	done

ViridianForestYoungster5Text:
	text "I ran out of #"
	line "BALLs to catch"
	cont "#MON with!"

	para "You should carry"
	line "extras!"
	done

ViridianForestTrainerTips1Text:
	text "TRAINER TIPS"

	para "If you want to"
	line "avoid battles,"
	cont "stay away from"
	cont "grassy areas!"
	done

ViridianForestUseAntidoteSignText:
	text "For poison, use"
	line "ANTIDOTE! Get it"
	cont "at #MON MARTs!"
	done

ViridianForestTrainerTips2Text:
	text "TRAINER TIPS"

	para "Contact PROF.OAK"
	line "via PC to get"
	cont "your #DEX"
	cont "evaluated!"
	done

ViridianForestTrainerTips3Text:
	text "TRAINER TIPS"

	para "No stealing"
	line "#MON from other"
	cont "trainers! Catch"
	cont "only wild #MON!"
	done

ViridianForestTrainerTips4Text:
	text "TRAINER TIPS"

	para "Weaken #MON"
	line "before attempting"
	cont "capture!"

	para "When healthy,"
	line "they may escape!"
	done

ViridianForestLeavingSignText:
	text "LEAVING"
	line "VIRIDIAN FOREST"
	cont "PEWTER CITY AHEAD"
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  0, VIRIDIAN_FOREST_NORTH_GATE, 3
	warp_event  2,  0, VIRIDIAN_FOREST_NORTH_GATE, 4
	warp_event 15, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 16, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 17, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 18, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 24, 40, BGEVENT_READ, ViridianForestTrainerTips1Sign
	bg_event 16, 32, BGEVENT_READ, ViridianForestUseAntidoteSign
	bg_event 26, 17, BGEVENT_READ, ViridianForestTrainerTips2Sign
	bg_event  4, 24, BGEVENT_READ, ViridianForestTrainerTips3Sign
	bg_event 18, 45, BGEVENT_READ, ViridianForestTrainerTips4Sign
	bg_event  2,  1, BGEVENT_READ, ViridianForestLeavingSign

	def_object_events
	object_event 16, 43, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestYoungster1Script, -1
	object_event 30, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestYoungster2Script, -1
	object_event 30, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestYoungster3Script, -1
	object_event  2, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestYoungster4Script, -1
	object_event 25, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestAntidoteBall, EVENT_VIRIDIAN_FOREST_ANTIDOTE
	object_event 12, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestPotionBall, EVENT_VIRIDIAN_FOREST_POTION
	object_event  1, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestPokeBallBall, EVENT_VIRIDIAN_FOREST_POKE_BALL
	object_event 27, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestYoungster5Script, -1
