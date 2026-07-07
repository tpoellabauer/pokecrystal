	object_const_def
	const SILPHCO11F_SILPH_PRESIDENT
	const SILPHCO11F_BEAUTY
	const SILPHCO11F_GIOVANNI
	const SILPHCO11F_ROCKET1
	const SILPHCO11F_ROCKET2

SilphCo11F_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: gives the MASTER BALL the first time you talk to him (no Giovanni gate
; in the source - the boardroom is unreachable without going through him
; anyway), then a flavor description on repeat visits.
SilphCo11FPresidentScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MASTER_BALL_FROM_SILPH_PRESIDENT
	iftrue .AlreadyThanked
	writetext SilphCo11FPresidentThankYouText
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .NoRoom
	setevent EVENT_GOT_MASTER_BALL_FROM_SILPH_PRESIDENT
	opentext
	writetext SilphCo11FPresidentMasterBallDescriptionText
	waitbutton
	closetext
	end
.NoRoom:
	closetext
	end
.AlreadyThanked:
	writetext SilphCo11FPresidentMasterBallDescriptionText
	waitbutton
	closetext
	end

SilphCo11FBeautyScript:
	jumptextfaceplayer SilphCo11FBeautyText

; Boss battle. Gen 1 ambushes the player at a coordinate trigger near the
; boardroom door; simplified here to a talk-triggered battle, matching the
; existing Rocket Hideout B4F Giovanni fight (also a stationary talk-triggered
; NPC, not a coordinate ambush). EVENT_BEAT_SILPH_CO_ROCKETSROCK is the shared
; "beat Giovanni" flag already checked by the Silph Worker dialogue on floors
; 2F-10F.
SilphCo11FGiovanniScript:
	faceplayer
	opentext
	writetext SilphCo11FGiovanniText
	waitbutton
	closetext
	loadtrainer GIOVANNI, GIOVANNI_SILPH_CO
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_ROCKETSROCK
	opentext
	writetext SilphCo11FGiovanniEndBattleText
	promptbutton
	writetext SilphCo11FGiovanniAfterBattleText
	waitbutton
	closetext
	end

SilphCo11FRocket1Script:
	faceplayer
	opentext
	writetext SilphCo11FRocket1BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_61
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_11F_ROCKET_1
	opentext
	writetext SilphCo11FRocket1EndBattleText
	promptbutton
	writetext SilphCo11FRocket1AfterBattleText
	waitbutton
	closetext
	end

SilphCo11FRocket2Script:
	faceplayer
	opentext
	writetext SilphCo11FRocket2BattleText
	waitbutton
	closetext
	loadtrainer GRUNTM, GRUNTM_60
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SILPH_CO_11F_ROCKET_2
	opentext
	writetext SilphCo11FRocket2EndBattleText
	promptbutton
	writetext SilphCo11FRocket2AfterBattleText
	waitbutton
	closetext
	end

SilphCo11FPresidentThankYouText:
	text "PRESIDENT: Thank"
	line "you for saving"
	cont "SILPH!"

	para "I will never"
	line "forget you saved"
	cont "us in our moment"
	cont "of peril!"

	para "Because I am"
	line "rich, I can give"
	cont "you anything!"

	para "Here, maybe this"
	line "will do!"
	prompt

SilphCo11FPresidentMasterBallDescriptionText:
	text "PRESIDENT: You"
	line "can't buy that"
	cont "anywhere!"

	para "It's our secret"
	line "prototype MASTER"
	cont "BALL!"

	para "It will catch any"
	line "#MON without"
	cont "fail!"

	para "You should be"
	line "quiet about using"
	cont "it, though."
	done

SilphCo11FBeautyText:
	text "SECRETARY: Thank"
	line "you for rescuing"
	cont "all of us!"

	para "We admire your"
	line "courage."
	done

SilphCo11FGiovanniText:
	text "Ah <PLAYER>!"
	line "So we meet again!"

	para "The PRESIDENT and"
	line "I are discussing"
	cont "a vital business"
	cont "proposition."

	para "Keep your nose"
	line "out of grown-up"
	cont "matters..."

	para "Or, experience a"
	line "world of pain!"
	done

SilphCo11FGiovanniEndBattleText:
	text "Arrgh!!"
	line "I lost again!?"
	done

SilphCo11FGiovanniAfterBattleText:
	text "Blast it all!"
	line "You ruined our"
	cont "plans for SILPH!"

	para "But, TEAM ROCKET"
	line "will never fall!"

	para "<PLAYER>! Never"
	line "forget that all"
	cont "#MON exist for"
	cont "TEAM ROCKET!"

	para "I must go, but I"
	line "shall return!"
	done

SilphCo11FRocket1BattleText:
	text "Stop right there!"
	line "Don't you move!"
	done

SilphCo11FRocket1EndBattleText:
	text "Don't..."
	line "Please!"
	done

SilphCo11FRocket1AfterBattleText:
	text "So, you want to"
	line "see my BOSS?"
	done

SilphCo11FRocket2BattleText:
	text "Halt! Do you have"
	line "an appointment"
	cont "with my BOSS?"
	done

SilphCo11FRocket2EndBattleText:
	text "Gaah!"
	line "Demolished!"
	done

SilphCo11FRocket2AfterBattleText:
	text "Watch your step,"
	line "my BOSS likes his"
	cont "#MON tough!"
	done

SilphCo11F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, SILPH_CO_10F, 2
	warp_event 13,  0, SILPH_CO_ELEVATOR, 1
	; Gen 1's roof warp is LAST_MAP (return to whichever map led here); Silph Co's
	; only entrance is SAFFRON_CITY warp id 7 (see SilphCo1F.asm), so that is the
	; concrete destination here.
	warp_event  5,  5, SAFFRON_CITY, 7
	warp_event  3,  2, SILPH_CO_7F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo11FPresidentScript, -1
	object_event 10,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo11FBeautyScript, -1
	object_event  6,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo11FGiovanniScript, -1
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo11FRocket1Script, EVENT_BEAT_SILPH_CO_11F_ROCKET_1
	object_event 15,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo11FRocket2Script, EVENT_BEAT_SILPH_CO_11F_ROCKET_2
