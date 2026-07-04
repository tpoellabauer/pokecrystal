	object_const_def
	const SAFARIZONEGATE_SAFARI_ZONE_WORKER1
	const SAFARIZONEGATE_SAFARI_ZONE_WORKER2

SafariZoneGate_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneGateWorker1Script:
	jumptextfaceplayer SafariZoneGateWorker1Text

SafariZoneGateWorker2Script:
	jumptextfaceplayer SafariZoneGateWorker2Text

SafariZoneGateWorker1Text:
	text "Welcome to the"
	line "SAFARI ZONE!"
	done

SafariZoneGateWorker2Text:
	text "SAFARI ZONE has 4"
	line "zones in it."

	para "Each zone has"
	line "different kinds"
	cont "of #MON. Use"
	cont "SAFARI BALLs to"
	cont "catch them!"
	done

SafariZoneGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, ROUTE_19_FUCHSIA_GATE, 5
	warp_event  4,  5, ROUTE_19_FUCHSIA_GATE, 5
	warp_event  3,  0, SAFARI_ZONE_CENTER, 1
	warp_event  4,  0, SAFARI_ZONE_CENTER, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateWorker1Script, -1
	object_event  1,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateWorker2Script, -1
