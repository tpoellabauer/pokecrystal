	object_const_def
	const SSANNEB1FROOMS_SAILOR1
	const SSANNEB1FROOMS_SAILOR2
	const SSANNEB1FROOMS_SAILOR3
	const SSANNEB1FROOMS_SAILOR4
	const SSANNEB1FROOMS_SAILOR5
	const SSANNEB1FROOMS_FISHER
	const SSANNEB1FROOMS_NPC1
	const SSANNEB1FROOMS_NPC2
	const SSANNEB1FROOMS_ITEM1
	const SSANNEB1FROOMS_ITEM2
	const SSANNEB1FROOMS_ITEM3

SSAnneB1FRooms_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnneB1FRoomsSailor1Script:
	faceplayer
	opentext
	writetext SSAnneB1FRoomsSailor1BeforeText
	waitbutton
	closetext
	loadtrainer SAILOR, 14
	winlosstext SSAnneB1FRoomsSailor1WinText, SSAnneB1FRoomsSailor1LossText
	setlasttalked SSANNEB1FROOMS_SAILOR1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SAILOR_SSANNE_1
	opentext
	writetext SSAnneB1FRoomsSailor1AfterText
	waitbutton
	closetext
	end

SSAnneB1FRoomsSailor2Script:
	faceplayer
	opentext
	writetext SSAnneB1FRoomsSailor2BeforeText
	waitbutton
	closetext
	loadtrainer SAILOR, 15
	winlosstext SSAnneB1FRoomsSailor2WinText, SSAnneB1FRoomsSailor2LossText
	setlasttalked SSANNEB1FROOMS_SAILOR2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SAILOR_SSANNE_2
	opentext
	writetext SSAnneB1FRoomsSailor2AfterText
	waitbutton
	closetext
	end

SSAnneB1FRoomsSailor3Script:
	faceplayer
	opentext
	writetext SSAnneB1FRoomsSailor3BeforeText
	waitbutton
	closetext
	loadtrainer SAILOR, 16
	winlosstext SSAnneB1FRoomsSailor3WinText, SSAnneB1FRoomsSailor3LossText
	setlasttalked SSANNEB1FROOMS_SAILOR3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SAILOR_SSANNE_3
	opentext
	writetext SSAnneB1FRoomsSailor3AfterText
	waitbutton
	closetext
	end

SSAnneB1FRoomsSailor4Script:
	faceplayer
	opentext
	writetext SSAnneB1FRoomsSailor4BeforeText
	waitbutton
	closetext
	loadtrainer SAILOR, 17
	winlosstext SSAnneB1FRoomsSailor4WinText, SSAnneB1FRoomsSailor4LossText
	setlasttalked SSANNEB1FROOMS_SAILOR4
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SAILOR_SSANNE_4
	opentext
	writetext SSAnneB1FRoomsSailor4AfterText
	waitbutton
	closetext
	end

SSAnneB1FRoomsSailor5Script:
	faceplayer
	opentext
	writetext SSAnneB1FRoomsSailor5BeforeText
	waitbutton
	closetext
	loadtrainer SAILOR, 18
	winlosstext SSAnneB1FRoomsSailor5WinText, SSAnneB1FRoomsSailor5LossText
	setlasttalked SSANNEB1FROOMS_SAILOR5
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_SAILOR_SSANNE_5
	opentext
	writetext SSAnneB1FRoomsSailor5AfterText
	waitbutton
	closetext
	end

SSAnneB1FRoomsFisherScript:
	faceplayer
	opentext
	writetext SSAnneB1FRoomsFisherBeforeText
	waitbutton
	closetext
	loadtrainer FISHER, 27
	winlosstext SSAnneB1FRoomsFisherWinText, SSAnneB1FRoomsFisherLossText
	setlasttalked SSANNEB1FROOMS_FISHER
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_FISHER_SSANNEB1
	opentext
	writetext SSAnneB1FRoomsFisherAfterText
	waitbutton
	closetext
	end

