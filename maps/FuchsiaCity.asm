	object_const_def
	const FUCHSIACITY_YOUNGSTER1
	const FUCHSIACITY_GAMBLER
	const FUCHSIACITY_ERIK
	const FUCHSIACITY_YOUNGSTER2
	const FUCHSIACITY_CHANSEY
	const FUCHSIACITY_VOLTORB
	const FUCHSIACITY_KANGASKHAN
	const FUCHSIACITY_SLOWPOKE
	const FUCHSIACITY_LAPRAS
	const FUCHSIACITY_FOSSIL

FuchsiaCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FuchsiaCityFlypointCallback

FuchsiaCityFlypointCallback:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

FuchsiaCityYoungster1Script:
	jumptextfaceplayer FuchsiaCityYoungster1Text

; Gen 1 SPRITE_GAMBLER has no Gen 2 sprite sheet; reused the Gentleman
; substitute already established for the GAMBLER trainer class elsewhere in
; this project (Route8/DiglettsCaveRoute11).
FuchsiaCityGamblerScript:
	jumptextfaceplayer FuchsiaCityGamblerText

FuchsiaCityErikScript:
	jumptextfaceplayer FuchsiaCityErikText

FuchsiaCityYoungster2Script:
	jumptextfaceplayer FuchsiaCityYoungster2Text

; Gen 1's Fuchsia City street displays 6 Pokemon statues (Chansey/Voltorb/
; Kangaskhan/Slowpoke/Lapras/a fossil) each showing a Pokedex-style blurb when
; read; ported as flavor-only signs (skipped the live DisplayDexEntry/
; PlayCry engine call Gen 1 used -- that's an engine integration, not a
; content-identity port). SPRITE_SEEL/SPRITE_FOSSIL have no Gen 2 sprite
; sheet; substituted SPRITE_MONSTER/SPRITE_POKE_BALL respectively.
FuchsiaCityChanseyScript:
	jumptextfaceplayer FuchsiaCityChanseyText

FuchsiaCityVoltorbScript:
	jumptextfaceplayer FuchsiaCityVoltorbText

FuchsiaCityKangaskhanScript:
	jumptextfaceplayer FuchsiaCityKangaskhanText

FuchsiaCitySlowpokeScript:
	jumptextfaceplayer FuchsiaCitySlowpokeText

FuchsiaCityLaprasScript:
	jumptextfaceplayer FuchsiaCityLaprasText

; Gen 1 gates this on EVENT_GOT_DOME_FOSSIL/EVENT_GOT_HELIX_FOSSIL (the Mt.
; Moon fossil choice); neither event nor the fossil-choice mechanic exists in
; this project yet, so this shows fixed flavor text instead of the dynamic
; Omanyte/Kabuto/undetermined variants.
FuchsiaCityFossilScript:
	jumptextfaceplayer FuchsiaCityFossilText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaCitySign2:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneSign:
	jumptext SafariZoneSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariGameSign:
	jumptext SafariGameSignText

FuchsiaCityPokecenterSign:
	jumpstd PokecenterSignScript

FuchsiaCityMartSign:
	jumpstd MartSignScript

; Gen 1's zoo exhibit plaques, one per caged #MON object (see the Gen 1 bg_event
; table in pokeredDisassembly/data/maps/objects/FuchsiaCity.asm).
FuchsiaCityChanseySign:
	jumptext FuchsiaCityChanseySignText

FuchsiaCityVoltorbSign:
	jumptext FuchsiaCityVoltorbSignText

FuchsiaCityKangaskhanSign:
	jumptext FuchsiaCityKangaskhanSignText

FuchsiaCitySlowpokeSign:
	jumptext FuchsiaCitySlowpokeSignText

FuchsiaCityLaprasSign:
	jumptext FuchsiaCityLaprasSignText

; Gen 1 shows OMANYTE or KABUTO here depending on the Mt. Moon fossil choice
; (EVENT_GOT_DOME_FOSSIL/EVENT_GOT_HELIX_FOSSIL) -- not modeled yet, see
; FuchsiaCityFossilScript above -- so this plaque reads the OMANYTE variant.
FuchsiaCityFossilSign:
	jumptext FuchsiaCityFossilSignText

FuchsiaCityYoungster1Text:
	text "Did you try the"
	line "SAFARI GAME? Some"
	cont "#MON can only"
	cont "be caught there."
	done

