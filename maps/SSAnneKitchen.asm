SSAnneKitchen_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnneKitchenCook1Script:
	jumptextfaceplayer SSAnneKitchenCook1Text

SSAnneKitchenCook2Script:
	jumptextfaceplayer SSAnneKitchenCook2Text

SSAnneKitchenCook3Script:
	jumptextfaceplayer SSAnneKitchenCook3Text

SSAnneKitchenCook4Script:
	jumptextfaceplayer SSAnneKitchenCook4Text

SSAnneKitchenCook5Script:
	jumptextfaceplayer SSAnneKitchenCook5Text

SSAnneKitchenCook6Script:
	jumptextfaceplayer SSAnneKitchenCook6Text

SSAnneKitchenCook7Script:
	faceplayer
	opentext
	writetext SSAnneKitchenCook7MainCourseIsText
	waitbutton
	random 3
	ifequal 0, .Salmon
	ifequal 1, .Eels
	writetext SSAnneKitchenCook7PrimeBeefSteakText
	waitbutton
	closetext
	end

.Salmon:
	writetext SSAnneKitchenCook7SalmonDuSaladText
	waitbutton
	closetext
	end

.Eels:
	writetext SSAnneKitchenCook7EelsAuBarbecueText
	waitbutton
	closetext
	end

SSAnneKitchenCook1Text:
	text "You, mon petit!"
	line "We're busy here!"
	cont "Out of the way!"
	done

SSAnneKitchenCook2Text:
	text "I saw an odd ball"
	line "in the trash."
	done

SSAnneKitchenCook3Text:
	text "I'm so busy I'm"
	line "getting dizzy!"
	done

SSAnneKitchenCook4Text:
	text "Hum-de-hum-de-"
	line "ho..."

	para "I peel spuds"
	line "every day!"
	cont "Hum-hum..."
	done

SSAnneKitchenCook5Text:
	text "Did you hear about"
	line "SNORLAX?"

	para "All it does is"
	line "eat and sleep!"
	done

SSAnneKitchenCook6Text:
	text "Snivel...Sniff..."

	para "I only get to"
	line "peel onions..."
	cont "Snivel..."
	done

SSAnneKitchenCook7MainCourseIsText:
	text "Er-hem! Indeed I"
	line "am le CHEF!"

	para "Le main course is"
	prompt

SSAnneKitchenCook7SalmonDuSaladText:
	text "Salmon du Salad!"

	para "Les guests may"
	line "gripe it's fish"
	cont "again, however!"
	done

SSAnneKitchenCook7EelsAuBarbecueText:
	text "Eels au Barbecue!"

	para "Les guests will"
	line "mutiny, I fear."
	done

SSAnneKitchenCook7PrimeBeefSteakText:
	text "Prime Beef Steak!"

	para "But, have I enough"
	line "fillets du beef?"
	done

SSAnneKitchen_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  8, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook1Script, -1
	object_event  5,  8, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook2Script, -1
	object_event  9,  7, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook3Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook4Script, -1
	object_event 13,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook5Script, -1
	object_event 13, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook6Script, -1
	object_event 11, 13, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook7Script, -1
