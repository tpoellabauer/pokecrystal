	object_const_def
	const SILPHCO4F_SILPH_WORKER_M
	const SILPHCO4F_SCIENTIST
	const SILPHCO4F_ROCKET1
	const SILPHCO4F_ROCKET2
	const SILPHCO4F_FULL_HEAL
	const SILPHCO4F_MAX_REVIVE
	const SILPHCO4F_ESCAPE_ROPE

SilphCo4F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo4FSilphWorkerMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .TeamRocketIsGoneText
	writetext SilphCo4FSilphWorkerMImHidingText
	waitbutton
	closetext
	end

.TeamRocketIsGoneText:
	writetext SilphCo4FSilphWorkerMTeamRocketIsGoneText
	waitbutton
	closetext
	end

SilphCo4FScientistScript:
	faceplayer
	opentext
	writetext SilphCo4FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, 11
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_4F_SCIENTIST
	opentext
	writetext SilphCo4FScientistEndBattleText
	promptbutton
	writetext SilphCo4FScientistAfterBattleText
	waitbutton
	closetext
	end

SilphCo4FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo4FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 46
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_4F_ROCKET_1
	opentext
	writetext SilphCo4FRocket1EndBattleText
	promptbutton
	writetext SilphCo4FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo4FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo4FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 47
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_4F_ROCKET_2
	opentext
	writetext SilphCo4FRocket2EndBattleText
	promptbutton
	writetext SilphCo4FRocket2AfterBattleText
	waitbutton
	closetext
	end

SilphCo4FSilphWorkerMImHidingText:
	text "Sssh! Can't you"
	line "see I'm hiding?"
	done

SilphCo4FSilphWorkerMTeamRocketIsGoneText:
	text "Huh? TEAM ROCKET"
	line "is gone?"
	done

SilphCo4FRocket1BattleText:
	text "TEAM ROCKET has"
	line "taken command of"
	cont "SILPH CO.!"
	done

SilphCo4FRocket1EndBattleText:
	text "Arrgh!"
	done

SilphCo4FRocket1AfterBattleText:
	text "Fwahahaha!"
	line "My BOSS has been"
	cont "after this place!"
	done

SilphCo4FScientistBattleText:
	text "My #MON are my"
	line "loyal soldiers!"
	done

SilphCo4FScientistEndBattleText:
	text "Darn!"
	line "You weak #MON!"
	done

SilphCo4FScientistAfterBattleText:
	text "The doors are"
	line "electronically"
	cont "locked! A CARD"
	cont "KEY opens them!"
	done

SilphCo4FRocket2BattleText:
	text "Intruder spotted!"
	done

SilphCo4FRocket2EndBattleText:
	text "Who"
	line "are you?"
	done

SilphCo4FRocket2AfterBattleText:
	text "I better tell the"
	line "BOSS on 11F!"
	done

SilphCo4FFullHealItemScript:
	itemball FULL_HEAL

SilphCo4FMaxReviveItemScript:
	itemball MAX_REVIVE

SilphCo4FEscapeRopeItemScript:
	itemball ESCAPE_ROPE

SilphCo4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  0, SILPH_CO_3F, 2
	warp_event 26,  0, SILPH_CO_5F, 2
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1
	warp_event 11,  7, SILPH_CO_10F, 4
	warp_event 17,  3, SILPH_CO_6F, 4
	warp_event  3, 15, SILPH_CO_10F, 5
	warp_event 17, 11, SILPH_CO_10F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo4FSilphWorkerMScript, -1
	object_event 14,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo4FScientistScript, EVENT_BEAT_SILPH_CO_4F_SCIENTIST
	object_event  9, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo4FRocket1Script, EVENT_BEAT_SILPH_CO_4F_ROCKET_1
	object_event 26, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo4FRocket2Script, EVENT_BEAT_SILPH_CO_4F_ROCKET_2
	object_event  3,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo4FFullHealItemScript, EVENT_SILPH_CO_4F_FULL_HEAL
	object_event  4,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo4FMaxReviveItemScript, EVENT_SILPH_CO_4F_MAX_REVIVE
	object_event  5,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo4FEscapeRopeItemScript, EVENT_SILPH_CO_4F_ESCAPE_ROPE
