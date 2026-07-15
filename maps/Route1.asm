	object_const_def
	const ROUTE1_YOUNGSTER1
	const ROUTE1_YOUNGSTER2

Route1_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1 Route 1: Youngster 1 is a Mart employee who gives the player a Potion sample
; (once per playthrough, tracked by EVENT_GOT_POTION_SAMPLE). Youngster 2 just gives
; advice about the ledges on the route.
Route1Youngster1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_POTION_SAMPLE
	iftrue .AlreadyGotPotion
	writetext Route1Youngster1MartSampleText
	waitbutton
	closetext
	giveitem POTION
	setevent EVENT_GOT_POTION_SAMPLE
	opentext
	writetext Route1Youngster1GotPotionText
	waitbutton
	closetext
	end

.AlreadyGotPotion:
	writetext Route1Youngster1AlsoGotPokeballsText
	waitbutton
	closetext
	end

Route1Youngster2Script:
	jumptextfaceplayer Route1Youngster2Text

Route1Sign:
	jumptext Route1SignText

Route1Youngster1MartSampleText:
	text "Hi! I work at a"
	line "#MON MART."

	para "It's a convenient"
	line "shop, so please"
	cont "visit us in"
	cont "VIRIDIAN CITY."

	para "I know, I'll give"
	line "you a sample!"
	cont "Here you go!"
	prompt

Route1Youngster1GotPotionText:
	text "<PLAYER> got"
	line "POTION!@"
	text_end

Route1Youngster1AlsoGotPokeballsText:
	text "We also carry"
	line "# BALLs for"
	cont "catching #MON!"
	done

Route1Youngster2Text:
	text "See those ledges"
	line "along the road?"

	para "It's a bit scary,"
	line "but you can jump"
	cont "from them."

	para "You can get back"
	line "to PALLET TOWN"
	cont "quicker that way."
	done

Route1SignText:
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_READ, Route1Sign

	def_object_events
	object_event  5, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1Youngster1Script, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1Youngster2Script, -1
