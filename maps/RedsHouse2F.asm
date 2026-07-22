RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsHouse2FPCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0

RedsHouse2FSNESScript:
	jumptext RedsHouse2FSNESText

RedsHouse2FSNESText:
	text "It's a Super"
	line "NES. There's a"
	cont "game paused on"
	cont "the screen."
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  1, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_UP, RedsHouse2FPCScript
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FSNESScript

	def_object_events
