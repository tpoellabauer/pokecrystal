
CeladonMansionRoof_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofFisherScript:
	jumptextfaceplayer CeladonMansionRoofFisherText

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

CeladonMansionRoofFisherText:
	text "High places--I do"
	line "love them so!"

	para "I'd say the only"
	line "thing that loves"

	para "heights as much as"
	line "me is smoke!"
	done

CeladonMansionRoofGraffitiText:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, CELADON_MANSION_3F, 2
	warp_event  2,  1, CELADON_MANSION_3F, 3
	warp_event  2,  7, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, CeladonMansionRoofGraffiti

	def_object_events
