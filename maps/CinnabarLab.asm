	object_const_def
	const CINNABARLAB_FISHING_GURU

; Gen 1 Cinnabar Lab, ported from pokered data/maps/objects/CinnabarLab.asm. The three
; interior doors warp to CINNABAR_LAB_TRADE_ROOM/CINNABAR_LAB_METRONOME_ROOM/
; CINNABAR_LAB_FOSSIL_ROOM (see CinnabarLabTradeRoom.asm / CinnabarLabMetronomeRoom.asm /
; CinnabarLabFossilRoom.asm).
CinnabarLab_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarLabFishingGuruScript:
	jumptextfaceplayer CinnabarLabFishingGuruText

CinnabarLabPhotoSign:
	jumptext CinnabarLabPhotoText

CinnabarLabMeetingRoomSign:
	jumptext CinnabarLabMeetingRoomSignText

CinnabarLabRAndDSign:
	jumptext CinnabarLabRAndDSignText

CinnabarLabTestingRoomSign:
	jumptext CinnabarLabTestingRoomSignText

CinnabarLabFishingGuruText:
	text "We study #MON"
	line "extensively here."

	para "People often bring"
	line "us rare #MON"
	cont "for examination."
	done

CinnabarLabPhotoText:
	text "A photo of the"
	line "LAB's founder,"
	cont "DR.FUJI!"
	done

CinnabarLabMeetingRoomSignText:
	text "#MON LAB"
	line "Meeting Room"
	done

CinnabarLabRAndDSignText:
	text "#MON LAB"
	line "R-and-D Room"
	done

CinnabarLabTestingRoomSignText:
	text "#MON LAB"
	line "Testing Room"
	done

CinnabarLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; Front door; CinnabarIsland's warp list gains 3 entries (gym/lab/mart) appended
	; after its existing 2, so this map's own slot there is #4, not Gen1's "1".
	warp_event  2,  7, CINNABAR_ISLAND, 4
	warp_event  3,  7, CINNABAR_ISLAND, 4
	; Interior doors; ids 3/4/5 must match each sub-room's own return warp id.
	warp_event  8,  4, CINNABAR_LAB_TRADE_ROOM, 1
	warp_event 12,  4, CINNABAR_LAB_METRONOME_ROOM, 1
	warp_event 16,  4, CINNABAR_LAB_FOSSIL_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_READ, CinnabarLabPhotoSign
	bg_event  9,  4, BGEVENT_READ, CinnabarLabMeetingRoomSign
	bg_event 13,  4, BGEVENT_READ, CinnabarLabRAndDSign
	bg_event 17,  4, BGEVENT_READ, CinnabarLabTestingRoomSign

	def_object_events
	object_event  1,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarLabFishingGuruScript, -1
