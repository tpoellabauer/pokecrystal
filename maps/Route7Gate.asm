	object_const_def
	const ROUTE7GATE_GUARD

Route7Gate_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1's Route7Gate (a mid-route pass-through building on ROUTE_7, distinct from this
; port's ROUTE_7_SAFFRON_GATE which sits at ROUTE_7's Saffron-adjacent edge) implements
; the classic "give the Saffron perimeter guards a drink" tripwire script: a per-step
; coordinate check, a shared BIT_GAVE_SAFFRON_GUARDS_DRINK flag, and vending-machine item
; consumption (pokeredDisassembly/scripts/Route7Gate.asm, farcall RemoveGuardDrink). That
; quest spans all four Saffron-perimeter gates (Route5/6/7/8Gate) and hasn't been ported
; anywhere in this project (ROUTE_7_SAFFRON_GATE already reuses a different, simpler
; machine-part sidequest for its own guard -- see maps/Route7SaffronGate.asm). Porting the
; full drink-bribe mechanic is out of scope for issue #77 ("guard NPC + 4 through-warps");
; this guard is a talk-triggered flavor NPC only, same idiom as Route11Gate/Route12Gate/
; Route15Gate.
Route7GateGuardScript:
	jumptextfaceplayer Route7GateGuardText

Route7GateGuardText:
	text "I'm on guard duty"
	line "here on ROUTE 7."

	para "Not much happens,"
	line "but it's a nice"
	cont "spot for a rest."
	done

Route7Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_7, 3
	warp_event  0,  5, ROUTE_7, 4
	warp_event  9,  4, ROUTE_7, 5
	warp_event  9,  5, ROUTE_7, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7GateGuardScript, -1
