	object_const_def
	const ROUTE23_EARTH_GUARD
	const ROUTE23_VOLCANO_GUARD
	const ROUTE23_MARSH_GUARD
	const ROUTE23_SOUL_GUARD
	const ROUTE23_RAINBOW_GUARD
	const ROUTE23_THUNDER_GUARD
	const ROUTE23_CASCADE_GUARD

Route23_MapScripts:
	def_scene_scripts
	scene_script Route23Noop1Scene, SCENE_ROUTE23_CASCADE_CHECK
	scene_script Route23Noop2Scene, SCENE_ROUTE23_THUNDER_CHECK
	scene_script Route23Noop3Scene, SCENE_ROUTE23_RAINBOW_CHECK
	scene_script Route23Noop4Scene, SCENE_ROUTE23_SOUL_CHECK
	scene_script Route23Noop5Scene, SCENE_ROUTE23_MARSH_CHECK
	scene_script Route23Noop6Scene, SCENE_ROUTE23_VOLCANO_CHECK
	scene_script Route23Noop7Scene, SCENE_ROUTE23_EARTH_CHECK
	scene_script Route23Noop8Scene, SCENE_ROUTE23_DONE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route23FlypointCallback

Route23Noop1Scene:
Route23Noop2Scene:
Route23Noop3Scene:
Route23Noop4Scene:
Route23Noop5Scene:
Route23Noop6Scene:
Route23Noop7Scene:
Route23Noop8Scene:
	end

Route23FlypointCallback:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	endcallback

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

; Gen 1 Route 23 sign, at the foot of the badge checkpoints (pokered text/Route23.asm).
Route23VictoryRoadGateSign:
	jumptext Route23VictoryRoadGateSignText

Route23VictoryRoadGateSignText:
	text "VICTORY ROAD GATE"
	line "- #MON LEAGUE"
	done

IndigoPlateauSignText:
	text "INDIGO PLATEAU"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#MON LEAGUE HQ"
	done

