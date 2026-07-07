	object_const_def
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	writetext LtSurgeOfferThunderboltText
	setval MOVETUTOR_THUNDERBOLT
	special MoveTutor
	ifequal FALSE, .TaughtThunderbolt
	writetext LtSurgeThunderboltDeclinedText
	waitbutton
	closetext
	end

.TaughtThunderbolt:
	writetext LtSurgeThunderboltTaughtText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

; Gen 1 trash can switch puzzle (pokeredDisassembly/engine/events/hidden_events/
; vermilion_gym_trash.asm): 15 trash cans hide two switches. Each can is checked
; independently for a 1-in-15 chance of being the switch currently being searched
; for, which reproduces the "one hidden switch among many" feel without needing
; a shared scratch variable to remember which specific can was chosen. Faithful to
; Gen 1's bug/feature where guessing wrong on the 2nd switch resets the whole puzzle.
; NOTE: this ports the event/text/sound logic only -- Gen 1's locked door blocking
; the way to LT.SURGE needs dedicated door collision (see graphics-tilesets skill,
; PORT_BACKLOG); until that lands the path to LT.SURGE stays open like vanilla.
VermilionGymTrashCanAlreadyOpen:
	jumptext VermilionGymTrashCanText

VermilionGymTrashCanNoSwitchHere:
	jumptext VermilionGymTrashCanText

VermilionGymTrashCanFoundFirstSwitch:
	opentext
	writetext VermilionGymTrashFoundFirstSwitchText
	playsound SFX_SWITCH_POCKETS
	waitsfx
	closetext
	end

VermilionGymTrashCanWrongSecondSwitch:
	opentext
	writetext VermilionGymTrashWrongSwitchText
	playsound SFX_WRONG
	waitsfx
	closetext
	end

VermilionGymTrashCanFoundSecondSwitch:
	opentext
	writetext VermilionGymTrashFoundSecondSwitchText
	playsound SFX_ENTER_DOOR
	waitsfx
	closetext
	end

MACRO vermilion_gym_trash_can
; \1: this can's index (0-14), matched against a random 0-14 roll for each lock
VermilionGymTrashCan\1:
	checkevent EVENT_VERMILIONGYM_2ND_LOCK_OPENED
	iftrue VermilionGymTrashCanAlreadyOpen
	checkevent EVENT_VERMILIONGYM_1ST_LOCK_OPENED
	iftrue .TrySecondLock
	random 15
	ifequal \1, .OpenFirstLock
	sjump VermilionGymTrashCanNoSwitchHere

.OpenFirstLock:
	setevent EVENT_VERMILIONGYM_1ST_LOCK_OPENED
	sjump VermilionGymTrashCanFoundFirstSwitch

.TrySecondLock:
	random 15
	ifequal \1, .OpenSecondLock
	clearevent EVENT_VERMILIONGYM_1ST_LOCK_OPENED
	sjump VermilionGymTrashCanWrongSecondSwitch

.OpenSecondLock:
	setevent EVENT_VERMILIONGYM_2ND_LOCK_OPENED
	sjump VermilionGymTrashCanFoundSecondSwitch
ENDM

	vermilion_gym_trash_can 0
	vermilion_gym_trash_can 1
	vermilion_gym_trash_can 2
	vermilion_gym_trash_can 3
	vermilion_gym_trash_can 4
	vermilion_gym_trash_can 5
	vermilion_gym_trash_can 6
	vermilion_gym_trash_can 7
	vermilion_gym_trash_can 8
	vermilion_gym_trash_can 9
	vermilion_gym_trash_can 10
	vermilion_gym_trash_can 11
	vermilion_gym_trash_can 12
	vermilion_gym_trash_can 13
	vermilion_gym_trash_can 14

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "SURGE: Hey, you"
	line "little tyke!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #MON,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done

LtSurgeWinLossText:
	text "SURGE: Arrrgh!"
	line "You are strong!"

	para "OK, kid. You get"
	line "THUNDERBADGE!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> received"
	line "THUNDERBADGE."
	done

LtSurgeThunderBadgeText:
	text "SURGE: THUNDER-"
	line "BADGE increases"
	cont "#MON's speed. "

	para "Consider it proof"
	line "that you defeated"

	para "me. You wear it"
	line "proudly, hear?"
	done

LtSurgeOfferThunderboltText:
	text "SURGE: Hey, kid,"
	line "electric #MON"
	cont "saved me in the"
	cont "war, so I want"
	cont "you to have this."

	para "I'll teach your"
	line "#MON THUNDER-"
	cont "BOLT! Go on!"
	done

LtSurgeThunderboltTaughtText:
	text "SURGE: There you"
	line "go, kid! Zap 'em"
	cont "good!"
	done

LtSurgeThunderboltDeclinedText:
	text "SURGE: Suit your-"
	line "self, kid!"
	done

LtSurgeFightDoneText:
	text "SURGE: Hey, kid!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #MON and I"
	line "are still at it!"
	done

GentlemanGregorySeenText:
	text "You're here to"
	line "defeat LT.SURGE?"

	para "Not if I can help"
	line "it!"
	done

GentlemanGregoryBeatenText:
	text "Sorry I failed"
	line "you, LT.SURGE,"
	cont "sir!"
	done

GentlemanGregoryAfterBattleText:
	text "When I was still"
	line "in the army, LT."

	para "SURGE saved my"
	line "life."
	done

GuitaristVincentSeenText:
	text "LT.SURGE recog-"
	line "nized my potential"

	para "with electric"
	line "#MON."

	para "Think you can beat"
	line "me?"
	done

GuitaristVincentBeatenText:
	text "Ooh, how shocking!"
	done

GuitaristVincentAfterBattleText:
	text "If the GYM's traps"
	line "were working, you"

	para "would have been"
	line "toast…"
	done

JugglerHortonSeenText:
	text "I'm going to take"
	line "you down! Prepare"
	cont "to be shocked!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line "I was overpowered…"
	done

JugglerHortonAfterBattleText:
	text "Don't get too com-"
	line "fortable about"

	para "beating me…"
	line "LT.SURGE is tough."
	done

VermilionGymGuideText:
	text "Yo! CHAMP in"
	line "making!"

	para "You lucked out"
	line "this time."

	para "LT.SURGE is very"
	line "cautious. He has"

	para "traps set all over"
	line "the GYM."

	para "But--he-heh--the"
	line "traps aren't"
	cont "active right now."

	para "You'll have no"
	line "problem getting to"
	cont "LT.SURGE."
	done

VermilionGymGuideWinText:
	text "Whew! That was an"
	line "electrifying bout!"

	para "It sure made me"
	line "nervous."
	done

VermilionGymTrashCanText:
	text "Nope! Nothing here"
	line "but trash."
	done

VermilionGymTrashFoundFirstSwitchText:
	text "Click! You found a"
	line "hidden switch!"

	para "One more switch is"
	line "hidden nearby…"
	done

VermilionGymTrashWrongSwitchText:
	text "Buzzzt! Wrong can!"

	para "The switches reset"
	line "themselves…"
	done

VermilionGymTrashFoundSecondSwitchText:
	text "Click! The path to"
	line "LT.SURGE is clear!"
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan0
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan1
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan2
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan3
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan4
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan5
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan6
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan7
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan8
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan9
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan10
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan11
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan12
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan13
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan14
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
