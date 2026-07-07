	object_const_def
	const FIGHTINGDOJO_KARATE_MASTER
	const FIGHTINGDOJO_BLACKBELT1
	const FIGHTINGDOJO_BLACKBELT2
	const FIGHTINGDOJO_BLACKBELT3
	const FIGHTINGDOJO_BLACKBELT4
	const FIGHTINGDOJO_HITMONLEE_POKE_BALL
	const FIGHTINGDOJO_HITMONCHAN_POKE_BALL

FightingDojo_MapScripts:
	def_scene_scripts

	def_callbacks

FightingDojoKarateMasterScript:
	faceplayer
	opentext
	checkevent EVENT_DEFEATED_FIGHTING_DOJO
	iftrue .StayAndTrain
	checkevent EVENT_BEAT_KARATE_MASTER
	iftrue .IWillGiveYouAPokemon
	writetext KarateMasterIntroText
	waitbutton
	closetext
	winlosstext KarateMasterDefeatedText, 0
	loadtrainer BLACKBELT_T, HAYATO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KARATE_MASTER
	; Gen 1: beating the Karate Master retires the Dojo's 4 rank-and-file Black Belts.
	setevent EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_1
	setevent EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_2
	setevent EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_3
	setevent EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_4
	opentext
	writetext KarateMasterIWillGiveYouAPokemonText
	waitbutton
	closetext
	end

.IWillGiveYouAPokemon:
	writetext KarateMasterIWillGiveYouAPokemonText
	waitbutton
	closetext
	end

.StayAndTrain:
	writetext KarateMasterStayAndTrainText
	waitbutton
	closetext
	end

TrainerFightingDojoBlackbelt1:
	trainer BLACKBELT_T, DAIGO, EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_1, FightingDojoBlackbelt1SeenText, FightingDojoBlackbelt1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext FightingDojoBlackbelt1AfterBattleText
	waitbutton
	closetext
	end

TrainerFightingDojoBlackbelt2:
	trainer BLACKBELT_T, RYU, EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_2, FightingDojoBlackbelt2SeenText, FightingDojoBlackbelt2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext FightingDojoBlackbelt2AfterBattleText
	waitbutton
	closetext
	end

TrainerFightingDojoBlackbelt3:
	trainer BLACKBELT_T, TAKESHI, EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_3, FightingDojoBlackbelt3SeenText, FightingDojoBlackbelt3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext FightingDojoBlackbelt3AfterBattleText
	waitbutton
	closetext
	end

TrainerFightingDojoBlackbelt4:
	trainer BLACKBELT_T, TETSU, EVENT_BEAT_FIGHTINGDOJO_BLACKBELT_4, FightingDojoBlackbelt4SeenText, FightingDojoBlackbelt4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext FightingDojoBlackbelt4AfterBattleText
	waitbutton
	closetext
	end

