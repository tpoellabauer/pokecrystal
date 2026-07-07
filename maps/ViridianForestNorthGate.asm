	object_const_def
	const VIRIDIANFORESTNORTHGATE_SUPER_NERD
	const VIRIDIANFORESTNORTHGATE_GRAMPS

; Gen 1 Viridian Forest north gate, ported from pokered
; data/maps/objects/ViridianForestNorthGate.asm.
ViridianForestNorthGate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestNorthGateSuperNerdScript:
	jumptextfaceplayer ViridianForestNorthGateSuperNerdText

ViridianForestNorthGateGrampsScript:
	jumptextfaceplayer ViridianForestNorthGateGrampsText

ViridianForestNorthGateSuperNerdText:
	text "Many #MON live"
	line "only in forests"
	cont "and caves."

	para "You need to look"
	line "everywhere to get"
	cont "different kinds!"
	done

ViridianForestNorthGateGrampsText:
	text "Have you noticed"
	line "the bushes on the"
	cont "roadside?"

	para "They can be cut"
	line "down by a special"
	cont "#MON move."
	done

ViridianForestNorthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; South (Route 2) side; Route2's warp list gains 3 entries appended after its
	; existing 5, so this gate's slot there is #6, not Gen1's "2".
	warp_event  4,  0, ROUTE_2, 6
	warp_event  5,  0, ROUTE_2, 6
	warp_event  4,  7, VIRIDIAN_FOREST, 1
	warp_event  5,  7, VIRIDIAN_FOREST, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianForestNorthGateSuperNerdScript, -1
	object_event  2,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestNorthGateGrampsScript, -1
