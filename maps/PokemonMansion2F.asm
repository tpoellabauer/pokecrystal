; Pokemon Mansion 2F
; Gen 1 source: pokeredDisassembly/scripts/PokemonMansion2F.asm
; Switch puzzle: see PokemonMansion1F.asm for the shared EVENT_MANSION_SWITCH_ON design note.
; 2 real Gen 1 hole-fall tiles (to 1F/3F) are ported as plain two-way warp_events instead of Gen
; 1's same-X/Y "dungeon warp" special mechanic, matching the existing precedent at
; IcePathB2FMahoganySide.asm's holes back to IcePathB1F.

	object_const_def
	const POKEMONMANSION2F_SUPER_NERD
	const POKEMONMANSION2F_CALCIUM
	const POKEMONMANSION2F_DIARY1
	const POKEMONMANSION2F_DIARY2

PokemonMansion2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, PokemonMansion2FSwitchDoorsCallback

PokemonMansion2FSwitchDoorsCallback:
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .SwitchOn
	changeblock  4,  2, $e
	changeblock  9,  4, $54
	changeblock  3, 11, $5f
	endcallback

.SwitchOn:
	changeblock  4,  2, $5f
	changeblock  9,  4, $e
	changeblock  3, 11, $e
	endcallback

PokemonMansion2FSwitchScript:
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
	changeblock  4,  2, $5f
	changeblock  9,  4, $e
	changeblock  3, 11, $e
	refreshmap
	end
.turn_off
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock  4,  2, $e
	changeblock  9,  4, $54
	changeblock  3, 11, $5f
	refreshmap
	end
.cancelled
	writetext PokemonMansion2FSwitchNotPressedText
	waitbutton
	closetext
	end

PokemonMansion2FSuperNerdScript:
	faceplayer
	opentext
	writetext PokemonMansion2FSuperNerdBattleText
	waitbutton
	closetext
	loadtrainer BURGLAR, BRAX
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_MANSION_2_TRAINER_0
	opentext
	writetext PokemonMansion2FSuperNerdAfterBattleText
	waitbutton
	closetext
	end

PokemonMansion2FDiary1Script:
	jumptextfaceplayer PokemonMansion2FDiary1Text

PokemonMansion2FDiary2Script:
	jumptextfaceplayer PokemonMansion2FDiary2Text

PokemonMansion2FCalciumBall:
	itemball CALCIUM

PokemonMansion2FSuperNerdBattleText:
	text "I can't get out!"
	line "This old place is"
	cont "one big puzzle!"
	done

PokemonMansion2FSuperNerdAfterBattleText:
	text "Switches open and"
	line "close alternating"
	cont "sets of doors!"
	done

PokemonMansion2FDiary1Text:
	text "Diary: July 5"
	line "Guyana,"
	cont "South America"

	para "A new #MON was"
	line "discovered deep"
	cont "in the jungle."
	done

PokemonMansion2FDiary2Text:
	text "Diary: July 10"
	line "We christened the"
	cont "newly discovered"
	cont "#MON, MEW."
	done

PokemonMansion2FSwitchText:
	text "A secret switch!"

	para "Press it?"
	done

PokemonMansion2FSwitchPressedText:
	text "Who wouldn't?"
	prompt

PokemonMansion2FSwitchNotPressedText:
	text "Not quite yet!"
	done

PokemonMansion2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 10, POKEMON_MANSION_1F, 5
	warp_event  7, 10, POKEMON_MANSION_3F, 1
	warp_event 25, 14, POKEMON_MANSION_3F, 3
	warp_event  6,  1, POKEMON_MANSION_3F, 2
	warp_event 19, 14, POKEMON_MANSION_3F, 6

	def_coord_events

	def_bg_events
	; Switch tile coordinate is approximate (Gen 1 places it via a raw tile-script hook,
	; not an object dump entry) -- verify against Polished Map and adjust if it lands on a
	; wall/blocked tile. See PORT_BACKLOG.
	bg_event 12,  1, BGEVENT_READ, PokemonMansion2FSwitchScript

	def_object_events
	object_event  3, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonMansion2FSuperNerdScript, EVENT_BEAT_MANSION_2_TRAINER_0
	object_event 28,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion2FCalciumBall, EVENT_POKEMON_MANSION_2F_CALCIUM
	object_event 18,  2, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion2FDiary1Script, -1
	object_event  3, 22, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion2FDiary2Script, -1
