	object_const_def
	const SSANNEB1FROOMS_SAILOR1
	const SSANNEB1FROOMS_SAILOR2
	const SSANNEB1FROOMS_SAILOR3
	const SSANNEB1FROOMS_SAILOR4
	const SSANNEB1FROOMS_SAILOR5
	const SSANNEB1FROOMS_FISHER
	const SSANNEB1FROOMS_SUPER_NERD
	const SSANNEB1FROOMS_MACHOKE
	const SSANNEB1FROOMS_ETHER
	const SSANNEB1FROOMS_TM_REST
	const SSANNEB1FROOMS_MAX_POTION

SSAnneB1FRooms_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSailorBart:
	trainer SAILOR, BART, EVENT_BEAT_SAILOR_SSANNEB1_1, SSAnneB1FRoomsSailor1BattleText, SSAnneB1FRoomsSailor1EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneB1FRoomsSailor1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorFlint:
	trainer SAILOR, FLINT, EVENT_BEAT_SAILOR_SSANNEB1_2, SSAnneB1FRoomsSailor2BattleText, SSAnneB1FRoomsSailor2EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneB1FRoomsSailor2AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorReuben:
	trainer SAILOR, REUBEN, EVENT_BEAT_SAILOR_SSANNEB1_3, SSAnneB1FRoomsSailor3BattleText, SSAnneB1FRoomsSailor3EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneB1FRoomsSailor3AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGunnar:
	trainer SAILOR, GUNNAR, EVENT_BEAT_SAILOR_SSANNEB1_4, SSAnneB1FRoomsSailor4BattleText, SSAnneB1FRoomsSailor4EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneB1FRoomsSailor4AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorRufus:
	trainer SAILOR, RUFUS, EVENT_BEAT_SAILOR_SSANNEB1_5, SSAnneB1FRoomsSailor5BattleText, SSAnneB1FRoomsSailor5EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneB1FRoomsSailor5AfterBattleText
	waitbutton
	closetext
	end

TrainerFisherOrville:
	trainer FISHER, ORVILLE, EVENT_BEAT_FISHER_SSANNEB1, SSAnneB1FRoomsFisherBattleText, SSAnneB1FRoomsFisherEndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneB1FRoomsFisherAfterBattleText
	waitbutton
	closetext
	end

SSAnneB1FRoomsSuperNerdScript:
	jumptextfaceplayer SSAnneB1FRoomsSuperNerdText

SSAnneB1FRoomsMachokeScript:
	jumptextfaceplayer SSAnneB1FRoomsMachokeText

SSAnneB1FRoomsEtherScript:
	itemball ETHER

SSAnneB1FRoomsTmRestScript:
	itemball TM_REST

SSAnneB1FRoomsMaxPotionScript:
	itemball MAX_POTION

SSAnneB1FRoomsSailor1BattleText:
	text "You know what they"
	line "say about sailors"
	cont "and fighting!"
	done

SSAnneB1FRoomsSailor1EndBattleText:
	text "Right!"
	line "Good fight, mate!"
	done

SSAnneB1FRoomsSailor1AfterBattleText:
	text "Haha! Want to be"
	line "a sailor, mate?"
	done

SSAnneB1FRoomsSailor2BattleText:
	text "My sailor's pride"
	line "is at stake!"
	done

SSAnneB1FRoomsSailor2EndBattleText:
	text "Your"
	line "spirit sank me!"
	done

SSAnneB1FRoomsSailor2AfterBattleText:
	text "Did you see the"
	line "FISHING GURU in"
	cont "VERMILION CITY?"
	done

SSAnneB1FRoomsSailor3BattleText:
	text "Us sailors have"
	line "#MON too!"
	done

SSAnneB1FRoomsSailor3EndBattleText:
	text "OK, "
	line "you're not bad."
	done

SSAnneB1FRoomsSailor3AfterBattleText:
	text "We caught all our"
	line "#MON while"
	cont "out at sea!"
	done

SSAnneB1FRoomsSailor4BattleText:
	text "I like feisty"
	line "kids like you!"
	done

SSAnneB1FRoomsSailor4EndBattleText:
	text "Argh!"
	line "Lost it!"
	done

SSAnneB1FRoomsSailor4AfterBattleText:
	text "Sea #MON live"
	line "in deep water."
	cont "You'll need a ROD!"
	done

SSAnneB1FRoomsSailor5BattleText:
	text "Matey, you're"
	line "walking the plank"
	cont "if you lose!"
	done

SSAnneB1FRoomsSailor5EndBattleText:
	text "Argh!"
	line "Beaten by a kid!"
	done

SSAnneB1FRoomsSailor5AfterBattleText:
	text "Jellyfish some-"
	line "times drift into"
	cont "the ship."
	done

SSAnneB1FRoomsFisherBattleText:
	text "Hello stranger!"
	line "Stop and chat!"

	para "All my #MON"
	line "are from the sea!"
	done

SSAnneB1FRoomsFisherEndBattleText:
	text "Darn!"
	line "I let that one"
	cont "get away!"
	done

SSAnneB1FRoomsFisherAfterBattleText:
	text "I was going to"
	line "make you my"
	cont "assistant too!"
	done

SSAnneB1FRoomsSuperNerdText:
	text "My buddy, MACHOKE,"
	line "is super strong!"

	para "He has enough"
	line "STRENGTH to move"
	cont "big rocks!"
	done

SSAnneB1FRoomsMachokeText:
	text "MACHOKE: Gwoh!"
	line "Goggoh!"
	done

SSAnneB1FRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, SS_ANNE_B1F, 5
	warp_event  3,  5, SS_ANNE_B1F, 5
	warp_event 12,  5, SS_ANNE_B1F, 4
	warp_event 13,  5, SS_ANNE_B1F, 4
	warp_event 22,  5, SS_ANNE_B1F, 3
	warp_event 23,  5, SS_ANNE_B1F, 3
	warp_event  2, 15, SS_ANNE_B1F, 2
	warp_event  3, 15, SS_ANNE_B1F, 2
	warp_event 12, 15, SS_ANNE_B1F, 1
	warp_event 13, 15, SS_ANNE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorBart, -1
	object_event  2, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorFlint, -1
	object_event 12,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorReuben, -1
	object_event 22,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorGunnar, -1
	object_event  0,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorRufus, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerFisherOrville, -1
	object_event 10, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsSuperNerdScript, -1
	object_event 11, 12, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsMachokeScript, -1
	object_event 20,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnneB1FRoomsEtherScript, -1
	object_event 10,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnneB1FRoomsTmRestScript, -1
	object_event 12, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnneB1FRoomsMaxPotionScript, -1
