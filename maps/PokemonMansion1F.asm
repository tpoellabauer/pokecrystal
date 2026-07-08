; Pokemon Mansion 1F
; Gen 1 source: pokeredDisassembly/scripts/PokemonMansion1F.asm
; Mansion switch puzzle: EVENT_MANSION_SWITCH_ON is shared across all 4 Mansion floors (1F/2F/3F/
; B1F) -- flipping any floor's switch toggles gates on every floor via each floor's own
; MAPCALLBACK_TILES callback (precedent: RuinsOfAlphKabutoChamber's hidden-door callback). Block
; IDs and coordinates are Gen 1's own values (TILESET_GEN1_FACILITY is a byte-identical port, same
; metatile numbering).

	object_const_def
	const POKEMONMANSION1F_SCIENTIST

PokemonMansion1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, PokemonMansion1FSwitchDoorsCallback

PokemonMansion1FSwitchDoorsCallback:
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .SwitchOn
	changeblock 12,  6, $2d
	changeblock  8,  3, $2d
	changeblock 10,  8, $2d
	changeblock 13, 13, $2d
	endcallback

.SwitchOn:
	changeblock 12,  6, $e
	changeblock  8,  3, $e
	changeblock 10,  8, $e
	changeblock 13, 13, $e
	endcallback

PokemonMansion1FScientistScript:
	faceplayer
	opentext
	writetext PokemonMansion1FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_POKEMON_MANSION_1F
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_MANSION_1_TRAINER_0
	opentext
	writetext PokemonMansion1FScientistAfterBattleText
	waitbutton
	closetext
	end

PokemonMansion1FSwitchScript:
	opentext
	writetext PokemonMansion1FSwitchText
	yesorno
	iffalse .cancelled
	writetext PokemonMansion1FSwitchPressedText
	waitbutton
	closetext
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .turn_off
	setevent EVENT_MANSION_SWITCH_ON
	changeblock 12,  6, $e
	changeblock  8,  3, $e
	changeblock 10,  8, $e
	changeblock 13, 13, $e
	refreshmap
	end
.turn_off
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock 12,  6, $2d
	changeblock  8,  3, $2d
	changeblock 10,  8, $2d
	changeblock 13, 13, $2d
	refreshmap
	end
.cancelled
	writetext PokemonMansion1FSwitchNotPressedText
	waitbutton
	closetext
	end

PokemonMansion1FScientistBattleText:
	text "Who are you? There"
	line "shouldn't be"
	cont "anyone here."
	done

PokemonMansion1FScientistAfterBattleText:
	text "A key? I don't"
	line "know what you're"
	cont "talking about."
	done

PokemonMansion1FSwitchText:
	text "A secret switch!"

	para "Press it?"
	done

PokemonMansion1FSwitchPressedText:
	text "Who wouldn't?"
	prompt

PokemonMansion1FSwitchNotPressedText:
	text "Not quite yet!"
	done

PokemonMansion1FEscapeRopeBall:
	itemball ESCAPE_ROPE

PokemonMansion1FCarbosBall:
	itemball CARBOS

PokemonMansion1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 27, CINNABAR_ISLAND, 1
	warp_event  5, 27, CINNABAR_ISLAND, 1
	warp_event  6, 27, CINNABAR_ISLAND, 1
	warp_event  7, 27, CINNABAR_ISLAND, 1
	warp_event  5, 10, POKEMON_MANSION_2F, 1
	warp_event 21, 23, POKEMON_MANSION_B1F, 1
	warp_event 26, 27, CINNABAR_ISLAND, 1
	warp_event 27, 27, CINNABAR_ISLAND, 1
	warp_event 16, 14, POKEMON_MANSION_3F, 4
	warp_event 17, 14, POKEMON_MANSION_3F, 5

	def_coord_events

	def_bg_events
	bg_event 12, 12, BGEVENT_READ, PokemonMansion1FSwitchScript

	def_object_events
	object_event 17, 17, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion1FScientistScript, -1
	object_event 14,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FEscapeRopeBall, EVENT_POKEMON_MANSION_1F_ESCAPE_ROPE
	object_event 18, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FCarbosBall, EVENT_POKEMON_MANSION_1F_CARBOS
