	object_const_def
	const VIRIDIANGYM_GIOVANNI
	const VIRIDIANGYM_COOLTRAINER_M1
	const VIRIDIANGYM_BLACKBELT1
	const VIRIDIANGYM_GUITARIST1
	const VIRIDIANGYM_BLACKBELT2
	const VIRIDIANGYM_COOLTRAINER_M2
	const VIRIDIANGYM_BLACKBELT3
	const VIRIDIANGYM_GUITARIST2
	const VIRIDIANGYM_COOLTRAINER_M3
	const VIRIDIANGYM_GYM_GUIDE
	const VIRIDIANGYM_REVIVE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: Viridian Gym's leader identity is a secret -- the gym guide doesn't know who it is, and
; the leader's own dialogue doesn't reveal his name until the battle itself. He is GIOVANNI, the
; Team Rocket boss already fought at Rocket Hideout B4F and Silph Co 11F; beating him here reveals
; the gym leader twist, and he flees to devote himself to Pokemon study (Team Rocket disbanded).
ViridianGymGiovanniScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext GiovanniPreBattleText
	waitbutton
	closetext
	winlosstext GiovanniWinLossText, 0
	loadtrainer GIOVANNI, GIOVANNI_VIRIDIAN_GYM
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext GiovanniEarthBadgeInfoText
	promptbutton
	verbosegiveitem TM_EARTHQUAKE
	iffalse .NoRoomForEarthquake
	setevent EVENT_GOT_TM_EARTHQUAKE_FROM_VIRIDIAN_GYM
.NoRoomForEarthquake:
	writetext GiovanniFleeText
	waitbutton
	closetext
	; Gen 1: beating the last-badge gym arms the 2nd Route 22 rival battle.
	; EVENT_1ST is the Route 22 rival object's shared visibility flag (re-set here so he
	; reappears); the coord dispatcher checks EVENT_2ND first, so the 2nd battle runs.
	setevent EVENT_2ND_ROUTE22_RIVAL_BATTLE
	setevent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	setmapscene ROUTE_22, SCENE_ROUTE22_DEFAULT
	end

.FightDone:
	checkevent EVENT_GOT_TM_EARTHQUAKE_FROM_VIRIDIAN_GYM
	iftrue .AlreadyGotEarthquake
	verbosegiveitem TM_EARTHQUAKE
	iffalse .AlreadyGotEarthquake
	setevent EVENT_GOT_TM_EARTHQUAKE_FROM_VIRIDIAN_GYM
.AlreadyGotEarthquake:
	writetext GiovanniEpilogueText
	waitbutton
	closetext
	end

TrainerViridianGymCooltrainerMErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_VIRIDIAN_GYM_COOLTRAINERM_1, ViridianGymCooltrainerM1SeenText, ViridianGymCooltrainerM1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymCooltrainerM1AfterBattleText
	waitbutton
	closetext
	end

TrainerViridianGymBlackbeltKenji1:
	trainer BLACKBELT_T, KENJI1, EVENT_BEAT_VIRIDIAN_GYM_BLACKBELT_1, ViridianGymBlackbelt1SeenText, ViridianGymBlackbelt1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymBlackbelt1AfterBattleText
	waitbutton
	closetext
	end

TrainerViridianGymGuitaristIggy:
	trainer GUITARIST, IGGY, EVENT_BEAT_VIRIDIAN_GYM_GUITARIST_1, ViridianGymGuitarist1SeenText, ViridianGymGuitarist1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymGuitarist1AfterBattleText
	waitbutton
	closetext
	end

TrainerViridianGymBlackbeltKenji2:
	trainer BLACKBELT_T, KENJI2, EVENT_BEAT_VIRIDIAN_GYM_BLACKBELT_2, ViridianGymBlackbelt2SeenText, ViridianGymBlackbelt2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymBlackbelt2AfterBattleText
	waitbutton
	closetext
	end

TrainerViridianGymCooltrainerMAndy:
	trainer COOLTRAINERM, ANDY, EVENT_BEAT_VIRIDIAN_GYM_COOLTRAINERM_2, ViridianGymCooltrainerM2SeenText, ViridianGymCooltrainerM2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymCooltrainerM2AfterBattleText
	waitbutton
	closetext
	end

TrainerViridianGymBlackbeltKenta:
	trainer BLACKBELT_T, KENTA, EVENT_BEAT_VIRIDIAN_GYM_BLACKBELT_3, ViridianGymBlackbelt3SeenText, ViridianGymBlackbelt3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymBlackbelt3AfterBattleText
	waitbutton
	closetext
	end

TrainerViridianGymGuitaristMarlon:
	trainer GUITARIST, MARLON, EVENT_BEAT_VIRIDIAN_GYM_GUITARIST_2, ViridianGymGuitarist2SeenText, ViridianGymGuitarist2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymGuitarist2AfterBattleText
	waitbutton
	closetext
	end

TrainerViridianGymCooltrainerMTyler:
	trainer COOLTRAINERM, TYLER, EVENT_BEAT_VIRIDIAN_GYM_COOLTRAINERM_3, ViridianGymCooltrainerM3SeenText, ViridianGymCooltrainerM3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext ViridianGymCooltrainerM3AfterBattleText
	waitbutton
	closetext
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymReviveBall:
	itemball REVIVE

