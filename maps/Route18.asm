	object_const_def
	const ROUTE18_COOLTRAINER_M1
	const ROUTE18_COOLTRAINER_M2
	const ROUTE18_COOLTRAINER_M3

Route18_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: all three are CoolTrainerM sprite, BIRD_KEEPER class.
TrainerRoute18CoolTrainerM1:
	trainer BIRD_KEEPER, TATE, EVENT_BEAT_ROUTE_18_TRAINER_0, Route18CoolTrainerM1SeenText, Route18CoolTrainerM1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route18CoolTrainerM1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute18CoolTrainerM2:
	trainer BIRD_KEEPER, NOLAN, EVENT_BEAT_ROUTE_18_TRAINER_1, Route18CoolTrainerM2SeenText, Route18CoolTrainerM2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route18CoolTrainerM2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute18CoolTrainerM3:
	trainer BIRD_KEEPER, CASEY1, EVENT_BEAT_ROUTE_18_TRAINER_2, Route18CoolTrainerM3SeenText, Route18CoolTrainerM3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route18CoolTrainerM3AfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

Route18CyclingRoadSign:
	jumptext Route18CyclingRoadSignText

Route18CoolTrainerM1SeenText:
	text "I always check"
	line "every grassy area"
	cont "for new #MON."
	done

Route18CoolTrainerM1BeatenText:
	text "Tch!"
	prompt

Route18CoolTrainerM1AfterBattleText:
	text "I wish I had a"
	line "BIKE!"
	done

Route18CoolTrainerM2SeenText:
	text "Kurukkoo!"
	line "How do you like"
	cont "my bird call?"
	done

Route18CoolTrainerM2BeatenText:
	text "I"
	line "had to bug you!"
	prompt

Route18CoolTrainerM2AfterBattleText:
	text "I also collect sea"
	line "#MON on"
	cont "weekends!"
	done

Route18CoolTrainerM3SeenText:
	text "This is my turf!"
	line "Get out of here!"
	done

Route18CoolTrainerM3BeatenText:
	text "Darn!"
	prompt

Route18CoolTrainerM3AfterBattleText:
	text "This is my fave"
	line "#MON hunting"
	cont "area!"
	done

Route18SignText:
	text "ROUTE 18"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route18CyclingRoadSignText:
	text "CYCLING ROAD"
	line "No pedestrians"
	cont "permitted!"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; Gen 1 geometry (issue #44): the Cycling Road gate sits mid-route (west/east
	; doors), not on the Route17 border -- Route17<->Route18 already has a normal
	; map connection (data/maps/attributes.asm); Route17Route18Gate is repurposed
	; as this map's own west/east pass-through (see Route17Route18Gate.asm).
	warp_event 33,  8, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 33,  9, ROUTE_17_ROUTE_18_GATE, 2
	warp_event 40,  8, ROUTE_17_ROUTE_18_GATE, 3
	warp_event 40,  9, ROUTE_17_ROUTE_18_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 43,  7, BGEVENT_READ, Route18Sign
	bg_event 33,  5, BGEVENT_READ, Route18CyclingRoadSign

	def_object_events
	object_event 36, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute18CoolTrainerM1, -1
	object_event 40, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute18CoolTrainerM2, -1
	object_event 42, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute18CoolTrainerM3, -1
