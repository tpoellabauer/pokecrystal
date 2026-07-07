	object_const_def
	const SILPHCO8F_SILPH_WORKER_M
	const SILPHCO8F_ROCKET1
	const SILPHCO8F_SCIENTIST
	const SILPHCO8F_ROCKET2

SilphCo8F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo8FSilphWorkerMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .ThanksForSaving
	writetext SilphCo8FSilphWorkerMSilphIsFinishedText
	waitbutton
	closetext
	end
.ThanksForSaving:
	writetext SilphCo8FSilphWorkerMThanksForSavingUsText
	waitbutton
	closetext
	end

SilphCo8FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo8FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_55
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_8F_ROCKET_1
	opentext
	writetext SilphCo8FRocket1EndBattleText
	promptbutton
	writetext SilphCo8FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo8FScientistScript:
	faceplayer
	opentext
	writetext SilphCo8FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_SILPH_8F
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_8F_SCIENTIST
	opentext
	writetext SilphCo8FScientistEndBattleText
	promptbutton
	writetext SilphCo8FScientistAfterBattleText
	waitbutton
	closetext
	end

SilphCo8FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo8FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_56
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_8F_ROCKET_2
	opentext
	writetext SilphCo8FRocket2EndBattleText
	promptbutton
	writetext SilphCo8FRocket2AfterBattleText
	waitbutton
	closetext
	end

SilphCo8FSilphWorkerMSilphIsFinishedText:
	text "I wonder if SILPH"
	line "is finished..."
	done

SilphCo8FSilphWorkerMThanksForSavingUsText:
	text "Thanks for saving"
	line "us!"
	done

SilphCo8FRocket1BattleText:
	text "That's as far as"
	line "you'll go!"
	done

SilphCo8FRocket1EndBattleText:
	text "Not"
	line "enough grit!"
	done

SilphCo8FRocket1AfterBattleText:
	text "If you don't turn"
	line "back, I'll call"
	cont "for backup!"
	done

SilphCo8FScientistBattleText:
	text "You're causing us"
	line "problems!"
	done

SilphCo8FScientistEndBattleText:
	text "Huh?"
	line "I lost?"
	done

SilphCo8FScientistAfterBattleText:
	text "So, what do you"
	line "think of SILPH"
	cont "BUILDING's maze?"
	done

SilphCo8FRocket2BattleText:
	text "I am one of the 4"
	line "ROCKET BROTHERS!"
	done

SilphCo8FRocket2EndBattleText:
	text "Whoo!"
	line "Oh brothers!"
	done

SilphCo8FRocket2AfterBattleText:
	text "I'll leave you up"
	line "to my brothers!"
	done

SilphCo8F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16,  0, SILPH_CO_9F, 2
	warp_event 14,  0, SILPH_CO_7F, 1
	warp_event 18,  0, SILPH_CO_ELEVATOR, 1
	warp_event  3, 11, SILPH_CO_8F, 7
	warp_event  3, 15, SILPH_CO_2F, 5
	warp_event 11,  5, SILPH_CO_2F, 6
	warp_event 11,  9, SILPH_CO_8F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo8FSilphWorkerMScript, -1
	object_event 19,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo8FRocket1Script, EVENT_BEAT_SILPH_CO_8F_ROCKET_1
	object_event 10,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo8FScientistScript, EVENT_BEAT_SILPH_CO_8F_SCIENTIST
	object_event 12, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo8FRocket2Script, EVENT_BEAT_SILPH_CO_8F_ROCKET_2
