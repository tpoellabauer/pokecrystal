	object_const_def
	const COPYCATSHOUSE1F_WOMAN
	const COPYCATSHOUSE1F_MAN
	const COPYCATSHOUSE1F_FAIRY

CopycatsHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

CopycatsHouse1FWomanScript:
	jumptextfaceplayer CopycatsHouse1FWomanText

CopycatsHouse1FManScript:
	jumptextfaceplayer CopycatsHouse1FManText

CopycatsHouse1FFairyScript:
	opentext
	writetext CopycatsHouse1FFairyText
	cry CHANSEY
	waitbutton
	closetext
	end

CopycatsHouse1FWomanText:
	text "My daughter is so"
	line "self-centered."
	cont "She only has a"
	cont "few friends."
	done

CopycatsHouse1FManText:
	text "My daughter likes"
	line "to mimic people."

	para "Her mimicry has"
	line "earned her the"
	cont "nickname COPYCAT"
	cont "around here!"
	done

CopycatsHouse1FFairyText:
	text "CHANSEY: Chaan!"
	line "Sii!"
	done

CopycatsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 8
	warp_event  3,  7, SAFFRON_CITY, 8
	warp_event  2,  0, COPYCATS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FWomanScript, -1
	object_event  5,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FManScript, -1
	object_event  1,  4, SPRITE_FAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FFairyScript, -1
