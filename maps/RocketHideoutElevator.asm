
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
	warp_event  2,  1, ROCKET_HIDEOUT_B1F, 3
	warp_event  3,  1, ROCKET_HIDEOUT_B1F, 5

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_READ, RocketHideoutElevatorScript

	def_object_events
