; Pokemon Mansion B1F
; Gen 1 source: pokeredDisassembly/scripts/PokemonMansionB1F.asm
; Switch puzzle: see PokemonMansion1F.asm for the shared EVENT_MANSION_SWITCH_ON design note.
; Holds the Secret Key that unlocks Cinnabar Gym (see CLAUDE.md's "Cinnabar Secret Key" flavor
; blocker) and this Diary reveals Team Rocket's failure to control MEWTWO.

	object_const_def
	const POKEMONMANSIONB1F_BURGLAR
	const POKEMONMANSIONB1F_SCIENTIST
	const POKEMONMANSIONB1F_RARE_CANDY
	const POKEMONMANSIONB1F_FULL_RESTORE
	const POKEMONMANSIONB1F_TM_BLIZZARD
	const POKEMONMANSIONB1F_TM_SOLARBEAM
	const POKEMONMANSIONB1F_DIARY
; Gen 1's Secret Key (unlocks Cinnabar Gym) is skipped: no SECRET_KEY item const exists in this
; project yet, and Cinnabar Gym doesn't check for one either (see CLAUDE.md's "Cinnabar Secret Key"
; flavor blocker, and PORT_BACKLOG) -- wiring a new item type is out of scope for a map-content
; port, same reasoning as the TM_REFLECT/TM_THUNDER_WAVE skips.

PokemonMansionB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, PokemonMansionB1FSwitchDoorsCallback

PokemonMansionB1FSwitchDoorsCallback:
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .SwitchOn
	changeblock 13,  8, $e
	changeblock  6, 11, $e
	changeblock  4,  3, $5f
	changeblock  8,  8, $54
	endcallback

.SwitchOn:
	changeblock 13,  8, $2d
	changeblock  6, 11, $5f
	changeblock  4,  3, $e
	changeblock  8,  8, $e
	endcallback

; This switch uses the same text as 2F's, per Gen 1 (pokeredDisassembly/scripts/PokemonMansionB1F.asm).
PokemonMansionB1FSwitchScript:
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
	changeblock 13,  8, $2d
	changeblock  6, 11, $5f
	changeblock  4,  3, $e
	changeblock  8,  8, $e
	refreshmap
	end
.turn_off
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock 13,  8, $e
	changeblock  6, 11, $e
	changeblock  4,  3, $5f
	changeblock  8,  8, $54
	refreshmap
	end
.cancelled
	writetext PokemonMansion2FSwitchNotPressedText
	waitbutton
	closetext
	end

PokemonMansionB1FBurglarScript:
	faceplayer
	opentext
	writetext PokemonMansionB1FBurglarBattleText
	waitbutton
	closetext
	loadtrainer BURGLAR, BURGLAR_POKEMON_MANSION_B1F
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_MANSION_4_TRAINER_0
	opentext
	writetext PokemonMansionB1FBurglarAfterBattleText
	waitbutton
	closetext
	end

PokemonMansionB1FScientistScript:
	faceplayer
	opentext
	writetext PokemonMansionB1FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_POKEMON_MANSION_B1F
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_MANSION_4_TRAINER_1
	opentext
	writetext PokemonMansionB1FScientistAfterBattleText
	waitbutton
	closetext
	end

PokemonMansionB1FDiaryScript:
	jumptextfaceplayer PokemonMansionB1FDiaryText

PokemonMansionB1FRareCandyBall:
	itemball RARE_CANDY

PokemonMansionB1FFullRestoreBall:
	itemball FULL_RESTORE

PokemonMansionB1FTMBlizzardBall:
	itemball TM_BLIZZARD

PokemonMansionB1FTMSolarbeamBall:
	itemball TM_SOLARBEAM

PokemonMansionB1FBurglarBattleText:
	text "Uh-oh. Where am"
	line "I now?"
	done

PokemonMansionB1FBurglarAfterBattleText:
	text "You can find stuff"
	line "lying around."
	done

PokemonMansionB1FScientistBattleText:
	text "This place is"
	line "ideal for a lab."
	done

PokemonMansionB1FScientistAfterBattleText:
	text "I like it here!"
	line "It's conducive to"
	cont "my studies!"
	done

PokemonMansionB1FDiaryText:
	text "Diary: Sept. 1"
	line "MEWTWO is far too"
	cont "powerful."

	para "We have failed to"
	line "curb its vicious"
	cont "tendencies…"
	done

PokemonMansionB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 22, POKEMON_MANSION_1F, 6

	def_coord_events

	def_bg_events
	; Switch tile coordinate is approximate -- see PokemonMansion2F.asm's note.
	bg_event 13,  7, BGEVENT_READ, PokemonMansionB1FSwitchScript

	def_object_events
	object_event 16, 23, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FBurglarScript, EVENT_BEAT_MANSION_4_TRAINER_0
	object_event 27, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FScientistScript, EVENT_BEAT_MANSION_4_TRAINER_1
	object_event 10,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FRareCandyBall, EVENT_POKEMON_MANSION_B1F_RARE_CANDY
	object_event  1, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FFullRestoreBall, EVENT_POKEMON_MANSION_B1F_FULL_RESTORE
	object_event 19, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FTMBlizzardBall, EVENT_POKEMON_MANSION_B1F_TM_BLIZZARD
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FTMSolarbeamBall, EVENT_POKEMON_MANSION_B1F_TM_SOLARBEAM
	object_event 16, 20, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FDiaryScript, -1
