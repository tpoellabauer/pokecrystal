	object_const_def
	const CINNABARGYM_BLAINE
	const CINNABARGYM_SUPER_NERD1
	const CINNABARGYM_SUPER_NERD2
	const CINNABARGYM_SUPER_NERD3
	const CINNABARGYM_SUPER_NERD4
	const CINNABARGYM_SUPER_NERD5
	const CINNABARGYM_SUPER_NERD6
	const CINNABARGYM_SUPER_NERD7
	const CINNABARGYM_GYM_GUIDE

; Gen 1 Cinnabar Gym, ported from pokered data/maps/objects/CinnabarGym.asm.
; Blaine is the gym leader (badge fight). The 7 Super Nerds are ordinary
; (non-badge) trainer battles, simplified from Gen1's sequential gym-gate
; unlock mechanic to standalone fights.
CinnabarGym_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext CinnabarGymBlaineIntroText
	waitbutton
	closetext
	winlosstext CinnabarGymBlaineLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear CINNABARGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext CinnabarGymReceivedBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext CinnabarGymBlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext CinnabarGymBlaineFightDoneText
	waitbutton
	closetext
	end

CinnabarGymGymGuideScript:
	jumptextfaceplayer CinnabarGymGymGuideText

CinnabarGymSuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	iftrue .Beaten
	writetext CinnabarGymSuperNerd1BattleText
	waitbutton
	closetext
	winlosstext CinnabarGymSuperNerd1EndBattleText, 0
	loadtrainer SUPER_NERD, SHAWN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	end
.Beaten:
	writetext CinnabarGymSuperNerd1AfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CINNABAR_GYM_TRAINER_1
	iftrue .Beaten
	writetext CinnabarGymSuperNerd2BattleText
	waitbutton
	closetext
	winlosstext CinnabarGymSuperNerd2EndBattleText, 0
	loadtrainer SUPER_NERD, GREGG
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CINNABAR_GYM_TRAINER_1
	end
.Beaten:
	writetext CinnabarGymSuperNerd2AfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSuperNerd3Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CINNABAR_GYM_TRAINER_2
	iftrue .Beaten
	writetext CinnabarGymSuperNerd3BattleText
	waitbutton
	closetext
	winlosstext CinnabarGymSuperNerd3EndBattleText, 0
	loadtrainer SUPER_NERD, TERU
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CINNABAR_GYM_TRAINER_2
	end
.Beaten:
	writetext CinnabarGymSuperNerd3AfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSuperNerd4Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CINNABAR_GYM_TRAINER_3
	iftrue .Beaten
	writetext CinnabarGymSuperNerd4BattleText
	waitbutton
	closetext
	winlosstext CinnabarGymSuperNerd4EndBattleText, 0
	loadtrainer SUPER_NERD, JAY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CINNABAR_GYM_TRAINER_3
	end
.Beaten:
	writetext CinnabarGymSuperNerd4AfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSuperNerd5Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CINNABAR_GYM_TRAINER_4
	iftrue .Beaten
	writetext CinnabarGymSuperNerd5BattleText
	waitbutton
	closetext
	winlosstext CinnabarGymSuperNerd5EndBattleText, 0
	loadtrainer SUPER_NERD, RUSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CINNABAR_GYM_TRAINER_4
	end
.Beaten:
	writetext CinnabarGymSuperNerd5AfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSuperNerd6Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CINNABAR_GYM_TRAINER_5
	iftrue .Beaten
	writetext CinnabarGymSuperNerd6BattleText
	waitbutton
	closetext
	winlosstext CinnabarGymSuperNerd6EndBattleText, 0
	loadtrainer SUPER_NERD, DAVE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CINNABAR_GYM_TRAINER_5
	end
.Beaten:
	writetext CinnabarGymSuperNerd6AfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSuperNerd7Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CINNABAR_GYM_TRAINER_6
	iftrue .Beaten
	writetext CinnabarGymSuperNerd7BattleText
	waitbutton
	closetext
	winlosstext CinnabarGymSuperNerd7EndBattleText, 0
	loadtrainer SUPER_NERD, NORTON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CINNABAR_GYM_TRAINER_6
	end
.Beaten:
	writetext CinnabarGymSuperNerd7AfterBattleText
	waitbutton
	closetext
	end

