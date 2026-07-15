	object_const_def
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4
	const ROUTE17_BIKER5
	const ROUTE17_BIKER6
	const ROUTE17_BIKER7
	const ROUTE17_BIKER8
	const ROUTE17_BIKER9
	const ROUTE17_BIKER10

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17AlwaysOnBikeCallback

Route17AlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

; Gen 1: Biker sprite, CUE_BALL class.
TrainerRoute17CueBall4:
	trainer CUE_BALL, CUE_BALL_4, EVENT_BEAT_ROUTE_17_TRAINER_0, Route17Biker1SeenText, Route17Biker1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17CueBall5:
	trainer CUE_BALL, CUE_BALL_5, EVENT_BEAT_ROUTE_17_TRAINER_1, Route17Biker2SeenText, Route17Biker2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17Biker3:
	trainer BIKER, RUSTY, EVENT_BEAT_ROUTE_17_TRAINER_2, Route17Biker3SeenText, Route17Biker3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17Biker4:
	trainer BIKER, FELIPE, EVENT_BEAT_ROUTE_17_TRAINER_3, Route17Biker4SeenText, Route17Biker4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker4AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17Biker5:
	trainer BIKER, NORRIS, EVENT_BEAT_ROUTE_17_TRAINER_4, Route17Biker5SeenText, Route17Biker5BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker5AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17CueBall6:
	trainer CUE_BALL, CUE_BALL_6, EVENT_BEAT_ROUTE_17_TRAINER_5, Route17Biker6SeenText, Route17Biker6BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker6AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17CueBall7:
	trainer CUE_BALL, CUE_BALL_7, EVENT_BEAT_ROUTE_17_TRAINER_6, Route17Biker7SeenText, Route17Biker7BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker7AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17CueBall8:
	trainer CUE_BALL, CUE_BALL_8, EVENT_BEAT_ROUTE_17_TRAINER_7, Route17Biker8SeenText, Route17Biker8BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker8AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17Biker9:
	trainer BIKER, WADE, EVENT_BEAT_ROUTE_17_TRAINER_8, Route17Biker9SeenText, Route17Biker9BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker9AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute17Biker10:
	trainer BIKER, EARL, EVENT_BEAT_ROUTE_17_TRAINER_9, Route17Biker10SeenText, Route17Biker10BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route17Biker10AfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

Route17NoticeSign1:
	jumptext Route17NoticeSign1Text

Route17TrainerTips1:
	jumptext Route17TrainerTips1Text

Route17TrainerTips2:
	jumptext Route17TrainerTips2Text

Route17Sign:
	jumptext Route17SignText

Route17NoticeSign2:
	jumptext Route17NoticeSign2Text

Route17CyclingRoadEndsSign:
	jumptext Route17CyclingRoadEndsSignText

Route17Biker1SeenText:
	text "There's no money"
	line "in fighting kids!"
	done

Route17Biker1BeatenText:
	text "Burned"
	line "out!"
	prompt

Route17Biker1AfterBattleText:
	text "Good stuff is"
	line "lying around on"
	cont "CYCLING ROAD!"
	done

Route17Biker2SeenText:
	text "What do you want,"
	line "kiddo?"
	done

Route17Biker2BeatenText:
	text "Whoo!"
	prompt

Route17Biker2AfterBattleText:
	text "I could belly-"
	line "bump you outta"
	cont "here!"
	done

Route17Biker3SeenText:
	text "You heading to"
	line "FUCHSIA?"
	done

Route17Biker3BeatenText:
	text "Crash and"
	line "burn!"
	prompt

Route17Biker3AfterBattleText:
	text "I love racing"
	line "downhill!"
	done

Route17Biker4SeenText:
	text "We're BIKERs!"
	line "Highway stars!"
	done

Route17Biker4BeatenText:
	text "Smoked!"
	prompt

Route17Biker4AfterBattleText:
	text "Are you looking"
	line "for adventure?"
	done

