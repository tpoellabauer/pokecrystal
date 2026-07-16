; Seafoam Islands B2F
; Gen 1 source: pokeredDisassembly/scripts/SeafoamIslandsB2F.asm
; Boulders ported as plain Gen 2 STRENGTH boulders, no floor-relay gate -- see SeafoamIslands1F.asm.

	object_const_def
	const SEAFOAMISLANDSB2F_BOULDER1
	const SEAFOAMISLANDSB2F_BOULDER2

SeafoamIslandsB2F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB2FBoulder:
	jumpstd StrengthBoulderScript

SeafoamIslandsB2FHiddenNugget:
	hiddenitem NUGGET, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_NUGGET

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  3, SEAFOAM_ISLANDS_B1F, 1
	warp_event  5, 13, SEAFOAM_ISLANDS_B3F, 1
	warp_event 13,  7, SEAFOAM_ISLANDS_B1F, 3
	warp_event 19, 15, SEAFOAM_ISLANDS_B1F, 4
	warp_event 25,  3, SEAFOAM_ISLANDS_B3F, 4
	warp_event 25, 11, SEAFOAM_ISLANDS_B1F, 6
	warp_event 25, 14, SEAFOAM_ISLANDS_B3F, 5

	def_coord_events

	def_bg_events
	bg_event 15, 15, BGEVENT_ITEM, SeafoamIslandsB2FHiddenNugget

	def_object_events
	object_event 18,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, -1
	object_event 23,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, -1
