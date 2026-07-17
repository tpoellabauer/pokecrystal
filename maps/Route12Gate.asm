	object_const_def
	const ROUTE12GATE_GUARD

Route12Gate_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1's Route12Gate is a 2-floor building (Route12Gate1F guard + Route12Gate2F lookout:
; a TM39 SWIFT giveaway NPC and binocular flavor signs --
; pokeredDisassembly/data/maps/{headers,objects}/Route12Gate2F.asm). Simplified to a
; single-room north<->south pass-through for issue #77 (guard NPC + 4 through-warps), same
; idiom this port already uses for ROUTE_16_GATE (see parity_static.py's
; _WARP_ALIAS_GROUPS). Reuses Route2Gate's north-south TILESET_GEN1_GATE block layout
; (same door shape Gen1's own Route12Gate1F needs: 2 doors north, 1 shared door south).
; Gen1's guard line references the (unported) upstairs lookout, so the flavor text below
; is adapted to reference ROUTE_12's own sleeping Snorlax (EVENT_ROUTE_12_SNORLAX, already
; ported on Route12.asm) instead.
Route12GateGuardScript:
	jumptextfaceplayer Route12GateGuardText

Route12GateGuardText:
	text "Careful up ahead,"
	line "there's a huge"
	cont "#MON asleep"
	cont "right on the road!"
	done

Route12Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_12, 2
	warp_event  5,  0, ROUTE_12, 3
	warp_event  4,  7, ROUTE_12, 4
	warp_event  5,  7, ROUTE_12, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route12GateGuardScript, -1
