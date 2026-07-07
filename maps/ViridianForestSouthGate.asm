	object_const_def
	const VIRIDIANFORESTSOUTHGATE_GIRL
	const VIRIDIANFORESTSOUTHGATE_LITTLE_GIRL

; Gen 1 Viridian Forest south gate, ported from pokered
; data/maps/objects/ViridianForestSouthGate.asm.
ViridianForestSouthGate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestSouthGateGirlScript:
	jumptextfaceplayer ViridianForestSouthGateGirlText

ViridianForestSouthGateLittleGirlScript:
	jumptextfaceplayer ViridianForestSouthGateLittleGirlText

ViridianForestSouthGateGirlText:
	text "Are you going to"
	line "VIRIDIAN FOREST?"
	cont "Be careful, it's"
	cont "a natural maze!"
	done

ViridianForestSouthGateLittleGirlText:
	text "RATTATA may be"
	line "small, but its"
	cont "bite is wicked!"
	cont "Did you get one?"
	done

ViridianForestSouthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; South (Route 2) side; Route2's warp list gains 3 entries appended after its
	; existing 5, so this gate's slot there is #8, not Gen1's "6".
	warp_event  4,  0, VIRIDIAN_FOREST, 4
	warp_event  5,  0, VIRIDIAN_FOREST, 5
	warp_event  4,  7, ROUTE_2, 8
	warp_event  5,  7, ROUTE_2, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestSouthGateGirlScript, -1
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestSouthGateLittleGirlScript, -1
