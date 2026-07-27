	object_const_def
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BEAUTY
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM22_SOLARBEAM
	iftrue .GotSolarbeam
	writetext ErikaExplainTMText
	promptbutton
	giveitem TM_SOLARBEAM
	iffalse .GotSolarbeam
	getitemname STRING_BUFFER_3, TM_SOLARBEAM
	writetext CeladonGymReceivedTM22Text
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM22_SOLARBEAM
.GotSolarbeam:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, CeladonGymBattleText8, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ErikaBeforeBattleText:
	text "Hello. Lovely"
	line "weather isn't it?"
	cont "It's so pleasant."

	para "...Oh dear..."
	line "I must have dozed"
	cont "off. Welcome."

	para "My name is ERIKA."
	line "I am the LEADER"
	cont "of CELADON GYM."

	para "I teach the art of"
	line "flower arranging."
	cont "My #MON are of"
	cont "the grass-type."

	para "Oh, I'm sorry, I"
	line "had no idea that"
	cont "you wished to"
	cont "challenge me."

	para "Very well, but I"
	line "shall not lose."
	done

ErikaBeatenText:
	text "ERIKA: Oh!"
	line "I concede defeat."

	para "You are remarkably"
	line "strong."

	para "I must confer you"
	line "the RAINBOWBADGE."
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> received"
	line "RAINBOWBADGE."
	done

ErikaExplainTMText:
	text "ERIKA: That was a"
	line "delightful match."

	para "I felt inspired."
	line "Please, I wish you"
	cont "to have this TM."

	para "It is SOLARBEAM."

	para "It takes a turn to"
	line "gather sunlight,"

	para "then unleashes a"
	line "powerful #MON"
	cont "attack."

	para "Please use it if"
	line "it pleases you…"
	done

CeladonGymReceivedTM22Text:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ErikaAfterBattleText:
	text "ERIKA: Losing"
	line "leaves a bitter"
	cont "aftertaste…"

	para "But knowing that"
	line "there are strong"

	para "trainers spurs me"
	line "to do better…"
	done

LassMichelleSeenText:
	text "Oh, you weren't"
	line "peeping? We get a"
	cont "lot of gawkers!"
	done

LassMichelleBeatenText:
	text "Oh, bleah!"
	done

LassMichelleAfterBattleText:
	text "I just got care-"
	line "less, that's all!"
	done

PicnickerTanyaSeenText:
	text "Oh, a battle?"
	line "That's kind of"
	cont "scary, but OK!"
	done

PicnickerTanyaBeatenText:
	text "Oh, that's it?"
	done

PicnickerTanyaAfterBattleText:
	text "Oh, look at all"
	line "your BADGES. No"

	para "wonder I couldn't"
	line "win!"
	done

BeautyJuliaSeenText:
	text "Aren't you the"
	line "peeping Tom?"
	done

BeautyJuliaBeatenText:
	text "No!"
	done

BeautyJuliaAfterBattleText:
	text "I have a blind"
	line "date coming up."
	cont "I have to learn"
	cont "to be polite."
	done

TwinsJoAndZoe1SeenText:
	text "Look at my grass"
	line "#MON!"

	para "They're so easy"
	line "to raise!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… We lost…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "Bleaah!"
	line "I hope ERIKA"
	cont "wipes you out!"
	done

CeladonGymBattleText8:
	text "Welcome to"
	line "CELADON GYM!"

	para "You better not"
	line "underestimate"
	cont "girl power!"
	done

TwinsJoAndZoe2BeatenText:
	text "We couldn't win…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "ERIKA is much,"
	line "much stronger!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 7
	warp_event  5, 17, CELADON_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  2, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  6,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  7, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  1,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  3,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
