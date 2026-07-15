	object_const_def
	const VICTORYROAD_MOLTRES
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_COOLTRAINERF_1F
	const VICTORYROAD_COOLTRAINERM_1F
	const VICTORYROAD_BLACKBELT_2F
	const VICTORYROAD_JUGGLER_2F_1
	const VICTORYROAD_JUGGLER_2F_2
	const VICTORYROAD_JUGGLER_2F_3
	const VICTORYROAD_POKEMANIAC_2F
	const VICTORYROAD_COOLTRAINERM_3F_1
	const VICTORYROAD_COOLTRAINERF_3F_1
	const VICTORYROAD_COOLTRAINERM_3F_2
	const VICTORYROAD_COOLTRAINERF_3F_2

; Gen 1 Victory Road has no rival battle (that's Johto-only content) -- just items + a Moltres
; static encounter. Ported from pokered scripts/VictoryRoad{1F,2F,3F}.asm's item/Moltres data
; (the 3 Gen1 floors are merged into this single Gen2 map). Dropped the forced rival ambush
; entirely (matches Red exactly, no equivalent to simplify into); Moltres reuses the ambush's
; old (18, 13) coordinate (already Johto-verified walkable) rather than a new guessed spot.
; Gen1's boulder-relay puzzle (switch-triggered tile swaps + dungeon-warp holes across floors,
; scripts/VictoryRoad{1,2,3}F.asm) has no Gen 2 macro equivalent (same class of bespoke
; forced-movement puzzle as Seafoam's, see maps-and-scripting skill) and is skipped; none of the
; 3 floors' warps require it for traversal in Gen1 either. Gen1's Victory Road trainers (2x
; Cooltrainer 1F; 2F has 1x Hiker-sprite (battles BLACKBELT_T) + 3x SuperNerd-sprite (battle
; JUGGLER, POKEMANIAC, JUGGLER) + 1x CoolM-sprite (Gen1 battle class TAMER, folded into JUGGLER:
; Gen2 has no TAMER class, precedent: JugglerGroup (7)/(8) Fuchsia Gym) = 5 trainers 2F; 3F has
; 4x Cooltrainer = 11 total, not 9 as issue #6's prose said --
; pokeredDisassembly/data/maps/objects/VictoryRoad{1F,2F,3F}.asm is ground truth). Placed at
; floor-plausible open-floor coordinates in this merged map (verified
; walkable via a cave_collision.asm/blk walkability-grid script + render_map screenshot review,
; not Gen1's raw per-floor coordinates, which don't line up 1:1 with this map's redesigned
; geometry -- see maps-and-scripting skill). RareCandy/FullHeal item balls converted to
; hiddenitem bg_events (same NUM_OBJECTS=16 cap workaround as PowerPlant; see PowerPlant.asm)
; to keep the total object_event count (11 trainers + Moltres + 3 remaining item balls = 15)
; under the cap.
VictoryRoad_MapScripts:
	def_scene_scripts
	scene_script VictoryRoadNoop1Scene, SCENE_VICTORYROAD_RIVAL_BATTLE
	scene_script VictoryRoadNoop2Scene, SCENE_VICTORYROAD_NOOP

	def_callbacks

VictoryRoadNoop1Scene:
	end

VictoryRoadNoop2Scene:
	end

VictoryRoadMoltres:
	opentext
	writetext VictoryRoadMoltresBattleText
	closetext
	cry MOLTRES
	loadwildmon MOLTRES, 50
	startbattle
	ifequal LOSE, .NotBeaten
	disappear VICTORYROAD_MOLTRES
	setevent EVENT_BEAT_MOLTRES
.NotBeaten:
	reloadmapafterbattle
	end

VictoryRoadMoltresBattleText:
	text "Kyaaa!"
	done

; Gen1's TM_SKY_ATTACK/TM_SUBMISSION/TM_EXPLOSION have no GSC equivalent (dropped from the
; Gen 2 TM roster) -- substituted with the closest available GSC TM/item (base stats/movesets
; stay GSC, out of scope per REACHING_PARITY.md).
VictoryRoadTMSkyAttack:
	itemball TM_HYPER_BEAM

VictoryRoadRareCandy:
	hiddenitem RARE_CANDY, EVENT_VICTORY_ROAD_MAX_REVIVE

VictoryRoadTMSubmission:
	itemball TM_DYNAMICPUNCH

VictoryRoadFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_FULL_HEAL

VictoryRoadTMExplosion:
	itemball FULL_RESTORE

VictoryRoadCooltrainerF1F:
	trainer COOLTRAINERF, COOLTRAINERF_VICTORYROAD_1F, EVENT_BEAT_VICTORY_ROAD_TRAINER_0, VictoryRoadCooltrainerF1FSeenText, VictoryRoadCooltrainerF1FBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadCooltrainerF1FAfterBattleText
	waitbutton
	closetext
	end

