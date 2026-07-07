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

SSAnneKitchenCook7Script:
	jumptextfaceplayer SSAnneKitchenCook7Text

SSAnneKitchenCook1Text:
	text "Salmon du Salad"
	line "is our specialty!"
	done

SSAnneKitchenCook2Text:
	text "The kitchen never"
	line "stops!"
	done

SSAnneKitchenCook3Text:
	text "Fresh fish every"
	line "day!"
	done

SSAnneKitchenCook4Text:
	text "Cooking at sea"
	line "is tricky!"
	done

SSAnneKitchenCook5Text:
	text "Quality food for"
	line "quality service!"
	done

SSAnneKitchenCook6Text:
	text "Come back later"
	line "for dinner!"
	done

SSAnneKitchenCook7Text:
	text "Today's special:"
	line "Eels au Barbecue!"
	done

SSAnneKitchen_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SS_ANNE_1F, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CHEF, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook1Script, -1
	object_event  3,  4, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook2Script, -1
	object_event  5,  2, SPRITE_CHEF, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook3Script, -1
	object_event  2,  1, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook4Script, -1
	object_event  6,  4, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook5Script, -1
	object_event  4,  6, SPRITE_CHEF, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook6Script, -1
	object_event  1,  6, SPRITE_CHEF, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneKitchenCook7Script, -1
