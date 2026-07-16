; Seafoam Islands B3F
; Gen 1 source: pokeredDisassembly/scripts/SeafoamIslandsB3F.asm
; Optional boulder shortcut skipped -- see SeafoamIslands1F.asm's note. B4F is already directly
; reachable via 4 of the plain warps below (matching Gen 1's own object data).

SeafoamIslandsB3F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB3FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_SEAFOAM_ISLANDS_B3F_HIDDEN_MAX_ELIXER

SeafoamIslandsB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 12, SEAFOAM_ISLANDS_B2F, 2
	warp_event  8,  6, SEAFOAM_ISLANDS_B4F, 3
	warp_event 25,  4, SEAFOAM_ISLANDS_B4F, 4
	warp_event 25,  3, SEAFOAM_ISLANDS_B2F, 5
	warp_event 25, 14, SEAFOAM_ISLANDS_B2F, 7
	warp_event 20, 17, SEAFOAM_ISLANDS_B4F, 1
	warp_event 21, 17, SEAFOAM_ISLANDS_B4F, 2

	def_coord_events

	def_bg_events
	bg_event  9, 16, BGEVENT_ITEM, SeafoamIslandsB3FHiddenMaxElixer

	def_object_events
