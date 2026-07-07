	object_const_def
	const SSANNE3F_SAILOR

SSAnne3F_MapScripts:
	def_scene_scripts

	def_callbacks

; Sailor NPC walking left and right
SSAnne3FSailorScript:
	jumptextfaceplayer SSAnne3FSailorText

SSAnne3FSailorText:
	text "What a beautiful"
	line "voyage!"
	done

SSAnne3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, SS_ANNE_2F, 2
	warp_event  3,  0, SS_ANNE_2F, 3
	warp_event  5,  2, SS_ANNE_BOW, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne3FSailorScript, -1