VictoryRoadCooltrainerM1F:
	trainer COOLTRAINERM, COOLTRAINERM_VICTORYROAD_1F, EVENT_BEAT_VICTORY_ROAD_TRAINER_1, VictoryRoadCooltrainerM1FSeenText, VictoryRoadCooltrainerM1FBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadCooltrainerM1FAfterBattleText
	waitbutton
	closetext
	end

VictoryRoadBlackbelt2F:
	trainer BLACKBELT_T, BLACKBELT_VICTORYROAD_2F, EVENT_BEAT_VICTORY_ROAD_TRAINER_2, VictoryRoadBlackbelt2FSeenText, VictoryRoadBlackbelt2FBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadBlackbelt2FAfterBattleText
	waitbutton
	closetext
	end

VictoryRoadJuggler2F1:
	trainer JUGGLER, JUGGLER_VICTORYROAD_2F_1, EVENT_BEAT_VICTORY_ROAD_TRAINER_3, VictoryRoadJuggler2F1SeenText, VictoryRoadJuggler2F1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadJuggler2F1AfterBattleText
	waitbutton
	closetext
	end

VictoryRoadJuggler2F2:
	trainer JUGGLER, JUGGLER_VICTORYROAD_2F_2, EVENT_BEAT_VICTORY_ROAD_TRAINER_4, VictoryRoadJuggler2F2SeenText, VictoryRoadJuggler2F2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadJuggler2F2AfterBattleText
	waitbutton
	closetext
	end

VictoryRoadPokemaniac2F:
	trainer POKEMANIAC, POKEMANIAC_VICTORYROAD_2F, EVENT_BEAT_VICTORY_ROAD_TRAINER_5, VictoryRoadPokemaniac2FSeenText, VictoryRoadPokemaniac2FBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadPokemaniac2FAfterBattleText
	waitbutton
	closetext
	end

VictoryRoadJuggler2F3:
	trainer JUGGLER, JUGGLER_VICTORYROAD_2F_3, EVENT_BEAT_VICTORY_ROAD_TRAINER_6, VictoryRoadJuggler2F3SeenText, VictoryRoadJuggler2F3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadJuggler2F3AfterBattleText
	waitbutton
	closetext
	end

VictoryRoadCooltrainerM3F1:
	trainer COOLTRAINERM, COOLTRAINERM_VICTORYROAD_3F_1, EVENT_BEAT_VICTORY_ROAD_TRAINER_7, VictoryRoadCooltrainerM3F1SeenText, VictoryRoadCooltrainerM3F1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadCooltrainerM3F1AfterBattleText
	waitbutton
	closetext
	end

VictoryRoadCooltrainerF3F1:
	trainer COOLTRAINERF, COOLTRAINERF_VICTORYROAD_3F_1, EVENT_BEAT_VICTORY_ROAD_TRAINER_8, VictoryRoadCooltrainerF3F1SeenText, VictoryRoadCooltrainerF3F1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadCooltrainerF3F1AfterBattleText
	waitbutton
	closetext
	end

VictoryRoadCooltrainerM3F2:
	trainer COOLTRAINERM, COOLTRAINERM_VICTORYROAD_3F_2, EVENT_BEAT_VICTORY_ROAD_TRAINER_9, VictoryRoadCooltrainerM3F2SeenText, VictoryRoadCooltrainerM3F2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadCooltrainerM3F2AfterBattleText
	waitbutton
	closetext
	end

VictoryRoadCooltrainerF3F2:
	trainer COOLTRAINERF, COOLTRAINERF_VICTORYROAD_3F_2, EVENT_BEAT_VICTORY_ROAD_TRAINER_10, VictoryRoadCooltrainerF3F2SeenText, VictoryRoadCooltrainerF3F2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VictoryRoadCooltrainerF3F2AfterBattleText
	waitbutton
	closetext
	end

VictoryRoadCooltrainerF1FSeenText:
	text "So you made it"
	line "in here! Not"
	cont "many do!"
	done

VictoryRoadCooltrainerF1FBeatenText:
	text "Oh well!"
	done

VictoryRoadCooltrainerF1FAfterBattleText:
	text "Keep climbing,"
	line "the CHAMPION is"
	cont "waiting up top!"
	done

VictoryRoadCooltrainerM1FSeenText:
	text "This cave tests"
	line "more than just"
	cont "your #MON!"
	done

VictoryRoadCooltrainerM1FBeatenText:
	text "Not bad!"
	done

VictoryRoadCooltrainerM1FAfterBattleText:
	text "The rocks never"
	line "stop rolling in"
	cont "here, watch out!"
	done

VictoryRoadBlackbelt2FSeenText:
	text "Strength alone"
	line "won't get you"
	cont "through here!"
	done

VictoryRoadBlackbelt2FBeatenText:
	text "Impressive!"
	done

VictoryRoadBlackbelt2FAfterBattleText:
	text "Train hard, the"
	line "summit is close"
	cont "now!"
	done

