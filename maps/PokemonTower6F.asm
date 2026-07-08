	object_const_def
	const POKEMONTOWER6F_CHANNELER1
	const POKEMONTOWER6F_CHANNELER2
	const POKEMONTOWER6F_CHANNELER3
	const POKEMONTOWER6F_RARE_CANDY
	const POKEMONTOWER6F_X_ACCURACY
	const POKEMONTOWER6F_MAROWAK_GHOST

; Gen 1's Marowak's Ghost is disguised as species RESTLESS_SOUL, revealed as MAROWAK by the Silph
; Scope (pokeredDisassembly/scripts/PokemonTower6F.asm) -- Gen 2 has neither RESTLESS_SOUL nor the
; ghost-disguise engine mechanic, so this is simplified to a direct wild MAROWAK (level 30) that
; visibly blocks the tile as SPRITE_GENGAR (a ghost-type overworld sprite, no Marowak overworld
; sprite exists), same "wild mon disguised as scenery, blocks path until beaten" pattern as
; Route36's SPRITE_WEIRD_TREE Sudowoodo. Reveal/calming flavor text kept from Gen 1.
PokemonTower6F_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonTower6FRareCandy:
	itemball RARE_CANDY

PokemonTower6FXAccuracy:
	itemball X_ACCURACY

PokemonTower6FMarowakGhost:
	opentext
	writetext PokemonTower6FBeGoneText
	closetext
	cry MAROWAK
	loadwildmon MAROWAK, 30
	startbattle
	ifequal LOSE, .NotBeaten
	opentext
	writetext PokemonTower6FGhostWasCubonesMotherText
	waitbutton
	writetext PokemonTower6FSoulWasCalmedText
	waitbutton
	closetext
	disappear POKEMONTOWER6F_MAROWAK_GHOST
	setevent EVENT_BEAT_GHOST_MAROWAK
.NotBeaten:
	reloadmapafterbattle
	end

TrainerChannelerPokemontower6f1:
	trainer CHANNELER, CHANNELER_POKEMONTOWER6F_1, EVENT_BEAT_POKEMON_TOWER_6F_TRAINER_0, ChannelerPokemontower6f1SeenText, ChannelerPokemontower6f1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower6f1AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower6f2:
	trainer CHANNELER, CHANNELER_POKEMONTOWER6F_2, EVENT_BEAT_POKEMON_TOWER_6F_TRAINER_1, ChannelerPokemontower6f2SeenText, ChannelerPokemontower6f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower6f2AfterBattleText
	waitbutton
	closetext
	end

TrainerChannelerPokemontower6f3:
	trainer CHANNELER, CHANNELER_POKEMONTOWER6F_3, EVENT_BEAT_POKEMON_TOWER_6F_TRAINER_2, ChannelerPokemontower6f3SeenText, ChannelerPokemontower6f3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChannelerPokemontower6f3AfterBattleText
	waitbutton
	closetext
	end

PokemonTower6FBeGoneText:
	text "Be gone…"
	line "Intruders…"
	done

PokemonTower6FGhostWasCubonesMotherText:
	text "The GHOST was the"
	line "restless soul of"
	cont "CUBONE's mother!"
	done

PokemonTower6FSoulWasCalmedText:
	text "The mother's soul"
	line "was calmed."

	para "It departed to"
	line "the afterlife!"
	done

ChannelerPokemontower6f1SeenText:
	text "Give…me…"
	line "blood…"
	done

ChannelerPokemontower6f1BeatenText:
	text "Groan!"
	prompt

ChannelerPokemontower6f1AfterBattleText:
	text "I feel anemic and"
	line "weak…"
	done

ChannelerPokemontower6f2SeenText:
	text "Urff… Kwaah!"
	done

ChannelerPokemontower6f2BeatenText:
	text "Some-"
	line "thing fell out!"
	prompt

ChannelerPokemontower6f2AfterBattleText:
	text "Hair didn't fall"
	line "out! It was an"
	cont "evil spirit!"
	done

ChannelerPokemontower6f3SeenText:
	text "Ke..ke...ke…"
	line "ke..ke...ke!!"
	done

ChannelerPokemontower6f3BeatenText:
	text "Keee!"
	prompt

ChannelerPokemontower6f3AfterBattleText:
	text "What's going on"
	line "here?"
	done

PokemonTower6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  9, POKEMON_TOWER_5F, 2
	warp_event  9, 16, POKEMON_TOWER_7F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12, 10, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower6f1, -1
	object_event  9,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower6f2, -1
	object_event 16,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 9, TrainerChannelerPokemontower6f3, -1
	object_event  6,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower6FRareCandy, EVENT_POKEMON_TOWER_6F_RARE_CANDY
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower6FXAccuracy, EVENT_POKEMON_TOWER_6F_X_ACCURACY
	object_event 10, 16, SPRITE_GENGAR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonTower6FMarowakGhost, EVENT_BEAT_GHOST_MAROWAK
