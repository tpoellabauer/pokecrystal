	object_const_def
	const ROUTE21_FISHER1
	const ROUTE21_FISHER2
	const ROUTE21_SWIMMER1
	const ROUTE21_SWIMMER2
	const ROUTE21_SWIMMER3
	const ROUTE21_SWIMMER4
	const ROUTE21_SWIMMER5
	const ROUTE21_FISHER3
	const ROUTE21_FISHER4

Route21_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherDelbert:
	trainer FISHER, DELBERT, EVENT_BEAT_ROUTE_21_TRAINER_0, FisherDelbertSeenText, FisherDelbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherDelbertAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherGarry:
	trainer FISHER, GARRY, EVENT_BEAT_ROUTE_21_TRAINER_1, FisherGarrySeenText, FisherGarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherGarryAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerHollis:
	trainer SWIMMERM, HOLLIS, EVENT_BEAT_ROUTE_21_TRAINER_2, SwimmerHollisSeenText, SwimmerHollisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerHollisAfterBattleText
	waitbutton
	closetext
	end

TrainerCueBallRoute21:
	trainer CUE_BALL, CUE_BALL_9, EVENT_BEAT_ROUTE_21_TRAINER_3, CueBallRoute21SeenText, CueBallRoute21BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CueBallRoute21AfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerRudy:
	trainer SWIMMERM, RUDY2, EVENT_BEAT_ROUTE_21_TRAINER_4, SwimmerRudySeenText, SwimmerRudyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerRudyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerStanton:
	trainer SWIMMERM, STANTON, EVENT_BEAT_ROUTE_21_TRAINER_5, SwimmerStantonSeenText, SwimmerStantonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerStantonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerDuane:
	trainer SWIMMERM, DUANE2, EVENT_BEAT_ROUTE_21_TRAINER_6, SwimmerDuaneSeenText, SwimmerDuaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerDuaneAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMoses:
	trainer FISHER, MOSES, EVENT_BEAT_ROUTE_21_TRAINER_7, FisherMosesSeenText, FisherMosesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMosesAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherAlvin:
	trainer FISHER, ALVIN, EVENT_BEAT_ROUTE_21_TRAINER_8, FisherAlvinSeenText, FisherAlvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAlvinAfterBattleText
	waitbutton
	closetext
	end

FisherDelbertSeenText:
	text "You want to know"
	line "if the fish are"
	cont "biting?"
	done

FisherDelbertBeatenText:
	text "Dang!"
	done

FisherDelbertAfterBattleText:
	text "I can't catch"
	line "anything good!"
	done

FisherGarrySeenText:
	text "I got a big haul!"
	line "Wanna go for it?"
	done

FisherGarryBeatenText:
	text "Darn MAGIKARP!"
	done

FisherGarryAfterBattleText:
	text "I seem to only"
	line "catch MAGIKARP!"
	done

SwimmerHollisSeenText:
	text "The sea cleanses"
	line "my body and soul!"
	done

SwimmerHollisBeatenText:
	text "Ayah!"
	done

SwimmerHollisAfterBattleText:
	text "I like the"
	line "mountains too!"
	done

CueBallRoute21SeenText:
	text "What's wrong with"
	line "me swimming?"
	done

CueBallRoute21BeatenText:
	text "Cheap shot!"
	done

CueBallRoute21AfterBattleText:
	text "I look like what?"
	line "A studded inner"
	cont "tube? Get lost!"
	done

SwimmerRudySeenText:
	text "I caught all my"
	line "#MON at sea!"
	done

SwimmerRudyBeatenText:
	text "Diver!! Down!!"
	done

SwimmerRudyAfterBattleText:
	text "Where'd you catch"
	line "your #MON?"
	done

SwimmerStantonSeenText:
	text "Right now, I'm in"
	line "a triathlon meet!"
	done

SwimmerStantonBeatenText:
	text "Pant...pant..."
	line "pant..."
	done

SwimmerStantonAfterBattleText:
	text "I'm beat!"
	line "But, I still have"
	cont "the bike race and"
	cont "marathon left!"
	done

SwimmerDuaneSeenText:
	text "Ahh! Feel the sun"
	line "and the wind!"
	done

SwimmerDuaneBeatenText:
	text "Yow! I lost!"
	done

SwimmerDuaneAfterBattleText:
	text "I'm sunburnt to a"
	line "crisp!"
	done

FisherMosesSeenText:
	text "Hey, don't scare"
	line "away the fish!"
	done

FisherMosesBeatenText:
	text "Sorry! I didn't"
	line "mean it!"
	done

FisherMosesAfterBattleText:
	text "I was just angry"
	line "that I couldn't"
	cont "catch anything."
	done

FisherAlvinSeenText:
	text "Keep me company"
	line "'til I get a hit!"
	done

FisherAlvinBeatenText:
	text "That burned some"
	line "time."
	done

FisherAlvinAfterBattleText:
	text "Oh wait! I got a"
	line "bite! Yeah!"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 24, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 7, TrainerFisherDelbert, -1
	object_event  6, 25, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 9, TrainerFisherGarry, -1
	object_event 10, 31, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 12, TrainerSwimmerHollis, -1
	object_event 12, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerCueBallRoute21, -1
	object_event 16, 63, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 13, TrainerSwimmerRudy, -1
	object_event  5, 71, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 14, TrainerSwimmerStanton, -1
	object_event 15, 71, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 15, TrainerSwimmerDuane, -1
	object_event 14, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 8, TrainerFisherMoses, -1
	object_event 17, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 10, TrainerFisherAlvin, -1
