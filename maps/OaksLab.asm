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
	scene_script OaksLabNoopScene,  SCENE_OAKSLAB_NOOP      ; default (wandered in early)
	scene_script OaksLabIntroScene, SCENE_OAKSLAB_INTRO     ; armed by the Pallet Oak event
	scene_script OaksLabNoopScene,  SCENE_OAKSLAB_CANT_LEAVE

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
	setscene SCENE_OAKSLAB_CANT_LEAVE
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
	checkevent EVENT_GOT_KANTO_POKEDEX
	iftrue .PostDex
	checkevent EVENT_GOT_OAKS_PARCEL
	iftrue .GiveDex
	writetext OaksLabOakDeliverParcelHintText
	waitbutton
	closetext
	end
.PostDex:
	writetext OaksLabOakHowIsYourPokedexComingText
	waitbutton
	closetext
	end
.GiveDex:
	closetext
	sjump OaksLabPokedexScene

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
	setscene SCENE_OAKSLAB_NOOP
	writetext OaksLabChoseStarterText
	promptbutton
	getmonname STRING_BUFFER_3, CHARMANDER
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHARMANDER, 5
	writetext OaksLabOakYourPokemonCanFightText
	waitbutton
	closetext
	disappear OAKSLAB_SQUIRTLE_BALL
	winlosstext OaksLabRivalIPickedTheWrongPokemonText, OaksLabRivalLossText
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
	setscene SCENE_OAKSLAB_NOOP
	writetext OaksLabChoseStarterText
	promptbutton
	getmonname STRING_BUFFER_3, SQUIRTLE
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke SQUIRTLE, 5
	writetext OaksLabOakYourPokemonCanFightText
	waitbutton
	closetext
	disappear OAKSLAB_BULBASAUR_BALL
	winlosstext OaksLabRivalIPickedTheWrongPokemonText, OaksLabRivalLossText
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
	setscene SCENE_OAKSLAB_NOOP
	writetext OaksLabChoseStarterText
	promptbutton
	getmonname STRING_BUFFER_3, BULBASAUR
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke BULBASAUR, 5
	writetext OaksLabOakYourPokemonCanFightText
	waitbutton
	closetext
	disappear OAKSLAB_CHARMANDER_BALL
	winlosstext OaksLabRivalIPickedTheWrongPokemonText, OaksLabRivalLossText
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
	checkevent EVENT_CHOSE_CHARMANDER
	iftrue .RivalTakesSquirtle
	checkevent EVENT_CHOSE_SQUIRTLE
	iftrue .RivalTakesBulbasaur
	getmonname STRING_BUFFER_3, CHARMANDER
	sjump .RivalReceivedMon
.RivalTakesSquirtle:
	getmonname STRING_BUFFER_3, SQUIRTLE
	sjump .RivalReceivedMon
.RivalTakesBulbasaur:
	getmonname STRING_BUFFER_3, BULBASAUR
.RivalReceivedMon:
	writetext OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
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
	writetext OaksLabLastMonText
	waitbutton
	closetext
	end

OaksLabDontGoAwayYetScript:
	turnobject OAKSLAB_OAK, DOWN
	turnobject OAKSLAB_RIVAL, DOWN
	opentext
	writetext OaksLabOakDontGoAwayYetText
	waitbutton
	closetext
	applymovement PLAYER, OaksLabPlayerWalkBackMovement
	end

OaksLabPlayerWalkBackMovement:
	step UP
	step_end

; --- Oak's Parcel delivery -> Pokedex + rival-returns cameo -----------------
OaksLabPokedexScene:
	opentext
	writetext OaksLabOak1DeliverParcelText
	promptbutton
	takeitem OAKS_PARCEL
	appear OAKSLAB_RIVAL
	turnobject OAKSLAB_RIVAL, LEFT
	writetext OaksLabRivalGrampsText
	waitbutton
	writetext OaksLabRivalWhatDidYouCallMeForText
	waitbutton
	writetext OaksLabOakPokedexSpeechText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext OaksLabOakGotPokedexText
	waitbutton
	giveitem POKE_BALL, 5
	writetext OaksLabOak1ReceivedPokeballsText
	waitbutton
	writetext OaksLabRivalLeaveItAllToMeText
	waitbutton
	closetext
	setevent EVENT_GOT_KANTO_POKEDEX
	applymovement OAKSLAB_RIVAL, OaksLabRivalExitMovement
	disappear OAKSLAB_RIVAL
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
	text "<RIVAL>: Gramps!"
	line "I'm fed up with"
	cont "waiting!"
	done

OaksLabRivalGrampsIsntAroundText:
	text "<RIVAL>: Yo"
	line "<PLAY_G>! Gramps"
	cont "isn't around!"
	done

OaksLabOakChooseMonText:
	text "OAK: <RIVAL>?"
	line "Let me think..."

	para "Oh, that's right,"
	line "I told you to"
	cont "come! Just wait!"

	para "Here, <PLAY_G>!"

	para "There are 3"
	line "#MON here!"

	para "Haha!"

	para "They are inside"
	line "the # BALLs."

	para "When I was young,"
	line "I was a serious"
	cont "#MON trainer!"

	para "In my old age, I"
	line "have only 3 left,"
	cont "but you can have"
	cont "one! Choose!"
	done

OaksLabRivalWhatAboutMeText:
	text "<RIVAL>: Hey!"
	line "Gramps! What"
	cont "about me?"
	done

OaksLabOakBePatientText:
	text "OAK: Be patient!"
	line "<RIVAL>, you can"
	cont "have one too!"
	done

