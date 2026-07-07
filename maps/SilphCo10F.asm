	object_const_def
	const SILPHCO10F_ROCKET
	const SILPHCO10F_SCIENTIST
	const SILPHCO10F_SILPH_WORKER_F
	const SILPHCO10F_TM_EARTHQUAKE
	const SILPHCO10F_RARE_CANDY
	const SILPHCO10F_CARBOS

SilphCo10F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo10FRocketScript:
	faceplayer
	opentext
	writetext SilphCo10FRocketBattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_59
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_10F_ROCKET
	opentext
	writetext SilphCo10FRocketEndBattleText
	promptbutton
	writetext SilphCo10FRocketAfterBattleText
	waitbutton
	closetext
	end

SilphCo10FScientistScript:
	faceplayer
	opentext
	writetext SilphCo10FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_SILPH_10F
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_10F_SCIENTIST
	opentext
	writetext SilphCo10FScientistEndBattleText
	promptbutton
	writetext SilphCo10FScientistAfterBattleText
	waitbutton
	closetext
	end

; Gen 1: this Silph worker just wanders and cries, pre/post-Giovanni flavor only.
SilphCo10FSilphWorkerFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .QuietNow
	writetext SilphCo10FSilphWorkerFImScaredText
	waitbutton
	closetext
	end
.QuietNow:
	writetext SilphCo10FSilphWorkerFQuietAboutMyCryingText
	waitbutton
	closetext
	end

SilphCo10FTmEarthquakeItemScript:
	itemball TM_EARTHQUAKE

SilphCo10FRareCandyItemScript:
	itemball RARE_CANDY

SilphCo10FCarbosItemScript:
	itemball CARBOS

SilphCo10FRocketBattleText:
	text "Welcome to the"
	line "10F! So good of"
	cont "you to join me!"
	done

SilphCo10FRocketEndBattleText:
	text "I'm"
	line "stunned!"
	done

SilphCo10FRocketAfterBattleText:
	text "Nice try, but the"
	line "boardroom is up"
	cont "one more floor!"
	done

SilphCo10FScientistBattleText:
	text "Enough of your"
	line "silly games!"
	done

SilphCo10FScientistEndBattleText:
	text "No"
	line "continues left!"
	done

SilphCo10FScientistAfterBattleText:
	text "Are you satisfied"
	line "with beating me?"
	cont "Then go on home!"
	done

SilphCo10FSilphWorkerFImScaredText:
	text "Waaaaa!"
	cont "I'm scared!"
	done

SilphCo10FSilphWorkerFQuietAboutMyCryingText:
	text "Please keep quiet"
	line "about my crying!"
	done

SilphCo10F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  0, SILPH_CO_9F, 1
	warp_event 10,  0, SILPH_CO_11F, 1
	warp_event 12,  0, SILPH_CO_ELEVATOR, 1
	warp_event  9, 11, SILPH_CO_4F, 4
	warp_event 13, 15, SILPH_CO_4F, 6
	warp_event 13,  7, SILPH_CO_4F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo10FRocketScript, EVENT_BEAT_SILPH_CO_10F_ROCKET
	object_event 10,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo10FScientistScript, EVENT_BEAT_SILPH_CO_10F_SCIENTIST
	object_event  9, 15, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo10FSilphWorkerFScript, -1
	object_event  2, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo10FTmEarthquakeItemScript, EVENT_SILPH_CO_10F_TM_EARTHQUAKE
	object_event  4, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo10FRareCandyItemScript, EVENT_SILPH_CO_10F_RARE_CANDY
	object_event  5, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo10FCarbosItemScript, EVENT_SILPH_CO_10F_CARBOS
