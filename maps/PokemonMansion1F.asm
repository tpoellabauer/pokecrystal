; Pokemon Mansion 1F
; Gen 1 source: pokeredDisassembly/scripts/PokemonMansion1F.asm
; Mansion switch puzzle logic: toggles EVENT_MANSION_SWITCH_ON, but does not yet
; actually swap floor blocks (no tiledata implementation) - see PORT_BACKLOG.

	object_const_def
	const POKEMONMANSION1F_SCIENTIST

PokemonMansion1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PokemonMansion1FNewMapSceneCallback

PokemonMansion1FNewMapSceneCallback:
	; On first load, check the switch state and replace blocks accordingly.
	; In Gen 1, this was done via predef ReplaceTileBlock with specific metatile IDs.
	; For now, this is a placeholder - block replacement would need tiledata updates.
	end

PokemonMansion1FScientistScript:
	faceplayer
	opentext
	writetext PokemonMansion1FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_POKEMON_MANSION_1F
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAINER
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
	; Interaction with the mansion switch puzzle
	; Toggles EVENT_MANSION_SWITCH_ON and would change floor blocks in a real implementation
	opentext
	writetext PokemonMansion1FSwitchText
	yesorno
	iffalse .cancelled
	writetext PokemonMansion1FSwitchPressedText
	waitbutton
	closetext
	; Toggle the switch event (would affect block layout in full implementation)
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .turn_off
	setevent EVENT_MANSION_SWITCH_ON
	end
.turn_off
	clearevent EVENT_MANSION_SWITCH_ON
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

	def_coord_events

	def_bg_events
	bg_event 12, 12, BGEVENT_READ, PokemonMansion1FSwitchScript

	def_object_events
	object_event 17, 17, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion1FScientistScript, -1
	object_event 14,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FEscapeRopeBall, EVENT_POKEMON_MANSION_1F_ESCAPE_ROPE
	object_event 18, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FCarbosBall, EVENT_POKEMON_MANSION_1F_CARBOS
