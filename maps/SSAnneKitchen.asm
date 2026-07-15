	object_const_def
	const SSANNE_KITCHEN_COOK1
	const SSANNE_KITCHEN_COOK2
	const SSANNE_KITCHEN_COOK3
	const SSANNE_KITCHEN_COOK4
	const SSANNE_KITCHEN_COOK5
	const SSANNE_KITCHEN_COOK6
	const SSANNE_KITCHEN_COOK7

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

; Simplified from Gen 1's 3-way random dish text to a single fixed line (content-equivalent,
; saves bank-25 space -- see model-and-gen/maps-and-scripting "simplify where faithful").
SSAnneKitchenCook7Script:
	jumptextfaceplayer SSAnneKitchenCook7Text

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
	line "Snorlax?"

	para "All it does is"
	line "eat and sleep!"
	done

SSAnneKitchenCook6Text:
	text "Snivel...Sniff..."

	para "I only get to"
	line "peel onions..."
	cont "Snivel..."
	done

SSAnneKitchenCook7Text:
	text "Er-hem! Indeed I"
	line "am le chef!"

	para "Le main course is"
	line "Salmon du Salad!"
	done

SSAnneKitchenHiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_SS_ANNE_KITCHEN_HIDDEN_GREAT_BALL

SSAnneKitchen_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  0, SS_ANNE_1F, 11

	def_coord_events

	def_bg_events
	bg_event 13,  9, BGEVENT_ITEM, SSAnneKitchenHiddenGreatBall

	def_object_events
	object_event  1,  8, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook1Script, -1
	object_event  5,  8, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook2Script, -1
	object_event  9,  7, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook3Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook4Script, -1
	object_event 13,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook5Script, -1
	object_event 13, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook6Script, -1
	object_event 11, 13, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook7Script, -1