SSAnneB1FRoomsNPC1Script:
	jumptextfaceplayer SSAnneB1FRoomsNPC1Text

SSAnneB1FRoomsNPC2Script:
	jumptextfaceplayer SSAnneB1FRoomsNPC2Text

SSAnneB1FRoomsItem1Script:
	itemball ETHER

SSAnneB1FRoomsItem2Script:
	itemball TM_REST

SSAnneB1FRoomsItem3Script:
	itemball MAX_POTION

; Placeholder battle texts
SSAnneB1FRoomsSailor1BeforeText:
	text "Battle!"
	done

SSAnneB1FRoomsSailor1WinText:
	text "Arrr!"
	done

SSAnneB1FRoomsSailor1LossText:
	text "Ahoy!"
	done

SSAnneB1FRoomsSailor1AfterText:
	text "Shiver me timbers!"
	done

SSAnneB1FRoomsSailor2BeforeText:
	text "Battle!"
	done

SSAnneB1FRoomsSailor2WinText:
	text "Lost!"
	done

SSAnneB1FRoomsSailor2LossText:
	text "Won!"
	done

SSAnneB1FRoomsSailor2AfterText:
	text "Sea legs!"
	done

SSAnneB1FRoomsSailor3BeforeText:
	text "Battle!"
	done

SSAnneB1FRoomsSailor3WinText:
	text "Lost!"
	done

SSAnneB1FRoomsSailor3LossText:
	text "Won!"
	done

SSAnneB1FRoomsSailor3AfterText:
	text "Fair winds!"
	done

SSAnneB1FRoomsSailor4BeforeText:
	text "Battle!"
	done

SSAnneB1FRoomsSailor4WinText:
	text "Lost!"
	done

SSAnneB1FRoomsSailor4LossText:
	text "Won!"
	done

SSAnneB1FRoomsSailor4AfterText:
	text "Good sailing!"
	done

SSAnneB1FRoomsSailor5BeforeText:
	text "Battle!"
	done

SSAnneB1FRoomsSailor5WinText:
	text "Lost!"
	done

SSAnneB1FRoomsSailor5LossText:
	text "Won!"
	done

SSAnneB1FRoomsSailor5AfterText:
	text "Smooth sailing!"
	done

SSAnneB1FRoomsFisherBeforeText:
	text "Fish battle?"
	done

SSAnneB1FRoomsFisherWinText:
	text "Caught!"
	done

SSAnneB1FRoomsFisherLossText:
	text "Got away!"
	done

SSAnneB1FRoomsFisherAfterText:
	text "Good catch!"
	done

SSAnneB1FRoomsNPC1Text:
	text "Worker here!"
	done

SSAnneB1FRoomsNPC2Text:
	text "Engine room!"
	done

SSAnneB1FRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 7, SS_ANNE_B1F, 1
	warp_event  5, 7, SS_ANNE_B1F, 2
	warp_event  7, 7, SS_ANNE_B1F, 3
	warp_event  9, 7, SS_ANNE_B1F, 4
	warp_event 11, 7, SS_ANNE_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsSailor1Script, -1
	object_event  4, 3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsSailor2Script, -1
	object_event  6, 2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsSailor3Script, -1
	object_event  8, 4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsSailor4Script, -1
	object_event 10, 2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsSailor5Script, -1
	object_event  3, 5, SPRITE_FISHERMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsFisherScript, -1
	object_event  1, 3, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsNPC1Script, -1
	object_event  7, 5, SPRITE_FISHERMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneB1FRoomsNPC2Script, -1
	object_event  2, 5, SPRITE_POKEBALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnneB1FRoomsItem1Script, -1
	object_event  5, 5, SPRITE_POKEBALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnneB1FRoomsItem2Script, -1
	object_event  8, 5, SPRITE_POKEBALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnneB1FRoomsItem3Script, -1
