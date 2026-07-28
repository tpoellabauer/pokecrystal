	object_const_def
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .GotItem
	writetext MrPsychicYouWantedThisText
	waitbutton
	giveitem TM_PSYCHIC_M
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_PSYCHIC_M
	writetext MrPsychicReceivedTM29Text
	playsound SFX_ITEM
	waitsfx
	waitbutton
	itemnotify
	setevent EVENT_GOT_TM29_PSYCHIC
	closetext
	end
.BagFull:
	writetext MrPsychicTM29NoRoomText
	waitbutton
	closetext
	end
.GotItem:
	writetext MrPsychicTM29ExplanationText
	waitbutton
	closetext
	end

MrPsychicYouWantedThisText:
	text "...Wait! Don't"
	line "say a word!"

	para "You wanted this!"
	done

MrPsychicReceivedTM29Text:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

MrPsychicTM29NoRoomText:
	text "Where do you plan"
	line "to put this?"
	done

MrPsychicTM29ExplanationText:
	text "TM29 is PSYCHIC!"

	para "It can lower the"
	line "target's SPECIAL"
	cont "abilities."
	done

MrPsychicsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 5
	warp_event  3,  7, SAFFRON_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
