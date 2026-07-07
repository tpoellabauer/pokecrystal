	object_const_def
	const ROCKETHIDOUTELEVATOR_ELEVATOR

RocketHideoutElevator_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutElevatorScript:
	opentext
	writetext RocketHideoutElevatorText
	waitbutton
	closetext
	end

RocketHideoutElevatorText:
	text "This elevator only"
	line "goes down to B1F"
	cont "right now."
	done

RocketHideoutElevator_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 2, 2, ROCKET_HIDEOUT_B1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 2, 2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutElevatorScript, -1