; Gen 1: Route 23 is the 7-guard progressive-badge gauntlet blocking the final approach to the
; #MON League (pokeredDisassembly/scripts/Route23.asm) -- one guard per Kanto badge, checked in
; the order a player earns them (Cascade..Earth; Boulder isn't checked, same as Gen 1, since it's
; the very first gym). The gauntlet corridor matches Gen 1's Route23 (10x72) closely enough that
; Gen 1's real guard Y-coordinates are reused directly and verified walkable in PyBoy; the map's
; League approach, however, uses GSC topology (warps to VICTORY_ROAD / INDIGO_PLATEAU_POKECENTER_1F,
; NOT Gen 1's map-edge connections + ROUTE_22_GATE -- see issue #43 / the parity whitelist), so the
; .blk is NOT byte-identical to Gen 1's. Simplified from Gen 1's raw per-step
; wYCoord auto-block (bespoke asm, no Gen 2 macro equivalent -- see maps-and-scripting skill) to
; the established Gen 2 idiom instead (precedent: VictoryRoadGate's coord_event/scene gate): each
; guard is a solid, badge-gated NPC with its own coord_event one tile south of it (so a
; north-bound player is caught even before reaching the guard's tile), and each guard vanishes
; (disappear + a persistent EVENT_* flag) once passed so the corridor actually opens up. Guards
; use SPRITE_OFFICER for Gen 1's SPRITE_GUARD (precedent: Route6SaffronGate/Route7SaffronGate) and
; SPRITE_SWIMMER_GUY for Gen 1's unisex SPRITE_SWIMMER (precedent noted in maps-and-scripting
; skill). Badges checked via `checkflag ENGINE_*BADGE` (the Kanto badge idiom used by every ported
; Kanto gym, e.g. ViridianGym.asm's `checkflag ENGINE_EARTHBADGE`) -- NOT Johto's VAR_BADGES/
; VictoryRoadGate gate, which is untouched.

Route23GuardStepBackMovement:
	step DOWN
	step_end

Route23CascadeGuardScript:
	faceplayer
_Route23CascadeGuardScript:
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .Pass
	writetext Route23CascadeBadgeNeededText
	waitbutton
	closetext
	applymovement PLAYER, Route23GuardStepBackMovement
	end
.Pass:
	writetext Route23CascadeBadgeOkText
	waitbutton
	closetext
	disappear ROUTE23_CASCADE_GUARD
	setevent EVENT_ROUTE23_PASSED_CASCADE_GUARD
	setscene SCENE_ROUTE23_THUNDER_CHECK
	end

Route23CascadeGuardCoordScript:
	turnobject PLAYER, UP
	sjump _Route23CascadeGuardScript

Route23ThunderGuardScript:
	faceplayer
_Route23ThunderGuardScript:
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .Pass
	writetext Route23ThunderBadgeNeededText
	waitbutton
	closetext
	applymovement PLAYER, Route23GuardStepBackMovement
	end
.Pass:
	writetext Route23ThunderBadgeOkText
	waitbutton
	closetext
	disappear ROUTE23_THUNDER_GUARD
	setevent EVENT_ROUTE23_PASSED_THUNDER_GUARD
	setscene SCENE_ROUTE23_RAINBOW_CHECK
	end

Route23ThunderGuardCoordScript:
	turnobject PLAYER, UP
	sjump _Route23ThunderGuardScript

Route23RainbowGuardScript:
	faceplayer
_Route23RainbowGuardScript:
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Pass
	writetext Route23RainbowBadgeNeededText
	waitbutton
	closetext
	applymovement PLAYER, Route23GuardStepBackMovement
	end
.Pass:
	writetext Route23RainbowBadgeOkText
	waitbutton
	closetext
	disappear ROUTE23_RAINBOW_GUARD
	setevent EVENT_ROUTE23_PASSED_RAINBOW_GUARD
	setscene SCENE_ROUTE23_SOUL_CHECK
	end

Route23RainbowGuardCoordScript:
	turnobject PLAYER, UP
	sjump _Route23RainbowGuardScript

Route23SoulGuardScript:
	faceplayer
_Route23SoulGuardScript:
	opentext
	checkflag ENGINE_SOULBADGE
	iftrue .Pass
	writetext Route23SoulBadgeNeededText
	waitbutton
	closetext
	applymovement PLAYER, Route23GuardStepBackMovement
	end
.Pass:
	writetext Route23SoulBadgeOkText
	waitbutton
	closetext
	disappear ROUTE23_SOUL_GUARD
	setevent EVENT_ROUTE23_PASSED_SOUL_GUARD
	setscene SCENE_ROUTE23_MARSH_CHECK
	end

Route23SoulGuardCoordScript:
	turnobject PLAYER, UP
	sjump _Route23SoulGuardScript

Route23MarshGuardScript:
	faceplayer
_Route23MarshGuardScript:
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .Pass
	writetext Route23MarshBadgeNeededText
	waitbutton
	closetext
	applymovement PLAYER, Route23GuardStepBackMovement
	end
.Pass:
	writetext Route23MarshBadgeOkText
	waitbutton
	closetext
	disappear ROUTE23_MARSH_GUARD
	setevent EVENT_ROUTE23_PASSED_MARSH_GUARD
	setscene SCENE_ROUTE23_VOLCANO_CHECK
	end

Route23MarshGuardCoordScript:
	turnobject PLAYER, UP
	sjump _Route23MarshGuardScript

Route23VolcanoGuardScript:
	faceplayer
_Route23VolcanoGuardScript:
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .Pass
	writetext Route23VolcanoBadgeNeededText
	waitbutton
	closetext
	applymovement PLAYER, Route23GuardStepBackMovement
	end
.Pass:
	writetext Route23VolcanoBadgeOkText
	waitbutton
	closetext
	disappear ROUTE23_VOLCANO_GUARD
	setevent EVENT_ROUTE23_PASSED_VOLCANO_GUARD
	setscene SCENE_ROUTE23_EARTH_CHECK
	end

Route23VolcanoGuardCoordScript:
	turnobject PLAYER, UP
	sjump _Route23VolcanoGuardScript

Route23EarthGuardScript:
	faceplayer
_Route23EarthGuardScript:
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .Pass
	writetext Route23EarthBadgeNeededText
	waitbutton
	closetext
	applymovement PLAYER, Route23GuardStepBackMovement
	end
.Pass:
	writetext Route23EarthBadgeOkText
	waitbutton
	closetext
	disappear ROUTE23_EARTH_GUARD
	setevent EVENT_ROUTE23_PASSED_EARTH_GUARD
	setscene SCENE_ROUTE23_DONE
	end

Route23EarthGuardCoordScript:
	turnobject PLAYER, UP
	sjump _Route23EarthGuardScript

Route23CascadeBadgeNeededText:
	text "You don't have"
	line "the CASCADEBADGE"
	cont "yet."

	para "Come back once"
	line "you've earned it!"
	done

Route23CascadeBadgeOkText:
	text "Oh! You have the"
	line "CASCADEBADGE!"

	para "Go right ahead!"
	done

Route23ThunderBadgeNeededText:
	text "You don't have"
	line "the THUNDERBADGE"
	cont "yet."

	para "Come back once"
	line "you've earned it!"
	done

Route23ThunderBadgeOkText:
	text "Oh! You have the"
	line "THUNDERBADGE!"

	para "Go right ahead!"
	done

Route23RainbowBadgeNeededText:
	text "You don't have"
	line "the RAINBOWBADGE"
	cont "yet."

	para "Come back once"
	line "you've earned it!"
	done

Route23RainbowBadgeOkText:
	text "Oh! You have the"
	line "RAINBOWBADGE!"

	para "Go right ahead!"
	done

Route23SoulBadgeNeededText:
	text "You don't have"
	line "the SOULBADGE"
	cont "yet."

	para "Come back once"
	line "you've earned it!"
	done

Route23SoulBadgeOkText:
	text "Oh! You have the"
	line "SOULBADGE!"

	para "Go right ahead!"
	done

Route23MarshBadgeNeededText:
	text "You don't have"
	line "the MARSHBADGE"
	cont "yet."

	para "Come back once"
	line "you've earned it!"
	done

Route23MarshBadgeOkText:
	text "Oh! You have the"
	line "MARSHBADGE!"

	para "Go right ahead!"
	done

Route23VolcanoBadgeNeededText:
	text "You don't have"
	line "the VOLCANOBADGE"
	cont "yet."

	para "Come back once"
	line "you've earned it!"
	done

Route23VolcanoBadgeOkText:
	text "Oh! You have the"
	line "VOLCANOBADGE!"

	para "Go right ahead!"
	done

Route23EarthBadgeNeededText:
	text "You don't have"
	line "the EARTHBADGE"
	cont "yet."

	para "Come back once"
	line "you've earned it!"
	done

Route23EarthBadgeOkText:
	text "Oh! You have the"
	line "EARTHBADGE!"

	para "Go right ahead!"
	done

Route23_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 10,  5, INDIGO_PLATEAU_POKECENTER_1F, 2
	warp_event  9, 13, VICTORY_ROAD, 10
	warp_event 10, 13, VICTORY_ROAD, 10

	def_coord_events
	coord_event  8, 137, SCENE_ROUTE23_CASCADE_CHECK, Route23CascadeGuardCoordScript
	coord_event  8, 120, SCENE_ROUTE23_THUNDER_CHECK, Route23ThunderGuardCoordScript
	coord_event 12, 106, SCENE_ROUTE23_RAINBOW_CHECK, Route23RainbowGuardCoordScript
	coord_event 11, 97, SCENE_ROUTE23_SOUL_CHECK, Route23SoulGuardCoordScript
	coord_event  8, 86, SCENE_ROUTE23_MARSH_CHECK, Route23MarshGuardCoordScript
	coord_event 10, 57, SCENE_ROUTE23_VOLCANO_CHECK, Route23VolcanoGuardCoordScript
	coord_event  4, 36, SCENE_ROUTE23_EARTH_CHECK, Route23EarthGuardCoordScript

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, IndigoPlateauSign
	bg_event  3, 33, BGEVENT_READ, Route23VictoryRoadGateSign

	def_object_events
	object_event  4, 35, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23EarthGuardScript, EVENT_ROUTE23_PASSED_EARTH_GUARD
	object_event 10, 56, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23VolcanoGuardScript, EVENT_ROUTE23_PASSED_VOLCANO_GUARD
	object_event  8, 85, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23MarshGuardScript, EVENT_ROUTE23_PASSED_MARSH_GUARD
	object_event 11, 96, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23SoulGuardScript, EVENT_ROUTE23_PASSED_SOUL_GUARD
	object_event 12, 105, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23RainbowGuardScript, EVENT_ROUTE23_PASSED_RAINBOW_GUARD
	object_event  8, 119, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23ThunderGuardScript, EVENT_ROUTE23_PASSED_THUNDER_GUARD
	object_event  8, 136, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23CascadeGuardScript, EVENT_ROUTE23_PASSED_CASCADE_GUARD
