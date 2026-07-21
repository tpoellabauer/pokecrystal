	object_const_def
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER
	const PALLETTOWN_OAK

PalletTown_MapScripts:
	def_scene_scripts
	scene_script PalletTownOakStopScene, SCENE_PALLETTOWN_OAK_STOPS_YOU
	scene_script PalletTownNoopScene,    SCENE_PALLETTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlypointCallback

PalletTownFlypointCallback:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

; Oak's object (PALLETTOWN_OAK) defaults visible (its own EVENT_OAK_IN_PALLET_TOWN
; visibility mask evaluates "shown" since that flag is never set), so keep him
; disappeared whenever this scene is idle-polled -- otherwise he stands around town
; as a duplicate, always-talkable Oak instead of only appearing for the cutscene
; below (which explicitly `appear`s/`disappear`s him around the encounter itself).
PalletTownOakStopScene:
	disappear PALLETTOWN_OAK
	end

PalletTownNoopScene:
	end

; Oak stops you when you try to leave north into the tall grass without a #MON.
; Ported from pokered PalletTown_Script (the wYCoord==1 gate). The coord events stay
; armed on SCENE_PALLETTOWN_OAK_STOPS_YOU, so this re-blocks every attempt until Oak's
; Lab hands you a starter and disarms it (setmapscene ..., SCENE_PALLETTOWN_NOOP).
PalletTownOakStopsYouScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 20
	playmusic MUSIC_PROF_OAK ; "oak appears" cutscene music, like Red's MUSIC_MEET_PROF_OAK
	appear PALLETTOWN_OAK
	applymovement PALLETTOWN_OAK, PalletTownOakApproachMovement
	opentext
	writetext PalletTownOakStopText
	waitbutton
	closetext
	applymovement PALLETTOWN_OAK, PalletTownOakLeaveMovement
	disappear PALLETTOWN_OAK
	; Oak leads you into the lab: walk the player in (Red literally walks you there),
	; then fade-warp inside. The Pallet north gate stays armed until you actually get
	; a starter (Oak's Lab clears it after the battle).
	applymovement PLAYER, PalletTownPlayerWalkToLabMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	setmapscene OAKS_LAB, SCENE_OAKSLAB_INTRO
	warp OAKS_LAB, 5, 11
	end

PalletTownOakScript:
	jumptextfaceplayer PalletTownOakStopText

PalletTownOakApproachMovement:
	step UP
	step_end

PalletTownOakLeaveMovement:
	step DOWN
	step_end

; Walks the player from the north grass gate ((10,1)/(11,1)) down to the Lab door
; (12,11) -- ported from Red's RLEList_PlayerWalkToLab (PAD_UP2/RIGHT3/DOWN5/LEFT1/
; DOWN6), simplified to straight DOWN+RIGHT since the actual landing tile is still
; the fixed `warp OAKS_LAB, 5, 11` right after this movement finishes.
PalletTownPlayerWalkToLabMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step_end

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "RED'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "BLUE'S HOUSE"
	done

PalletTownOakStopText:
	text "Hey! Wait!"
	line "Don't go out!"

	para "It's unsafe!"
	line "Wild #MON live"
	cont "in tall grass!"

	para "You need your own"
	line "#MON for your"
	cont "protection."

	para "I know!"
	line "Here, come with"
	cont "me!"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 2

	def_coord_events
	coord_event 10,  1, SCENE_PALLETTOWN_OAK_STOPS_YOU, PalletTownOakStopsYouScript
	coord_event 11,  1, SCENE_PALLETTOWN_OAK_STOPS_YOU, PalletTownOakStopsYouScript

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  3,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 11, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	object_event 10,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownOakScript, EVENT_OAK_IN_PALLET_TOWN
