	object_const_def
	const POKEMONTOWER2F_RIVAL
	const POKEMONTOWER2F_CHANNELER

; Gen 1's 3rd rival battle (OPP_RIVAL2 class) -- ambushes the player mid-tower. Simplified from
; Gen 1's direction-dependent approach animation (pokeredDisassembly/scripts/PokemonTower2F.asm)
; to a single coord-triggered approach, matching the Route22 rival precedent. Stays on the floor
; and gives different flavor dialogue after being beaten (Gen 1 doesn't make him leave here).
PokemonTower2F_MapScripts:
	def_scene_scripts
	scene_script PokemonTower2FDefaultScene, SCENE_POKEMONTOWER2F_DEFAULT

	def_callbacks

PokemonTower2FDefaultScene:
	end

PokemonTower2FRivalBattleScene:
	checkevent EVENT_BEAT_POKEMON_TOWER_RIVAL
	iftrue .end
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement POKEMONTOWER2F_RIVAL, PokemonTower2FRivalApproachMovement
	opentext
	writetext PokemonTower2FRivalWhatBringsYouHereText
	waitbutton
	closetext
	checkevent EVENT_CHOSE_CHARMANDER
	iftrue .Charmander
	checkevent EVENT_CHOSE_SQUIRTLE
	iftrue .Squirtle
	; you chose Bulbasaur -> rival's Charmander line
	loadtrainer RIVAL2, RIVAL2_POKEMONTOWER_CHARMANDER
	sjump .Fight
.Squirtle:
	loadtrainer RIVAL2, RIVAL2_POKEMONTOWER_BULBASAUR
	sjump .Fight
.Charmander:
	loadtrainer RIVAL2, RIVAL2_POKEMONTOWER_SQUIRTLE
.Fight:
	winlosstext PokemonTower2FRivalDefeatedText, PokemonTower2FRivalVictoryText
	setlasttalked POKEMONTOWER2F_RIVAL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEMON_TOWER_RIVAL
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PokemonTower2FRivalWhatBringsYouHereText
	waitbutton
	closetext
.end:
	end

PokemonTower2FRivalScript:
	checkevent EVENT_BEAT_POKEMON_TOWER_RIVAL
	iftrue .AlreadyBeaten
	end

.AlreadyBeaten:
	faceplayer
	opentext
	writetext PokemonTower2FRivalHowsYourDexText
	waitbutton
	closetext
	end

PokemonTower2FChannelerScript:
	jumptextfaceplayer PokemonTower2FChannelerText

PokemonTower2FRivalApproachMovement:
	step DOWN
	step_end

PokemonTower2FRivalWhatBringsYouHereText:
	text "<RIVAL>: Hey,"
	line "<PLAYER>! What"
	cont "brings you here?"
	cont "Your #MON"
	cont "don't look dead!"

	para "I can at least"
	line "make them faint!"
	cont "Let's go, pal!"
	done

PokemonTower2FRivalDefeatedText:
	text "What? You"
	line "stinker!"

	para "I took it easy on"
	line "you too!"
	done

PokemonTower2FRivalVictoryText:
	text "<RIVAL>: Well,"
	line "look at all your"
	cont "wimpy #MON!"

	para "Toughen them up a"
	line "bit more!"
	done

PokemonTower2FRivalHowsYourDexText:
	text "How's your #DEX"
	line "coming, pal? I"
	cont "just caught a"
	cont "CUBONE!"

	para "I can't find the"
	line "grown-up MAROWAK"
	cont "yet!"

	para "I doubt there are"
	line "any left! Well, I"
	cont "better get going!"
	cont "I've got a lot to"
	cont "accomplish, pal!"

	para "Smell ya later!"
	done

PokemonTower2FChannelerText:
	text "Even we could not"
	line "identify the"
	cont "wayward GHOSTs!"

	para "A SILPH SCOPE"
	line "might be able to"
	cont "unmask them."
	done

PokemonTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, POKEMON_TOWER_3F, 1
	warp_event 18,  9, POKEMON_TOWER_1F, 3

	def_coord_events
	coord_event 15,  5, SCENE_POKEMONTOWER2F_DEFAULT, PokemonTower2FRivalBattleScene
	coord_event 14,  6, SCENE_POKEMONTOWER2F_DEFAULT, PokemonTower2FRivalBattleScene

	def_bg_events

	def_object_events
	object_event 14,  5, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonTower2FRivalScript, -1
	object_event  3,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonTower2FChannelerScript, -1
