	object_const_def
	const CINNABARISLAND_GIRL
	const CINNABARISLAND_GAMBLER

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

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

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, CinnabarIslandSign
	bg_event 16, 11, BGEVENT_READ, CinnabarIslandMartSign
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandLabSign
	bg_event 13,  3, BGEVENT_READ, CinnabarIslandGymSign

	def_object_events
	object_event 12,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandGirlScript, -1
	object_event 14,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandGamblerScript, -1
