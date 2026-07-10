	object_const_def
	const SILPHCO7F_SILPH_WORKER_M1
	const SILPHCO7F_SILPH_WORKER_M2
	const SILPHCO7F_SILPH_WORKER_M3
	const SILPHCO7F_SILPH_WORKER_F
	const SILPHCO7F_ROCKET1
	const SILPHCO7F_SCIENTIST
	const SILPHCO7F_ROCKET2
	const SILPHCO7F_ROCKET3
	const SILPHCO7F_RIVAL
	const SILPHCO7F_CALCIUM
	const SILPHCO7F_TM_SWORDS_DANCE

SilphCo7F_MapScripts:
	def_scene_scripts

	def_callbacks

; Silph Worker M1 - the Gen 1 "lapras guy": once-only LAPRAS gift for saving him,
; then pre/post-Giovanni flavor text (EVENT_BEAT_SILPH_CO_ROCKETSROCK is the
; shared "beat Giovanni" flag also checked on floors 2F-6F).
SilphCo7FSilphWorkerM1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_LAPRAS_FROM_SILPH_CO_7F
	iftrue .AlreadyThanked
	writetext SilphCo7FSilphWorkerM1HaveThisPokemonText
	promptbutton
	givepoke LAPRAS, 15
	setevent EVENT_GOT_LAPRAS_FROM_SILPH_CO_7F
	opentext
	writetext SilphCo7FSilphWorkerM1LaprasDescriptionText
	waitbutton
	closetext
	end
.AlreadyThanked:
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .Saved
	writetext SilphCo7FSilphWorkerM1IsOurPresidentOkText
	waitbutton
	closetext
	end
.Saved:
	writetext SilphCo7FSilphWorkerM1SavedText
	waitbutton
	closetext
	end

SilphCo7FSilphWorkerM2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .RocketsGone
	writetext SilphCo7FSilphWorkerM2AfterTheMasterBallText
	waitbutton
	closetext
	end
.RocketsGone:
	writetext SilphCo7FSilphWorkerM2CancelledMasterBallText
	waitbutton
	closetext
	end

SilphCo7FSilphWorkerM3Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .RocketsGone
	writetext SilphCo7FSilphWorkerM3ItWouldBeBadText
	waitbutton
	closetext
	end
.RocketsGone:
	writetext SilphCo7FSilphWorkerM3YouChasedOffTeamRocketText
	waitbutton
	closetext
	end

SilphCo7FSilphWorkerFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	iftrue .SafeAtLast
	writetext SilphCo7FSilphWorkerFItsReallyDangerousHereText
	waitbutton
	closetext
	end
.SafeAtLast:
	writetext SilphCo7FSilphWorkerFSafeAtLastText
	waitbutton
	closetext
	end

; Rocket trainer battles
SilphCo7FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo7FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_52
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_7F_ROCKET_1
	opentext
	writetext SilphCo7FRocket1EndBattleText
	promptbutton
	writetext SilphCo7FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo7FScientistScript:
	faceplayer
	opentext
	writetext SilphCo7FScientistBattleText
	waitbutton
	closetext
	loadtrainer SCIENTIST, SCIENTIST_SILPH_7F
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_7F_SCIENTIST
	opentext
	writetext SilphCo7FScientistEndBattleText
	promptbutton
	writetext SilphCo7FScientistAfterBattleText
	waitbutton
	closetext
	end

SilphCo7FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo7FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_53
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_7F_ROCKET_2
	opentext
	writetext SilphCo7FRocket2EndBattleText
	promptbutton
	writetext SilphCo7FRocket2AfterBattleText
	waitbutton
	closetext
	end

SilphCo7FRocket3Script:
	faceplayer
	opentext
	writetext SilphCo7FRocket3BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_54
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_7F_ROCKET_3
	opentext
	writetext SilphCo7FRocket3EndBattleText
	promptbutton
	writetext SilphCo7FRocket3AfterBattleText
	waitbutton
	closetext
	end

