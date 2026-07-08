	object_const_def
	const POKEMONTOWER4F_CHANNELER1
	const POKEMONTOWER4F_CHANNELER2
	const POKEMONTOWER4F_CHANNELER3
	const POKEMONTOWER4F_ELIXER
	const POKEMONTOWER4F_AWAKENING
	const POKEMONTOWER4F_HP_UP

PokemonTower4F_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonTower4FElixer:
	itemball ELIXER

PokemonTower4FAwakening:
	itemball AWAKENING

PokemonTower4FHPUp:
	itemball HP_UP

TrainerChannelerPokemontower4f1:
	trainer CHANNELER, CHANNELER_POKEMONTOWER4F_1, EVENT_BEAT_POKEMON_TOWER_4F_TRAINER_0, ChannelerPokemontower4f1SeenText, ChannelerPokemontower4f1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower4f1AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower4f2:
	trainer CHANNELER, CHANNELER_POKEMONTOWER4F_2, EVENT_BEAT_POKEMON_TOWER_4F_TRAINER_1, ChannelerPokemontower4f2SeenText, ChannelerPokemontower4f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower4f2AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower4f3:
	trainer CHANNELER, CHANNELER_POKEMONTOWER4F_3, EVENT_BEAT_POKEMON_TOWER_4F_TRAINER_2, ChannelerPokemontower4f3SeenText, ChannelerPokemontower4f3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower4f3AfterBattleText
	waitbutton
	closetext
	end

ChannelerPokemontower4f1SeenText:
	text "GHOST! No!"
	line "Kwaaah!"
	done

ChannelerPokemontower4f1BeatenText:
	text "Where"
	line "is the GHOST?"
	prompt

ChannelerPokemontower4f1AfterBattleText:
	text "I must have been"
	line "dreaming…"
	done

ChannelerPokemontower4f2SeenText:
	text "Be cursed with"
	line "me! Kwaaah!"
	done

ChannelerPokemontower4f2BeatenText:
	text "What!"
	prompt

ChannelerPokemontower4f2AfterBattleText:
	text "We can't crack"
	line "the identity of"
	cont "the GHOSTs."
	done

ChannelerPokemontower4f3SeenText:
	text "Huhuhu…"
	line "Beat me not!"
	done

ChannelerPokemontower4f3BeatenText:
	text "Huh?"
	line "Who? What?"
	prompt

ChannelerPokemontower4f3AfterBattleText:
	text "May the departed"
	line "souls of #MON"
	cont "rest in peace…"
	done

PokemonTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, POKEMON_TOWER_5F, 1
	warp_event 18,  9, POKEMON_TOWER_3F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5, 10, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower4f1, -1
	object_event 15,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower4f2, -1
	object_event 14, 12, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower4f3, -1
	object_event 12, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower4FElixer, EVENT_POKEMON_TOWER_4F_ELIXER
	object_event  9, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower4FAwakening, EVENT_POKEMON_TOWER_4F_AWAKENING
	object_event 12, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower4FHPUp, EVENT_POKEMON_TOWER_4F_HP_UP
