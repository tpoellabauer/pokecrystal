	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_RIVAL
	const OAKSLAB_CHARMANDER_BALL
	const OAKSLAB_SQUIRTLE_BALL
	const OAKSLAB_BULBASAUR_BALL
	const OAKSLAB_GIRL
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2

; Gen 1 Oak's Lab intro, ported from pokered scripts/OaksLab.asm.
; Flow: Oak leads you in (Pallet grass event warps you here + arms SCENE_OAKSLAB_INTRO)
; -> Oak/rival "choose a mon" dialog -> pick 1 of 3 balls -> rival takes the type-counter
; starter -> first rival battle (party depends on your pick) -> rival leaves. The Pokedex
; and Oak's Parcel come later (Viridian parcel errand).

OaksLab_MapScripts:
	def_scene_scripts
	scene_script OaksLabNoopScene,  SCENE_OAKSLAB_NOOP  ; default (wandered in early)
	scene_script OaksLabIntroScene, SCENE_OAKSLAB_INTRO ; armed by the Pallet Oak event

	def_callbacks
	callback MAPCALLBACK_OBJECTS, OaksLabObjectsCallback

OaksLabNoopScene:
	end

OaksLabIntroScene:
	sdefer OaksLabIntroScript
	end

OaksLabObjectsCallback:
	checkevent EVENT_BATTLED_RIVAL_IN_OAKS_LAB
	iffalse .rivalStays
	disappear OAKSLAB_RIVAL
.rivalStays:
	checkevent EVENT_GOT_STARTER
	iffalse .done
	disappear OAKSLAB_CHARMANDER_BALL
	disappear OAKSLAB_SQUIRTLE_BALL
	disappear OAKSLAB_BULBASAUR_BALL
.done:
	endcallback

; --- the forced intro when Oak has just led you in --------------------------
OaksLabIntroScript:
	applymovement PLAYER, OaksLabPlayerWalkInMovement
	turnobject OAKSLAB_RIVAL, DOWN
	opentext
	writetext OaksLabRivalFedUpText
	waitbutton
	closetext
	turnobject OAKSLAB_OAK, DOWN
	opentext
	writetext OaksLabOakChooseMonText
	waitbutton
	closetext
	opentext
	writetext OaksLabRivalWhatAboutMeText
	waitbutton
	closetext
	opentext
	writetext OaksLabOakBePatientText
	waitbutton
	closetext
	setevent EVENT_OAK_ASKED_TO_CHOOSE_MON
	setscene SCENE_OAKSLAB_NOOP
	end

OaksLabPlayerWalkInMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

; --- Oak by the table -------------------------------------------------------
OaksLabOakScript:
	faceplayer
	opentext
	checkevent EVENT_BATTLED_RIVAL_IN_OAKS_LAB
	iftrue .AfterRival
	checkevent EVENT_OAK_ASKED_TO_CHOOSE_MON
	iftrue .ChooseOne
	writetext OaksLabOakHelloText
	waitbutton
	closetext
	end
.ChooseOne:
	writetext OaksLabOakWhichMonText
	waitbutton
	closetext
	end
.AfterRival:
	writetext OaksLabOakDeliverParcelHintText
	waitbutton
	closetext
	end

; --- the three starter Poke Balls -------------------------------------------
OaksLabCharmanderBallScript:
	checkevent EVENT_GOT_STARTER
	iftrue OaksLabStarterAlreadyTakenScript
	checkevent EVENT_OAK_ASKED_TO_CHOOSE_MON
	iffalse OaksLabThosePokeBallsScript
	turnobject OAKSLAB_OAK, DOWN
	reanchormap
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext OaksLabYouWantCharmanderText
	yesorno
	iffalse OaksLabPickAgainScript
	disappear OAKSLAB_CHARMANDER_BALL
	setevent EVENT_GOT_STARTER
	setevent EVENT_CHOSE_CHARMANDER
	writetext OaksLabChoseStarterText
	promptbutton
	getmonname STRING_BUFFER_3, CHARMANDER
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHARMANDER, 5
	closetext
	disappear OAKSLAB_SQUIRTLE_BALL
	winlosstext OaksLabRivalWinText, OaksLabRivalLossText
	setlasttalked OAKSLAB_RIVAL
	loadtrainer RIVAL1, RIVAL1_KANTO_SQUIRTLE
	sjump OaksLabRivalTakesAndBattles

OaksLabSquirtleBallScript:
	checkevent EVENT_GOT_STARTER
	iftrue OaksLabStarterAlreadyTakenScript
	checkevent EVENT_OAK_ASKED_TO_CHOOSE_MON
	iffalse OaksLabThosePokeBallsScript
	turnobject OAKSLAB_OAK, DOWN
	reanchormap
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext OaksLabYouWantSquirtleText
	yesorno
	iffalse OaksLabPickAgainScript
	disappear OAKSLAB_SQUIRTLE_BALL
	setevent EVENT_GOT_STARTER
	setevent EVENT_CHOSE_SQUIRTLE
	writetext OaksLabChoseStarterText
	promptbutton
	getmonname STRING_BUFFER_3, SQUIRTLE
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke SQUIRTLE, 5
	closetext
	disappear OAKSLAB_BULBASAUR_BALL
	winlosstext OaksLabRivalWinText, OaksLabRivalLossText
	setlasttalked OAKSLAB_RIVAL
	loadtrainer RIVAL1, RIVAL1_KANTO_BULBASAUR
	sjump OaksLabRivalTakesAndBattles

OaksLabBulbasaurBallScript:
	checkevent EVENT_GOT_STARTER
	iftrue OaksLabStarterAlreadyTakenScript
	checkevent EVENT_OAK_ASKED_TO_CHOOSE_MON
	iffalse OaksLabThosePokeBallsScript
	turnobject OAKSLAB_OAK, DOWN
	reanchormap
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext OaksLabYouWantBulbasaurText
	yesorno
	iffalse OaksLabPickAgainScript
	disappear OAKSLAB_BULBASAUR_BALL
	setevent EVENT_GOT_STARTER
	setevent EVENT_CHOSE_BULBASAUR
	writetext OaksLabChoseStarterText
	promptbutton
	getmonname STRING_BUFFER_3, BULBASAUR
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke BULBASAUR, 5
	closetext
	disappear OAKSLAB_CHARMANDER_BALL
	winlosstext OaksLabRivalWinText, OaksLabRivalLossText
	setlasttalked OAKSLAB_RIVAL
	loadtrainer RIVAL1, RIVAL1_KANTO_CHARMANDER
	sjump OaksLabRivalTakesAndBattles

; shared tail: rival grabs the counter starter and challenges you
OaksLabRivalTakesAndBattles:
	setevent EVENT_RIVAL_GOT_STARTER
	turnobject OAKSLAB_RIVAL, DOWN
	opentext
	writetext OaksLabRivalIllTakeThisOneText
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OaksLabRivalIllTakeYouOnText
	waitbutton
	closetext
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext OaksLabRivalSmellYouLaterText
	waitbutton
	closetext
	applymovement OAKSLAB_RIVAL, OaksLabRivalExitMovement
	disappear OAKSLAB_RIVAL
	setevent EVENT_BATTLED_RIVAL_IN_OAKS_LAB
	setevent EVENT_FOLLOWED_OAK_INTO_LAB
	setevent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	setmapscene PALLET_TOWN, SCENE_PALLETTOWN_NOOP
	special HealParty
	playmapmusic
	end

OaksLabRivalExitMovement:
	step DOWN
	step DOWN
	step_end

OaksLabThosePokeBallsScript:
	opentext
	writetext OaksLabThosePokeBallsText
	waitbutton
	closetext
	end

OaksLabPickAgainScript:
	opentext
	writetext OaksLabPickAgainText
	waitbutton
	closetext
	end

OaksLabStarterAlreadyTakenScript:
	opentext
	writetext OaksLabStarterAlreadyTakenText
	waitbutton
	closetext
	end

; --- the rival, before you pick --------------------------------------------
OaksLabRivalScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_STARTER
	iftrue .AfterChoose
	writetext OaksLabRivalGoAheadChooseText
	waitbutton
	closetext
	end
.AfterChoose:
	writetext OaksLabRivalMineLooksStrongerText
	waitbutton
	closetext
	end

OaksLabGirlScript:
	jumptextfaceplayer OaksLabGirlText

OaksLabScientist1Script:
	jumptextfaceplayer OaksLabScientistText

OaksLabScientist2Script:
	jumptextfaceplayer OaksLabScientistText

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

