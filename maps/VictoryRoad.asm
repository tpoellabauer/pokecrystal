	object_const_def
	const VICTORYROAD_MOLTRES
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5

; Gen 1 Victory Road has no rival battle (that's Johto-only content) -- just items + a Moltres
; static encounter. Ported from pokered scripts/VictoryRoad{1F,2F,3F}.asm's item/Moltres data
; (the 3 Gen1 floors are merged into this single Gen2 map). Dropped the forced rival ambush
; entirely (matches Red exactly, no equivalent to simplify into); Moltres reuses the ambush's
; old (18, 13) coordinate (already Johto-verified walkable) rather than a new guessed spot.
; Gen1's boulder-relay puzzle (switch-triggered tile swaps + dungeon-warp holes across floors,
; scripts/VictoryRoad{1,2,3}F.asm) has no Gen 2 macro equivalent (same class of bespoke
; forced-movement puzzle as Seafoam's, see maps-and-scripting skill) and is skipped; none of the
; 3 floors' warps require it for traversal in Gen1 either. Gen1's 9 Victory Road trainers
; (2x Cooltrainer 1F, Hiker+2x Super Nerd+Cooltrainer_M 2F, 4x Cooltrainer 3F) are not yet
; placed -- this merged map's geometry doesn't match Gen1's 3 floors 1:1, so new trainer spots
; need Polished Map coordinate verification first (see REACHING_PARITY.md).
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
	itemball RARE_CANDY

VictoryRoadTMSubmission:
	itemball TM_DYNAMICPUNCH

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadTMExplosion:
	itemball FULL_RESTORE

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

	def_object_events
	object_event 18, 13, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadMoltres, EVENT_BEAT_MOLTRES
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMSkyAttack, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadRareCandy, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMSubmission, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMExplosion, EVENT_VICTORY_ROAD_HP_UP
