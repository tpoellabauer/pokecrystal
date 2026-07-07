	object_const_def
	const SILPHCO3F_SILPH_WORKER_M
	const SILPHCO3F_SCIENTIST
	const SILPHCO3F_ROCKET

SilphCo3F_MapScripts:
	def_scene_scripts

	def_callbacks

; Silph Worker M - context-aware dialogue
SilphCo3FSilphWorkerMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .RocketsGone
	writetext SilphCo3FSilphWorkerMWhatShouldIDoText
	waitbutton
	closetext
	end
.RocketsGone:
	writetext SilphCo3FSilphWorkerMYouSavedUsText
	waitbutton
	closetext
	end

; Scientist trainer
SilphCo3FScientistScript:
	faceplayer
	opentext
	writetext SilphCo3FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, 4
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_3F_SCIENTIST
	opentext
	writetext SilphCo3FScientistEndBattleText
	promptbutton
	writetext SilphCo3FScientistAfterBattleText
	waitbutton
	closetext
	end

; Rocket trainer
SilphCo3FRocketScript:
	faceplayer
	opentext
	writetext SilphCo3FRocketBattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 45
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_3F_ROCKET
	opentext
	writetext SilphCo3FRocketEndBattleText
	promptbutton
	writetext SilphCo3FRocketAfterBattleText
	waitbutton
	closetext
	end

; Text
SilphCo3FSilphWorkerMWhatShouldIDoText:
	text "I work for SILPH."
	line "What should I do?"
	done

SilphCo3FSilphWorkerMYouSavedUsText:
	text "<PLAYER>! You and"
	line "your #MON"
	cont "saved us!"
	done

SilphCo3FRocketBattleText:
	text "Quit messing with"
	line "us, kid!"
	done

SilphCo3FRocketEndBattleText:
	text "I give"
	line "up!"
	done

SilphCo3FRocketAfterBattleText:
	text "A hint? You can"
	line "open doors with a"
	cont "CARD KEY!"
	done

SilphCo3FScientistBattleText:
	text "I support TEAM"
	line "ROCKET more than"
	cont "I support SILPH!"
	done

SilphCo3FScientistEndBattleText:
	text "You"
	line "really got me!"
	done

SilphCo3FScientistAfterBattleText:
	text "Humph..."

	para "TEAM ROCKET said"
	line "that if I helped"
	cont "them, they'd let"
	cont "me study #MON!"
	done

SilphCo3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  0, SILPH_CO_2F, 2
	warp_event 24,  0, SILPH_CO_4F, 1
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1
	warp_event 23, 11, SILPH_CO_3F, 10
	warp_event  3,  3, SILPH_CO_5F, 6
	warp_event  3, 15, SILPH_CO_5F, 7
	warp_event 27,  3, SILPH_CO_2F, 4
	warp_event  3, 11, SILPH_CO_9F, 4
	warp_event 11, 11, SILPH_CO_7F, 5
	warp_event 27, 15, SILPH_CO_3F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 24,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FSilphWorkerMScript, -1
	object_event  7,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientistScript, EVENT_BEAT_SILPH_CO_3F_SCIENTIST
	object_event 20,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FRocketScript, EVENT_BEAT_SILPH_CO_3F_ROCKET