FuchsiaCityGamblerText:
	text "SAFARI ZONE has a"
	line "zoo in front of"
	cont "the entrance."

	para "Out back is the"
	line "SAFARI GAME for"
	cont "catching #MON."
	done

FuchsiaCityErikText:
	text "ERIK: Where's"
	line "SARA? I said I'd"
	cont "meet her here."
	done

FuchsiaCityYoungster2Text:
	text "That item ball in"
	line "there is really a"
	cont "#MON."
	done

FuchsiaCityChanseyText:
	text "Name: CHANSEY"

	para "Catching one is"
	line "all up to chance."
	done

FuchsiaCityVoltorbText:
	text "Name: VOLTORB"

	para "The very image of"
	line "a # BALL."
	done

FuchsiaCityKangaskhanText:
	text "Name: KANGASKHAN"

	para "A maternal #MON"
	line "that raises its"
	cont "young in a pouch"
	cont "on its belly."
	done

FuchsiaCitySlowpokeText:
	text "Name: SLOWPOKE"

	para "Friendly and very"
	line "slow moving."
	done

FuchsiaCityLaprasText:
	text "Name: LAPRAS"

	para "A.K.A. the king"
	line "of the seas."
	done

FuchsiaCityFossilText:
	text "A #MON that was"
	line "resurrected from"
	cont "a fossil, on"
	cont "display."
	done

FuchsiaCitySignText:
	text "FUCHSIA CITY"

	para "Behold! It's"
	line "Passion Pink!"
	done

FuchsiaGymSignText:
	text "FUCHSIA CITY"
	line "#MON GYM"
	cont "LEADER: KOGA"

	para "The Poisonous"
	line "Ninja Master"
	done

SafariZoneSignText:
	text "#MON PARADISE"
	line "SAFARI ZONE"
	done

WardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done

SafariGameSignText:
	text "SAFARI GAME"
	line "#MON-U-CATCH!"
	done

FuchsiaCityChanseySignText:
	text "Name: CHANSEY"

	para "Catching one is"
	line "all up to chance."
	done

FuchsiaCityVoltorbSignText:
	text "Name: VOLTORB"

	para "The very image of"
	line "a # BALL."
	done

FuchsiaCityKangaskhanSignText:
	text "Name: KANGASKHAN"

	para "A maternal #MON"
	line "that raises its"

	para "young in a pouch"
	line "on its belly."
	done

FuchsiaCitySlowpokeSignText:
	text "Name: SLOWPOKE"

	para "Friendly and very"
	line "slow moving."
	done

FuchsiaCityLaprasSignText:
	text "Name: LAPRAS"

	para "A.K.A. the king"
	line "of the seas."
	done

FuchsiaCityFossilSignText:
	text "Name: OMANYTE"

	para "A #MON that"
	line "was resurrected"
	cont "from a fossil."
	done

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event 22, 13, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  5, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_OLDER_SISTERS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 35, ROUTE_19_FUCHSIA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 21, 15, BGEVENT_READ, SafariZoneSign
	bg_event  5, 29, BGEVENT_READ, FuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, FuchsiaCitySign2
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariGameSign
	bg_event 13, 15, BGEVENT_READ, FuchsiaCityLaprasSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign
	bg_event 15, 23, BGEVENT_READ, FuchsiaCitySign
	bg_event 33,  7, BGEVENT_READ, FuchsiaCityChanseySign
	bg_event 27,  7, BGEVENT_READ, FuchsiaCityVoltorbSign
	bg_event 13,  7, BGEVENT_READ, FuchsiaCityKangaskhanSign
	bg_event 31, 13, BGEVENT_READ, FuchsiaCitySlowpokeSign
	bg_event  7,  7, BGEVENT_READ, FuchsiaCityFossilSign

	def_object_events
	object_event 10, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster1Script, -1
	object_event 28, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityGamblerScript, -1
	object_event 30, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityErikScript, -1
	object_event 24,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster2Script, -1
	object_event 31,  5, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityChanseyScript, -1
	object_event 25,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityVoltorbScript, -1
	object_event 12,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityKangaskhanScript, -1
	object_event 30, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCitySlowpokeScript, -1
	object_event  8, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityLaprasScript, -1
	object_event  6,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFossilScript, -1
