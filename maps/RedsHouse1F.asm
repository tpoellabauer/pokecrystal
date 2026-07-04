	object_const_def
	const REDSHOUSE1F_MOM

RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script RedHouse1FNoopScene ; unusable

	def_callbacks

RedHouse1FNoopScene:
	end

RedsHouse1FMomScript:
	jumptextfaceplayer RedsHouse1FMomText

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FMomText:
	text "MOM: Right."
	line "All boys leave"
	cont "home some day."
	cont "It said so on TV."

	para "PROF.OAK, next"
	line "door, is looking"
	cont "for you."
	done

RedsHouse1FTVText:
	text "There's a movie"
	line "on TV. Four boys"
	cont "are walking on"
	cont "railroad tracks."

	para "I better go too."
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  1, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  3,  1, BGEVENT_READ, RedsHouse1FTV

	def_object_events
	object_event  5,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouse1FMomScript, -1
