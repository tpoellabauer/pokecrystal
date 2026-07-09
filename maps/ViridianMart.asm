	object_const_def
	const VIRIDIANMART_CLERK
	const VIRIDIANMART_LASS
	const VIRIDIANMART_COOLTRAINER_M

ViridianMart_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianMartClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OAKS_PARCEL
	iftrue .Mart
	writetext ViridianMartClerkParcelText
	promptbutton
	giveitem OAKS_PARCEL
	writetext ViridianMartClerkGaveParcelText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_OAKS_PARCEL
	closetext
	end
.Mart:
	pokemart MARTTYPE_STANDARD, MART_VIRIDIAN
	closetext
	end

ViridianMartLassScript:
	jumptextfaceplayer ViridianMartYoungsterText

ViridianMartCooltrainerMScript:
	jumptextfaceplayer ViridianMartCooltrainerMText

ViridianMartYoungsterText:
	text "This shop sells"
	line "many ANTIDOTEs."
	done

ViridianMartCooltrainerMText:
	text "No! POTIONs are"
	line "all sold out."
	done

ViridianMartClerkParcelText:
	text "CLERK: Hey, you!"
	line "You're from"
	cont "PALLET TOWN, right?"

	para "PROF.OAK asked us"
	line "to order something"
	cont "for him."

	para "It's in, but we"
	line "haven't got the"
	cont "time to deliver it."

	para "Could you take it"
	line "to him?"
	done

ViridianMartClerkGaveParcelText:
	text "<PLAY_G> received"
	line "OAK'S PARCEL!"
	done

ViridianMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 4
	warp_event  3,  7, VIRIDIAN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartClerkScript, -1
	object_event  7,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartLassScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartCooltrainerMScript, -1
