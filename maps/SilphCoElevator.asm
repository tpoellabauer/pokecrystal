SilphCoElevator_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1's elevator is an interactive floor panel (bg_event 3, 0 -> TEXT_SILPHCOELEVATOR_ELEVATOR,
; which opens DisplayElevatorFloorMenu), not an NPC. The old port had a SPRITE_RECEPTIONIST
; standing on the elevator's own warp tile (2, 2); removed. Same idiom as RocketHideoutElevator.
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
	warp_event  2,  2, SILPH_CO_1F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, SilphCoElevatorScript

	def_object_events
