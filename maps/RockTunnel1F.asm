	object_const_def
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2
	const ROCKTUNNEL1F_HIKER1
	const ROCKTUNNEL1F_HIKER2
	const ROCKTUNNEL1F_HIKER3
	const ROCKTUNNEL1F_CUBONE_HERMIT
	const ROCKTUNNEL1F_JR_TRAINER_F1
	const ROCKTUNNEL1F_JR_TRAINER_F2
	const ROCKTUNNEL1F_JR_TRAINER_F3

RockTunnel1F_MapScripts:
	def_scene_scripts

	def_callbacks

RockTunnel1FElixer:
	itemball ELIXER

RockTunnel1FTMSteelWing:
	itemball TM_STEEL_WING

RockTunnel1FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY

RockTunnel1FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND

TrainerHikerRocktunnel1:
	trainer HIKER, HIKER_ROCKTUNNEL1, EVENT_BEAT_ROCK_TUNNEL_1F_TRAINER_0, HikerRocktunnel1SeenText, HikerRocktunnel1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRocktunnel1AfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRocktunnel2:
	trainer HIKER, HIKER_ROCKTUNNEL2, EVENT_BEAT_ROCK_TUNNEL_1F_TRAINER_1, HikerRocktunnel2SeenText, HikerRocktunnel2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRocktunnel2AfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRocktunnel3:
	trainer HIKER, HIKER_ROCKTUNNEL3, EVENT_BEAT_ROCK_TUNNEL_1F_TRAINER_2, HikerRocktunnel3SeenText, HikerRocktunnel3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRocktunnel3AfterBattleText
	waitbutton
	closetext
	end

; Gen 1 sprite is SUPER_NERD, but the real battle data (OPP_POKEMANIAC) is POKEMANIAC class.
TrainerCuboneHermit:
	trainer POKEMANIAC, CUBONE_HERMIT, EVENT_BEAT_ROCK_TUNNEL_1F_TRAINER_3, CuboneHermitSeenText, CuboneHermitBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CuboneHermitAfterBattleText
	waitbutton
	closetext
	end

; Gen 1 sprite is COOLTRAINER_F, but the real battle data (OPP_JR_TRAINER_F) is JR_TRAINER_F class.
TrainerJrTrainerFRocktunnel1:
	trainer JR_TRAINER_F, JR_TRAINER_F_15, EVENT_BEAT_ROCK_TUNNEL_1F_TRAINER_4, JrTrainerFRocktunnel1SeenText, JrTrainerFRocktunnel1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JrTrainerFRocktunnel1AfterBattleText
	waitbutton
	closetext
	end

TrainerJrTrainerFRocktunnel2:
	trainer JR_TRAINER_F, JR_TRAINER_F_16, EVENT_BEAT_ROCK_TUNNEL_1F_TRAINER_5, JrTrainerFRocktunnel2SeenText, JrTrainerFRocktunnel2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JrTrainerFRocktunnel2AfterBattleText
	waitbutton
	closetext
	end

TrainerJrTrainerFRocktunnel3:
	trainer JR_TRAINER_F, JR_TRAINER_F_17, EVENT_BEAT_ROCK_TUNNEL_1F_TRAINER_6, JrTrainerFRocktunnel3SeenText, JrTrainerFRocktunnel3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JrTrainerFRocktunnel3AfterBattleText
	waitbutton
	closetext
	end

RockTunnel1FSign:
	jumptext RockTunnel1FSignText

HikerRocktunnel1SeenText:
	text "This tunnel goes"
	line "a long way, kid!"
	done

HikerRocktunnel1BeatenText:
	text "Doh! You win!"
	done

HikerRocktunnel1AfterBattleText:
	text "Watch for ONIX!"
	line "It can put the"
	cont "squeeze on you!"
	done

HikerRocktunnel2SeenText:
	text "Hmm. Maybe I'm"
	line "lost in here..."
	done

HikerRocktunnel2BeatenText:
	text "Ease up! What am"
	line "I doing? Which"
	cont "way is out?"
	done

HikerRocktunnel2AfterBattleText:
	text "That sleeping"
	line "#MON on ROUTE"
	cont "12 forced me to"
	cont "take this detour."
	done

HikerRocktunnel3SeenText:
	text "Outsiders like"
	line "you need to show"
	cont "me some respect!"
	done

HikerRocktunnel3BeatenText:
	text "I give!"
	done

HikerRocktunnel3AfterBattleText:
	text "You're talented"
	line "enough to hike!"
	done

CuboneHermitSeenText:
	text "#MON fight!"
	line "Ready, go!"
	done

CuboneHermitBeatenText:
	text "Game over!"
	done

CuboneHermitAfterBattleText:
	text "Oh well, I'll get"
	line "a ZUBAT as I go!"
	done

JrTrainerFRocktunnel1SeenText:
	text "Eek! Don't try"
	line "anything funny in"
	cont "the dark!"
	done

JrTrainerFRocktunnel1BeatenText:
	text "It was too dark!"
	done

JrTrainerFRocktunnel1AfterBattleText:
	text "I saw a MACHOP"
	line "in this tunnel!"
	done

JrTrainerFRocktunnel2SeenText:
	text "I came this far"
	line "for #MON!"
	done

JrTrainerFRocktunnel2BeatenText:
	text "I'm out of #MON!"
	done

JrTrainerFRocktunnel2AfterBattleText:
	text "You looked cute"
	line "and harmless!"
	done

JrTrainerFRocktunnel3SeenText:
	text "You have #MON!"
	line "Let's start!"
	done

JrTrainerFRocktunnel3BeatenText:
	text "You play hard!"
	done

JrTrainerFRocktunnel3AfterBattleText:
	text "Whew! I'm all"
	line "sweaty now!"
	done

RockTunnel1FSignText:
	text "ROCK TUNNEL"
	line "CERULEAN CITY -"
	cont "LAVENDER TOWN"
	done

RockTunnel1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  3, ROUTE_9, 1
	warp_event 11, 25, ROUTE_10_SOUTH, 1
	warp_event  5,  3, ROCK_TUNNEL_B1F, 3
	warp_event 15,  9, ROCK_TUNNEL_B1F, 2
	warp_event 27,  3, ROCK_TUNNEL_B1F, 4
	warp_event 27, 13, ROCK_TUNNEL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event 24,  4, BGEVENT_ITEM, RockTunnel1FHiddenXAccuracy
	bg_event 21, 15, BGEVENT_ITEM, RockTunnel1FHiddenXDefend
	bg_event 11, 29, BGEVENT_READ, RockTunnel1FSign

	def_object_events
	object_event  4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
	object_event  7,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 12, TrainerHikerRocktunnel1, -1
	object_event  5, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 13, TrainerHikerRocktunnel2, -1
	object_event 17, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 14, TrainerHikerRocktunnel3, -1
	object_event 23,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 7, TrainerCuboneHermit, -1
	object_event 37, 21, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 17, TrainerJrTrainerFRocktunnel1, -1
	object_event 22, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 18, TrainerJrTrainerFRocktunnel2, -1
	object_event 32, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 19, TrainerJrTrainerFRocktunnel3, -1
