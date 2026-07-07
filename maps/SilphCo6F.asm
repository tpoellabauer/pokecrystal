	object_const_def
	const SILPHCO6F_SILPH_WORKER_M1
	const SILPHCO6F_SILPH_WORKER_M2
	const SILPHCO6F_SILPH_WORKER_F1
	const SILPHCO6F_SILPH_WORKER_F2
	const SILPHCO6F_SILPH_WORKER_M3
	const SILPHCO6F_SCIENTIST
	const SILPHCO6F_ROCKET1
	const SILPHCO6F_ROCKET2
	const SILPHCO6F_HP_UP
	const SILPHCO6F_X_ACCURACY

SilphCo6F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo6FSilphWorkerM1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .RocketsGone
	writetext SilphCo6FSilphWorkerM1TookOverTheBuildingText
	waitbutton
	closetext
	end
.RocketsGone:
	writetext SilphCo6FSilphWorkerM1BackToWorkText
	waitbutton
	closetext
	end

SilphCo6FSilphWorkerM2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .WeGotEngagedText
	writetext SilphCo6FSilphWorkerM2HelpMePleaseText
	waitbutton
	closetext
	end

.WeGotEngagedText:
	writetext SilphCo6FSilphWorkerM2WeGotEngagedText
	waitbutton
	closetext
	end

SilphCo6FSilphWorkerF1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .HaveToMarryHimText
	writetext SilphCo6FSilphWorkerF1SuchACowardText
	waitbutton
	closetext
	end

.HaveToMarryHimText:
	writetext SilphCo6FSilphWorkerF1HaveToMarryHimText
	waitbutton
	closetext
	end

SilphCo6FSilphWorkerF2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .TeamRocketRanText
	writetext SilphCo6FSilphWorkerF2TeamRocketConquerWorldText
	waitbutton
	closetext
	end

.TeamRocketRanText:
	writetext SilphCo6FSilphWorkerF2TeamRocketRanText
	waitbutton
	closetext
	end

SilphCo6FSilphWorkerM3Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .RocketsGone
	writetext SilphCo6FSilphWorkerM3TargetedSilphText
	waitbutton
	closetext
	end
.RocketsGone:
	writetext SilphCo6FSilphWorkerM3WorkForSilphText
	waitbutton
	closetext
	end

SilphCo6FScientistScript:
	faceplayer
	opentext
	writetext SilphCo6FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, 13
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_6F_SCIENTIST
	opentext
	writetext SilphCo6FScientistEndBattleText
	promptbutton
	writetext SilphCo6FScientistAfterBattleText
	waitbutton
	closetext
	end

SilphCo6FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo6FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 50
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_6F_ROCKET_1
	opentext
	writetext SilphCo6FRocket1EndBattleText
	promptbutton
	writetext SilphCo6FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo6FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo6FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, 51
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_6F_ROCKET_2
	opentext
	writetext SilphCo6FRocket2EndBattleText
	promptbutton
	writetext SilphCo6FRocket2AfterBattleText
	waitbutton
	closetext
	end

SilphCo6FHpUpItemScript:
	itemball HP_UP

SilphCo6FXAccuracyItemScript:
	itemball X_ACCURACY

SilphCo6FSilphWorkerM1TookOverTheBuildingText:
	text "The ROCKETs came"
	line "and took over the"
	cont "building!"
	done

SilphCo6FSilphWorkerM1BackToWorkText:
	text "Well, better get"
	line "back to work!"
	done

SilphCo6FSilphWorkerM2HelpMePleaseText:
	text "Oh dear, oh dear."
	line "Help me please!"
	done

SilphCo6FSilphWorkerM2WeGotEngagedText:
	text "We got engaged!"
	line "Heheh!"
	done

SilphCo6FSilphWorkerF1SuchACowardText:
	text "Look at him! He's"
	line "such a coward!"
	done

SilphCo6FSilphWorkerF1HaveToMarryHimText:
	text "I feel so sorry"
	line "for him, I have"
	cont "to marry him!"
	done

SilphCo6FSilphWorkerF2TeamRocketConquerWorldText:
	text "TEAM ROCKET is"
	line "trying to conquer"
	cont "the world with"
	cont "#MON!"
	done

SilphCo6FSilphWorkerF2TeamRocketRanText:
	text "TEAM ROCKET ran"
	line "because of you!"
	done

SilphCo6FSilphWorkerM3TargetedSilphText:
	text "They must have"
	line "targeted SILPH"
	cont "for our #MON"
	cont "products."
	done

SilphCo6FSilphWorkerM3WorkForSilphText:
	text "Come work for"
	line "SILPH when you"
	cont "get older!"
	done

SilphCo6FRocket1BattleText:
	text "I am one of the 4"
	line "ROCKET BROTHERS!"
	done

SilphCo6FRocket1EndBattleText:
	text "Flame"
	line "out!"
	done

SilphCo6FRocket1AfterBattleText:
	text "No matter!"
	line "My brothers will"
	cont "avenge me!"
	done

SilphCo6FScientistBattleText:
	text "That rotten"
	line "PRESIDENT!"

	para "He shouldn't have"
	line "sent me to the"
	cont "TIKSI BRANCH!"
	done

SilphCo6FScientistEndBattleText:
	text "Shoot!"
	done

SilphCo6FScientistAfterBattleText:
	text "TIKSI BRANCH?"
	line "It's in Russian"
	cont "no man's land!"
	done

SilphCo6FRocket2BattleText:
	text "You dare betray"
	line "TEAM ROCKET?"
	done

SilphCo6FRocket2EndBattleText:
	text "You"
	line "traitor!"
	done

SilphCo6FRocket2AfterBattleText:
	text "If you stand for"
	line "justice, you"
	cont "betray evil!"
	done

SilphCo6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 0, SILPH_CO_7F, 2
	warp_event 14, 0, SILPH_CO_5F, 1
	warp_event 18, 0, SILPH_CO_ELEVATOR, 1
	warp_event 3, 3, SILPH_CO_4F, 5
	warp_event 23, 3, SILPH_CO_2F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo6FSilphWorkerM1Script, -1
	object_event 20, 6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo6FSilphWorkerM2Script, -1
	object_event 21, 6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo6FSilphWorkerF1Script, -1
	object_event 11, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo6FSilphWorkerF2Script, -1
	object_event 18, 13, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo6FSilphWorkerM3Script, -1
	object_event 7, 8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo6FScientistScript, EVENT_BEAT_SILPH_CO_6F_SCIENTIST
	object_event 17, 3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo6FRocket1Script, EVENT_BEAT_SILPH_CO_6F_ROCKET_1
	object_event 14, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo6FRocket2Script, EVENT_BEAT_SILPH_CO_6F_ROCKET_2
	object_event 3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo6FHpUpItemScript, EVENT_SILPH_CO_6F_HP_UP
	object_event 2, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo6FXAccuracyItemScript, EVENT_SILPH_CO_6F_X_ACCURACY
