	object_const_def
	const POKEMONTOWER1F_RECEPTIONIST
	const POKEMONTOWER1F_MIDDLE_AGED_WOMAN
	const POKEMONTOWER1F_BALDING_GUY
	const POKEMONTOWER1F_GIRL
	const POKEMONTOWER1F_CHANNELER

PokemonTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonTower1FReceptionistScript:
	jumptextfaceplayer PokemonTower1FReceptionistText

PokemonTower1FMiddleAgedWomanScript:
	jumptextfaceplayer PokemonTower1FMiddleAgedWomanText

PokemonTower1FBaldingGuyScript:
	jumptextfaceplayer PokemonTower1FBaldingGuyText

PokemonTower1FGirlScript:
	jumptextfaceplayer PokemonTower1FGirlText

PokemonTower1FChannelerScript:
	jumptextfaceplayer PokemonTower1FChannelerText

PokemonTower1FReceptionistText:
	text "#MON TOWER was"
	line "erected in the"
	cont "memory of #MON"
	cont "that had died."
	done

PokemonTower1FMiddleAgedWomanText:
	text "Did you come to"
	line "pay respects?"
	cont "Bless you!"
	done

PokemonTower1FBaldingGuyText:
	text "I came to pray"
	line "for my CLEFAIRY."

	para "Sniff! I can't"
	line "stop crying..."
	done

PokemonTower1FGirlText:
	text "My GROWLITHE..."
	line "Why did you die?"
	done

PokemonTower1FChannelerText:
	text "I am a CHANNELER!"
	line "There are spirits"
	cont "up to mischief!"
	done

PokemonTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 17, LAVENDER_TOWN, 7
	warp_event 11, 17, LAVENDER_TOWN, 7
	warp_event 18,  9, POKEMON_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15, 13, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonTower1FReceptionistScript, -1
	object_event  6,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonTower1FMiddleAgedWomanScript, -1
	object_event  8, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonTower1FBaldingGuyScript, -1
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonTower1FGirlScript, -1
	object_event 17,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonTower1FChannelerScript, -1
