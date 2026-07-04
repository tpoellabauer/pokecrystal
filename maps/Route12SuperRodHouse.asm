	object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route12SuperRodHouse:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotItem
	writetext Route12SuperRodHouseFishingGuruText
	waitbutton
	verbosegiveitem SUPER_ROD
	setevent EVENT_GOT_SUPER_ROD
	closetext
	end
.GotItem:
	writetext Route12SuperRodHouseFishingGuruAfterText
	waitbutton
	closetext
	end

Route12SuperRodHouseFishingGuruText:
	text "I'm the FISHING"
	line "GURU's brother!"

	para "I simply looove"
	line "fishing!"

	para "Do you like to"
	line "fish?"

	para "Here, take the"
	line "SUPER ROD!"
	done

Route12SuperRodHouseFishingGuruAfterText:
	text "I hope that SUPER"
	line "ROD brings you"
	cont "good catches!"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouse, -1
