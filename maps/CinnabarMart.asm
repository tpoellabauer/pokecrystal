	object_const_def
	const CINNABARMART_CLERK
	const CINNABARMART_SILPH_WORKER_F
	const CINNABARMART_SCIENTIST

; Gen 1 Cinnabar Mart, ported from pokered data/maps/objects/CinnabarMart.asm. No
; MART_CINNABAR entry exists in data/items/marts.asm (an order-sensitive table with no
; wizard yet, unlike the item/trainer wizards -- see CLAUDE.md "do not hand-edit the
; append-only tables"), so the clerk is flavor-only for now instead of a working
; `pokemart`; wiring a real shelf is a follow-up once a marts-table wizard exists.
CinnabarMart_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarMartClerkScript:
	jumptextfaceplayer CinnabarMartClerkText

CinnabarMartSilphWorkerFScript:
	jumptextfaceplayer CinnabarMartSilphWorkerFText

CinnabarMartScientistScript:
	jumptextfaceplayer CinnabarMartScientistText

CinnabarMartClerkText:
	text "Welcome!"

	para "We're still"
	line "restocking after"
	cont "the eruption --"
	cont "sorry for the wait!"
	done

CinnabarMartSilphWorkerFText:
	text "Don't they have X"
	line "ATTACK? It's good"
	cont "for battles!"
	done

CinnabarMartScientistText:
	text "It never hurts to"
	line "have extra items!"
	done

CinnabarMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; Front door; CinnabarIsland's warp list gains 3 entries (gym/lab/mart) appended
	; after its existing 2, so this map's own slot there is #5, not Gen1's "5" by
	; coincidence (Gen1 CinnabarIsland's own list also had mart last, at #5).
	warp_event  3,  7, CINNABAR_ISLAND, 5
	warp_event  4,  7, CINNABAR_ISLAND, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarMartClerkScript, -1
	object_event  6,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarMartSilphWorkerFScript, -1
	object_event  3,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarMartScientistScript, -1
