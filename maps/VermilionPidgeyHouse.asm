	object_const_def
	const VERMILIONPIDGEYHOUSE_YOUNGSTER
	const VERMILIONPIDGEYHOUSE_PIDGEY
	const VERMILIONPIDGEYHOUSE_LETTER

; Gen 1 Vermilion Pidgey House, ported from pokeredDisassembly/scripts+text+data/maps/objects/
; VermilionPidgeyHouse.asm. No GSC equivalent existed; new map (asmkit.newmap, TILESET_GEN1_HOUSE).
VermilionPidgeyHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionPidgeyHouseYoungsterScript:
	jumptextfaceplayer VermilionPidgeyHouseYoungsterText

VermilionPidgeyHousePidgeyScript:
	opentext
	writetext VermilionPidgeyHousePidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end

VermilionPidgeyHouseLetterScript:
	jumptextfaceplayer VermilionPidgeyHouseLetterText

VermilionPidgeyHouseYoungsterText:
	text "My PIDGEY and I"
	line "are pen pals with"
	cont "a #MON fan far"
	cont "away."
	done

VermilionPidgeyHousePidgeyText:
	text "PIDGEY: Gurruu!"
	done

VermilionPidgeyHouseLetterText:
	text "It's a letter from"
	line "a #MON fan in"
	cont "another town."
	done

VermilionPidgeyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 5
	warp_event  3,  7, VERMILION_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPidgeyHouseYoungsterScript, -1
	object_event  3,  5, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPidgeyHousePidgeyScript, -1
	object_event  4,  3, SPRITE_PAPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPidgeyHouseLetterScript, -1
