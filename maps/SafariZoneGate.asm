DEF SAFARI_ZONE_ENTRANCE_FEE EQU 500

	object_const_def
	const SAFARIZONEGATE_SAFARI_ZONE_WORKER1
	const SAFARIZONEGATE_SAFARI_ZONE_WORKER2

SafariZoneGate_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1 SafariZoneGate.asm: pay 500 to enter, one time (afterward you can come and go freely
; through this gate, matching Gen1's `EVENT_PAID_SAFARI_ZONE_ENTRANCE_FEE`-gated dialogue below).
; The ball-limit/step-timer session itself (30 Safari Balls, step-counted forced exit) is not
; wired yet -- see docs/PORT_BACKLOG.md for the reusable engine pointers.
SafariZoneGateWorker1Script:
	checkevent EVENT_PAID_SAFARI_ZONE_ENTRANCE_FEE
	iftrue .AlreadyPaid
	opentext
	writetext SafariZoneGateWorker1Text
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, SAFARI_ZONE_ENTRANCE_FEE
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, SAFARI_ZONE_ENTRANCE_FEE
	special PlaceMoneyTopRight
	setevent EVENT_PAID_SAFARI_ZONE_ENTRANCE_FEE
	writetext SafariZoneGateWorker1PaidText
	waitbutton
	closetext
	end

.AlreadyPaid:
	jumptextfaceplayer SafariZoneGateWorker1WelcomeBackText

.NotEnoughMoney:
	writetext SafariZoneGateWorker1NotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext SafariZoneGateWorker1RefusedText
	waitbutton
	closetext
	end

SafariZoneGateWorker2Script:
	jumptextfaceplayer SafariZoneGateWorker2Text

SafariZoneGateWorker1Text:
	text "Welcome to the"
	line "SAFARI ZONE!"

	para "For ¥{d:SAFARI_ZONE_ENTRANCE_FEE}, you"
	line "can catch rare"
	cont "#MON inside."

	para "Would you like"
	line "to play?"
	done

SafariZoneGateWorker1PaidText:
	text "Have fun! Use"
	line "SAFARI BALLs to"
	cont "catch #MON."
	done

SafariZoneGateWorker1WelcomeBackText:
	text "Welcome back to"
	line "the SAFARI ZONE!"
	done

SafariZoneGateWorker1NotEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

SafariZoneGateWorker1RefusedText:
	text "Come back if you"
	line "change your mind!"
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
