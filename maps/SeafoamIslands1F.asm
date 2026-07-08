; Seafoam Islands 1F
; Gen 1 source: pokeredDisassembly/scripts/SeafoamIslands1F.asm
; Gen 1's 2 boulders here are an optional shortcut (push into a hole to drop to B1F) -- floor
; connectivity down to B1F already exists via 3 plain warps below (matching Gen 1's own object
; data), so this optional puzzle is skipped rather than reimplementing Gen 1's bespoke
; boulder-relay-between-floors mechanic (raw dungeon-warp asm with no Gen 2 macro equivalent).
; The one MANDATORY boulder puzzle (blocking Articuno) is preserved on SeafoamIslandsB4F.asm.

SeafoamIslands1F_MapScripts:
	def_scene_scripts

	def_callbacks

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
