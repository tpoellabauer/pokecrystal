	object_const_def
	const SILPHCO5F_SILPH_WORKER_M
	const SILPHCO5F_SCIENTIST
	const SILPHCO5F_COOLTRAINERM
	const SILPHCO5F_ROCKET1
	const SILPHCO5F_ROCKET2
	const SILPHCO5F_TM_TAKE_DOWN
	const SILPHCO5F_PROTEIN
	const SILPHCO5F_CARD_KEY

SilphCo5F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo5FSilphWorkerMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .RocketsGone
	writetext SilphCo5FSilphWorkerMThatsYouRightText
	waitbutton
	closetext
	end
.RocketsGone:
	writetext SilphCo5FSilphWorkerMYoureOurHeroText
	waitbutton
	closetext
	end

SilphCo5FScientistScript:
	faceplayer
	opentext
	writetext SilphCo5FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, 12
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_5F_SCIENTIST
	opentext
	writetext SilphCo5FScientistEndBattleText
	promptbutton
	writetext SilphCo5FScientistAfterBattleText
	waitbutton
	closetext
	end

SilphCo5FCoolTrainerMScript:
	faceplayer
	opentext
	writetext SilphCo5FRockerBattleText
	waitbutton
	closetext
	loadtrainer COOLTRAINERM, 1
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_5F_COOLTRAINERM
	opentext
	writetext SilphCo5FRockerEndBattleText
	promptbutton
	writetext SilphCo5FRockerAfterBattleText
	waitbutton
	closetext
	end

SilphCo5FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo5FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 48
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_5F_ROCKET_1
	opentext
	writetext SilphCo5FRocket1EndBattleText
	promptbutton
	writetext SilphCo5FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo5FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo5FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 49
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_5F_ROCKET_2
	opentext
	writetext SilphCo5FRocket2AfterBattleText
	waitbutton
	closetext
	end

SilphCo5FTakDownItemScript:
	itemball TM_ROCK_SMASH

SilphCo5FProteinItemScript:
	itemball PROTEIN

SilphCo5FCardKeyItemScript:
	itemball CARD_KEY

SilphCo5FSilphWorkerMThatsYouRightText:
	text "TEAM ROCKET is"
	line "in an uproar over"
	cont "some intruder."
	cont "That's you right?"
	done

SilphCo5FSilphWorkerMYoureOurHeroText:
	text "TEAM ROCKET took"
	line "off! You're our"
	cont "hero! Thank you!"
	done

SilphCo5FRocket1BattleText:
	text "I heard a kid was"
	line "wandering around."
	done

SilphCo5FRocket1EndBattleText:
	text "Boom!"
	done

SilphCo5FRocket1AfterBattleText:
	text "It's not smart"
	line "to pick a fight"
	cont "with TEAM ROCKET!"
	done

SilphCo5FScientistBattleText:
	text "We study #"
	line "BALL technology"
	cont "on this floor!"
	done

SilphCo5FScientistEndBattleText:
	text "Dang!"
	line "Blast it!"
	done

SilphCo5FScientistAfterBattleText:
	text "We worked on the"
	line "ultimate #"
	cont "BALL which would"
	cont "catch anything!"
	done

SilphCo5FRockerBattleText:
	text "Whaaat? There"
	line "shouldn't be any"
	cont "children here?"
	done

SilphCo5FRockerEndBattleText:
	text "Oh"
	line "goodness!"
	done

SilphCo5FRockerAfterBattleText:
	text "You're only on 5F."
	line "It's a long way"
	cont "to my BOSS!"
	done

SilphCo5FRocket2BattleText:
	text "Show TEAM ROCKET"
	line "a little respect!"
	done

SilphCo5FRocket2EndBattleText:
	text "Cough..."
	line "Cough..."
	done

SilphCo5FRocket2AfterBattleText:
	text "Which reminds me."

	para "KOFFING evolves"
	line "into WEEZING!"
	done

SilphCo5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  0, SILPH_CO_6F, 2
	warp_event 26,  0, SILPH_CO_4F, 2
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1
	warp_event 27,  3, SILPH_CO_7F, 6
	warp_event  9, 15, SILPH_CO_9F, 5
	warp_event 11,  5, SILPH_CO_3F, 5
	warp_event  3, 15, SILPH_CO_3F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo5FSilphWorkerMScript, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo5FScientistScript, EVENT_BEAT_SILPH_CO_5F_SCIENTIST
	object_event 18, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo5FCoolTrainerMScript, EVENT_BEAT_SILPH_CO_5F_COOLTRAINERM
	object_event  8, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo5FRocket1Script, EVENT_BEAT_SILPH_CO_5F_ROCKET_1
	object_event 28,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo5FRocket2Script, EVENT_BEAT_SILPH_CO_5F_ROCKET_2
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo5FTakDownItemScript, EVENT_SILPH_CO_5F_TM_TAKE_DOWN
	object_event  4,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo5FProteinItemScript, EVENT_SILPH_CO_5F_PROTEIN
	object_event 21, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo5FCardKeyItemScript, EVENT_SILPH_CO_5F_CARD_KEY
