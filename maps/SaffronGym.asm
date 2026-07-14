	object_const_def
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_CHANNELER1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_CHANNELER2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_CHANNELER3
	const SAFFRONGYM_YOUNGSTER3
	const SAFFRONGYM_YOUNGSTER4
	const SAFFRONGYM_GYM_GUIDE

SaffronGym_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_SAFFRON_GYM_TRAINER_0
	setevent EVENT_BEAT_SAFFRON_GYM_TRAINER_1
	setevent EVENT_BEAT_SAFFRON_GYM_TRAINER_2
	setevent EVENT_BEAT_SAFFRON_GYM_TRAINER_3
	setevent EVENT_BEAT_SAFFRON_GYM_TRAINER_4
	setevent EVENT_BEAT_SAFFRON_GYM_TRAINER_5
	setevent EVENT_BEAT_SAFFRON_GYM_TRAINER_6
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	checkevent EVENT_GOT_TM_PSYCHIC_SAFFRON_GYM
	iftrue .AfterTM
	writetext SabrinaMarshBadgeText
	promptbutton
	verbosegiveitem TM_PSYCHIC_M
	iffalse .AfterTM
	setevent EVENT_GOT_TM_PSYCHIC_SAFFRON_GYM
.AfterTM:
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerChannelerIrene:
	trainer CHANNELER, CHANNELER_SAFFRONGYM_1, EVENT_BEAT_SAFFRON_GYM_TRAINER_0, ChannelerIreneSeenText, ChannelerIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerIreneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGarrett:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_SAFFRON_GYM_TRAINER_1, PsychicGarrettSeenText, PsychicGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerOpal:
	trainer CHANNELER, CHANNELER_SAFFRONGYM_2, EVENT_BEAT_SAFFRON_GYM_TRAINER_2, ChannelerOpalSeenText, ChannelerOpalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerOpalAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicLeland:
	trainer PSYCHIC_T, PSYCHIC_T_SAFFRONGYM_1, EVENT_BEAT_SAFFRON_GYM_TRAINER_3, PsychicLelandSeenText, PsychicLelandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicLelandAfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerMyrtle:
	trainer CHANNELER, CHANNELER_SAFFRONGYM_3, EVENT_BEAT_SAFFRON_GYM_TRAINER_4, ChannelerMyrtleSeenText, ChannelerMyrtleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerMyrtleAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_SAFFRON_GYM_TRAINER_5, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicWade:
	trainer PSYCHIC_T, PSYCHIC_T_SAFFRONGYM_2, EVENT_BEAT_SAFFRON_GYM_TRAINER_6, PsychicWadeSeenText, PsychicWadeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicWadeAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuideWinScript
	writetext SaffronGymGuideText
	waitbutton
	closetext
	end

.SaffronGymGuideWinScript:
	writetext SaffronGymGuideWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd GymStatue2Script

SabrinaIntroText:
	text "SABRINA: I had a"
	line "vision of your"
	cont "arrival!"

	para "I have had psy-"
	line "chic powers since"
	cont "I was a child."

	para "I first learned"
	line "to bend spoons"
	cont "with my mind."

	para "I dislike fight-"
	line "ing, but if you"
	cont "wish, I will show"
	cont "you my powers!"
	done

SabrinaWinLossText:
	text "SABRINA: I'm"
	line "shocked!"
	cont "But a loss is a"
	cont "loss."

	para "I admit I didn't"
	line "work hard enough"
	cont "to win!"

	para "You earned the"
	line "MARSHBADGE!"
	done

ReceivedMarshBadgeText:
	text "<PLAYER> received"
	line "MARSHBADGE."
	done

SabrinaMarshBadgeText:
	text "SABRINA: The"
	line "MARSHBADGE makes"
	cont "#MON up to L70"
	cont "obey you!"

	para "Stronger #MON"
	line "will become wild,"
	cont "ignoring your"
	cont "orders in battle!"

	para "Wait, please take"
	line "this too!"
	done

SabrinaFightDoneText:
	text "SABRINA: Your love"
	line "for your #MON"

	para "overwhelmed my"
	line "psychic power…"

	para "The power of love,"
	line "I think, is also a"

	para "kind of psychic"
	line "power…"
	done

ChannelerIreneSeenText:
	text "SABRINA is younger"
	line "than I, but I"
	cont "respect her!"
	done

ChannelerIreneBeatenText:
	text "Not"
	line "good enough!"
	done

ChannelerIreneAfterBattleText:
	text "In a battle of"
	line "equals, the one"
	cont "with the stronger"
	cont "will wins!"

	para "If you wish to"
	line "beat SABRINA,"
	cont "focus on winning!"
	done

PsychicGarrettSeenText:
	text "Does our unseen"
	line "power scare you?"
	done

PsychicGarrettBeatenText:
	text "I never"
	line "foresaw this!"
	done

