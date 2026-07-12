	object_const_def
	const MUSEUM1F_SCIENTIST1
	const MUSEUM1F_GAMBLER
	const MUSEUM1F_SCIENTIST2
	const MUSEUM1F_SCIENTIST3

Museum1F_MapScripts:
	def_scene_scripts

	def_callbacks

; Minimal viable port of Gen 1's PEWTER_CITY museum (structural-bug fix, see
; docs/DIVERGENCE_BACKLOG.md Bug 1). Gen 1's Scientist1 gate-keeps entry
; behind a 50-coin ticket purchase and its Scientist2 hands over OLD_AMBER
; (no Gen 2 item/event-flag equivalent exists yet); both are simplified to
; flavor-only dialogue here. The upstairs fossil hall (MUSEUM_2F) and its Old
; Amber pickup are not ported — follow-up scope, not part of this fix.
Museum1FScientist1Script:
	jumptextfaceplayer Museum1FScientist1Text

Museum1FGamblerScript:
	jumptextfaceplayer Museum1FGamblerText

Museum1FScientist2Script:
	jumptextfaceplayer Museum1FScientist2Text

Museum1FScientist3Script:
	jumptextfaceplayer Museum1FScientist3Text

Museum1FScientist1Text:
	text "Welcome to the"
	line "PEWTER MUSEUM of"
	cont "SCIENCE!"

	para "Take plenty of"
	line "time to look"
	cont "around!"
	done

Museum1FGamblerText:
	text "That is one"
	line "magnificent"
	cont "fossil!"
	done

Museum1FScientist2Text:
	text "Ssh! I think that"
	line "this chunk of"
	cont "AMBER contains"
	cont "#MON DNA!"

	para "It would be great"
	line "if #MON could"
	cont "be resurrected"
	cont "from it!"
	done

Museum1FScientist3Text:
	text "We are proud of 2"
	line "fossils of very"
	cont "rare, prehistoric"
	cont "#MON!"
	done

Museum1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 6
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FScientist1Script, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Museum1FGamblerScript, -1
	object_event 15,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FScientist2Script, -1
	object_event 17,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FScientist3Script, -1
