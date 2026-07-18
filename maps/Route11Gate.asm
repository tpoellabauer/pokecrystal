	object_const_def
	const ROUTE11GATE_GUARD

Route11Gate_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1's Route11Gate is a 2-floor building (Route11Gate1F guard + Route11Gate2F lookout:
; an Oak's Aide ITEMFINDER reward, an in-game trade NPC, and binocular flavor signs --
; pokeredDisassembly/data/maps/{headers,objects}/Route11Gate2F.asm). Simplified to a
; single-room west<->east pass-through for issue #77 (guard NPC + 4 through-warps), same
; idiom this port already uses for ROUTE_16_GATE (Gen1's 2-floor Route16Gate1F/2F ->
; single-room pass-through, see parity_static.py's _WARP_ALIAS_GROUPS). The 2F content is
; a reasonable follow-up, not required by the route<->gate warp parity this issue closes.
Route11GateGuardScript:
	jumptextfaceplayer Route11GateGuardText

Route11GateGuardText:
	text "When you catch"
	line "lots of #MON,"
	cont "isn't it hard to"
	cont "think up names?"

	para "In LAVENDER TOWN,"
	line "there's a man who"
	cont "rates #MON"
	cont "nicknames."

	para "He'll help you"
	line "rename them too!"
	done

Route11Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_11, 2
	warp_event  0,  5, ROUTE_11, 3
	warp_event  9,  4, ROUTE_11, 4
	warp_event  9,  5, ROUTE_11, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11GateGuardScript, -1
