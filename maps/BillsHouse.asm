	object_const_def
	const BILLSHOUSE_BILL_POKEMON
	const BILLSHOUSE_BILL

; Gen 1 port: in Red, Bill is home (not in Johto), fused with a #MON by a botched
; experiment (pokeredDisassembly/scripts/BillsHouse.asm). GSC's Bill's-Grandpa
; stone-collection sidequest is a Gen 2 replacement for this scene and is dropped.
; Simplifications vs Gen 1: the cell-separator cutscene (Bill walking into the
; TELEPORTER, the player running the Cell Separation System from the PC) is collapsed
; into the dialogue itself -- Gen 2 has no `script_bills_pc` PC hook -- and Gen 1's
; third object (a second Bill sprite on the machine tile with the "check out my rare
; #MON on my PC" line) is folded into the one Bill NPC.
BillsHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .BillVisibility

.BillVisibility:
	checkevent EVENT_SEPARATED_BILL
	iftrue .Separated
	disappear BILLSHOUSE_BILL
	endcallback

.Separated:
	appear BILLSHOUSE_BILL
	endcallback

BillsHouseBillPokemon:
	opentext
	writetext BillsHouseBillImNotAPokemonText
	yesorno
	iffalse .Refused
.UseMachine:
	writetext BillsHouseBillUseSeparationSystemText
	waitbutton
	closetext
	disappear BILLSHOUSE_BILL_POKEMON
	appear BILLSHOUSE_BILL
	setevent EVENT_MET_BILL
	end

.Refused:
	writetext BillsHouseBillNoYouGottaHelpText
	promptbutton
	sjump .UseMachine

BillsHouseBill:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_BILL
	iftrue .GotTicket
	writetext BillsHouseBillThankYouText
	promptbutton
	verbosegiveitem S_S_TICKET
	iffalse .BagFull
	setevent EVENT_GOT_SS_TICKET_FROM_BILL
.GotTicket:
	writetext BillsHouseBillWhyDontYouGoInsteadOfMeText
	waitbutton
	closetext
	end

.BagFull:
	writetext BillsHouseBillNoRoomText
	waitbutton
	closetext
	end

BillsHouseBillImNotAPokemonText:
	text "Hiya! I'm a"
	line "#MON…"
	cont "…No I'm not!"

	para "Call me BILL!"
	line "I'm a true blue"
	cont "#MANIAC!"

	para "I screwed up an"
	line "experiment and"
	cont "got combined with"
	cont "a #MON!"

	para "So, how about it?"
	line "Help me out here!"
	done

BillsHouseBillUseSeparationSystemText:
	text "When I'm in the"
	line "TELEPORTER, go to"

	para "my PC and run the"
	line "Cell Separation"
	cont "System!"
	done

BillsHouseBillNoYouGottaHelpText:
	text "No!? Come on, you"
	line "gotta help a guy"
	cont "in deep trouble!"

	para "What do you say,"
	line "chief? Please?"
	cont "OK? All right!"
	done

BillsHouseBillThankYouText:
	text "BILL: Yeehah!"
	line "Thanks, bud! I"
	cont "owe you one!"

	para "So, did you come"
	line "to see my #MON"
	cont "collection?"

	para "You didn't? That's"
	line "a bummer."

	para "I've got to thank"
	line "you… Oh here,"
	cont "maybe this'll do."
	done

BillsHouseBillNoRoomText:
	text "You've got too"
	line "much stuff, bud!"
	done

BillsHouseBillWhyDontYouGoInsteadOfMeText:
	text "That cruise ship,"
	line "S.S.AQUA, is in"

	para "VERMILION CITY."
	line "Its passengers"
	cont "are all trainers!"

	para "They invited me"
	line "to their party,"

	para "but I can't stand"
	line "fancy do's."

	para "Why don't you go"
	line "instead of me?"
	done

BillsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BillsHouseBillPokemon, EVENT_SEPARATED_BILL
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsHouseBill, EVENT_BILLS_HOUSE_BILL