GiovanniPreBattleText:
	text "Fwahahaha! This"
	line "is my hideout!"

	para "I planned to"
	line "resurrect TEAM"
	cont "ROCKET here!"

	para "But you have"
	line "caught me again!"
	cont "So be it! This"
	cont "time, I'm not"
	cont "holding back!"

	para "Once more, you"
	line "shall face"
	cont "GIOVANNI, the"
	cont "greatest trainer!"
	done

GiovanniWinLossText:
	text "GIOVANNI: Ha!"

	para "That was a truly"
	line "intense fight!"
	cont "You have won!"
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "EARTHBADGE."
	done

GiovanniEarthBadgeInfoText:
	text "The EARTHBADGE"
	line "makes #MON of"
	cont "any level obey!"

	para "It is proof of"
	line "your mastery as a"
	cont "#MON trainer!"
	done

GiovanniFleeText:
	text "Having lost, I"
	line "cannot face my"
	cont "underlings!"
	cont "TEAM ROCKET is"
	cont "finished forever!"

	para "I will dedicate my"
	line "life to the study"
	cont "of #MON!"

	para "Let us meet again"
	line "some day!"
	cont "Farewell!"
	done

GiovanniEpilogueText:
	text "GIOVANNI has left"
	line "to study #MON."

	para "TEAM ROCKET is"
	line "finished forever!"
	done

ViridianGymCooltrainerM1SeenText:
	text "Heh! You must be"
	line "running out of"
	cont "steam by now!"
	done

ViridianGymCooltrainerM1BeatenText:
	text "I"
	line "ran out of gas!"
	prompt

ViridianGymCooltrainerM1AfterBattleText:
	text "You need power to"
	line "keep up with our"
	cont "GYM LEADER!"
	done

ViridianGymBlackbelt1SeenText:
	text "Rrrroar! I'm"
	line "working myself"
	cont "into a rage!"
	done

ViridianGymBlackbelt1BeatenText:
	text "Wargh!"
	prompt

ViridianGymBlackbelt1AfterBattleText:
	text "I'm still not"
	line "worthy!"
	done

ViridianGymGuitarist1SeenText:
	text "#MON and I, we"
	line "make wonderful"
	cont "music together!"
	done

ViridianGymGuitarist1BeatenText:
	text "You are in"
	line "perfect harmony!"
	prompt

ViridianGymGuitarist1AfterBattleText:
	text "Do you know the"
	line "identity of our"
	cont "GYM LEADER?"
	done

ViridianGymBlackbelt2SeenText:
	text "Karate is the"
	line "ultimate form of"
	cont "martial arts!"
	done

ViridianGymBlackbelt2BeatenText:
	text "Atcho!"
	prompt

ViridianGymBlackbelt2AfterBattleText:
	text "If my #MON"
	line "were as good at"
	cont "karate as I…"
	done

ViridianGymCooltrainerM2SeenText:
	text "The truly talented"
	line "win with style!"
	done

ViridianGymCooltrainerM2BeatenText:
	text "I"
	line "lost my grip!"
	prompt

ViridianGymCooltrainerM2AfterBattleText:
	text "The LEADER will"
	line "scold me!"
	done

ViridianGymBlackbelt3SeenText:
	text "I'm the KARATE"
	line "KING! Your fate"
	cont "rests with me!"
	done

ViridianGymBlackbelt3BeatenText:
	text "Ayah!"
	prompt

ViridianGymBlackbelt3AfterBattleText:
	text "#MON LEAGUE?"
	line "You? Don't get"
	cont "cocky!"
	done

ViridianGymGuitarist2SeenText:
	text "Your #MON will"
	line "cower at the"
	cont "crack of my whip!"
	done

ViridianGymGuitarist2BeatenText:
	text "Yowch!"
	line "Whiplash!"
	prompt

ViridianGymGuitarist2AfterBattleText:
	text "Wait! I was just"
	line "careless!"
	done

ViridianGymCooltrainerM3SeenText:
	text "VIRIDIAN GYM was"
	line "closed for a long"
	cont "time, but now our"
	cont "LEADER is back!"
	done

ViridianGymCooltrainerM3BeatenText:
	text "I"
	line "was beaten?"
	prompt

ViridianGymCooltrainerM3AfterBattleText:
	text "You can go on to"
	line "#MON LEAGUE"
	cont "only by defeating"
	cont "our GYM LEADER!"
	done

ViridianGymGuideText:
	text "Yo! CHAMP in"
	line "making!"

	para "Even I don't know"
	line "VIRIDIAN LEADER's"
	cont "identity!"

	para "This will be the"
	line "toughest of all"
	cont "the GYM LEADERs!"

	para "I heard the"
	line "trainers here like"
	cont "ground-type #MON!"
	done

ViridianGymGuideWinText:
	text "Blow me away!"
	line "GIOVANNI was the"
	cont "GYM LEADER here?"
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 17, VIRIDIAN_CITY, 1
	warp_event 17, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianGymGiovanniScript, -1
	object_event 12,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerViridianGymCooltrainerMErick, -1
	object_event 11, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerViridianGymBlackbeltKenji1, -1
	object_event 10,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerViridianGymGuitaristIggy, -1
	object_event  3,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerViridianGymBlackbeltKenji2, -1
	object_event 13,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerViridianGymCooltrainerMAndy, -1
	object_event 10,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerViridianGymBlackbeltKenta, -1
	object_event  2, 16, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerViridianGymGuitaristMarlon, -1
	object_event  6,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerViridianGymCooltrainerMTyler, -1
	object_event 16, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, -1
	object_event 16,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianGymReviveBall, EVENT_PICKED_UP_VIRIDIAN_GYM_REVIVE
