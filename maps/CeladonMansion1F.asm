	object_const_def
	const CELADONMANSION1F_MEOWTH
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_NIDORANF

CeladonMansion1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansion1FMeowthScript:
	opentext
	writetext CeladonMansion1FMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

CeladonMansion1FGrannyScript:
	jumptextfaceplayer CeladonMansion1FGrannyText

CeladonMansion1FClefairyScript:
	opentext
	writetext CeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

CeladonMansion1FNidoranFScript:
	opentext
	writetext CeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

CeladonMansionManagersSuiteSign:
	jumptext CeladonMansionManagersSuiteSignText

CeladonMansion1FMeowthText:
	text "MEOWTH: Meow!"
	done

CeladonMansion1FGrannyText:
	text "My dear #MON"
	line "keep me company."

	para "MEOWTH even brings"
	line "money home!"
	done

CeladonMansion1FClefairyText:
	text "CLEFAIRY: Pi"
	line "pippippi!"
	done

CeladonMansion1FNidoranFText:
	text "NIDORAN: Kya"
	line "kyaoo!"
	done

CeladonMansionManagersSuiteSignText:
	text "CELADON MANSION"
	line "Manager's Suite"
	done

CeladonMansion1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  9, CELADON_CITY, 2
	warp_event  7,  9, CELADON_CITY, 2
	warp_event  3,  0, CELADON_CITY, 3
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  7,  0, CELADON_MANSION_2F, 4

	def_coord_events

	def_bg_events
	bg_event  4,  9, BGEVENT_READ, CeladonMansionManagersSuiteSign

	def_object_events
	object_event  0,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FMeowthScript, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FGrannyScript, -1
	object_event  1,  8, SPRITE_FAIRY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FClefairyScript, -1
	object_event  4,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FNidoranFScript, -1
