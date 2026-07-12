	object_const_def
	const ROUTE16_BIKER1
	const ROUTE16_BIKER2
	const ROUTE16_BIKER3
	const ROUTE16_BIKER4
	const ROUTE16_BIKER5
	const ROUTE16_BIKER6
	const ROUTE16_SNORLAX

Route16_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route16AlwaysOnBikeCallback

Route16AlwaysOnBikeCallback:
	readvar VAR_YCOORD
	ifless 5, .CanWalk
	readvar VAR_XCOORD
	ifgreater 13, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	endcallback

; Gen 1: sleeping SNORLAX blocks the path; same pattern as Route 12/VermilionCity.
Route16Snorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext Route16SnorlaxText
	waitbutton
	closetext
	end

.Awake:
	writetext Route16SnorlaxWokeUpText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 30
	startbattle
	disappear ROUTE16_SNORLAX
	setevent EVENT_ROUTE_16_SNORLAX
	reloadmapafterbattle
	end

TrainerRoute16Biker1:
	trainer BIKER, DALTON, EVENT_BEAT_ROUTE_16_TRAINER_0, Route16Biker1SeenText, Route16Biker1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route16Biker1AfterBattleText
	waitbutton
	closetext
	end

; Gen 1: Biker sprite, CUE_BALL class.
TrainerRoute16CueBall1:
	trainer CUE_BALL, CUE_BALL_1, EVENT_BEAT_ROUTE_16_TRAINER_1, Route16Biker2SeenText, Route16Biker2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route16Biker2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute16CueBall2:
	trainer CUE_BALL, CUE_BALL_2, EVENT_BEAT_ROUTE_16_TRAINER_2, Route16Biker3SeenText, Route16Biker3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route16Biker3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute16Biker4:
	trainer BIKER, IGOR, EVENT_BEAT_ROUTE_16_TRAINER_3, Route16Biker4SeenText, Route16Biker4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route16Biker4AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute16CueBall3:
	trainer CUE_BALL, CUE_BALL_3, EVENT_BEAT_ROUTE_16_TRAINER_4, Route16Biker5SeenText, Route16Biker5BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route16Biker5AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute16Biker6:
	trainer BIKER, OMAR, EVENT_BEAT_ROUTE_16_TRAINER_5, Route16Biker6SeenText, Route16Biker6BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route16Biker6AfterBattleText
	waitbutton
	closetext
	end

CyclingRoadSign:
	jumptext CyclingRoadSignText

Route16Sign:
	jumptext Route16SignText

Route16SnorlaxText:
	text "A sleeping #MON"
	line "blocks the way!"
	done

Route16SnorlaxWokeUpText:
	text "SNORLAX woke up!"

	para "It attacked in a"
	line "grumpy rage!"
	done

Route16Biker1SeenText:
	text "What do you want?"
	done

Route16Biker1BeatenText:
	text "Don't you"
	line "dare laugh!"
	prompt

Route16Biker1AfterBattleText:
	text "We like just"
	line "hanging here,"
	cont "what's it to you?"
	done

Route16Biker2SeenText:
	text "Nice BIKE!"
	line "Hand it over!"
	done

Route16Biker2BeatenText:
	text "Knock"
	line "out!"
	prompt

Route16Biker2AfterBattleText:
	text "Forget it, who"
	line "needs your BIKE!"
	done

Route16Biker3SeenText:
	text "Come out and play,"
	line "little mouse!"
	done

Route16Biker3BeatenText:
	text "You"
	line "little rat!"
	prompt

Route16Biker3AfterBattleText:
	text "I hate losing!"
	line "Get away from me!"
	done

Route16Biker4SeenText:
	text "Hey, you just"
	line "bumped me!"
	done

Route16Biker4BeatenText:
	text "Kaboom!"
	prompt

Route16Biker4AfterBattleText:
	text "You can also get"
	line "to FUCHSIA from"
	cont "VERMILION using a"
	cont "coastal road."
	done

Route16Biker5SeenText:
	text "I'm feeling"
	line "hungry and mean!"
	done

Route16Biker5BeatenText:
	text "Bad,"
	line "bad, bad!"
	prompt

Route16Biker5AfterBattleText:
	text "I like my #MON"
	line "ferocious! They"
	cont "tear up enemies!"
	done

Route16Biker6SeenText:
	text "Sure, I'll go!"
	done

Route16Biker6BeatenText:
	text "Don't make"
	line "me mad!"
	prompt

Route16Biker6AfterBattleText:
	text "I like harassing"
	line "people with my"
	cont "vicious #MON!"
	done

CyclingRoadSignText:
	text "Enjoy the slope!"
	line "CYCLING ROAD"
	done

Route16SignText:
	text "ROUTE 16"
	line "CELADON CITY -"
	cont "FUCHSIA CITY"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 24, 10, ROUTE_16_GATE, 3
	warp_event 24, 11, ROUTE_16_GATE, 4
	warp_event 17, 10, ROUTE_16_GATE, 1
	warp_event 17, 11, ROUTE_16_GATE, 2
	warp_event 24,  4, ROUTE_16_GATE, 3
	warp_event 24,  5, ROUTE_16_GATE, 4
	warp_event 17,  4, ROUTE_16_GATE, 1
	warp_event 17,  5, ROUTE_16_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 27, 11, BGEVENT_READ, CyclingRoadSign
	bg_event  5, 17, BGEVENT_READ, Route16Sign

	def_object_events
	object_event 17, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute16Biker1, -1
	object_event 14, 13, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute16CueBall1, -1
	object_event 11, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute16CueBall2, -1
	object_event  9, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute16Biker4, -1
	object_event  6, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute16CueBall3, -1
	object_event  3, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute16Biker6, -1
	object_event 26, 10, SPRITE_SNORLAX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route16Snorlax, EVENT_ROUTE_16_SNORLAX
