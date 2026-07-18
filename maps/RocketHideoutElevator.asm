RocketHideoutElevator_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1's elevator is a LIFT_KEY-gated dynamic floor menu (B1F/B2F/B4F) built around
; wElevatorWarpMaps (pokeredDisassembly/scripts/RocketHideoutElevator.asm). Re-expressed
; here with pokecrystal's native elevator engine (engine/events/elevator.asm's `elevator`
; script command + `elevfloor` floor list) -- the same idiom already used for the
; Goldenrod/Celadon Dept Store elevators and Battle Tower -- rather than hand-porting the
; raw wWarpEntries poke, which has no script-macro equivalent. The LIFT_KEY gate is a
; plain checkitem, same idiom as GoldenrodUnderground's BASEMENT_KEY door.
RocketHideoutElevatorScript:
	opentext
	checkitem LIFT_KEY
	iftrue .UseElevator
	writetext RocketHideoutElevatorNeedsKeyText
	waitbutton
	closetext
	end

.UseElevator
	elevator RocketHideoutElevatorFloors
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done
	end

; Floor list + destinations. Each elevfloor's warp id lands the player on the door tile
; adjacent to that floor's elevator entrance (same convention as GoldenrodDeptStoreElevatorData).
RocketHideoutElevatorFloors:
	db 3 ; floors
	elevfloor FLOOR_B1F, 3, ROCKET_HIDEOUT_B1F
	elevfloor FLOOR_B2F, 3, ROCKET_HIDEOUT_B2F
	elevfloor FLOOR_B4F, 2, ROCKET_HIDEOUT_B4F
	db -1 ; end

RocketHideoutElevatorNeedsKeyText:
	text "It appears to"
	line "need a key."
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
