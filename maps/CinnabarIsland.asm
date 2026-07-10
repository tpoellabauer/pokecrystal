	object_const_def
	const CINNABARISLAND_GIRL
	const CINNABARISLAND_GAMBLER

CinnabarIsland_MapScripts:
	def_scene_scripts
	scene_script CinnabarIslandNoop1Scene, SCENE_CINNABARISLAND_GYM_DOOR_CHECK

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandNoop1Scene:
	end

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

; Gen 1: the Cinnabar Gym door is locked until the player has the Secret Key (found in Pokemon
; Mansion B1F, see PokemonMansionB1F.asm) -- pokeredDisassembly/scripts/CinnabarIsland.asm's
; CinnabarIslandDefaultScript re-checks every step near the door tile and pushes the player back
; if the key is missing (a per-frame wYCoord/wXCoord poll, no Gen 2 macro equivalent -- see
; maps-and-scripting skill). Re-expressed here as a coord_event one tile south of the door warp
; (18, 3), the same "auto-trigger + forced step back" idiom already used for VictoryRoadGate's
; badge check. Always armed (SCENE_CINNABARISLAND_GYM_DOOR_CHECK is scene 0, the map's default,
; and is never advanced away from) since possessing the key -- not any one-time flag -- is what
; permanently unlocks the door.
CinnabarIslandGymDoorCheckScript:
	checkitem SECRET_KEY
	iftrue .Unlocked
	opentext
	writetext CinnabarIslandGymDoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, CinnabarIslandStepBackMovement
.Unlocked:
	end

CinnabarIslandStepBackMovement:
	step DOWN
	step_end

CinnabarIslandGirlScript:
	jumptextfaceplayer CinnabarIslandGirlText

CinnabarIslandGamblerScript:
	jumptextfaceplayer CinnabarIslandGamblerText

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandLabSign:
	jumptext CinnabarIslandLabSignText

CinnabarIslandMartSign:
	jumpstd MartSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandGirlText:
	text "CINNABAR GYM's"
	line "BLAINE is an odd"
	cont "man who has lived"
	cont "here for decades."
	done

CinnabarIslandGamblerText:
	text "Scientists conduct"
	line "experiments in"
	cont "the burned out"
	cont "building."
	done

CinnabarIslandGymSignText:
	text "There's a notice"
	line "here…"

	para "CINNABAR GYM has"
	line "relocated to SEA-"
	cont "FOAM ISLANDS."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "CINNABAR ISLAND"

	para "The Fiery Town of"
	line "Burning Desire"
	done

CinnabarIslandLabSignText:
	text "#MON LAB"
	done

CinnabarIslandGymDoorLockedText:
	text "The door is"
	line "locked."

	para "You need the"
	line "SECRET KEY to"
	cont "get in."
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, POKEMON_MANSION_1F, 2
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1
	; Gym/lab/mart restored from Gen 1 (see NEEDS-MAP backlog); appended after the
	; two entries above, so their own front-door warps target slots 3/4/5 here.
	warp_event 18,  3, CINNABAR_GYM, 1
	warp_event  6,  9, CINNABAR_LAB, 1
	warp_event 15, 11, CINNABAR_MART, 1

	def_coord_events
	coord_event 18,  4, SCENE_CINNABARISLAND_GYM_DOOR_CHECK, CinnabarIslandGymDoorCheckScript

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, CinnabarIslandSign
	bg_event 16, 11, BGEVENT_READ, CinnabarIslandMartSign
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandLabSign
	bg_event 13,  3, BGEVENT_READ, CinnabarIslandGymSign

	def_object_events
	object_event 12,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandGirlScript, -1
	object_event 14,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandGamblerScript, -1
