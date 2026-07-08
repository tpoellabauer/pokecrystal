	object_const_def
	const POKEMONTOWER5F_CHANNELER1
	const POKEMONTOWER5F_CHANNELER2
	const POKEMONTOWER5F_CHANNELER3
	const POKEMONTOWER5F_CHANNELER4
	const POKEMONTOWER5F_CHANNELER5
	const POKEMONTOWER5F_NUGGET

; Gen 1's purified-zone tiles (10-11, 8-9) fully heal the party once per visit and fade to a
; white "sealed with white magic" cutscene (pokeredDisassembly/scripts/PokemonTower5F.asm).
; Simplified to a coord-triggered heal + text, no fade -- Gen 2's coord_event already only fires
; on step-in (not every frame like Gen 1's raw script), so no re-entrancy guard is needed either.
PokemonTower5F_MapScripts:
	def_scene_scripts
	scene_script PokemonTower5FDefaultScene, SCENE_POKEMONTOWER5F_DEFAULT

	def_callbacks

PokemonTower5FDefaultScene:
	end

PokemonTower5FPurifiedZoneScript:
	special HealParty
	opentext
	writetext PokemonTower5FPurifiedZoneText
	waitbutton
	closetext
	end

PokemonTower5FNugget:
	itemball NUGGET

; Non-battling flavor NPC who explains the purified zone.
PokemonTower5FChannelerScript:
	jumptextfaceplayer PokemonTower5FChanneler1Text

TrainerChannelerPokemontower5f2:
	trainer CHANNELER, CHANNELER_POKEMONTOWER5F_1, EVENT_BEAT_POKEMON_TOWER_5F_TRAINER_0, ChannelerPokemontower5f2SeenText, ChannelerPokemontower5f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower5f2AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower5f3:
	trainer CHANNELER, CHANNELER_POKEMONTOWER5F_2, EVENT_BEAT_POKEMON_TOWER_5F_TRAINER_1, ChannelerPokemontower5f3SeenText, ChannelerPokemontower5f3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower5f3AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower5f4:
	trainer CHANNELER, CHANNELER_POKEMONTOWER5F_3, EVENT_BEAT_POKEMON_TOWER_5F_TRAINER_2, ChannelerPokemontower5f4SeenText, ChannelerPokemontower5f4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower5f4AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower5f5:
	trainer CHANNELER, CHANNELER_POKEMONTOWER5F_4, EVENT_BEAT_POKEMON_TOWER_5F_TRAINER_3, ChannelerPokemontower5f5SeenText, ChannelerPokemontower5f5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower5f5AfterBattleText
	waitbutton
	closetext
	end

PokemonTower5FChanneler1Text:
	text "Come, child! I"
	line "sealed this space"
	cont "with white magic!"

	para "You can rest here!"
	done

ChannelerPokemontower5f2SeenText:
	text "Give…me…"
	line "your…soul…"
	done

ChannelerPokemontower5f2BeatenText:
	text "Gasp!"
	prompt

ChannelerPokemontower5f2AfterBattleText:
	text "I was under"
	line "possession!"
	done

ChannelerPokemontower5f3SeenText:
	text "You…shall…"
	line "join…us…"
	done

ChannelerPokemontower5f3BeatenText:
	text "What"
	line "a nightmare!"
	prompt

ChannelerPokemontower5f3AfterBattleText:
	text "I was possessed!"
	done

ChannelerPokemontower5f4SeenText:
	text "Zombies!"
	done

ChannelerPokemontower5f4BeatenText:
	text "Ha?"
	prompt

ChannelerPokemontower5f4AfterBattleText:
	text "I regained my"
	line "senses!"
	done

ChannelerPokemontower5f5SeenText:
	text "Urgah…"
	line "Urff…."
	done

ChannelerPokemontower5f5BeatenText:
	text "Whoo!"
	prompt

ChannelerPokemontower5f5AfterBattleText:
	text "I fell to evil"
	line "spirits despite"
	cont "my training!"
	done

PokemonTower5FPurifiedZoneText:
	text "Entered purified,"
	line "protected zone!"

	para "<PLAYER>'s #MON"
	line "are fully healed!"
	done

PokemonTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, POKEMON_TOWER_4F, 1
	warp_event 18,  9, POKEMON_TOWER_6F, 1

	def_coord_events
	coord_event 10, 8, SCENE_POKEMONTOWER5F_DEFAULT, PokemonTower5FPurifiedZoneScript
	coord_event 11, 8, SCENE_POKEMONTOWER5F_DEFAULT, PokemonTower5FPurifiedZoneScript
	coord_event 10, 9, SCENE_POKEMONTOWER5F_DEFAULT, PokemonTower5FPurifiedZoneScript
	coord_event 11, 9, SCENE_POKEMONTOWER5F_DEFAULT, PokemonTower5FPurifiedZoneScript

	def_bg_events

	def_object_events
	object_event 12,  8, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonTower5FChannelerScript, -1
	object_event 17,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower5f2, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower5f3, -1
	object_event  6, 10, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower5f4, -1
	object_event  9, 16, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower5f5, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower5FNugget, EVENT_POKEMON_TOWER_5F_NUGGET
