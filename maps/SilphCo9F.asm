	object_const_def
	const SILPHCO9F_NURSE
	const SILPHCO9F_ROCKET1
	const SILPHCO9F_SCIENTIST
	const SILPHCO9F_ROCKET2

SilphCo9F_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: the nurse offers a free full heal before you face Giovanni, then just
; thanks you afterward.
SilphCo9FNurseScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .ThankYou
	writetext SilphCo9FNurseYouLookTiredText
	promptbutton
	special HealParty
	writetext SilphCo9FNurseDontGiveUpText
	waitbutton
	closetext
	end
.ThankYou:
	writetext SilphCo9FNurseThankYouText
	waitbutton
	closetext
	end

SilphCo9FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo9FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_57
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_9F_ROCKET_1
	opentext
	writetext SilphCo9FRocket1EndBattleText
	promptbutton
	writetext SilphCo9FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo9FScientistScript:
	faceplayer
	opentext
	writetext SilphCo9FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_SILPH_9F
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_9F_SCIENTIST
	opentext
	writetext SilphCo9FScientistEndBattleText
	promptbutton
	writetext SilphCo9FScientistAfterBattleText
	waitbutton
	closetext
	end

SilphCo9FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo9FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_58
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_9F_ROCKET_2
	opentext
	writetext SilphCo9FRocket2EndBattleText
	promptbutton
	writetext SilphCo9FRocket2AfterBattleText
	waitbutton
	closetext
	end

SilphCo9FNurseYouLookTiredText:
	text "You look tired!"
	line "You should take a"
	cont "quick nap!"
	prompt

SilphCo9FNurseDontGiveUpText:
	text "Don't give up!"
	done

SilphCo9FNurseThankYouText:
	text "Thank you so"
	line "much!"
	done

SilphCo9FRocket1BattleText:
	text "Your #MON seem"
	line "to adore you, kid!"
	done

SilphCo9FRocket1EndBattleText:
	text "Ghaaah!"
	done

SilphCo9FRocket1AfterBattleText:
	text "If I had started"
	line "as a trainer at"
	cont "your age..."
	done

SilphCo9FScientistBattleText:
	text "Your #MON have"
	line "weak points! I"
	cont "can nail them!"
	done

SilphCo9FScientistEndBattleText:
	text "You"
	line "hammered me!"
	done

SilphCo9FScientistAfterBattleText:
	text "Exploiting weak"
	line "spots does work!"
	cont "Think about"
	cont "element types!"
	done

SilphCo9FRocket2BattleText:
	text "I am one of the 4"
	line "ROCKET BROTHERS!"
	done

SilphCo9FRocket2EndBattleText:
	text "Warg!"
	line "Brothers, I lost!"
	done

SilphCo9FRocket2AfterBattleText:
	text "My brothers will"
	line "avenge me!"
	done

SilphCo9F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14,  0, SILPH_CO_10F, 1
	warp_event 16,  0, SILPH_CO_8F, 1
	warp_event 18,  0, SILPH_CO_ELEVATOR, 1
	warp_event  9,  3, SILPH_CO_3F, 8
	warp_event 17, 15, SILPH_CO_5F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 14, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo9FNurseScript, -1
	object_event  2,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo9FRocket1Script, EVENT_BEAT_SILPH_CO_9F_ROCKET_1
	object_event 21, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo9FScientistScript, EVENT_BEAT_SILPH_CO_9F_SCIENTIST
	object_event 13, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo9FRocket2Script, EVENT_BEAT_SILPH_CO_9F_ROCKET_2