OaksLabOakHelloText:
	text "#MON around the"
	line "world wait for"
	cont "you, <PLAY_G>!"
	done

OaksLabOakWhichMonText:
	text "OAK: Now, <PLAY_G>,"
	line "which #MON do"
	cont "you want?"
	done

OaksLabOakDeliverParcelHintText:
	text "OAK: Oh right! I"
	line "have a request"
	cont "of you two."
	done

OaksLabOakHowIsYourPokedexComingText:
	text "OAK: Good to see you!"
	line "How is your #DEX"
	cont "coming? Here, let me"
	cont "take a look!"
	done

OaksLabOakYourPokemonCanFightText:
	text "OAK: If a wild #MON"
	line "appears, your #MON"
	cont "can fight against it!"
	done

OaksLabOak1DeliverParcelText:
	text "OAK: Oh, <PLAY_G>!"

	para "How is my old"
	line "#MON?"

	para "Well, it seems to"
	line "like you a lot."

	para "You must be"
	line "talented as a"
	cont "#MON trainer!"

	para "What? You have"
	line "something for me?"

	para "<PLAY_G> delivered"
	line "OAK's PARCEL."
	done

OaksLabOak1ReceivedPokeballsText:
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para "<PLAY_G> got 5"
	line "# BALLs!@"
	text_end

OaksLabRivalWhatDidYouCallMeForText:
	text "<RIVAL>: What did"
	line "you call me for?"
	done

OaksLabOakPokedexSpeechText:
	text "On the desk there"
	line "is my invention,"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"

	para "It's a hi-tech"
	line "encyclopedia!"
	done

OaksLabOakGotPokedexText:
	text "OAK: <PLAY_G> and"
	line "<RIVAL>! Take these"
	cont "with you!"

	para "<PLAY_G> got"
	line "#DEX from OAK!"
	done

OaksLabRivalLeaveItAllToMeText:
	text "<RIVAL>: Alright"
	line "Gramps! Leave it"
	cont "all to me!"

	para "<PLAY_G>, I hate to"
	line "say it, but I"
	cont "don't need you!"

	para "I know! I'll"
	line "borrow a TOWN MAP"
	cont "from my sis!"

	para "I'll tell her not"
	line "to lend you one,"
	cont "<PLAY_G>! Hahaha!"
	done

OaksLabThosePokeBallsText:
	text "Those are #"
	line "BALLs. They"
	cont "contain #MON!"
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

OaksLabLastMonText:
	text "That's PROF.OAK's"
	line "last #MON!"
	done

OaksLabRivalIllTakeThisOneText:
	text "<RIVAL>: I'll take"
	line "this one, then!"
	done

OaksLabRivalReceivedMonText:
	text "<RIVAL> received"
	line "a @"
	text_ram wStringBuffer3
	text "!@"
	text_end

OaksLabRivalIllTakeYouOnText:
	text "<RIVAL>: Wait"
	line "<PLAY_G>!"
	cont "Let's check out"
	cont "our #MON!"

	para "Come on, I'll take"
	line "you on!"
	done

OaksLabRivalIPickedTheWrongPokemonText:
	text "WHAT?"
	line "Unbelievable!"
	cont "I picked the wrong"
	cont "#MON!"
	done

OaksLabRivalLossText:
	text "<RIVAL>: Yeah! Am I"
	line "great or what?"
	done

OaksLabRivalSmellYouLaterText:
	text "<RIVAL>: Okay! I'll"
	line "make my #MON"

	para "fight to toughen"
	line "it up!"

	para "<PLAY_G>! Gramps!"
	line "Smell you later!"
	done

OaksLabRivalGoAheadChooseText:
	text "<RIVAL>: Heh, I"
	line "don't need to be"
	cont "greedy like you!"

	para "Go ahead and"
	line "choose, <PLAY_G>!"
	done

OaksLabRivalGrampsText:
	text "<RIVAL>: Gramps!"
	done

OaksLabOakDontGoAwayYetText:
	text "OAK: Hey! Don't go"
	line "away yet!"
	done

OaksLabRivalMineLooksStrongerText:
	text "<RIVAL>: My #MON"
	line "looks a lot"
	cont "stronger."
	done

OaksLabGirlText:
	text "PROF.OAK is the"
	line "authority on"
	cont "#MON!"

	para "Many #MON"
	line "trainers hold him"
	cont "in high regard!"
	done

OaksLabScientistText:
	text "I study #MON as"
	line "PROF.OAK's AIDE."
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
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

; Red dialogue retained for Oak's Lab story beats not currently script-reachable.
OaksLabMonEnergeticText:
	text "This #MON is"
	line "really energetic!"
	prompt

OaksLabOak1RaiseYourYoungPokemonText:
	text "OAK: <PLAY_G>,"
	line "raise your young"
	cont "#MON by making"
	cont "it fight!"
	done

OaksLabOak2Text:
	text "?"
	done

OaksLabGivePokeballsExplanationText:
	para "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and try"
	line "to catch it!"

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "could escape. You"
	cont "have to be lucky!"
	done

OaksLabOak1ParcelThanksText:
	para "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thank you!"
	done

OaksLabOakThatWasMyDreamText:
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world..."

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events
	coord_event  4,  6, SCENE_OAKSLAB_CANT_LEAVE, OaksLabDontGoAwayYetScript
	coord_event  5,  6, SCENE_OAKSLAB_CANT_LEAVE, OaksLabDontGoAwayYetScript

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
