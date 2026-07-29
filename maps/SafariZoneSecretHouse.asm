	object_const_def
	const SAFARIZONESECRETHOUSE_FISHING_GURU

SafariZoneSecretHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneSecretHouseFishingGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM03_SURF
	iftrue .GotItem
	writetext SafariZoneSecretHouseFishingGuruYouHaveWonText
	waitbutton
	giveitem HM_SURF
	iffalse .BagFull
	getitemname STRING_BUFFER_3, HM_SURF
	writetext SafariZoneSecretHouseFishingGuruReceivedHM03Text
	playsound SFX_ITEM
	waitsfx
	waitbutton
	itemnotify
	setevent EVENT_GOT_HM03_SURF
	closetext
	end
.BagFull:
	writetext SafariZoneSecretHouseFishingGuruHM03NoRoomText
	waitbutton
	closetext
	end
.GotItem:
	writetext SafariZoneSecretHouseFishingGuruHM03ExplanationText
	waitbutton
	closetext
	end

SafariZoneSecretHouseFishingGuruYouHaveWonText:
	text "Ah! Finally!"

	para "You're the first"
	line "person to reach"
	cont "the SECRET HOUSE!"

	para "I was getting"
	line "worried that no"
	cont "one would win our"
	cont "campaign prize."

	para "Congratulations!"
	line "You have won!"
	done

SafariZoneSecretHouseFishingGuruReceivedHM03Text:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

SafariZoneSecretHouseFishingGuruHM03NoRoomText:
	text "You don't have"
	line "room for this"
	cont "fabulous prize!"
	done

SafariZoneSecretHouseFishingGuruHM03ExplanationText:
	text "HM03 is SURF!"

	para "#MON will be"
	line "able to ferry you"
	cont "across water!"

	para "And, this HM"
	line "isn't disposable!"
	cont "You can use it"
	cont "over and over!"

	para "You're super"
	line "lucky for winning"
	cont "this fabulous"
	cont "prize!"
	done

SafariZoneSecretHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 7
	warp_event  3,  7, SAFARI_ZONE_WEST, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneSecretHouseFishingGuru, -1
