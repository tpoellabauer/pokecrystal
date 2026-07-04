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
	writetext SafariZoneSecretHouseFishingGuruText
	waitbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	closetext
	end
.GotItem:
	writetext SafariZoneSecretHouseFishingGuruAfterText
	waitbutton
	closetext
	end

SafariZoneSecretHouseFishingGuruText:
	text "Ah! Finally!"

	para "You're the first"
	line "person to reach"
	cont "the SECRET HOUSE!"

	para "I was getting"
	line "worried that no"
	cont "one would win our"
	cont "campaign prize."

	para "Congratulations!"
	line "You have won"
	cont "HM03 SURF!"
	done

SafariZoneSecretHouseFishingGuruAfterText:
	text "That HM03 SURF"
	line "will serve you"
	cont "well."
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
