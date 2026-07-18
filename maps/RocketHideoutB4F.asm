	object_const_def
	const ROCKETHIDEOUTB4F_GIOVANNI
	const ROCKETHIDEOUTB4F_ROCKET1
	const ROCKETHIDEOUTB4F_ROCKET2
	const ROCKETHIDEOUTB4F_ROCKET3
	const ROCKETHIDEOUTB4F_HP_UP
	const ROCKETHIDEOUTB4F_TM_RAZOR_WIND
	const ROCKETHIDEOUTB4F_IRON
	const ROCKETHIDEOUTB4F_SILPH_SCOPE
	const ROCKETHIDEOUTB4F_LIFT_KEY

RocketHideoutB4F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RocketHideoutB4FHiddenItemsCallback

; Gen 1 starts the SILPH SCOPE and LIFT KEY balls hidden
; (pokeredDisassembly/data/maps/toggleable_objects.asm: both OFF for ROCKET_HIDEOUT_B4F).
; The SILPH SCOPE appears once GIOVANNI is beaten (he leaves it behind); the LIFT KEY
; appears once ROCKET3 drops it in his after-battle text.
RocketHideoutB4FHiddenItemsCallback:
	checkevent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	iftrue .silph_scope_dropped
	disappear ROCKETHIDEOUTB4F_SILPH_SCOPE
.silph_scope_dropped
	checkevent EVENT_ROCKET_DROPPED_LIFT_KEY
	iftrue .lift_key_dropped
	disappear ROCKETHIDEOUTB4F_LIFT_KEY
.lift_key_dropped
	endcallback

RocketHideoutB4FGiovanniScript:
	faceplayer
	opentext
	writetext RocketHideoutB4FGiovanniImpressedYouGotHereText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FGiovanniWhatCannotBeText, 0
	setlasttalked ROCKETHIDEOUTB4F_GIOVANNI
	loadtrainer GIOVANNI, GIOVANNI_ROCKET_HIDEOUT
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	opentext
	writetext RocketHideoutB4FGiovanniHopeWeMeetAgainText
	waitbutton
	closetext
	; Gen 1: HideObject GIOVANNI + ShowObject ITEM_4 (the SILPH SCOPE he leaves behind)
	disappear ROCKETHIDEOUTB4F_GIOVANNI
	appear ROCKETHIDEOUTB4F_SILPH_SCOPE
	end

RocketHideoutB4FRocket1Script:
	faceplayer
	opentext
	writetext RocketHideoutB4FRocket1BattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FRocket1EndBattleText, 0
	setlasttalked ROCKETHIDEOUTB4F_ROCKET1
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B4F_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0
	opentext
	writetext RocketHideoutB4FRocket1AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB4FRocket2Script:
	faceplayer
	opentext
	writetext RocketHideoutB4FRocket2BattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FRocket2EndBattleText, 0
	setlasttalked ROCKETHIDEOUTB4F_ROCKET2
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B4F_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	opentext
	writetext RocketHideoutB4FRocket2AfterBattleText
	waitbutton
	closetext
	end

RocketHideoutB4FRocket3Script:
	faceplayer
	opentext
	writetext RocketHideoutB4FRocket3BattleText
	waitbutton
	closetext
	winlosstext RocketHideoutB4FRocket3EndBattleText, 0
	setlasttalked ROCKETHIDEOUTB4F_ROCKET3
	loadtrainer GRUNTM, ROCKET_HIDEOUT_B4F_3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2
	opentext
	writetext RocketHideoutB4FRocket3AfterBattleText
	waitbutton
	closetext
	; Gen 1: CheckAndSetEvent EVENT_ROCKET_DROPPED_LIFT_KEY -> ShowObject ITEM_5
	checkevent EVENT_ROCKET_DROPPED_LIFT_KEY
	iftrue .already_dropped
	setevent EVENT_ROCKET_DROPPED_LIFT_KEY
	appear ROCKETHIDEOUTB4F_LIFT_KEY
.already_dropped
	end

