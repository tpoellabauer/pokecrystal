	object_const_def
	const SSANNE_BOW_SAILOR1
	const SSANNE_BOW_SAILOR2
	const SSANNE_BOW_SUPERNERD
	const SSANNE_BOW_SAILOR3
	const SSANNE_BOW_COOLTRAIN_M

SSAnneBow_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnneBowSailor1Script:
	faceplayer
	opentext
	writetext SSAnneBowSailor1BeforeText
	waitbutton
	closetext
	loadtrainer SAILOR, 19
	winlosstext SSAnneBowSailor1WinText, SSAnneBowSailor1LossText
	setlasttalked SSANNE_BOW_SAILOR1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SAILOR_SSANNEBOW_1
	opentext
	writetext SSAnneBowSailor1AfterText
	waitbutton
	closetext
	end

SSAnneBowSailor2Script:
	faceplayer
	opentext
	writetext SSAnneBowSailor2BeforeText
	waitbutton
	closetext
	loadtrainer SAILOR, 20
	winlosstext SSAnneBowSailor2WinText, SSAnneBowSailor2LossText
	setlasttalked SSANNE_BOW_SAILOR2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SAILOR_SSANNEBOW_2
	opentext
	writetext SSAnneBowSailor2AfterText
	waitbutton
	closetext
	end

SSAnneBowSupernerdScript:
	jumptextfaceplayer SSAnneBowSupernerdText

SSAnneBowSailor3Script:
	jumptextfaceplayer SSAnneBowSailor3Text

SSAnneBowCooltrainMScript:
	jumptextfaceplayer SSAnneBowCooltrainMText

SSAnneBowSailor1BeforeText:
	text "Battle?"
	done

SSAnneBowSailor1WinText:
	text "Lost!"
	done

SSAnneBowSailor1LossText:
	text "Won!"
	done

SSAnneBowSailor1AfterText:
	text "Nice duel!"
	done

SSAnneBowSailor2BeforeText:
	text "Battle?"
	done

SSAnneBowSailor2WinText:
	text "Lost!"
	done

SSAnneBowSailor2LossText:
	text "Won!"
	done

SSAnneBowSailor2AfterText:
	text "Well fought!"
	done

SSAnneBowSupernerdText:
	text "I'm studying the"
	line "ocean depths!"
	done

SSAnneBowSailor3Text:
	text "What a voyage!"
	done

SSAnneBowCooltrainMText:
	text "Enjoy the view!"
	done

SSAnneBow_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  6, SS_ANNE_3F, 3
	warp_event  5,  6, SS_ANNE_3F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSailor1Script, -1
	object_event  7,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSailor2Script, -1
	object_event  1,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSupernerdScript, -1
	object_event  5,  1, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSailor3Script, -1
	object_event  8,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowCooltrainMScript, -1
