	object_const_def
	const SSANNE1FROOMS_GENTLEMAN1
	const SSANNE1FROOMS_GENTLEMAN2
	const SSANNE1FROOMS_GENTLEMAN3
	const SSANNE1FROOMS_YOUNGSTER
	const SSANNE1FROOMS_LASS
	const SSANNE1FROOMS_GIRL1
	const SSANNE1FROOMS_MIDDLEMAN
	const SSANNE1FROOMS_LITTLEGIRL
	const SSANNE1FROOMS_WIGGLYTUFF
	const SSANNE1FROOMS_GIRL2
	const SSANNE1FROOMS_ITEM

SSAnne1FRooms_MapScripts:
	def_scene_scripts

	def_callbacks

; Gentleman 1 trainer battle
SSAnne1FRoomsGentleman1Script:
	faceplayer
	opentext
	writetext SSAnne1FRoomsGentleman1BeforeText
	waitbutton
	closetext
	loadtrainer GENTLEMAN, 6
	winlosstext SSAnne1FRoomsGentleman1WinText, SSAnne1FRoomsGentleman1LossText
	setlasttalked SSANNE1FROOMS_GENTLEMAN1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_GENTLEMAN_SSANNE_1
	opentext
	writetext SSAnne1FRoomsGentleman1AfterText
	waitbutton
	closetext
	end

; Gentleman 2 trainer battle
SSAnne1FRoomsGentleman2Script:
	faceplayer
	opentext
	writetext SSAnne1FRoomsGentleman2BeforeText
	waitbutton
	closetext
	loadtrainer GENTLEMAN, 7
	winlosstext SSAnne1FRoomsGentleman2WinText, SSAnne1FRoomsGentleman2LossText
	setlasttalked SSANNE1FROOMS_GENTLEMAN2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_GENTLEMAN_SSANNE_2
	opentext
	writetext SSAnne1FRoomsGentleman2AfterText
	waitbutton
	closetext
	end

; Gentleman 3 trainer battle
SSAnne1FRoomsGentleman3Script:
	faceplayer
	opentext
	writetext SSAnne1FRoomsGentleman3BeforeText
	waitbutton
	closetext
	loadtrainer GENTLEMAN, 8
	winlosstext SSAnne1FRoomsGentleman3WinText, SSAnne1FRoomsGentleman3LossText
	setlasttalked SSANNE1FROOMS_GENTLEMAN3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_GENTLEMAN_SSANNE_3
	opentext
	writetext SSAnne1FRoomsGentleman3AfterText
	waitbutton
	closetext
	end

; Youngster trainer battle
SSAnne1FRoomsYoungsterScript:
	faceplayer
	opentext
	writetext SSAnne1FRoomsYoungsterBeforeText
	waitbutton
	closetext
	loadtrainer YOUNGSTER, 15
	winlosstext SSAnne1FRoomsYoungsterWinText, SSAnne1FRoomsYoungsterLossText
	setlasttalked SSANNE1FROOMS_YOUNGSTER
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_YOUNGSTER_SSANNE
	opentext
	writetext SSAnne1FRoomsYoungsterAfterText
	waitbutton
	closetext
	end

; Lass trainer battle
SSAnne1FRoomsLassScript:
	faceplayer
	opentext
	writetext SSAnne1FRoomsLassBeforeText
	waitbutton
	closetext
	loadtrainer LASS, 18
	winlosstext SSAnne1FRoomsLassWinText, SSAnne1FRoomsLassLossText
	setlasttalked SSANNE1FROOMS_LASS
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_LASS_SSANNE
	opentext
	writetext SSAnne1FRoomsLassAfterText
	waitbutton
	closetext
	end

; NPCs
SSAnne1FRoomsGirl1Script:
	jumptextfaceplayer SSAnne1FRoomsGirl1Text

SSAnne1FRoomsMiddlemanScript:
	jumptextfaceplayer SSAnne1FRoomsMiddlemanText

SSAnne1FRoomsLittleGirlScript:
	jumptextfaceplayer SSAnne1FRoomsLittleGirlText

SSAnne1FRoomsWigglytuffScript:
	opentext
	writetext SSAnne1FRoomsWigglytuffText
	waitbutton
	closetext
	end

SSAnne1FRoomsGirl2Script:
	jumptextfaceplayer SSAnne1FRoomsGirl2Text

SSAnne1FRoomsItemScript:
	itemball TM_BODY_SLAM

SSAnne1FRoomsGentleman1BeforeText:
	text "Hi!"
	done

SSAnne1FRoomsGentleman1WinText:
	text "Oh!"
	done

SSAnne1FRoomsGentleman1LossText:
	text "How rude!"
	done

SSAnne1FRoomsGentleman1AfterText:
	text "That was fun!"
	done

SSAnne1FRoomsGentleman2BeforeText:
	text "Care for a battle?"
	done

SSAnne1FRoomsGentleman2WinText:
	text "I lost!"
	done

SSAnne1FRoomsGentleman2LossText:
	text "Excellent!"
	done

SSAnne1FRoomsGentleman2AfterText:
	text "You're quite skilled!"
	done

SSAnne1FRoomsGentleman3BeforeText:
	text "Shall we duel?"
	done

SSAnne1FRoomsGentleman3WinText:
	text "Defeated!"
	done

SSAnne1FRoomsGentleman3LossText:
	text "Victory!"
	done

SSAnne1FRoomsGentleman3AfterText:
	text "A worthy opponent!"
	done

SSAnne1FRoomsYoungsterBeforeText:
	text "Hi, buddy!"
	done

SSAnne1FRoomsYoungsterWinText:
	text "Whoa!"
	done

SSAnne1FRoomsYoungsterLossText:
	text "Yeah!"
	done

SSAnne1FRoomsYoungsterAfterText:
	text "That was cool!"
	done

SSAnne1FRoomsLassBeforeText:
	text "Want to battle?"
	done

SSAnne1FRoomsLassWinText:
	text "No way!"
	done

SSAnne1FRoomsLassLossText:
	text "Wow!"
	done

SSAnne1FRoomsLassAfterText:
	text "Good luck!"
	done

SSAnne1FRoomsGirl1Text:
	text "We're on a ship!"
	done

SSAnne1FRoomsMiddlemanText:
	text "The ocean air is"
	line "wonderful!"
	done

SSAnne1FRoomsLittleGirlText:
	text "This ship is so"
	line "big!"
	done

SSAnne1FRoomsWigglytuffText:
	text "Wigglytuff:"
	line "Jigglypuff!"
	done

SSAnne1FRoomsGirl2Text:
	text "I hope we see"
	line "some sea #MON!"
	done

SSAnne1FRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SS_ANNE_1F, 3
	warp_event  8,  7, SS_ANNE_1F, 4
	warp_event  4,  7, SS_ANNE_1F, 5
	warp_event  6,  7, SS_ANNE_1F, 6
	warp_event 10,  7, SS_ANNE_1F, 7
	warp_event  0,  6, SS_ANNE_1F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGentleman1Script, -1
	object_event  6,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGentleman2Script, -1
	object_event 10,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGentleman3Script, -1
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsYoungsterScript, -1
	object_event  8,  1, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsLassScript, -1
	object_event  1,  4, SPRITE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGirl1Script, -1
	object_event  3,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsMiddlemanScript, -1
	object_event  7,  5, SPRITE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsLittleGirlScript, -1
	object_event 11,  4, SPRITE_WIGGLYTUFF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsWigglytuffScript, -1
	object_event  9,  4, SPRITE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGirl2Script, -1
	object_event  5,  1, SPRITE_POKEBALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnne1FRoomsItemScript, -1
