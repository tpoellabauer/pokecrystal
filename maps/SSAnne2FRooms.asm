	object_const_def
	const SSANNE2FROOMS_GENTLEMAN1
	const SSANNE2FROOMS_GENTLEMAN2
	const SSANNE2FROOMS_FISHER
	const SSANNE2FROOMS_LASS
	const SSANNE2FROOMS_NPC1
	const SSANNE2FROOMS_NPC2
	const SSANNE2FROOMS_NPC3
	const SSANNE2FROOMS_NPC4
	const SSANNE2FROOMS_NPC5
	const SSANNE2FROOMS_NPC6
	const SSANNE2FROOMS_ITEM1
	const SSANNE2FROOMS_ITEM2

SSAnne2FRooms_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnne2FRoomsGentleman1Script:
	faceplayer
	opentext
	writetext SSAnne2FRoomsGentleman1BeforeText
	waitbutton
	closetext
	loadtrainer GENTLEMAN, 6
	winlosstext SSAnne2FRoomsGentleman1WinText, SSAnne2FRoomsGentleman1LossText
	setlasttalked SSANNE2FROOMS_GENTLEMAN1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_GENTLEMAN_SSANNE2_1
	opentext
	writetext SSAnne2FRoomsGentleman1AfterText
	waitbutton
	closetext
	end

SSAnne2FRoomsGentleman2Script:
	faceplayer
	opentext
	writetext SSAnne2FRoomsGentleman2BeforeText
	waitbutton
	closetext
	loadtrainer GENTLEMAN, 7
	winlosstext SSAnne2FRoomsGentleman2WinText, SSAnne2FRoomsGentleman2LossText
	setlasttalked SSANNE2FROOMS_GENTLEMAN2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_GENTLEMAN_SSANNE2_2
	opentext
	writetext SSAnne2FRoomsGentleman2AfterText
	waitbutton
	closetext
	end

SSAnne2FRoomsFisherScript:
	faceplayer
	opentext
	writetext SSAnne2FRoomsFisherBeforeText
	waitbutton
	closetext
	loadtrainer FISHER, 26
	winlosstext SSAnne2FRoomsFisherWinText, SSAnne2FRoomsFisherLossText
	setlasttalked SSANNE2FROOMS_FISHER
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_FISHER_SSANNE
	opentext
	writetext SSAnne2FRoomsFisherAfterText
	waitbutton
	closetext
	end

SSAnne2FRoomsLassScript:
	faceplayer
	opentext
	writetext SSAnne2FRoomsLassBeforeText
	waitbutton
	closetext
	loadtrainer LASS, 18
	winlosstext SSAnne2FRoomsLassWinText, SSAnne2FRoomsLassLossText
	setlasttalked SSANNE2FROOMS_LASS
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	setevent EVENT_BEAT_LASS_SSANNE2
	opentext
	writetext SSAnne2FRoomsLassAfterText
	waitbutton
	closetext
	end

SSAnne2FRoomsNPC1Script:
	jumptextfaceplayer SSAnne2FRoomsNPC1Text

SSAnne2FRoomsNPC2Script:
	jumptextfaceplayer SSAnne2FRoomsNPC2Text

SSAnne2FRoomsNPC3Script:
	jumptextfaceplayer SSAnne2FRoomsNPC3Text

SSAnne2FRoomsNPC4Script:
	jumptextfaceplayer SSAnne2FRoomsNPC4Text

SSAnne2FRoomsNPC5Script:
	jumptextfaceplayer SSAnne2FRoomsNPC5Text

SSAnne2FRoomsNPC6Script:
	jumptextfaceplayer SSAnne2FRoomsNPC6Text

SSAnne2FRoomsItem1Script:
	itemball MAX_ETHER

SSAnne2FRoomsItem2Script:
	itemball RARE_CANDY

SSAnne2FRoomsGentleman1BeforeText:
	text "Trainer battle!"
	done

SSAnne2FRoomsGentleman1WinText:
	text "I lost!"
	done

SSAnne2FRoomsGentleman1LossText:
	text "I win!"
	done

SSAnne2FRoomsGentleman1AfterText:
	text "Well fought!"
	done

SSAnne2FRoomsGentleman2BeforeText:
	text "Ready to battle?"
	done

SSAnne2FRoomsGentleman2WinText:
	text "Defeated!"
	done

SSAnne2FRoomsGentleman2LossText:
	text "Victory!"
	done

SSAnne2FRoomsGentleman2AfterText:
	text "Good match!"
	done

SSAnne2FRoomsFisherBeforeText:
	text "Fish with #MON?"
	done

SSAnne2FRoomsFisherWinText:
	text "I'm out!"
	done

SSAnne2FRoomsFisherLossText:
	text "I'm in!"
	done

SSAnne2FRoomsFisherAfterText:
	text "Good fishing!"
	done

SSAnne2FRoomsLassBeforeText:
	text "Battle me!"
	done

SSAnne2FRoomsLassWinText:
	text "You won!"
	done

SSAnne2FRoomsLassLossText:
	text "I won!"
	done

SSAnne2FRoomsLassAfterText:
	text "Nice battle!"
	done

SSAnne2FRoomsNPC1Text:
	text "Sailing the seas!"
	done

SSAnne2FRoomsNPC2Text:
	text "What a voyage!"
	done

SSAnne2FRoomsNPC3Text:
	text "I'm relaxing!"
	done

SSAnne2FRoomsNPC4Text:
	text "Great views!"
	done

SSAnne2FRoomsNPC5Text:
	text "This ship rocks!"
	done

SSAnne2FRoomsNPC6Text:
	text "I love cruises!"
	done

SSAnne2FRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 7, SS_ANNE_2F, 4
	warp_event  5, 7, SS_ANNE_2F, 4
	warp_event  7, 7, SS_ANNE_2F, 5
	warp_event  9, 7, SS_ANNE_2F, 5
	warp_event 11, 7, SS_ANNE_2F, 6
	warp_event  1, 7, SS_ANNE_2F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsGentleman1Script, -1
	object_event  6, 1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsGentleman2Script, -1
	object_event  4, 4, SPRITE_FISHERMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsFisherScript, -1
	object_event 10, 3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsLassScript, -1
	object_event  1, 2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsNPC1Script, -1
	object_event  3, 5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsNPC2Script, -1
	object_event  7, 3, SPRITE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsNPC3Script, -1
	object_event  9, 5, SPRITE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsNPC4Script, -1
	object_event  2, 5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsNPC5Script, -1
	object_event  8, 2, SPRITE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FRoomsNPC6Script, -1
	object_event  5, 2, SPRITE_POKEBALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnne2FRoomsItem1Script, -1
	object_event 11, 1, SPRITE_POKEBALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnne2FRoomsItem2Script, -1
