	object_const_def
	const SILPHCOELEVATOR_ELEVATOR

SilphCoElevator_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoElevatorScript:
	opentext
	writetext SilphCoElevatorText
	waitbutton
	closetext
	end

SilphCoElevatorText:
	text "Which floor?"
	done

SilphCoElevator_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  2, SILPH_CO_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCoElevatorScript, -1
