	object_const_def
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3
	const ROCKTUNNELB1F_JR_TRAINER_F1
	const ROCKTUNNELB1F_HIKER1
	const ROCKTUNNELB1F_POKEMANIAC1
	const ROCKTUNNELB1F_POKEMANIAC2
	const ROCKTUNNELB1F_HIKER2
	const ROCKTUNNELB1F_JR_TRAINER_F2
	const ROCKTUNNELB1F_HIKER3
	const ROCKTUNNELB1F_POKEMANIAC3

RockTunnelB1F_MapScripts:
	def_scene_scripts

	def_callbacks

RockTunnelB1FIron:
	itemball IRON

RockTunnelB1FPPUp:
	itemball PP_UP

RockTunnelB1FRevive:
	itemball REVIVE

RockTunnelB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

; Gen 1 sprite is COOLTRAINER_F, but the real battle data (OPP_JR_TRAINER_F) is JR_TRAINER_F class.
TrainerJrTrainerFRocktunnelb1f1:
	trainer JR_TRAINER_F, JR_TRAINER_F_18, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_0, JrTrainerFRocktunnelb1f1SeenText, JrTrainerFRocktunnelb1f1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JrTrainerFRocktunnelb1f1AfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRocktunnelb1f1:
	trainer HIKER, HIKER_ROCKTUNNELB1F1, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_1, HikerRocktunnelb1f1SeenText, HikerRocktunnelb1f1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRocktunnelb1f1AfterBattleText
	waitbutton
	closetext
	end

; Gen 1 sprite is SUPER_NERD, but the real battle data (OPP_POKEMANIAC) is POKEMANIAC class.
TrainerPokemaniacRocktunnelb1f1:
	trainer POKEMANIAC, POKEMANIAC_ROCKTUNNELB1F1, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_2, PokemaniacRocktunnelb1f1SeenText, PokemaniacRocktunnelb1f1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRocktunnelb1f1AfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRocktunnelb1f2:
	trainer POKEMANIAC, POKEMANIAC_ROCKTUNNELB1F2, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_3, PokemaniacRocktunnelb1f2SeenText, PokemaniacRocktunnelb1f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRocktunnelb1f2AfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRocktunnelb1f2:
	trainer HIKER, HIKER_ROCKTUNNELB1F2, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_4, HikerRocktunnelb1f2SeenText, HikerRocktunnelb1f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRocktunnelb1f2AfterBattleText
	waitbutton
	closetext
	end

TrainerJrTrainerFRocktunnelb1f2:
	trainer JR_TRAINER_F, JR_TRAINER_F_19, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_5, JrTrainerFRocktunnelb1f2SeenText, JrTrainerFRocktunnelb1f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JrTrainerFRocktunnelb1f2AfterBattleText
	waitbutton
	closetext
	end

; Reuses CURTIS's party data (Gen 1 shares this HikerData entry between Route 9 and here).
TrainerHikerRocktunnelb1f3:
	trainer HIKER, CURTIS, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_6, HikerRocktunnelb1f3SeenText, HikerRocktunnelb1f3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRocktunnelb1f3AfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRocktunnelb1f3:
	trainer POKEMANIAC, POKEMANIAC_ROCKTUNNELB1F3, EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_7, PokemaniacRocktunnelb1f3SeenText, PokemaniacRocktunnelb1f3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRocktunnelb1f3AfterBattleText
	waitbutton
	closetext
	end

JrTrainerFRocktunnelb1f1SeenText:
	text "Hikers leave twigs"
	line "as trail markers."
	done

JrTrainerFRocktunnelb1f1BeatenText:
	text "Ohhh! I did my"
	line "best!"
	done

JrTrainerFRocktunnelb1f1AfterBattleText:
	text "I want to go"
	line "home!"
	done

HikerRocktunnelb1f1SeenText:
	text "Hahaha! Can you"
	line "beat my power?"
	done

HikerRocktunnelb1f1BeatenText:
	text "Oops! Out-"
	line "muscled!"
	done

HikerRocktunnelb1f1AfterBattleText:
	text "I go for power"
	line "because I hate"
	cont "thinking!"
	done

PokemaniacRocktunnelb1f1SeenText:
	text "You have a"
	line "#DEX? I want"
	cont "one too!"
	done

PokemaniacRocktunnelb1f1BeatenText:
	text "Shoot! I'm so"
	line "jealous!"
	done

PokemaniacRocktunnelb1f1AfterBattleText:
	text "When you finish"
	line "your #DEX, can"
	cont "I have it?"
	done

PokemaniacRocktunnelb1f2SeenText:
	text "Do you know about"
	line "costume players?"
	done

PokemaniacRocktunnelb1f2BeatenText:
	text "Well, that's"
	line "that."
	done

PokemaniacRocktunnelb1f2AfterBattleText:
	text "Costume players"
	line "dress up as"
	cont "#MON for fun."
	done

HikerRocktunnelb1f2SeenText:
	text "My #MON"
	line "techniques will"
	cont "leave you crying!"
	done

HikerRocktunnelb1f2BeatenText:
	text "I give! You're a"
	line "better"
	cont "technician!"
	done

HikerRocktunnelb1f2AfterBattleText:
	text "In mountains,"
	line "you'll often find"
	cont "rock-type #MON."
	done

JrTrainerFRocktunnelb1f2SeenText:
	text "I don't often"
	line "come here, but I"
	cont "will fight you."
	done

JrTrainerFRocktunnelb1f2BeatenText:
	text "Oh! I lost!"
	done

JrTrainerFRocktunnelb1f2AfterBattleText:
	text "I like tiny"
	line "#MON, big ones"
	cont "are too scary!"
	done

HikerRocktunnelb1f3SeenText:
	text "Hit me with your"
	line "best shot!"
	done

HikerRocktunnelb1f3BeatenText:
	text "Fired away!"
	done

HikerRocktunnelb1f3AfterBattleText:
	text "I'll raise my"
	line "#MON to beat"
	cont "yours, kid!"
	done

PokemaniacRocktunnelb1f3SeenText:
	text "I draw #MON"
	line "when I'm home."
	done

PokemaniacRocktunnelb1f3BeatenText:
	text "Whew! I'm"
	line "exhausted!"
	done

PokemaniacRocktunnelb1f3AfterBattleText:
	text "I'm an artist,"
	line "not a fighter."
	done

RockTunnelB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROCK_TUNNEL_1F, 6
	warp_event 17,  9, ROCK_TUNNEL_1F, 4
	warp_event 23,  3, ROCK_TUNNEL_1F, 3
	warp_event 25, 23, ROCK_TUNNEL_1F, 5

	def_coord_events

	def_bg_events
	bg_event  4, 14, BGEVENT_ITEM, RockTunnelB1FHiddenMaxPotion

	def_object_events
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event  6, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 15,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
	object_event 11, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerJrTrainerFRocktunnelb1f1, -1
	object_event  6, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerRocktunnelb1f1, -1
	object_event  3,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRocktunnelb1f1, -1
	object_event 20, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerPokemaniacRocktunnelb1f2, -1
	object_event 30, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerRocktunnelb1f2, -1
	object_event 14, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerJrTrainerFRocktunnelb1f2, -1
	object_event 33,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerRocktunnelb1f3, -1
	object_event 26, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerPokemaniacRocktunnelb1f3, -1
