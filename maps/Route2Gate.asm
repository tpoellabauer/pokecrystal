	object_const_def
	const ROUTE2GATE_OAKS_AIDE
	const ROUTE2GATE_YOUNGSTER

Route2Gate_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1 gate: Oak's Aide withholds HM05 FLASH until the player has caught
; >= 10 #MON species. Ported using the existing dex-count var mechanism
; (readvar VAR_DEXCAUGHT + ifgreater), same idiom used by the Ruins of Alph
; Unown-count checks. See maps-and-scripting/pokered-asset-source skills.
Route2GateOaksAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .Explain
	readvar VAR_DEXCAUGHT
	ifgreater 9, .Qualifies
	writetext Route2GateOaksAideNotYetText
	waitbutton
	closetext
	end

.Qualifies:
	verbosegiveitem HM_FLASH
	iffalse .NoRoom
	setevent EVENT_GOT_HM05_FLASH
.Explain:
	writetext Route2GateOaksAideText
	waitbutton
	closetext
	end

.NoRoom:
	closetext
	end

Route2GateYoungsterScript:
	jumptextfaceplayer Route2GateYoungsterText

Route2GateOaksAideNotYetText:
	text "I'm PROF.OAK's"
	line "AIDE!"

	para "Catch 10 kinds of"
	line "#MON, and I'll"
	cont "give you HM05,"
	cont "FLASH!"

	para "You've only"
	line "caught @"
	text_decimal wScriptVar, 1, 3
	text " so far."
	done

Route2GateOaksAideText:
	text "The HM FLASH"
	line "lights even the"
	cont "darkest dungeons."
	done

Route2GateYoungsterText:
	text "Once a #MON"
	line "learns FLASH, you"
	cont "can get through"
	cont "ROCK TUNNEL."
	done

Route2Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_2, 3
	warp_event  5,  0, ROUTE_2, 4
	warp_event  4,  7, ROUTE_2, 2
	warp_event  5,  7, ROUTE_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2GateOaksAideScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2GateYoungsterScript, -1