CinnabarGymBlaineIntroText:
	text "BLAINE: Waaah!"

	para "My GYM in CINNABAR"
	line "burned down."

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have BURN HEAL!"
	done

CinnabarGymBlaineLossText:
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done

CinnabarGymReceivedBadgeText:
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done

CinnabarGymBlaineAfterBattleText:
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "Keep training your"
	line "#MON!"
	done

CinnabarGymBlaineFightDoneText:
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done

CinnabarGymGymGuideText:
	text "BLAINE runs the"
	line "CINNABAR GYM."

	para "His fire-type"
	line "#MON are very"
	cont "hot-tempered!"

	para "Be careful!"
	done

CinnabarGymSuperNerd1BattleText:
	text "Do you know how"
	line "hot #MON fire"
	cont "breath can get?"
	done

CinnabarGymSuperNerd1EndBattleText:
	text "Yow!"
	line "Hot, hot, hot!"
	done

CinnabarGymSuperNerd1AfterBattleText:
	text "Fire, or to be"
	line "more precise,"
	cont "combustion..."

	para "Blah, blah, blah,"
	line "blah..."
	done

CinnabarGymSuperNerd2BattleText:
	text "I was a thief, but"
	line "I went straight as"
	cont "a trainer!"
	done

CinnabarGymSuperNerd2EndBattleText:
	text "I"
	line "surrender!"
	done

CinnabarGymSuperNerd2AfterBattleText:
	text "I can't help"
	line "stealing other"
	cont "people's #MON!"
	done

CinnabarGymSuperNerd3BattleText:
	text "You can't win!"
	line "I have studied"
	cont "#MON totally!"
	done

CinnabarGymSuperNerd3EndBattleText:
	text "Waah!"
	line "My studies!"
	done

CinnabarGymSuperNerd3AfterBattleText:
	text "My theories are"
	line "too complicated"
	cont "for you!"
	done

CinnabarGymSuperNerd4BattleText:
	text "I just like using"
	line "fire #MON!"
	done

CinnabarGymSuperNerd4EndBattleText:
	text "Too hot"
	line "to handle!"
	done

CinnabarGymSuperNerd4AfterBattleText:
	text "I wish there was"
	line "a thief #MON!"
	cont "I'd use that!"
	done

CinnabarGymSuperNerd5BattleText:
	text "I know why BLAINE"
	line "became a trainer!"
	done

CinnabarGymSuperNerd5EndBattleText:
	text "Ow!"
	done

CinnabarGymSuperNerd5AfterBattleText:
	text "BLAINE was lost"
	line "in the mountains"
	cont "when a fiery bird"
	cont "#MON appeared."

	para "Its light showed"
	line "BLAINE the way"
	cont "back down!"
	done

CinnabarGymSuperNerd6BattleText:
	text "I've been to many"
	line "GYMs, but this is"
	cont "my favorite!"
	done

CinnabarGymSuperNerd6EndBattleText:
	text "Yowza!"
	line "Too hot!"
	done

CinnabarGymSuperNerd6AfterBattleText:
	text "Us fire #MON"
	line "fans like PONYTA"
	cont "and NINETALES!"
	done

CinnabarGymSuperNerd7BattleText:
	text "Fire is weak"
	line "against H2O!"
	done

CinnabarGymSuperNerd7EndBattleText:
	text "Oh!"
	line "Snuffed out!"
	done

CinnabarGymSuperNerd7AfterBattleText:
	text "Water beats fire!"
	line "But fire melts"
	cont "ice #MON!"
	done

CinnabarGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; Front door; CinnabarIsland's warp list gains 3 entries (gym/lab/mart) appended
	; after its existing 2, so this map's own slot there is #3, not Gen1's "2".
	warp_event 16, 17, CINNABAR_ISLAND, 3
	warp_event 17, 17, CINNABAR_ISLAND, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarGymBlaineScript, -1
	object_event 17,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymSuperNerd1Script, -1
	object_event 17,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymSuperNerd2Script, -1
	object_event 11,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymSuperNerd3Script, -1
	object_event 11,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymSuperNerd4Script, -1
	object_event 11, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymSuperNerd5Script, -1
	object_event  3, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymSuperNerd6Script, -1
	object_event  3,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymSuperNerd7Script, -1
	object_event 16, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymGymGuideScript, -1
