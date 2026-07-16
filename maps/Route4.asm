	object_const_def
	const ROUTE4_COOLTRAINER_F
	const ROUTE4_LASS
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

Route4CooltrainerFScript:
	faceplayer
	opentext
	writetext Route4CooltrainerFText
	waitbutton
	closetext
	end

TrainerLassTammy:
	trainer LASS, TAMMY, EVENT_BEAT_ROUTE_4_TRAINER_0, LassTammySeenText, LassTammyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassTammyAfterBattleText
	waitbutton
	closetext
	end

Route4PokecenterSign:
	jumptext Route4PokecenterSignText

Route4MtMoonSign:
	jumptext Route4MtMoonSignText

Route4Sign:
	jumptext Route4SignText

; Gen 1 has TM32 Whirlwind here; Gen 2 has no Whirlwind TM, so the port gives its
; direct functional equivalent, TM05 Roar (same force-switch effect).
Route4TMWhirlwind:
	itemball TM_ROAR

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

Route4CooltrainerFText:
	text "Ouch! I tripped"
	line "over a rocky"
	cont "#MON, GEODUDE!"
	done

LassTammySeenText:
	text "I came to get my"
	line "mushroom #MON!"
	done

LassTammyBeatenText:
	text "Oh! My cute"
	line "mushroom #MON!"
	done

LassTammyAfterBattleText:
	text "There might not"
	line "be any more"
	cont "mushrooms here."

	para "I think I got"
	line "them all."
	done

Route4PokecenterSignText:
	text "Heal Your #MON!"
	line "#MON CENTER"
	done

Route4MtMoonSignText:
	text "MT.MOON"
	line "Tunnel Entrance"
	done

Route4SignText:
	text "ROUTE 4"

	para "MT.MOON -"
	line "CERULEAN CITY"
	done

Route4HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_4_HIDDEN_GREAT_BALL

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event 12,  5, BGEVENT_READ, Route4PokecenterSign
	bg_event 17,  7, BGEVENT_READ, Route4MtMoonSign
	bg_event 27,  7, BGEVENT_READ, Route4Sign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall
	bg_event 40,  3, BGEVENT_ITEM, Route4HiddenGreatBall

	def_object_events
	object_event  9,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route4CooltrainerFScript, -1
	object_event 63,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerLassTammy, -1
	object_event 57,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4TMWhirlwind, EVENT_ROUTE_4_TM_WHIRLWIND
