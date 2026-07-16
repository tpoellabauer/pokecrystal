	object_const_def
	const ROUTE5DAYCARE_GRAMPS
	const ROUTE5DAYCARE_GRANNY

; Gen 1 Route 5 Day Care, ported from pokeredDisassembly maps/Daycare.blk (byte-identical). Gen1's
; single attendant (DAYCARE_GENTLEMAN) only stored one Pokemon while you walked; Gen2's Day Care
; is the native two-attendant breeding engine (DayCareMan/DayCareLady specials, map-agnostic --
; see engine/events/daycare.asm), so this room uses the same Gramps/Granny pair as the Johto
; DayCare building (maps/DayCare.asm) rather than a single Gen1-shaped NPC, to keep the real
; breeding mechanic working. No EVENT_* gating: unlike Johto's Odd-Egg-quest DayCareMan intro,
; this is a plain always-available attendant pair, so the scripts call the generic specials
; directly (Johto's DayCareManScript_Inside's ".AlreadyHaveOddEgg" branch, without the one-time
; egg gate).
Route5DayCare_MapScripts:
	def_scene_scripts

	def_callbacks

Route5DayCareGrampsScript:
	faceplayer
	opentext
	special DayCareMan
	waitbutton
	closetext
	end

Route5DayCareGrannyScript:
	faceplayer
	opentext
	special DayCareLady
	waitbutton
	closetext
	end

Route5DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_5, 5
	warp_event  3,  7, ROUTE_5, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5DayCareGrampsScript, -1
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5DayCareGrannyScript, -1
