	object_const_def
	const SSANNE_BOW_SUPERNERD
	const SSANNE_BOW_SAILOR1
	const SSANNE_BOW_COOLTRAIN_M
	const SSANNE_BOW_SAILOR2
	const SSANNE_BOW_SAILOR3

SSAnneBow_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnneBowSupernerdScript:
	jumptextfaceplayer SSAnneBowSupernerdText

SSAnneBowSailor1Script:
	jumptextfaceplayer SSAnneBowSailor1Text

SSAnneBowCooltrainMScript:
	jumptextfaceplayer SSAnneBowCooltrainMText

TrainerSailorHoyt:
	trainer SAILOR, HOYT, EVENT_BEAT_SAILOR_SSANNEBOW_1, SSAnneBowSailor2BeforeText, SSAnneBowSailor2WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneBowSailor2AfterText
	waitbutton
	closetext
	end

TrainerSailorPercy:
	trainer SAILOR, PERCY, EVENT_BEAT_SAILOR_SSANNEBOW_2, SSAnneBowSailor3BeforeText, SSAnneBowSailor3WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneBowSailor3AfterText
	waitbutton
	closetext
	end

SSAnneBowSupernerdText:
	text "The party's over."
	line "The ship will be"
	cont "departing soon."
	done

SSAnneBowSailor1Text:
	text "Scrubbing decks"
	line "is hard work!"
	done

SSAnneBowCooltrainMText:
	text "Urf. I feel ill."

	para "I stepped out to"
	line "get some air."
	done

SSAnneBowSailor2BeforeText:
	text "Hey matey!"

	para "Let's do a little"
	line "jig!"
	done

SSAnneBowSailor2WinText:
	text "You're"
	line "impressive!"
	done

SSAnneBowSailor2AfterText:
	text "How many kinds of"
	line "Pokemon do you"
	cont "think there are?"
	done

SSAnneBowSailor3BeforeText:
	text "Ahoy there!"
	line "Are you seasick?"
	done

SSAnneBowSailor3WinText:
	text "I was"
	line "just careless!"
	done

SSAnneBowSailor3AfterText:
	text "My Pa said there"
	line "are 100 kinds of"
	cont "Pokemon. I think"
	cont "there are more."
	done

SSAnneBow_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  6, SS_ANNE_3F, 1
	warp_event 13,  7, SS_ANNE_3F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSupernerdScript, -1
	object_event  4,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSailor1Script, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowCooltrainMScript, -1
	object_event  4,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorHoyt, -1
	object_event 10,  8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorPercy, -1