; Gen1 field itemballs. TM_RAZOR_WIND (Gen1 TM02) has no Gen2 equivalent -> TM_RETURN
; substitute (Normal-type, same precedent as RocketHideoutB2F's TM_HORN_DRILL and
; RocketHideoutB3F's TM_DOUBLE_EDGE).
; SILPH_SCOPE and LIFT_KEY are real key items here, repurposed from the spare TERU-SAMA
; item slots ITEM_5A / ITEM_64 (model/items.toml). Reusing Gen 2's BASEMENT_KEY for the
; Lift Key would have opened GoldenrodUnderground's basement door early (its checkitem
; gate), so the Gen1 items get their own constants instead.
RocketHideoutB4FHPUp:
	itemball HP_UP

RocketHideoutB4FTMRazorWind:
	itemball TM_RETURN

RocketHideoutB4FIron:
	itemball IRON

RocketHideoutB4FSilphScope:
	itemball SILPH_SCOPE

RocketHideoutB4FLiftKey:
	itemball LIFT_KEY

RocketHideoutB4FGiovanniImpressedYouGotHereText:
	text "So! I must say, I"
	line "am impressed you"
	cont "got here!"
	done

RocketHideoutB4FGiovanniWhatCannotBeText:
	text "WHAT!"
	line "This cannot be!"
	done

RocketHideoutB4FGiovanniHopeWeMeetAgainText:
	text "I see that you"
	line "raise #MON"
	cont "with utmost care."

	para "A child like you"
	line "would never"
	cont "understand what I"
	cont "hope to achieve."

	para "I shall step"
	line "aside this time!"

	para "I hope we meet"
	line "again…"
	done

RocketHideoutB4FRocket1BattleText:
	text "I know you! You"
	line "ruined our plans"
	cont "at MT.MOON!"
	done

RocketHideoutB4FRocket1EndBattleText:
	text "Burned"
	line "again!"
	done

RocketHideoutB4FRocket1AfterBattleText:
	text "Do you have"
	line "something against"
	cont "TEAM ROCKET?"
	done

RocketHideoutB4FRocket2BattleText:
	text "How can you not"
	line "see the beauty of"
	cont "our evil?"
	done

RocketHideoutB4FRocket2EndBattleText:
	text "Ayaya!"
	done

RocketHideoutB4FRocket2AfterBattleText:
	text "BOSS! I'm sorry I"
	line "failed you!"
	done

RocketHideoutB4FRocket3BattleText:
	text "The elevator"
	line "doesn't work? Who"
	cont "has the LIFT KEY?"
	done

RocketHideoutB4FRocket3EndBattleText:
	text "No!"
	done

RocketHideoutB4FRocket3AfterBattleText:
	text "Oh no! I dropped"
	line "the LIFT KEY!"
	done

RocketHideoutB4FHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROCKET_HIDEOUT_B4F_HIDDEN_SUPER_POTION

RocketHideoutB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; Gen 1 geometry (issue #44): moved to match pokeredDisassembly's coordinate
	; (.blk is already Gen1-ported; only this coord was stale).
	warp_event 19, 10, ROCKET_HIDEOUT_B3F, 2
	warp_event 24, 15, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 25, 15, ROCKET_HIDEOUT_ELEVATOR, 2

	def_coord_events

	def_bg_events
	bg_event 25,  1, BGEVENT_ITEM, RocketHideoutB4FHiddenSuperPotion

	def_object_events
	object_event 25,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FGiovanniScript, EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	object_event 23, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FRocket1Script, -1
	object_event 26, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FRocket2Script, -1
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FRocket3Script, -1
	object_event 10, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FHPUp, EVENT_ROCKET_HIDEOUT_B4F_HP_UP
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FTMRazorWind, EVENT_ROCKET_HIDEOUT_B4F_TM_RAZOR_WIND
	object_event 12, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FIron, EVENT_ROCKET_HIDEOUT_B4F_IRON
	object_event 25,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FSilphScope, EVENT_ROCKET_HIDEOUT_B4F_SILPH_SCOPE
	object_event 10,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FLiftKey, EVENT_ROCKET_HIDEOUT_B4F_LIFT_KEY
