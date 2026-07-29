	object_const_def
	const BLUESHOUSE_DAISY_SITTING
	const BLUESHOUSE_DAISY_WALKING
	const BLUESHOUSE_TOWN_MAP

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisySittingScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOWN_MAP
	iftrue .GotTownMap
	checkevent EVENT_GOT_KANTO_POKEDEX
	iftrue .OfferMap
	writetext DaisyRivalAtLabText
	waitbutton
	closetext
	end

.OfferMap:
	writetext DaisyOfferMapText
	waitbutton
	closetext
	giveitem TOWN_MAP
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TOWN_MAP
	opentext
	writetext GotTownMapText
	waitbutton
	setevent EVENT_GOT_TOWN_MAP
	disappear BLUESHOUSE_TOWN_MAP
	closetext
	end

.BagFull:
	opentext
	writetext DaisyBagFullText
	waitbutton
	closetext
	end

.GotTownMap:
	writetext DaisyUseMapText
	waitbutton
	closetext
	end

DaisyWalkingScript:
	jumptextfaceplayer DaisyWalkingText

TownMapScript:
	jumptext TownMapText

DaisyRivalAtLabText:
	text "Hi <PLAYER>!"
	line "<RIVAL> is out at"
	cont "Grandpa's lab."
	done

DaisyOfferMapText:
	text "Grandpa asked you"
	line "to run an errand?"
	cont "Here, this will"
	cont "help you!"
	prompt

GotTownMapText:
	text "<PLAYER> got a"
	line "@"
	text_ram wStringBuffer3
	text "!@"
	sound_item
	text_end

DaisyBagFullText:
	text "You have too much"
	line "stuff with you."
	done

DaisyUseMapText:
	text "Use the TOWN MAP"
	line "to find out where"
	cont "you are."
	done

DaisyWalkingText:
	text "#MON are living"
	line "things! If they"
	cont "get tired, give"
	cont "them a rest!"
	done

TownMapText:
	text "It's a big map!"
	line "This is useful!"
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisySittingScript, -1
	object_event  6,  4, SPRITE_DAISY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyWalkingScript, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TownMapScript, EVENT_GOT_TOWN_MAP
