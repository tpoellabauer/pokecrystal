	object_const_def
	const FUCHSIAGYM_KOGA
	const FUCHSIAGYM_ROCKER1
	const FUCHSIAGYM_ROCKER2
	const FUCHSIAGYM_ROCKER3
	const FUCHSIAGYM_ROCKER4
	const FUCHSIAGYM_ROCKER5
	const FUCHSIAGYM_ROCKER6
	const FUCHSIAGYM_GYM_GUIDE

FuchsiaGym_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaGymKogaScript:
	faceplayer
	opentext
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	writetext KogaBeforeBattleText
	waitbutton
	closetext
	winlosstext KogaWinLossText, 0
	loadtrainer KOGA, KOGA2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KOGA
	setevent EVENT_BEAT_FUCHSIA_GYM_TRAINER_0
	setevent EVENT_BEAT_FUCHSIA_GYM_TRAINER_1
	setevent EVENT_BEAT_FUCHSIA_GYM_TRAINER_2
	setevent EVENT_BEAT_FUCHSIA_GYM_TRAINER_3
	setevent EVENT_BEAT_FUCHSIA_GYM_TRAINER_4
	setevent EVENT_BEAT_FUCHSIA_GYM_TRAINER_5
	opentext
	writetext ReceivedSoulBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	writetext KogaSoulBadgeInfoText
	promptbutton
	verbosegiveitem TM_TOXIC
	iffalse .AfterTM
	setevent EVENT_GOT_TM06_TOXIC
.AfterTM:
	writetext KogaPostBattleAdviceText
	waitbutton
	closetext
	end

.FightDone:
	writetext KogaFightDoneText
	waitbutton
	closetext
	end

TrainerJugglerDuncan:
	trainer JUGGLER, IRWIN2, EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, JugglerDuncanSeenText, JugglerDuncanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerDuncanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerKendall:
	trainer JUGGLER, IRWIN3, EVENT_BEAT_FUCHSIA_GYM_TRAINER_1, JugglerKendallSeenText, JugglerKendallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerKendallAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerOtis:
	trainer JUGGLER, IRWIN4, EVENT_BEAT_FUCHSIA_GYM_TRAINER_2, JugglerOtisSeenText, JugglerOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerWesley:
	trainer JUGGLER, JUGGLER_FUCHSIAGYM_1, EVENT_BEAT_FUCHSIA_GYM_TRAINER_3, JugglerWesleySeenText, JugglerWesleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerWesleyAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerReggie:
	trainer JUGGLER, JUGGLER_FUCHSIAGYM_2, EVENT_BEAT_FUCHSIA_GYM_TRAINER_4, JugglerReggieSeenText, JugglerReggieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerReggieAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerClyde:
	trainer JUGGLER, JUGGLER_FUCHSIAGYM_3, EVENT_BEAT_FUCHSIA_GYM_TRAINER_5, JugglerClydeSeenText, JugglerClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerClydeAfterBattleText
	waitbutton
	closetext
	end

FuchsiaGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KOGA
	iftrue .FuchsiaGymGuideWinScript
	writetext FuchsiaGymGuideText
	waitbutton
	closetext
	end

.FuchsiaGymGuideWinScript:
	writetext FuchsiaGymGuideWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, KOGA, KOGA2
	jumpstd GymStatue2Script

KogaBeforeBattleText:
	text "KOGA: Fwahahaha!"

	para "A mere child like"
	line "you dares to"
	cont "challenge me?"

	para "Very well, I"
	line "shall show you"
	cont "the terror of a"
	cont "ninja master!"

	para "You shall feel"
	line "the despair of"
	cont "poison and sleep"
	cont "techniques!"
	done

KogaWinLossText:
	text "KOGA: Humph!"
	line "You have proven"
	cont "your worth!"

	para "Here! Take the"
	line "SOULBADGE!"
	done

ReceivedSoulBadgeText:
	text "<PLAYER> received"
	line "SOULBADGE."
	done

