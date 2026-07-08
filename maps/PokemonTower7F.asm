	object_const_def
	const POKEMONTOWER7F_ROCKET1
	const POKEMONTOWER7F_ROCKET2
	const POKEMONTOWER7F_ROCKET3
	const POKEMONTOWER7F_MR_FUJI

; Gen 1's Rockets flee with a scripted walk-off animation after being beaten, and beating all 3
; auto-warps the player to Mr. Fuji's house with a full toggle-object dance (Saffron Dojo/Radio
; Tower sign swap, hiding Fuji here, showing him at home) -- see
; pokeredDisassembly/scripts/PokemonTower7F.asm. Simplified: Rockets use the standard `trainer`
; macro (stay put after losing, like every other ported trainer, no walk-off). No auto-warp: this
; project's MrFujisHouse already has an unconditional Mr. Fuji + Poke Flute reward (from before
; this floor was ported, see PORT_BACKLOG), so Fuji here just thanks the player once all 3
; Rockets are beaten rather than duplicating that reward or migrating his location.
PokemonTower7F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerGruntmPokemontower7f1:
	trainer GRUNTM, GRUNTM_62, EVENT_BEAT_POKEMON_TOWER_7F_TRAINER_0, GruntmPokemontower7f1SeenText, GruntmPokemontower7f1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntmPokemontower7f1AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntmPokemontower7f2:
	trainer GRUNTM, GRUNTM_63, EVENT_BEAT_POKEMON_TOWER_7F_TRAINER_1, GruntmPokemontower7f2SeenText, GruntmPokemontower7f2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntmPokemontower7f2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntmPokemontower7f3:
	trainer GRUNTM, GRUNTM_64, EVENT_BEAT_POKEMON_TOWER_7F_TRAINER_2, GruntmPokemontower7f3SeenText, GruntmPokemontower7f3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntmPokemontower7f3AfterBattleText
	waitbutton
	closetext
	end

PokemonTower7FMrFujiScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_POKEMON_TOWER_7F_TRAINER_2
	iffalse .StillTrapped
	checkevent EVENT_RESCUED_MR_FUJI
	iftrue .AlreadyRescued
	setevent EVENT_RESCUED_MR_FUJI
	writetext PokemonTower7FMrFujiRescueText
	waitbutton
	closetext
	end

.StillTrapped:
	writetext PokemonTower7FMrFujiTrappedText
	waitbutton
	closetext
	end

.AlreadyRescued:
	writetext PokemonTower7FMrFujiAlreadyRescuedText
	waitbutton
	closetext
	end

GruntmPokemontower7f1SeenText:
	text "What do you want?"
	line "Why are you here?"
	done

GruntmPokemontower7f1BeatenText:
	text "I give up!"
	prompt

GruntmPokemontower7f1AfterBattleText:
	text "I'm not going to"
	line "forget this!"
	done

GruntmPokemontower7f2SeenText:
	text "This old guy came"
	line "and complained"
	cont "about us harming"
	cont "useless #MON!"

	para "We're talking it"
	line "over as adults!"
	done

GruntmPokemontower7f2BeatenText:
	text "Please!"
	line "No more!"
	prompt

GruntmPokemontower7f2AfterBattleText:
	text "#MON are only"
	line "good for making"
	cont "money!"

	para "Stay out of our"
	line "business!"
	done

GruntmPokemontower7f3SeenText:
	text "You're not saving"
	line "anyone, kid!"
	done

GruntmPokemontower7f3BeatenText:
	text "Don't"
	line "fight us ROCKETs!"
	prompt

GruntmPokemontower7f3AfterBattleText:
	text "You're not getting"
	line "away with this!"
	done

PokemonTower7FMrFujiTrappedText:
	text "MR.FUJI: These"
	line "ROCKETs won't let"
	cont "me leave!"
	done

PokemonTower7FMrFujiRescueText:
	text "MR.FUJI: Heh? You"
	line "came to save me?"

	para "Thank you. But, I"
	line "came here of my"
	cont "own free will."

	para "I came to calm"
	line "the soul of"
	cont "CUBONE's mother."

	para "I think MAROWAK's"
	line "spirit has gone"
	cont "to the afterlife."

	para "I must thank you"
	line "for your kind"
	cont "concern!"
	done

PokemonTower7FMrFujiAlreadyRescuedText:
	text "MR.FUJI: Thanks"
	line "again for your"
	cont "help back there!"
	done

PokemonTower7F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 16, POKEMON_TOWER_6F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 19, TrainerGruntmPokemontower7f1, -1
	object_event 12,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 20, TrainerGruntmPokemontower7f2, -1
	object_event  9,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 21, TrainerGruntmPokemontower7f3, -1
	object_event 10,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonTower7FMrFujiScript, -1