; Gen 1: the Karate Master's back room hides two gift Pokemon behind him; picking one hides that
; ball but leaves the other in place (it just refuses further gifts once you've already chosen).
FightingDojoHitmonleePokeBall:
	checkevent EVENT_BEAT_KARATE_MASTER
	iffalse .NotYet
	checkevent EVENT_GOT_HITMONLEE
	iftrue .AlreadyChose
	checkevent EVENT_GOT_HITMONCHAN
	iftrue .AlreadyChose
	opentext
	writetext HitmonleeOfferText
	yesorno
	iffalse .Declined
	disappear FIGHTINGDOJO_HITMONLEE_POKE_BALL
	setevent EVENT_GOT_HITMONLEE
	setevent EVENT_DEFEATED_FIGHTING_DOJO
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke HITMONLEE, 30
	closetext
	end
.Declined:
	closetext
	end
.AlreadyChose:
	opentext
	writetext BetterNotGetGreedyText
	waitbutton
	closetext
	end
.NotYet:
	end

FightingDojoHitmonchanPokeBall:
	checkevent EVENT_BEAT_KARATE_MASTER
	iffalse .NotYet
	checkevent EVENT_GOT_HITMONLEE
	iftrue .AlreadyChose
	checkevent EVENT_GOT_HITMONCHAN
	iftrue .AlreadyChose
	opentext
	writetext HitmonchanOfferText
	yesorno
	iffalse .Declined
	disappear FIGHTINGDOJO_HITMONCHAN_POKE_BALL
	setevent EVENT_GOT_HITMONCHAN
	setevent EVENT_DEFEATED_FIGHTING_DOJO
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke HITMONCHAN, 30
	closetext
	end
.Declined:
	closetext
	end
.AlreadyChose:
	opentext
	writetext BetterNotGetGreedyText
	waitbutton
	closetext
	end
.NotYet:
	end

KarateMasterIntroText:
	text "Grunt!"

	para "I am the KARATE"
	line "MASTER! I am the"
	cont "LEADER here!"

	para "You wish to"
	line "challenge us?"
	cont "Expect no mercy!"

	para "Fwaaa!"
	done

KarateMasterDefeatedText:
	text "Hwa!"
	line "Arrgh! Beaten!"
	done

KarateMasterIWillGiveYouAPokemonText:
	text "Indeed, I have"
	line "lost!"

	para "But I beseech you,"
	line "do not take our"
	cont "emblem as your"
	cont "trophy!"

	para "In return, I will"
	line "give you a prized"
	cont "fighting #MON!"

	para "Choose whichever"
	line "one you like!"
	done

KarateMasterStayAndTrainText:
	text "Ho!"

	para "Stay and train at"
	line "Karate with us!"
	done

FightingDojoBlackbelt1SeenText:
	text "Hoargh! Take your"
	line "shoes off!"
	done

FightingDojoBlackbelt1BeatenText:
	text "I give"
	line "up!"
	prompt

FightingDojoBlackbelt1AfterBattleText:
	text "You wait 'til you"
	line "see our Master!"

	para "I'm a small fry"
	line "compared to him!"
	done

FightingDojoBlackbelt2SeenText:
	text "I hear you're"
	line "good! Show me!"
	done

FightingDojoBlackbelt2BeatenText:
	text "Judge!"
	line "1 point!"
	prompt

FightingDojoBlackbelt2AfterBattleText:
	text "Our Master is a"
	line "pro fighter!"
	done

FightingDojoBlackbelt3SeenText:
	text "Nothing tough"
	line "frightens me!"

	para "I break boulders"
	line "for training!"
	done

FightingDojoBlackbelt3BeatenText:
	text "Yow!"
	line "Stubbed fingers!"
	prompt

FightingDojoBlackbelt3AfterBattleText:
	text "The only thing"
	line "that frightens us"
	cont "is psychic power!"
	done

FightingDojoBlackbelt4SeenText:
	text "Hoohah!"

	para "You're trespassing"
	line "in our FIGHTING"
	cont "DOJO!"
	done

FightingDojoBlackbelt4BeatenText:
	text "Oof!"
	line "I give up!"
	prompt

FightingDojoBlackbelt4AfterBattleText:
	text "The prime fighters"
	line "across the land"
	cont "train here."
	done

HitmonleeOfferText:
	text "You want the"
	line "hard kicking"
	cont "HITMONLEE?"
	done

HitmonchanOfferText:
	text "You want the"
	line "piston punching"
	cont "HITMONCHAN?"
	done

BetterNotGetGreedyText:
	text "Better not get"
	line "greedy…"
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FightingDojoKarateMasterScript, -1
	object_event  3,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerFightingDojoBlackbelt1, -1
	object_event  3,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerFightingDojoBlackbelt2, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerFightingDojoBlackbelt3, -1
	object_event  5,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerFightingDojoBlackbelt4, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoHitmonleePokeBall, -1
	object_event  5,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoHitmonchanPokeBall, -1