; Rival battle. Gen 1 ambushes the player at a coordinate trigger and picks the
; type-counter starter (matches Route22.asm's RIVAL1 counter idiom); simplified
; here to a talk-triggered battle (precedent: Events 1-4 used talk-triggered
; handoffs instead of Gen1 auto-ambush). Uses the real Gen1 Silph Co. 7F roster
; (Rival2Data's 3rd tier, Lv35-40) via the RIVAL1_SILPHCO_* trainer parties.
SilphCo7FRivalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SILPH_CO_RIVAL
	iftrue .AlreadyBattled
	writetext SilphCo7FRivalText
	waitbutton
	closetext
	checkevent EVENT_CHOSE_CHARMANDER
	iftrue .Charmander
	checkevent EVENT_CHOSE_SQUIRTLE
	iftrue .Squirtle
	loadtrainer RIVAL1, RIVAL1_SILPHCO_CHARMANDER
	sjump .Fight
.Squirtle:
	loadtrainer RIVAL1, RIVAL1_SILPHCO_BULBASAUR
	sjump .Fight
.Charmander:
	loadtrainer RIVAL1, RIVAL1_SILPHCO_SQUIRTLE
.Fight:
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_RIVAL
	opentext
	writetext SilphCo7FRivalDefeatedText
	promptbutton
	writetext SilphCo7FRivalGoodLuckToYouText
	waitbutton
	closetext
	end
.AlreadyBattled:
	writetext SilphCo7FRivalGoodLuckToYouText
	waitbutton
	closetext
	end

SilphCo7FCalciumItemScript:
	itemball CALCIUM

; Gen 1 gives TM_SWORDS_DANCE (Gen1 TM01) here; Swords Dance isn't a Gen2 TM
; move, so substituted with the closest available GSC TM (self Attack/Defense
; buff), same treatment as VictoryRoad's TM_SKY_ATTACK->TM_HYPER_BEAM swap.
SilphCo7FTMSwordsDanceItemScript:
	itemball TM_CURSE

; Text
SilphCo7FSilphWorkerM1HaveThisPokemonText:
	text "Oh! Hi! You're"
	line "not a ROCKET!"

	para "You came to save"
	line "us? Why, thank"
	cont "you!"

	para "I want you to"
	line "have this #MON"
	cont "for saving us."
	prompt

SilphCo7FSilphWorkerM1LaprasDescriptionText:
	text "It's LAPRAS. It's"
	line "very intelligent."

	para "We kept it in our"
	line "lab, but it'll be"
	cont "better off with"
	cont "you!"

	para "It's a good"
	line "swimmer. It'll"
	cont "give you a lift!"
	done

SilphCo7FSilphWorkerM1IsOurPresidentOkText:
	text "TEAM ROCKET's"
	line "BOSS went to the"
	cont "boardroom! Is our"
	cont "PRESIDENT OK?"
	done

SilphCo7FSilphWorkerM1SavedText:
	text "Saved at last!"
	line "Thank you!"
	done

SilphCo7FSilphWorkerM2AfterTheMasterBallText:
	text "TEAM ROCKET was"
	line "after the MASTER"
	cont "BALL, which will"
	cont "catch any #MON!"
	done

SilphCo7FSilphWorkerM2CancelledMasterBallText:
	text "We canceled the"
	line "MASTER BALL"
	cont "project because"
	cont "of TEAM ROCKET."
	done

SilphCo7FSilphWorkerM3ItWouldBeBadText:
	text "It would be bad"
	line "if TEAM ROCKET"
	cont "took over SILPH"
	cont "or our #MON!"
	done

SilphCo7FSilphWorkerM3YouChasedOffTeamRocketText:
	text "Wow! You chased"
	line "off TEAM ROCKET"
	cont "all by yourself?"
	done

SilphCo7FSilphWorkerFItsReallyDangerousHereText:
	text "You! It's really"
	line "dangerous here!"
	cont "You came to save"
	cont "me? You can't!"
	done

SilphCo7FSilphWorkerFSafeAtLastText:
	text "Safe at last!"
	line "Oh, thank you!"
	done

SilphCo7FRocket1BattleText:
	text "Oh ho! I smell a"
	line "little rat!"
	done

SilphCo7FRocket1EndBattleText:
	text "Lights"
	line "out!"
	done

SilphCo7FRocket1AfterBattleText:
	text "You won't find my"
	line "BOSS by just"
	cont "scurrying around!"
	done

SilphCo7FScientistBattleText:
	text "Heheh!"

	para "You mistook me"
	line "for a SILPH"
	cont "worker?"
	done

SilphCo7FScientistEndBattleText:
	text "I'm"
	line "done!"
	done

SilphCo7FScientistAfterBattleText:
	text "Despite your age,"
	line "you are a skilled"
	cont "trainer!"
	done

SilphCo7FRocket2BattleText:
	text "I am one of the 4"
	line "ROCKET BROTHERS!"
	done

SilphCo7FRocket2EndBattleText:
	text "Aack!"
	line "Brothers, I lost!"
	done

SilphCo7FRocket2AfterBattleText:
	text "Doesn't matter."
	line "My brothers will"
	cont "repay the favor!"
	done

SilphCo7FRocket3BattleText:
	text "A child intruder?"
	line "That must be you!"
	done

SilphCo7FRocket3EndBattleText:
	text "Fine!"
	line "I lost!"
	done

SilphCo7FRocket3AfterBattleText:
	text "Go on home before"
	line "my BOSS gets"
	cont "ticked off!"
	done

SilphCo7FRivalText:
	text "<RIVAL>: What"
	line "kept you"
	cont "<PLAYER>?"
	done

SilphCo7FRivalDefeatedText:
	text "Oh ho!"
	line "So you are ready"
	cont "for BOSS ROCKET!"
	done

SilphCo7FRivalGoodLuckToYouText:
	text "I'm going to the"
	line "#MON LEAGUE"
	cont "to boot out the"
	cont "ELITE FOUR!"

	para "<PLAYER>, well"
	line "good luck to you!"
	cont "Don't sweat it!"
	cont "Smell ya!"
	done

SilphCo7F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16,  0, SILPH_CO_8F, 2
	warp_event 22,  0, SILPH_CO_6F, 1
	warp_event 18,  0, SILPH_CO_ELEVATOR, 1
	warp_event  5,  7, SILPH_CO_11F, 4
	warp_event  5,  3, SILPH_CO_3F, 9
	warp_event 21, 15, SILPH_CO_5F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FSilphWorkerM1Script, -1
	object_event 13, 13, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FSilphWorkerM2Script, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FSilphWorkerM3Script, -1
	object_event 10,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo7FSilphWorkerFScript, -1
	object_event 13,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FRocket1Script, EVENT_BEAT_SILPH_CO_7F_ROCKET_1
	object_event  2, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FScientistScript, EVENT_BEAT_SILPH_CO_7F_SCIENTIST
	object_event 20,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FRocket2Script, EVENT_BEAT_SILPH_CO_7F_ROCKET_2
	object_event 19, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FRocket3Script, EVENT_BEAT_SILPH_CO_7F_ROCKET_3
	object_event  3,  7, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo7FRivalScript, -1
	object_event  1,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo7FCalciumItemScript, EVENT_SILPH_CO_7F_CALCIUM
	object_event 24, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo7FTMSwordsDanceItemScript, EVENT_SILPH_CO_7F_TM_SWORDS_DANCE
