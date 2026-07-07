	object_const_def
	const SILPHCO2F_SILPH_WORKER_F
	const SILPHCO2F_SCIENTIST1
	const SILPHCO2F_SCIENTIST2
	const SILPHCO2F_ROCKET1
	const SILPHCO2F_ROCKET2

SilphCo2F_MapScripts:
	def_scene_scripts

	def_callbacks

; Silph Worker F - gives TM_SELFDESTRUCT
SilphCo2FSilphWorkerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_SELFDESTRUCT
	iftrue .AlreadyHaveTM
	writetext SilphCo2FSilphWorkerFPleaseTakeThisText
	promptbutton
	verbosegiveitem TM_SELFDESTRUCT
	iffalse .NoRoom
	setevent EVENT_GOT_TM_SELFDESTRUCT
	opentext
	writetext SilphCo2FSilphWorkerFReceivedTMText
	waitbutton
	sjump .Explanation
.AlreadyHaveTM:
	writetext SilphCo2FSilphWorkerFTMExplanationText
	waitbutton
	closetext
	end
.NoRoom:
	writetext SilphCo2FSilphWorkerFTMNoRoomText
	waitbutton
.Explanation:
	writetext SilphCo2FSilphWorkerFTMExplanationText
	waitbutton
	closetext
	end

; Scientist trainer battles
SilphCo2FScientist1Script:
	faceplayer
	opentext
	writetext SilphCo2FScientist1BattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, 9
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_2F_SCIENTIST_1
	opentext
	writetext SilphCo2FScientist1EndBattleText
	promptbutton
	writetext SilphCo2FScientist1AfterBattleText
	waitbutton
	closetext
	end

SilphCo2FScientist2Script:
	faceplayer
	opentext
	writetext SilphCo2FScientist2BattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, 10
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_2F_SCIENTIST_2
	opentext
	writetext SilphCo2FScientist2EndBattleText
	promptbutton
	writetext SilphCo2FScientist2AfterBattleText
	waitbutton
	closetext
	end

; Rocket trainer battles
SilphCo2FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo2FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 43
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_2F_ROCKET_1
	opentext
	writetext SilphCo2FRocket1EndBattleText
	promptbutton
	writetext SilphCo2FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo2FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo2FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 44
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_2F_ROCKET_2
	opentext
	writetext SilphCo2FRocket2EndBattleText
	promptbutton
	writetext SilphCo2FRocket2AfterBattleText
	waitbutton
	closetext
	end

; Text
SilphCo2FSilphWorkerFPleaseTakeThisText:
	text "Eeek!"
	line "No! Stop! Help!"

	para "Oh, you're not"
	line "with TEAM ROCKET."
	cont "I thought..."
	cont "I'm sorry. Here,"
	cont "please take this!"
	done

SilphCo2FSilphWorkerFReceivedTMText:
	text "<PLAYER> got"
	line "TM_SELFDESTRUCT!@"
	text_end

SilphCo2FSilphWorkerFTMExplanationText:
	text "TM_SELFDESTRUCT is"
	line "powerful, but"
	cont "the #MON that"
	cont "uses it faints!"
	cont "Be careful."
	done

SilphCo2FSilphWorkerFTMNoRoomText:
	text "You don't have any"
	line "room for this."
	done

SilphCo2FScientist1BattleText:
	text "Help! I'm a SILPH"
	line "employee."
	done

SilphCo2FScientist1EndBattleText:
	text "How"
	line "did you know I"
	cont "was a ROCKET?"
	done

SilphCo2FScientist1AfterBattleText:
	text "I work for both"
	line "SILPH and TEAM"
	cont "ROCKET!"
	done

SilphCo2FScientist2BattleText:
	text "It's off limits"
	line "here! Go home!"
	done

SilphCo2FScientist2EndBattleText:
	text "You're"
	line "good."
	done

SilphCo2FScientist2AfterBattleText:
	text "Can you solve the"
	line "maze in here?"
	done

SilphCo2FRocket1BattleText:
	text "No kids are"
	line "allowed in here!"
	done

SilphCo2FRocket1EndBattleText:
	text "Tough!"
	done

SilphCo2FRocket1AfterBattleText:
	text "Diamond shaped"
	line "tiles are"
	cont "teleport blocks!"

	para "They're hi-tech"
	line "transporters!"
	done

SilphCo2FRocket2BattleText:
	text "Hey kid! What are"
	line "you doing here?"
	done

SilphCo2FRocket2EndBattleText:
	text "I goofed!"
	done

SilphCo2FRocket2AfterBattleText:
	text "SILPH CO. will"
	line "be merged with"
	cont "TEAM ROCKET!"
	done

SilphCo2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  0, SILPH_CO_1F, 3
	warp_event 26,  0, SILPH_CO_3F, 1
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1
	warp_event  3,  3, SILPH_CO_3F, 7
	warp_event 13,  3, SILPH_CO_8F, 5
	warp_event 27, 15, SILPH_CO_8F, 6
	warp_event  9, 15, SILPH_CO_6F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  1, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo2FSilphWorkerFScript, -1
	object_event  5, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo2FScientist1Script, EVENT_BEAT_SILPH_CO_2F_SCIENTIST_1
	object_event 24, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo2FScientist2Script, EVENT_BEAT_SILPH_CO_2F_SCIENTIST_2
	object_event 16, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo2FRocket1Script, EVENT_BEAT_SILPH_CO_2F_ROCKET_1
	object_event 24,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo2FRocket2Script, EVENT_BEAT_SILPH_CO_2F_ROCKET_2
