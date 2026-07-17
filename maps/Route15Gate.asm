	object_const_def
	const ROUTE15GATE_GUARD

Route15Gate_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1's Route15Gate is a 2-floor building (Route15Gate1F guard + Route15Gate2F lookout:
; an Oak's Aide EXP.ALL reward and a binocular flavor sign --
; pokeredDisassembly/data/maps/{headers,objects}/Route15Gate2F.asm). Simplified to a
; single-room west<->east pass-through for issue #77 (guard NPC + 4 through-warps), same
; idiom this port already uses for ROUTE_16_GATE (see parity_static.py's
; _WARP_ALIAS_GROUPS). The 2F content is a reasonable follow-up, not required by the
; route<->gate warp parity this issue closes.
Route15GateGuardScript:
	jumptextfaceplayer Route15GateGuardText

Route15GateGuardText:
	text "Are you working"
	line "on a #DEX?"

	para "PROF.OAK's AIDE"
	line "came by here."
	done

Route15Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_15, 1
	warp_event  0,  5, ROUTE_15, 2
	warp_event  9,  4, ROUTE_15, 3
	warp_event  9,  5, ROUTE_15, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15GateGuardScript, -1
