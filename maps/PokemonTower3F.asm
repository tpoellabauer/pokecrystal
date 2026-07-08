	object_const_def
	const POKEMONTOWER3F_CHANNELER1
	const POKEMONTOWER3F_CHANNELER2
	const POKEMONTOWER3F_CHANNELER3
	const POKEMONTOWER3F_ESCAPE_ROPE

PokemonTower3F_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonTower3FEscapeRope:
	itemball ESCAPE_ROPE

TrainerChannelerPokemontower3f1:
	trainer CHANNELER, CHANNELER_POKEMONTOWER3F_1, EVENT_BEAT_POKEMON_TOWER_3F_TRAINER_0, ChannelerPokemontower3f1SeenText, ChannelerPokemontower3f1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower3f1AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower3f2:
	trainer CHANNELER, CHANNELER_POKEMONTOWER3F_2, EVENT_BEAT_POKEMON_TOWER_3F_TRAINER_1, ChannelerPokemontower3f2SeenText, ChannelerPokemontower3f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower3f2AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower3f3:
	trainer CHANNELER, CHANNELER_POKEMONTOWER3F_3, EVENT_BEAT_POKEMON_TOWER_3F_TRAINER_2, ChannelerPokemontower3f3SeenText, ChannelerPokemontower3f3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower3f3AfterBattleText
	waitbutton
	closetext
	end

ChannelerPokemontower3f1SeenText:
	text "Urrg…Awaa…"
	line "Huhu…graa…"
	done

ChannelerPokemontower3f1BeatenText:
	text "Hwa!"
	line "I'm saved!"
	prompt

ChannelerPokemontower3f1AfterBattleText:
	text "The GHOSTs can be"
	line "identified by the"
	cont "SILPH SCOPE."
	done

ChannelerPokemontower3f2SeenText:
	text "Kekeke…."
	line "Kwaaah!"
	done

ChannelerPokemontower3f2BeatenText:
	text "Hmm?"
	line "What am I doing?"
	prompt

ChannelerPokemontower3f2AfterBattleText:
	text "Sorry! I was"
	line "possessed!"
	done

ChannelerPokemontower3f3SeenText:
	text "Be gone!"
	line "Evil spirit!"
	done

ChannelerPokemontower3f3BeatenText:
	text "Whew!"
	line "The spirit left!"
	prompt

ChannelerPokemontower3f3AfterBattleText:
	text "My friends were"
	line "possessed too!"
	done

PokemonTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, POKEMON_TOWER_2F, 1
	warp_event 18,  9, POKEMON_TOWER_4F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerChannelerPokemontower3f1, -1
	object_event  9,  8, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerChannelerPokemontower3f2, -1
	object_event 10, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerChannelerPokemontower3f3, -1
	object_event 12,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower3FEscapeRope, EVENT_POKEMON_TOWER_3F_ESCAPE_ROPE
