DEF SAFARI_ZONE_ENTRANCE_FEE EQU 500

	object_const_def
	const SAFARIZONEGATE_SAFARI_ZONE_WORKER1
	const SAFARIZONEGATE_SAFARI_ZONE_WORKER2

SafariZoneGate_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1 SafariZoneGate.asm: pay 500 to enter, one time (afterward you can come and go freely
; through this gate, matching Gen1's `EVENT_PAID_SAFARI_ZONE_ENTRANCE_FEE`-gated dialogue below).
; Each entry (first paid visit or a later free one) grants a fresh 30 Safari Balls
; (`special GiveSafariBalls`, engine/events/bug_contest/contest.asm -- shares Gen1's ball
; counter WRAM byte, wParkBallsRemaining/wSafariBallsRemaining), plus a fresh 500-step
; timer that forces you out at 0 steps remaining (DoSafariStep, engine/overworld/events.asm).
SafariZoneGateWorker1Script:
	checkevent EVENT_PAID_SAFARI_ZONE_ENTRANCE_FEE
	iftrue .AlreadyPaid
	opentext
	writetext SafariZoneGateWorker1WouldYouLikeToJoinText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, SAFARI_ZONE_ENTRANCE_FEE
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, SAFARI_ZONE_ENTRANCE_FEE
	special PlaceMoneyTopRight
	setevent EVENT_PAID_SAFARI_ZONE_ENTRANCE_FEE
	special GiveSafariBalls
	writetext SafariZoneGateWorker1PaidText
	waitbutton
	closetext
	end

.AlreadyPaid:
	special GiveSafariBalls
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
	faceplayer
	opentext
	writetext SafariZoneGateWorker2FirstTimeHereText
	yesorno
	iftrue .ExplainSafariZone
	writetext SafariZoneGateWorker2YoureARegularHereText
	waitbutton
	closetext
	end

.ExplainSafariZone:
	writetext SafariZoneGateWorker2SafariZoneExplanationText
	waitbutton
	closetext
	end

SafariZoneGateWorker1Text:
	text "Welcome to the"
	line "SAFARI ZONE!"
	done

SafariZoneGateWorker1WouldYouLikeToJoinText:
	text "For just ¥500,"
	line "you can catch all"
	cont "the <PKMN> you"
	cont "want in the park!"

	para "Would you like to"
	line "join the hunt?"
	done

SafariZoneGateWorker1PaidText:
	text "That'll be ¥500"
	line "please!"

	para "We only use a"
	line "special # BALL"
	cont "here."

	para "<PLAYER> received"
	line "30 SAFARI BALLs!"
	done

SafariZoneGateWorker1CallYouOnThePAText:
	text "We'll call you on"
	line "the PA when you"
	cont "run out of time"
	cont "or SAFARI BALLs!"
	done

SafariZoneGateWorker1WelcomeBackText:
	text "OK! Please come"
	line "again!"
	done

SafariZoneGateWorker1NotEnoughMoneyText:
	text "Oops! Not enough"
	line "money!"
	done

SafariZoneGateWorker1RefusedText:
	text "Sorry, you're a"
	line "regular here!"
	done

SafariZoneGateWorker1LeavingEarlyText:
	text "Leaving early?"
	done

SafariZoneGateWorker1ReturnSafariBallsText:
	text "Please return any"
	line "SAFARI BALLs you"
	cont "have left."
	done

SafariZoneGateWorker1GoodLuckText:
	text "Good Luck!"
	done

SafariZoneGateWorker2FirstTimeHereText:
	text "Hi! Is it your"
	line "first time here?"
	done

SafariZoneGateWorker2SafariZoneExplanationText:
	text "SAFARI ZONE has 4"
	line "zones in it."

	para "Each zone has"
	line "different kinds"
	cont "of #MON. Use"
	cont "SAFARI BALLs to"
	cont "catch them!"

	para "When you run out"
	line "of time or SAFARI"
	cont "BALLs, it's game"
	cont "over for you!"

	para "Before you go,"
	line "open an unused"
	cont "<PKMN> BOX so"
	cont "there's room for"
	cont "new <PKMN>!"
	done

SafariZoneGateWorker2YoureARegularHereText:
	text "Sorry, you're a"
	line "regular here!"
	done

SafariZoneGateHiddenNugget:
	hiddenitem NUGGET, EVENT_SAFARI_ZONE_GATE_HIDDEN_NUGGET

SafariZoneGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; Gen 1 geometry (issue #44): retargeted from the bogus ROUTE_19_FUCHSIA_GATE
	; stub straight to FuchsiaCity's (18,3) door (this map's south side).
	warp_event  3,  5, FUCHSIA_CITY, 7
	warp_event  4,  5, FUCHSIA_CITY, 7
	warp_event  3,  0, SAFARI_ZONE_CENTER, 1
	warp_event  4,  0, SAFARI_ZONE_CENTER, 2

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_ITEM, SafariZoneGateHiddenNugget

	def_object_events
	object_event  6,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateWorker1Script, -1
	object_event  1,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateWorker2Script, -1
