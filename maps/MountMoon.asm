	object_const_def
	const MOUNTMOON_RIVAL
	const MOUNTMOON_FOSSIL_SUPER_NERD
	const MOUNTMOON_DOME_FOSSIL
	const MOUNTMOON_HELIX_FOSSIL

MountMoon_MapScripts:
	def_scene_scripts
	scene_script MountMoonRivalEncounterScene, SCENE_MOUNTMOON_RIVAL_BATTLE
	scene_script MountMoonNoopScene,           SCENE_MOUNTMOON_NOOP

	def_callbacks

MountMoonRivalEncounterScene:
	sdefer MountMoonRivalBattleScript
	end

MountMoonNoopScene:
	end

MountMoonRivalBattleScript:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_RIVAL, MountMoonRivalMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonRivalTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonRivalTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_RIVAL, MountMoonRivalMovementAfter
	disappear MOUNTMOON_RIVAL
	setscene SCENE_MOUNTMOON_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonRivalMovementBefore:
	step LEFT
	step LEFT
	step LEFT
	step_end

MountMoonRivalMovementAfter:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonRivalTextBefore:
	text "<……> <……> <……>"

	para "It's been a while,"
	line "<PLAYER>."

	para "…Since I lost to"
	line "you, I thought"

	para "about what I was"
	line "lacking with my"
	cont "#MON…"

	para "And we came up"
	line "with an answer."

	para "<PLAYER>, now we'll"
	line "show you!"
	done

MountMoonRivalTextWin:
	text "<……> <……> <……>"

	para "I thought I raised"
	line "my #MON to be"

	para "the best they"
	line "could be…"

	para "…But it still "
	line "wasn't enough…"
	done

MountMoonRivalTextAfter:
	text "<……> <……> <……>"

	para "…You won, fair"
	line "and square."

	para "I admit it. But"
	line "this isn't the"
	cont "end."

	para "I'm going to be"
	line "the greatest #-"
	cont "MON trainer ever."

	para "Because these guys"
	line "are behind me."

	para "…Listen, <PLAYER>."

	para "One of these days"
	line "I'm going to prove"

	para "how good I am by"
	line "beating you."
	done

MountMoonRivalTextLoss:
	text "<……> <……> <……>"

	para "I've repaid my"
	line "debt to you."

	para "With my #MON,"
	line "I'm going to beat"

	para "the CHAMPION and"
	line "become the world's"
	cont "greatest trainer."
	done

; Gen1 Mt Moon fossil-pickup room (issue #170), ported from pokered scripts/MtMoonB2F.asm +
; text/MtMoonB2F.asm. Gen1's separate B2F floor was dropped when Mt Moon collapsed into this
; single GSC map, so the scene is re-hosted here: a Super Nerd blocks two fossils (SPRITE_ROCK
; stand-ins for Gen1's SPRITE_FOSSIL) and demands a rival-for-the-fossil battle; after he loses
; the player may take exactly ONE fossil -- picking either sets the shared EVENT_GOT_MT_MOON_
; FOSSIL flag, which is both fossil objects' visibility flag, so the other is hidden ("the Super
; Nerd grabs it"), enforcing the mutually-exclusive choice. The chosen fossil is a key item
; carried to Cinnabar Lab for revival (#164's already-ported checkitem flow).
MountMoonFossilSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MT_MOON_FOSSIL_SUPER_NERD
	iftrue .Beaten
	writetext MountMoonSuperNerdBothMineText
	waitbutton
	closetext
	winlosstext MountMoonSuperNerdWinText, MountMoonSuperNerdLossText
	setlasttalked MOUNTMOON_FOSSIL_SUPER_NERD
	loadtrainer SUPER_NERD, STAN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MT_MOON_FOSSIL_SUPER_NERD
	opentext
	writetext MountMoonSuperNerdShareText
	waitbutton
	closetext
	end

.Beaten:
	checkevent EVENT_GOT_MT_MOON_FOSSIL
	iftrue .GotOne
	writetext MountMoonSuperNerdEachTakeOneText
	waitbutton
	closetext
	end

.GotOne:
	writetext MountMoonSuperNerdPokeLabText
	waitbutton
	closetext
	end

MountMoonDomeFossilScript:
	opentext
	checkevent EVENT_GOT_MT_MOON_FOSSIL
	iftrue .Done
	checkevent EVENT_BEAT_MT_MOON_FOSSIL_SUPER_NERD
	iffalse .Guarded
	writetext MountMoonDomeFossilOfferText
	yesorno
	iffalse .Done
	verbosegiveitem DOME_FOSSIL
	iffalse .Done
	setevent EVENT_GOT_MT_MOON_FOSSIL
	writetext MountMoonSuperNerdTakesOtherText
	waitbutton
	disappear MOUNTMOON_DOME_FOSSIL
	disappear MOUNTMOON_HELIX_FOSSIL
	closetext
	end

.Guarded:
	writetext MountMoonFossilGuardedText
	waitbutton
.Done:
	closetext
	end

MountMoonHelixFossilScript:
	opentext
	checkevent EVENT_GOT_MT_MOON_FOSSIL
	iftrue .Done
	checkevent EVENT_BEAT_MT_MOON_FOSSIL_SUPER_NERD
	iffalse .Guarded
	writetext MountMoonHelixFossilOfferText
	yesorno
	iffalse .Done
	verbosegiveitem HELIX_FOSSIL
	iffalse .Done
	setevent EVENT_GOT_MT_MOON_FOSSIL
	writetext MountMoonSuperNerdTakesOtherText
	waitbutton
	disappear MOUNTMOON_DOME_FOSSIL
	disappear MOUNTMOON_HELIX_FOSSIL
	closetext
	end

.Guarded:
	writetext MountMoonFossilGuardedText
	waitbutton
.Done:
	closetext
	end

MountMoonSuperNerdBothMineText:
	text "Hey, stop!"

	para "I found these"
	line "fossils! They're"
	cont "both mine!"
	done

MountMoonSuperNerdWinText:
	text "Rgh!"
	line "You beat me!"
	done

MountMoonSuperNerdLossText:
	text "Heh! These"
	line "fossils are mine!"
	done

MountMoonSuperNerdShareText:
	text "OK! I'll share!"

	para "We'll each take"
	line "one!"
	cont "No being greedy!"
	done

MountMoonSuperNerdEachTakeOneText:
	text "We'll each take"
	line "one!"
	cont "No being greedy!"
	done

MountMoonSuperNerdPokeLabText:
	text "Far away, on"
	line "CINNABAR ISLAND,"
	cont "there's a #MON"
	cont "LAB."

	para "They do research"
	line "on regenerating"
	cont "fossils."
	done

MountMoonFossilGuardedText:
	text "A SUPER NERD is"
	line "guarding the"

	para "fossils. Better"
	line "settle it with"
	cont "him first!"
	done

MountMoonDomeFossilOfferText:
	text "You want the"
	line "DOME FOSSIL?"
	done

MountMoonHelixFossilOfferText:
	text "You want the"
	line "HELIX FOSSIL?"
	done

MountMoonSuperNerdTakesOtherText:
	text "The SUPER NERD"
	line "grabbed the other"
	cont "fossil and ran!"
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	object_event 12,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonFossilSuperNerdScript, -1
	object_event 11,  7, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonDomeFossilScript, EVENT_GOT_MT_MOON_FOSSIL
	object_event 13,  7, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonHelixFossilScript, EVENT_GOT_MT_MOON_FOSSIL