PsychicGarrettAfterBattleText:
	text "Psychic #MON"
	line "fear only ghosts"
	cont "and bugs!"
	done

ChannelerOpalSeenText:
	text "#MON take on"
	line "the appearance of"
	cont "their trainers."

	para "Your #MON must"
	line "be tough, then!"
	done

ChannelerOpalBeatenText:
	text "I knew"
	line "it!"
	done

ChannelerOpalAfterBattleText:
	text "I must teach"
	line "better techniques"
	cont "to my #MON!"
	done

PsychicLelandSeenText:
	text "You know that"
	line "power alone isn't"
	cont "enough!"
	done

PsychicLelandBeatenText:
	text "I don't"
	line "believe this!"
	done

PsychicLelandAfterBattleText:
	text "SABRINA just wiped"
	line "out the KARATE"
	cont "MASTER next door!"
	done

ChannelerMyrtleSeenText:
	text "You and I, our"
	line "#MON shall"
	cont "fight!"
	done

ChannelerMyrtleBeatenText:
	text "I lost"
	line "after all!"
	done

ChannelerMyrtleAfterBattleText:
	text "I knew that this"
	line "was going to take"
	cont "place."
	done

PsychicJaredSeenText:
	text "SABRINA is young,"
	line "but she's also"
	cont "our LEADER!"

	para "You won't reach"
	line "her easily!"
	done

PsychicJaredBeatenText:
	text "I lost"
	line "my concentration!"
	done

PsychicJaredAfterBattleText:
	text "There used to be"
	line "2 #MON GYMs in"
	cont "SAFFRON."

	para "The FIGHTING DOJO"
	line "next door lost"
	cont "its GYM status"
	cont "when we went and"
	cont "creamed them!"
	done

PsychicWadeSeenText:
	text "SAFFRON #MON"
	line "GYM is famous for"
	cont "its psychics!"

	para "You want to see"
	line "SABRINA!"
	cont "I can tell!"
	done

PsychicWadeBeatenText:
	text "Arrrgh!"
	done

PsychicWadeAfterBattleText:
	text "That's right! I"
	line "used telepathy to"
	cont "read your mind!"
	done

SaffronGymGuideText:
	text "Yo! Champ in"
	line "making!"

	para "SABRINA's #MON"
	line "use psychic power"
	cont "instead of force!"

	para "Fighting #MON"
	line "are weak against"
	cont "psychic #MON!"

	para "They get creamed"
	line "before they can"
	cont "even aim a punch!"
	done

SaffronGymGuideWinText:
	text "Psychic power,"
	line "huh?"

	para "If I had that,"
	line "I'd make a bundle"
	cont "at the slots!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event  1,  3, SAFFRON_GYM, 23
	warp_event  5,  3, SAFFRON_GYM, 16
	warp_event  1,  5, SAFFRON_GYM, 19
	warp_event  5,  5, SAFFRON_GYM, 9
	warp_event  1,  9, SAFFRON_GYM, 28
	warp_event  5,  9, SAFFRON_GYM, 17
	warp_event  1, 11, SAFFRON_GYM, 6
	warp_event  5, 11, SAFFRON_GYM, 14
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event  5, 15, SAFFRON_GYM, 31
	warp_event  1, 17, SAFFRON_GYM, 18
	warp_event  5, 17, SAFFRON_GYM, 10
	warp_event  9,  3, SAFFRON_GYM, 27
	warp_event 11,  3, SAFFRON_GYM, 4
	warp_event  9,  5, SAFFRON_GYM, 8
	warp_event 11,  5, SAFFRON_GYM, 13
	warp_event 11, 11, SAFFRON_GYM, 5
	warp_event 11, 15, SAFFRON_GYM, 32
	warp_event 15,  3, SAFFRON_GYM, 25
	warp_event 19,  3, SAFFRON_GYM, 29
	warp_event 15,  5, SAFFRON_GYM, 3
	warp_event 19,  5, SAFFRON_GYM, 11
	warp_event 15,  9, SAFFRON_GYM, 21
	warp_event 19,  9, SAFFRON_GYM, 30
	warp_event 15, 11, SAFFRON_GYM, 15
	warp_event 19, 11, SAFFRON_GYM, 7
	warp_event 15, 15, SAFFRON_GYM, 22
	warp_event 19, 15, SAFFRON_GYM, 26
	warp_event 15, 17, SAFFRON_GYM, 12
	warp_event 19, 17, SAFFRON_GYM, 20

	def_coord_events

	def_bg_events
	bg_event  9, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 10,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerChannelerIrene, -1
	object_event 17,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGarrett, -1
	object_event  3,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerChannelerOpal, -1
	object_event 17,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicLeland, -1
	object_event  3, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerChannelerMyrtle, -1
	object_event 17, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicJared, -1
	object_event  3,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicWade, -1
	object_event 10, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuideScript, -1
