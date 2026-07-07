	object_const_def
	const SSANNE_CAPTAINS_ROOM_CAPTAIN

SSAnneCaptainsRoom_MapScripts:
	def_scene_scripts

	def_callbacks

; Captain gives HM01 (Cut) on back rub
SSAnneCaptainsRoomCaptainScript:
	faceplayer
	opentext
	writetext SSAnneCaptainsRoomCaptainText
	waitbutton
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
	warp_event  1,  3, SS_ANNE_2F, 9

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, TrashScript
	bg_event  1,  2, BGEVENT_READ, BookScript

	def_object_events
	object_event  1,  2, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneCaptainsRoomCaptainScript, -1
