	object_const_def
	const ROUTE20_SWIMMER1
	const ROUTE20_SWIMMER2
	const ROUTE20_SWIMMER3
	const ROUTE20_SWIMMER4
	const ROUTE20_SWIMMER5
	const ROUTE20_SWIMMER6
	const ROUTE20_COOLTRAINER_M
	const ROUTE20_SWIMMER7
	const ROUTE20_SWIMMER8
	const ROUTE20_SWIMMER9

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route20ClearRocksCallback

Route20ClearRocksCallback:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

TrainerSwimmerRafael:
	trainer SWIMMERM, RAFAEL, EVENT_BEAT_ROUTE_20_TRAINER_0, SwimmerRafaelSeenText, SwimmerRafaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerRafaelAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyShari:
	trainer BEAUTY, SHARI, EVENT_BEAT_ROUTE_20_TRAINER_1, BeautyShariSeenText, BeautyShariBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyShariAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyGloria:
	trainer BEAUTY, GLORIA, EVENT_BEAT_ROUTE_20_TRAINER_2, BeautyGloriaSeenText, BeautyGloriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyGloriaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerRoute20a:
	trainer JR_TRAINER_F, JR_TRAINER_F_13, EVENT_BEAT_ROUTE_20_TRAINER_3, SwimmerRoute20aSeenText, SwimmerRoute20aBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerRoute20aAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerDustin:
	trainer SWIMMERM, DUSTIN, EVENT_BEAT_ROUTE_20_TRAINER_4, SwimmerDustinSeenText, SwimmerDustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerDustinAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerMarcus:
	trainer SWIMMERM, MARCUS, EVENT_BEAT_ROUTE_20_TRAINER_5, SwimmerMarcusSeenText, SwimmerMarcusBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerMarcusAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermRoute20:
	trainer BIRD_KEEPER, EMMETT, EVENT_BEAT_ROUTE_20_TRAINER_6, CooltrainermRoute20SeenText, CooltrainermRoute20BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRoute20AfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyRobin:
	trainer BEAUTY, ROBIN, EVENT_BEAT_ROUTE_20_TRAINER_7, BeautyRobinSeenText, BeautyRobinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyRobinAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerRoute20b:
	trainer JR_TRAINER_F, JR_TRAINER_F_14, EVENT_BEAT_ROUTE_20_TRAINER_8, SwimmerRoute20bSeenText, SwimmerRoute20bBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerRoute20bAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyDelia:
	trainer BEAUTY, DELIA2, EVENT_BEAT_ROUTE_20_TRAINER_9, BeautyDeliaSeenText, BeautyDeliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyDeliaAfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerRafaelSeenText:
	text "The water is"
	line "shallow here."
	done

SwimmerRafaelBeatenText:
	text "Splash!"
	done

SwimmerRafaelAfterBattleText:
	text "I wish I could"
	line "ride my #MON."
	done

BeautyShariSeenText:
	text "SEAFOAM is a"
	line "quiet getaway!"
	done

BeautyShariBeatenText:
	text "Quit it!"
	done

BeautyShariAfterBattleText:
	text "There's a huge"
	line "cavern underneath"
	cont "this island."
	done

BeautyGloriaSeenText:
	text "I love floating"
	line "with the fishes!"
	done

BeautyGloriaBeatenText:
	text "Yowch!"
	done

BeautyGloriaAfterBattleText:
	text "Want to float"
	line "with me?"
	done

SwimmerRoute20aSeenText:
	text "Are you on"
	line "vacation too?"
	done

SwimmerRoute20aBeatenText:
	text "No mercy at all!"
	done

SwimmerRoute20aAfterBattleText:
	text "SEAFOAM used to"
	line "be one island!"
	done

SwimmerDustinSeenText:
	text "Check out my buff"
	line "physique!"
	done

SwimmerDustinBeatenText:
	text "Wimpy!"
	done

SwimmerDustinAfterBattleText:
	text "I should've been"
	line "buffing up my"
	cont "#MON, not me!"
	done

SwimmerMarcusSeenText:
	text "Why are you"
	line "riding a #MON?"
	cont "Can't you swim?"
	done

SwimmerMarcusBeatenText:
	text "Ouch! Torpedoed!"
	done

SwimmerMarcusAfterBattleText:
	text "Riding a #MON"
	line "sure looks fun!"
	done

CooltrainermRoute20SeenText:
	text "I rode my bird"
	line "#MON here!"
	done

CooltrainermRoute20BeatenText:
	text "Oh no!"
	done

CooltrainermRoute20AfterBattleText:
	text "My birds can't"
	line "FLY me back!"
	done

BeautyRobinSeenText:
	text "My boy friend gave"
	line "me big pearls!"
	done

BeautyRobinBeatenText:
	text "Don't touch my"
	line "pearls!"
	done

BeautyRobinAfterBattleText:
	text "Will my pearls"
	line "grow bigger"
	cont "inside CLOYSTER?"
	done

SwimmerRoute20bSeenText:
	text "I swam here from"
	line "CINNABAR ISLAND!"
	done

SwimmerRoute20bBeatenText:
	text "I'm so"
	line "disappointed!"
	done

SwimmerRoute20bAfterBattleText:
	text "#MON have"
	line "taken over an"
	cont "abandoned mansion"
	cont "on CINNABAR!"
	done

BeautyDeliaSeenText:
	text "CINNABAR, in the"
	line "west, has a LAB"
	cont "for #MON."
	done

BeautyDeliaBeatenText:
	text "Wait!"
	done

BeautyDeliaAfterBattleText:
	text "CINNABAR is a"
	line "volcanic island!"
	done

CinnabarGymSignText:
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 38,  7, SEAFOAM_GYM, 1

	def_coord_events

	def_bg_events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	def_object_events
	object_event 49,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerSwimmerRafael, -1
	object_event 44, 11, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 15, TrainerBeautyShari, -1
	object_event 40,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 6, TrainerBeautyGloria, -1
	object_event 46, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 16, TrainerSwimmerRoute20a, -1
	object_event 34, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 10, TrainerSwimmerDustin, -1
	object_event 20,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 11, TrainerSwimmerMarcus, -1
	object_event 30,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 11, TrainerCooltrainermRoute20, -1
	object_event 22,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 7, TrainerBeautyRobin, -1
	object_event 15, 12, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 24, TrainerSwimmerRoute20b, -1
	object_event 10,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 8, TrainerBeautyDelia, -1
