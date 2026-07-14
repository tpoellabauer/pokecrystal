; Seafoam Islands 1F
; Gen 1 source: pokeredDisassembly/scripts/SeafoamIslands1F.asm
; Gen 1's 2 boulders here feed an optional shortcut (push one into a hole to drop it to B1F).
; That boulder-relay-between-floors mechanic is bespoke raw dungeon-warp asm with no Gen 2 macro
; equivalent, so the boulders are ported as ordinary Gen 2 STRENGTH boulders -- present, pushable,
; at the Gen 1 coordinates -- but nothing is gated on them: floor connectivity down to B1F already
; exists via the plain warps below (matching Gen 1's own object data).

	object_const_def
	const SEAFOAMISLANDS1F_BOULDER1
	const SEAFOAMISLANDS1F_BOULDER2

SeafoamIslands1F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslands1FBoulder:
	jumpstd StrengthBoulderScript

SeafoamIslands1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ROUTE_20, 2
	warp_event  5, 17, ROUTE_20, 2
	warp_event 26, 17, ROUTE_20, 3
	warp_event 27, 17, ROUTE_20, 3
	warp_event  7,  5, SEAFOAM_ISLANDS_B1F, 2
	warp_event 25,  3, SEAFOAM_ISLANDS_B1F, 7
	warp_event 23, 15, SEAFOAM_ISLANDS_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event 18, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslands1FBoulder, -1
	object_event 26,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslands1FBoulder, -1
