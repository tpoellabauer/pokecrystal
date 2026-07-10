; Pokemon Mansion 3F
; Gen 1 source: pokeredDisassembly/scripts/PokemonMansion3F.asm
; Switch puzzle: see PokemonMansion1F.asm for the shared EVENT_MANSION_SWITCH_ON design note.
; Gen 1's 3 hole-fall tiles (2 to 1F, 1 to 2F) are ported as plain two-way warp_events instead of
; Gen 1's same-X/Y "dungeon warp" mechanic -- same simplification as PokemonMansion2F.asm.
; This floor's Diary reveals MEWTWO's origin (MEW gave birth to it here).

	object_const_def
	const POKEMONMANSION3F_SUPER_NERD
	const POKEMONMANSION3F_SCIENTIST
	const POKEMONMANSION3F_MAX_POTION
	const POKEMONMANSION3F_IRON
	const POKEMONMANSION3F_DIARY

PokemonMansion3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, PokemonMansion3FSwitchDoorsCallback

PokemonMansion3FSwitchDoorsCallback:
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .SwitchOn
	changeblock  7,  2, $e
	changeblock  7,  5, $5f
	endcallback

.SwitchOn:
	changeblock  7,  2, $5f
	changeblock  7,  5, $e
	endcallback

; This switch uses the same text as 2F's, per Gen 1 (pokeredDisassembly/scripts/PokemonMansion3F.asm).
PokemonMansion3FSwitchScript:
	opentext
	writetext PokemonMansion2FSwitchText
	yesorno
	iffalse .cancelled
	writetext PokemonMansion2FSwitchPressedText
	waitbutton
	closetext
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .turn_off
	setevent EVENT_MANSION_SWITCH_ON
	changeblock  7,  2, $5f
	changeblock  7,  5, $e
	refreshmap
	end
.turn_off
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock  7,  2, $e
	changeblock  7,  5, $5f
	refreshmap
	end
.cancelled
	writetext PokemonMansion2FSwitchNotPressedText
	waitbutton
	closetext
	end

PokemonMansion3FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_POKEMON_MANSION_3F_HIDDEN_MAX_REVIVE

PokemonMansion3FSuperNerdScript:
	faceplayer
	opentext
	writetext PokemonMansion3FSuperNerdBattleText
	waitbutton
	closetext
	loadtrainer BURGLAR, BURGLAR_POKEMON_MANSION_3F
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_MANSION_3_TRAINER_0
	opentext
	writetext PokemonMansion3FSuperNerdAfterBattleText
	waitbutton
	closetext
	end

PokemonMansion3FScientistScript:
	faceplayer
	opentext
	writetext PokemonMansion3FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_POKEMON_MANSION_3F
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_MANSION_3_TRAINER_1
	opentext
	writetext PokemonMansion3FScientistAfterBattleText
	waitbutton
	closetext
	end

PokemonMansion3FDiaryScript:
	jumptextfaceplayer PokemonMansion3FDiaryText

PokemonMansion3FMaxPotionBall:
	itemball MAX_POTION

PokemonMansion3FIronBall:
	itemball IRON

PokemonMansion3FSuperNerdBattleText:
	text "This place is"
	line "like, huge!"
	done

PokemonMansion3FSuperNerdAfterBattleText:
	text "I wonder where"
	line "my partner went."
	done

PokemonMansion3FScientistBattleText:
	text "My mentor once"
	line "lived here."
	done

PokemonMansion3FScientistAfterBattleText:
	text "So, you're stuck?"
	line "Try jumping off"
	cont "over there!"
	done

PokemonMansion3FDiaryText:
	text "Diary: Feb. 6"
	line "MEW gave birth."

	para "We named the"
	line "newborn MEWTWO."
	done

PokemonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 10, POKEMON_MANSION_2F, 2
	warp_event  6,  1, POKEMON_MANSION_2F, 4
	warp_event 25, 14, POKEMON_MANSION_2F, 3
	warp_event 16, 14, POKEMON_MANSION_1F, 9
	warp_event 17, 14, POKEMON_MANSION_1F, 10
	warp_event 19, 14, POKEMON_MANSION_2F, 5

	def_coord_events

	def_bg_events
	; Switch tile is Gen 1's exact hidden_events.asm coordinate (hidden_events_for
	; POKEMON_MANSION_3F, Mansion3Script_Switches), not an approximation.
	bg_event 10,  5, BGEVENT_READ, PokemonMansion3FSwitchScript
	bg_event  1,  9, BGEVENT_ITEM, PokemonMansion3FHiddenMaxRevive

	def_object_events
	object_event  5, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonMansion3FSuperNerdScript, EVENT_BEAT_MANSION_3_TRAINER_0
	object_event 20, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonMansion3FScientistScript, EVENT_BEAT_MANSION_3_TRAINER_1
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion3FMaxPotionBall, EVENT_POKEMON_MANSION_3F_MAX_POTION
	object_event 25,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion3FIronBall, EVENT_POKEMON_MANSION_3F_IRON
	object_event  6, 12, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion3FDiaryScript, -1
