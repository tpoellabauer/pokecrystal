	object_const_def
	const LAVENDERTOWN_LITTLE_GIRL
	const LAVENDERTOWN_COOLTRAINER_M
	const LAVENDERTOWN_SUPER_NERD

LavenderTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LavenderTownFlypointCallback

LavenderTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

LavenderTownLittleGirlScript:
	faceplayer
	opentext
	writetext LavenderTownLittleGirlDoYouBelieveInGhostsText
	yesorno
	iffalse .HaHaGuessNot
	writetext LavenderTownLittleGirlSoThereAreBelieversText
	waitbutton
	closetext
	end

.HaHaGuessNot:
	writetext LavenderTownLittleGirlHaHaGuessNotText
	waitbutton
	closetext
	end

LavenderTownCooltrainerMScript:
	jumptextfaceplayer LavenderTownCooltrainerMText

LavenderTownSuperNerdScript:
	jumptextfaceplayer LavenderTownSuperNerdText

LavenderTownSign:
	jumptext LavenderTownSignText

LavenderTownSilphScopeSign:
	jumptext LavenderTownSilphScopeSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

LavenderTownPokemonTowerSign:
	jumptext LavenderTownPokemonTowerSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd PokecenterSignScript

LavenderMartSignText:
	jumpstd MartSignScript

LavenderTownLittleGirlDoYouBelieveInGhostsText:
	text "Do you believe in"
	line "GHOSTs?"
	done

LavenderTownLittleGirlSoThereAreBelieversText:
	text "Really? So there"
	line "are believers..."
	done

LavenderTownLittleGirlHaHaGuessNotText:
	text "Hahaha, I guess"
	line "not."

	para "That white hand"
	line "on your shoulder,"
	cont "it's not real."
	done

LavenderTownCooltrainerMText:
	text "This town is known"
	line "as the grave site"
	cont "of #MON."

	para "Memorial services"
	line "are held in"
	cont "#MON TOWER."
	done

LavenderTownSuperNerdText:
	text "GHOSTs appeared"
	line "in #MON TOWER."

	para "I think they're"
	line "the spirits of"
	cont "#MON that the"
	cont "ROCKETs killed."
	done

LavenderTownSignText:
	text "LAVENDER TOWN"

	para "The Noble Purple"
	line "Town"
	done

LavenderTownSilphScopeSignText:
	text "New SILPH SCOPE!"

	para "Make the Invisible"
	line "Plain to See!"

	para "SILPH CO."
	done

VolunteerPokemonHouseSignText:
	text "LAVENDER VOLUNTEER"
	line "#MON HOUSE"
	done

LavenderTownPokemonTowerSignText:
	text "May the Souls of"
	line "#MON Rest Easy"
	cont "#MON TOWER"
	done

SoulHouseSignText:
	text "SOUL HOUSE"

	para "May the Souls of"
	line "#MON Rest Easy"
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  7,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 13, LAVENDER_NAME_RATER, 1
	warp_event 15, 13, LAVENDER_MART, 1
	warp_event 13, 11, SOUL_HOUSE, 1
	warp_event 14,  5, POKEMON_TOWER_1F, 1

	def_coord_events

	def_bg_events
	bg_event  4,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  5,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event  9,  3, BGEVENT_READ, LavenderTownSilphScopeSign
	bg_event 11,  9, BGEVENT_READ, LavenderTownSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event 16, 13, BGEVENT_READ, LavenderMartSignText
	bg_event 17,  7, BGEVENT_READ, LavenderTownPokemonTowerSign

	def_object_events
	object_event 15,  9, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownLittleGirlScript, -1
	object_event  9, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownCooltrainerMScript, -1
	object_event  8,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LavenderTownSuperNerdScript, -1