; --- text -------------------------------------------------------------------
OaksLabRivalFedUpText:
	text "GARY: Gramps! I'm"
	line "fed up with"
	cont "waiting!"
	done

OaksLabOakChooseMonText:
	text "OAK: <PLAY_G>?"
	line "Let me think…"

	para "Oh, that's right, I"
	line "told you to come!"

	para "Just wait!"

	para "Here, <PLAY_G>!"
	line "There are 3 #-"
	cont "MON here."

	para "Ha, ha, ha!"

	para "When I was young, I"
	line "was a serious #-"
	cont "MON trainer!"

	para "In my old age, I"
	line "have only 3 left,"

	para "but you can have"
	line "one! Choose!"
	done

OaksLabRivalWhatAboutMeText:
	text "GARY: Hey! Gramps!"
	line "What about me?"
	done

OaksLabOakBePatientText:
	text "OAK: Be patient,"
	line "GARY. You can have"
	cont "one, too!"
	done

OaksLabOakHelloText:
	text "OAK: The #MON on"
	line "the table are for"

	para "you and GARY."
	line "Go on, choose!"
	done

OaksLabOakWhichMonText:
	text "OAK: Which #MON"
	line "will you choose?"
	done

OaksLabOakDeliverParcelHintText:
	text "OAK: Now that you"
	line "have a #MON,"

	para "run an errand for"
	line "me, would you?"

	para "There's a #MART"
	line "in VIRIDIAN CITY."

	para "Pick up my order"
	line "there for me."
	done

OaksLabThosePokeBallsText:
	text "Those are #"
	line "BALLS. They contain"
	cont "#MON."
	done

OaksLabYouWantCharmanderText:
	text "So! You want the"
	line "fire #MON,"

	para "CHARMANDER?"
	done

OaksLabYouWantSquirtleText:
	text "So! You want the"
	line "water #MON,"

	para "SQUIRTLE?"
	done

OaksLabYouWantBulbasaurText:
	text "So! You want the"
	line "plant #MON,"

	para "BULBASAUR?"
	done

OaksLabChoseStarterText:
	text "OAK: That's your"
	line "#MON!"

	para "Raise it well!"
	done

OaksLabReceivedStarterText:
	text "<PLAY_G> received"
	line "a @"
	text_ram wStringBuffer3
	text "!@"
	text_end

OaksLabPickAgainText:
	text "Take your time to"
	line "choose."
	done

OaksLabStarterAlreadyTakenText:
	text "You already have a"
	line "#MON! Get going!"
	done

OaksLabRivalIllTakeThisOneText:
	text "GARY: I'll take"
	line "this one, then!"
	done

OaksLabRivalIllTakeYouOnText:
	text "GARY: Wait,"
	line "<PLAY_G>! Let's"

	para "check out our #-"
	line "MON!"

	para "Come on, I'll take"
	line "you on!"
	done

OaksLabRivalWinText:
	text "GARY: Why did I"
	line "pick this dumb"
	cont "#MON?"
	done

OaksLabRivalLossText:
	text "GARY: Yeah! Am I"
	line "great or what?"
	done

OaksLabRivalSmellYouLaterText:
	text "GARY: Okay! I'll"
	line "make my #MON"

	para "fight to toughen"
	line "it up!"

	para "<PLAY_G>! Gramps!"
	line "Smell you later!"
	done

OaksLabRivalGoAheadChooseText:
	text "GARY: Hurry up and"
	line "choose one!"
	done

OaksLabRivalMineLooksStrongerText:
	text "GARY: My #MON"
	line "looks a lot"
	cont "stronger. Heh!"
	done

OaksLabGirlText:
	text "I'm PROF.OAK's"
	line "aide."

	para "Take good care of"
	line "your new #MON!"
	done

OaksLabScientistText:
	text "PROF.OAK is the"
	line "authority on #-"
	cont "MON."

	para "Many trainers hold"
	line "him in high regard."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "It's the lab's PC."
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  5,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabOakScript, -1
	object_event  4,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabRivalScript, -1
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabCharmanderBallScript, -1
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabSquirtleBallScript, -1
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabBulbasaurBallScript, -1
	object_event  1,  9, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OaksLabGirlScript, -1
	object_event  2, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabScientist1Script, -1
	object_event  8, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabScientist2Script, -1