KogaSoulBadgeInfoText:
	text "KOGA: Now that"
	line "you have the"
	cont "SOULBADGE, the"
	cont "DEFENSE of your"
	cont "#MON increases!"

	para "It also lets you"
	line "SURF outside of"
	cont "battle!"

	para "Ah! Take this"
	line "too!"
	done

KogaPostBattleAdviceText:
	text "When afflicted by"
	line "TOXIC, #MON"
	cont "suffer more and"
	cont "more as battle"
	cont "progresses!"

	para "It will surely"
	line "terrorize foes!"
	done

KogaFightDoneText:
	text "KOGA: Fwahaha!"
	line "There's no need"
	cont "to fight again!"

	para "Go on, get out"
	line "of here!"
	done

JugglerDuncanSeenText:
	text "Strength isn't"
	line "the key for"
	cont "#MON!"

	para "It's strategy!"

	para "I'll show you how"
	line "strategy can beat"
	cont "brute strength!"
	done

JugglerDuncanBeatenText:
	text "What?"
	line "Extraordinary!"
	done

JugglerDuncanAfterBattleText:
	text "So, you mix brawn"
	line "with brains?"
	cont "Good strategy!"
	done

JugglerKendallSeenText:
	text "I wanted to become"
	line "a ninja, so I"
	cont "joined this GYM!"
	done

JugglerKendallBeatenText:
	text "I'm done"
	line "for!"
	done

JugglerKendallAfterBattleText:
	text "I will keep on"
	line "training under"
	cont "KOGA, my ninja"
	cont "master!"
	done

JugglerOtisSeenText:
	text "Let's see you"
	line "beat my special"
	cont "techniques!"
	done

JugglerOtisBeatenText:
	text "You"
	line "had me fooled!"
	done

JugglerOtisAfterBattleText:
	text "I like poison and"
	line "sleep techniques,"
	cont "as they linger"
	cont "after battle!"
	done

JugglerWesleySeenText:
	text "Stop right there!"

	para "Our invisible"
	line "walls have you"
	cont "frustrated?"
	done

JugglerWesleyBeatenText:
	text "Whoa!"
	line "He's got it!"
	done

JugglerWesleyAfterBattleText:
	text "You impressed me!"
	line "Here's a hint!"

	para "Look very closely"
	line "for gaps in the"
	cont "invisible walls!"
	done

JugglerReggieSeenText:
	text "I also study the"
	line "way of the ninja"
	cont "with master KOGA!"

	para "Ninja have a long"
	line "history of using"
	cont "animals!"
	done

JugglerReggieBeatenText:
	text "Awoo!"
	done

JugglerReggieAfterBattleText:
	text "I still have much"
	line "to learn!"
	done

JugglerClydeSeenText:
	text "Master KOGA comes"
	line "from a long line"
	cont "of ninjas!"

	para "What did you"
	line "descend from?"
	done

JugglerClydeBeatenText:
	text "Dropped"
	line "my balls!"
	done

JugglerClydeAfterBattleText:
	text "Where there is"
	line "light, there is"
	cont "shadow!"

	para "Light and shadow!"
	line "Which do you"
	cont "choose?"
	done

FuchsiaGymGuideText:
	text "Yo! Champ in"
	line "making!"

	para "FUCHSIA GYM is"
	line "riddled with"
	cont "invisible walls!"

	para "KOGA might appear"
	line "close, but he's"
	cont "blocked off!"

	para "You have to find"
	line "gaps in the walls"
	cont "to reach him!"
	done

FuchsiaGymGuideWinText:
	text "It's amazing how"
	line "ninja can terrify"
	cont "even now!"
	done

FuchsiaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, FUCHSIA_CITY, 3
	warp_event  5, 17, FUCHSIA_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 10, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymKogaScript, -1
	object_event  8, 13, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerDuncan, -1
	object_event  7,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerKendall, -1
	object_event  1, 12, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerOtis, -1
	object_event  3,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerWesley, -1
	object_event  8,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerReggie, -1
	object_event  2,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerClyde, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymGuideScript, -1