VictoryRoadJuggler2F1SeenText:
	text "My #MON read"
	line "your every move!"
	done

VictoryRoadJuggler2F1BeatenText:
	text "Unbelievable!"
	done

VictoryRoadJuggler2F1AfterBattleText:
	text "A true #MON"
	line "master sees all!"
	done

VictoryRoadJuggler2F2SeenText:
	text "Watch my hands,"
	line "not my #MON!"
	done

VictoryRoadJuggler2F2BeatenText:
	text "A clean miss!"
	done

VictoryRoadJuggler2F2AfterBattleText:
	text "Even tricks fail"
	line "against skill!"
	done

VictoryRoadPokemaniac2FSeenText:
	text "I study #MON"
	line "here in the"
	cont "dark!"
	done

VictoryRoadPokemaniac2FBeatenText:
	text "Fascinating!"
	done

VictoryRoadPokemaniac2FAfterBattleText:
	text "A LAPRAS lives"
	line "somewhere in"
	cont "this cave!"
	done

VictoryRoadJuggler2F3SeenText:
	text "Can you keep up"
	line "with my MR.MIME?"
	done

VictoryRoadJuggler2F3BeatenText:
	text "It mimicked"
	line "defeat!"
	done

VictoryRoadJuggler2F3AfterBattleText:
	text "Practice makes"
	line "perfect, they"
	cont "say!"
	done

VictoryRoadCooltrainerM3F1SeenText:
	text "The top floor is"
	line "no place for the"
	cont "weak!"
	done

VictoryRoadCooltrainerM3F1BeatenText:
	text "You're strong!"
	done

VictoryRoadCooltrainerM3F1AfterBattleText:
	text "The CHAMPION"
	line "awaits beyond"
	cont "this cave!"
	done

VictoryRoadCooltrainerF3F1SeenText:
	text "Few #MON trainers"
	line "reach this high!"
	done

VictoryRoadCooltrainerF3F1BeatenText:
	text "So close!"
	done

VictoryRoadCooltrainerF3F1AfterBattleText:
	text "You have what it"
	line "takes to go all"
	cont "the way!"
	done

VictoryRoadCooltrainerM3F2SeenText:
	text "One last test"
	line "before the exit!"
	done

VictoryRoadCooltrainerM3F2BeatenText:
	text "Well fought!"
	done

VictoryRoadCooltrainerM3F2AfterBattleText:
	text "INDIGO PLATEAU"
	line "is just ahead!"
	done

VictoryRoadCooltrainerF3F2SeenText:
	text "This is the last"
	line "gauntlet before"
	cont "the exit!"
	done

VictoryRoadCooltrainerF3F2BeatenText:
	text "You win!"
	done

VictoryRoadCooltrainerF3F2AfterBattleText:
	text "Good luck at the"
	line "POKEMON LEAGUE!"
	done

VictoryRoadHiddenGuardSpec:
	hiddenitem GUARD_SPEC, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

VictoryRoad_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 67, VICTORY_ROAD_GATE, 5
	warp_event  1, 49, VICTORY_ROAD, 3
	warp_event  1, 35, VICTORY_ROAD, 2
	warp_event 13, 31, VICTORY_ROAD, 5
	warp_event 13, 17, VICTORY_ROAD, 4
	warp_event 17, 33, VICTORY_ROAD, 7
	warp_event 17, 19, VICTORY_ROAD, 6
	warp_event  0, 11, VICTORY_ROAD, 9
	warp_event  0, 27, VICTORY_ROAD, 8
	warp_event 13,  5, ROUTE_23, 3

	def_coord_events

	def_bg_events
	bg_event  3, 29, BGEVENT_ITEM, VictoryRoadHiddenGuardSpec
	bg_event  3, 65, BGEVENT_ITEM, VictoryRoadHiddenMaxRevive
	bg_event 12, 48, BGEVENT_ITEM, VictoryRoadRareCandy
	bg_event 15, 48, BGEVENT_ITEM, VictoryRoadFullHeal

	def_object_events
	object_event 18, 13, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadMoltres, EVENT_BEAT_MOLTRES
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMSkyAttack, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMSubmission, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMExplosion, EVENT_VICTORY_ROAD_HP_UP
	object_event  4,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadCooltrainerF1F, -1
	object_event  9,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadCooltrainerM1F, -1
	object_event 12,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadBlackbelt2F, -1
	object_event 13, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, VictoryRoadJuggler2F1, -1
	object_event 16, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadJuggler2F2, -1
	object_event  5, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, VictoryRoadPokemaniac2F, -1
	object_event 10, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, VictoryRoadJuggler2F3, -1
	object_event 11, 61, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadCooltrainerM3F1, -1
	object_event  7, 62, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadCooltrainerF3F1, -1
	object_event 12, 64, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadCooltrainerM3F2, -1
	object_event 11, 66, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, VictoryRoadCooltrainerF3F2, -1
