	object_const_def
	const CELADONMANSIONROOFHOUSE_HIKER
	const CELADONMANSIONROOFHOUSE_EEVEE_POKEBALL

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

; Ported from pokeredDisassembly scripts/CeladonMansionRoofHouse.asm +
; text/CeladonMansionRoofHouse.asm. Faithful port of the Gen 1 HIKER's trade-and-communicate
; flavor line.
CeladonMansionRoofHouseHikerScript:
	jumptextfaceplayer CeladonMansionRoofHouseHikerText

; Gen 1's pokeball object calls GivePokemon EEVEE, level 25, then hides itself
; (predef HideObject via TOGGLE_CELADON_MANSION_EEVEE_GIFT) — NOT ported, see
; "NEEDS SHARED-TABLE WORK" in the port report. Flavor-only; Gen 1 source has no text_far
; attached to this object at all (text_asm goes straight to GivePokemon), so the line below
; is an invented minimal flavor line, not a ported string.
CeladonMansionRoofHouseEeveePokeballScript:
	jumptextfaceplayer CeladonMansionRoofHouseEeveePokeballText

CeladonMansionRoofHouseHikerText:
	text "I know everything"
	line "about the world"
	cont "of #MON in"
	cont "your GAME BOY!"

	para "Get together with"
	line "your friends and"
	cont "trade #MON!"
	done

CeladonMansionRoofHouseEeveePokeballText:
	text "A #MON BALL…"

	para "It looks empty."
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseHikerScript, -1
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseEeveePokeballScript, -1