Route17Biker5SeenText:
	text "Let VOLTORB"
	line "electrify you!"
	done

Route17Biker5BeatenText:
	text "Grounded"
	line "out!"
	prompt

Route17Biker5AfterBattleText:
	text "I got my VOLTORB"
	line "at the abandoned"
	cont "POWER PLANT."
	done

Route17Biker6SeenText:
	text "My #MON won't"
	line "evolve! Why?"
	done

Route17Biker6BeatenText:
	text "Why,"
	line "you!"
	prompt

Route17Biker6AfterBattleText:
	text "Maybe some #MON"
	line "need element"
	cont "STONEs to evolve."
	done

Route17Biker7SeenText:
	text "I need a little"
	line "exercise!"
	done

Route17Biker7BeatenText:
	text "Whew!"
	line "Good workout!"
	prompt

Route17Biker7AfterBattleText:
	text "I'm sure I lost"
	line "weight there!"
	done

Route17Biker8SeenText:
	text "Be a rebel!"
	done

Route17Biker8BeatenText:
	text "Aaaargh!"
	prompt

Route17Biker8AfterBattleText:
	text "Be ready to fight"
	line "for your beliefs!"
	done

Route17Biker9SeenText:
	text "Nice BIKE!"
	line "How's it handle?"
	done

Route17Biker9BeatenText:
	text "Shoot!"
	prompt

Route17Biker9AfterBattleText:
	text "The slope makes"
	line "it hard to steer!"
	done

Route17Biker10SeenText:
	text "Get lost kid!"
	line "I'm bushed!"
	done

Route17Biker10BeatenText:
	text "Are you"
	line "satisfied?"
	prompt

Route17Biker10AfterBattleText:
	text "I need to catch"
	line "a few Zs!"
	done

Route17NoticeSign1Text:
	text "It's a notice!"

	para "Watch out for"
	line "discarded items!"
	done

Route17TrainerTips1Text:
	text "TRAINER TIPS"

	para "All #MON are"
	line "unique."

	para "Even #MON of"
	line "the same type and"
	cont "level grow at"
	cont "different rates."
	done

Route17TrainerTips2Text:
	text "TRAINER TIPS"

	para "Press the A or B"
	line "Button to stay in"
	cont "place while on a"
	cont "slope."
	done

Route17SignText:
	text "ROUTE 17"
	line "CELADON CITY -"
	cont "FUCHSIA CITY"
	done

Route17NoticeSign2Text:
	text "It's a notice!"

	para "Don't throw the"
	line "game, throw #"
	cont "BALLs instead!"
	done

Route17CyclingRoadEndsSignText:
	text "CYCLING ROAD"
	line "Slope ends here!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; No warps here in Gen 1 (issue #44): Route17Route18Gate was a GSC-era bogus
	; Route17/Route18-border crossing; repurposed as Route18's own mid-route gate.
	; Route17<->Route18 connects via the normal map connection only.

	def_coord_events

	def_bg_events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer
	bg_event  9, 51, BGEVENT_READ, Route17NoticeSign1
	bg_event  9, 63, BGEVENT_READ, Route17TrainerTips1
	bg_event  9, 75, BGEVENT_READ, Route17TrainerTips2
	bg_event  9, 87, BGEVENT_READ, Route17Sign
	bg_event  9, 111, BGEVENT_READ, Route17NoticeSign2
	bg_event  9, 141, BGEVENT_READ, Route17CyclingRoadEndsSign

	def_object_events
	object_event 12, 19, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17CueBall4, -1
	object_event 11, 16, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17CueBall5, -1
	object_event  4, 18, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17Biker3, -1
	object_event  7, 32, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17Biker4, -1
	object_event 14, 34, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17Biker5, -1
	object_event 17, 58, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17CueBall6, -1
	object_event  2, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17CueBall7, -1
	object_event 14, 98, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17CueBall8, -1
	object_event  5, 98, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17Biker9, -1
	object_event 10, 118, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerRoute17Biker10, -1
