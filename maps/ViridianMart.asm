	object_const_def
	const VIRIDIANMART_CLERK
	const VIRIDIANMART_YOUNGSTER
	const VIRIDIANMART_COOLTRAINER_M

; Gen 1 auto-greets you with the parcel errand the instant you set foot in the mart (no need to
; talk to the clerk first) -- ViridianMart_Script/ViridianMartDefaultScript in
; pokeredDisassembly/scripts/ViridianMart.asm runs every frame and, while
; EVENT_GOT_OAKS_PARCEL is unset, shows the greeting + hands off the parcel unprompted, eating
; player input for the duration. Port that as a scene that fires on map load (default scene 0)
; instead of requiring the player to interact with the clerk sprite.
ViridianMart_MapScripts:
	def_scene_scripts
	scene_script ViridianMartOaksParcelScene, SCENE_VIRIDIANMART_OAKS_PARCEL
	scene_script ViridianMartNoopScene,       SCENE_VIRIDIANMART_NOOP

	def_callbacks

ViridianMartOaksParcelScene:
	checkevent EVENT_GOT_OAKS_PARCEL
	iftrue .noop
	sdefer ViridianMartGreetAndGiveParcelScript
.noop:
	setscene SCENE_VIRIDIANMART_NOOP
	; fallthrough
ViridianMartNoopScene:
	end

ViridianMartGreetAndGiveParcelScript:
	opentext
	writetext ViridianMartClerkYouCameFromPalletTownText
	waitbutton
	writetext ViridianMartClerkSayHiToOakText
	waitbutton
	closetext
	opentext
	writetext ViridianMartClerkParcelQuestText
	promptbutton
	giveitem OAKS_PARCEL
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_OAKS_PARCEL
	closetext
	end

ViridianMartClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OAKS_PARCEL
	iftrue .Mart
	writetext ViridianMartClerkParcelQuestText
	promptbutton
	giveitem OAKS_PARCEL
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

ViridianMartYoungsterScript:
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

ViridianMartClerkYouCameFromPalletTownText:
	text "Hey! You came from"
	line "PALLET TOWN?"
	done

ViridianMartClerkSayHiToOakText:
	text "Okay! Say hi to"
	line "PROF.OAK for me!"
	done

ViridianMartClerkParcelQuestText:
	text "You know PROF."
	line "OAK, right?"

	para "His order came in."
	line "Will you take it"
	cont "to him?"

	para "<PLAYER> got"
	line "OAK'S PARCEL!"
	done

ViridianMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIRIDIAN_CITY, 4
	warp_event  4,  7, VIRIDIAN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartClerkScript, -1
	object_event  5,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartYoungsterScript, -1
	object_event  3,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartCooltrainerMScript, -1
