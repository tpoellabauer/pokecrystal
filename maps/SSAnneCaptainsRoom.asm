	object_const_def
	const SSANNE_CAPTAINS_ROOM_CAPTAIN

SSAnneCaptainsRoom_MapScripts:
	def_scene_scripts

	def_callbacks

; Captain gives HM01 (Cut) on back rub. Gen1 gates this behind a repeated-B-press
; minigame with no Gen2 macro equivalent; simplified to a straight one-time gift
; on first talk (precedent: BillsHouse/one-time-item-give idiom).
SSAnneCaptainsRoomCaptainScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .NotSickAnymore
	writetext SSAnneCaptainsRoomRubCaptainsBackText
	waitbutton
	writetext SSAnneCaptainsRoomCaptainIFeelMuchBetterText
	waitbutton
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	closetext
	end

.NotSickAnymore:
	writetext SSAnneCaptainsRoomCaptainNotSickAnymoreText
	waitbutton
	closetext
	end

TrashScript:
	jumptext TrashText

BookScript:
	jumptext SSAnneCaptainsRoomSeasickBookText

SSAnneCaptainsRoomRubCaptainsBackText:
	text "CAPTAIN: Ooargh..."
	line "I feel hideous..."
	cont "Urrp! Seasick..."

	para "<PLAYER> rubbed"
	line "the CAPTAIN's"
	cont "back!"

	para "Rub-rub..."
	line "Rub-rub..."
	done

SSAnneCaptainsRoomCaptainIFeelMuchBetterText:
	text "CAPTAIN: Whew!"
	line "Thank you! I"
	cont "feel much better!"

	para "You want to see"
	line "my CUT technique?"

	para "I could show you"
	line "if I wasn't ill..."

	para "I know! You can"
	line "have this!"

	para "Teach it to your"
	line "#MON and you"
	cont "can see it CUT"
	cont "any time!"
	done

SSAnneCaptainsRoomCaptainNotSickAnymoreText:
	text "CAPTAIN: Whew!"

	para "Now that I'm not"
	line "sick any more, I"
	cont "guess it's time."
	done

TrashText:
	text "This trash bin is"
	line "full of rubbish."
	done

SSAnneCaptainsRoomSeasickBookText:
	text "How to Conquer"
	line "Seasickness..."
	cont "The CAPTAIN's"
	cont "reading this!"
	done

SSAnneCaptainsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, SS_ANNE_2F, 9

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, TrashScript
	bg_event  1,  2, BGEVENT_READ, BookScript

	def_object_events
	object_event  4,  2, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneCaptainsRoomCaptainScript, -1
