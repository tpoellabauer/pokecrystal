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
	iftrue .Done
	writetext SSAnneCaptainsRoomCaptainText
	waitbutton
	giveitem HM_CUT
	iffalse .Done
	setevent EVENT_GOT_HM01_CUT
.Done:
	closetext
	end

TrashScript:
	jumptext TrashText

BookScript:
	jumptext BookText

SSAnneCaptainsRoomCaptainText:
	text "Captain: Ahoy,"
	line "young sailor!"

	para "My back is so"
	line "stiff from all"
	cont "this sailing."

	para "Would you rub my"
	line "back for me?"

	para "If you do, I'll"
	line "teach you how to"
	cont "use Cut!"
	done

TrashText:
	text "This trash bin is"
	line "full of rubbish."
	done

BookText:
	text "It's a book about"
	line "sailing."
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
