	object_const_def
	const SSANNE1FROOMS_GENTLEMAN1
	const SSANNE1FROOMS_GENTLEMAN2
	const SSANNE1FROOMS_YOUNGSTER
	const SSANNE1FROOMS_COOLTRAINER_F
	const SSANNE1FROOMS_GIRL1
	const SSANNE1FROOMS_MIDDLE_AGED_MAN
	const SSANNE1FROOMS_LITTLE_GIRL
	const SSANNE1FROOMS_WIGGLYTUFF
	const SSANNE1FROOMS_GIRL2
	const SSANNE1FROOMS_TM_BODY_SLAM
	const SSANNE1FROOMS_GENTLEMAN3

SSAnne1FRooms_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerGentlemanAugust:
	trainer GENTLEMAN, AUGUST, EVENT_BEAT_GENTLEMAN_SSANNE_1, SSAnne1FRoomsGentleman1BattleText, SSAnne1FRoomsGentleman1EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnne1FRoomsGentleman1AfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanBenedict:
	trainer GENTLEMAN, BENEDICT, EVENT_BEAT_GENTLEMAN_SSANNE_2, SSAnne1FRoomsGentleman2BattleText, SSAnne1FRoomsGentleman2EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnne1FRoomsGentleman2AfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWaldo:
	trainer YOUNGSTER, WALDO, EVENT_BEAT_YOUNGSTER_SSANNE, SSAnne1FRoomsYoungsterBattleText, SSAnne1FRoomsYoungsterEndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnne1FRoomsYoungsterAfterBattleText
	waitbutton
	closetext
	end

TrainerLassTessa:
	trainer LASS, TESSA, EVENT_BEAT_LASS_SSANNE, SSAnne1FRoomsCooltrainerFBattleText, SSAnne1FRoomsCooltrainerFEndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnne1FRoomsCooltrainerFAfterBattleText
	waitbutton
	closetext
	end

SSAnne1FRoomsGirl1Script:
	jumptextfaceplayer SSAnne1FRoomsGirl1Text

SSAnne1FRoomsMiddleAgedManScript:
	jumptextfaceplayer SSAnne1FRoomsMiddleAgedManText

SSAnne1FRoomsLittleGirlScript:
	jumptextfaceplayer SSAnne1FRoomsLittleGirlText

SSAnne1FRoomsWigglytuffScript:
	jumptextfaceplayer SSAnne1FRoomsWigglytuffText

SSAnne1FRoomsGirl2Script:
	jumptextfaceplayer SSAnne1FRoomsGirl2Text

; Gen 1 TM34 Body Slam has no Gen2 equivalent (same class of gap as
; TM_REFLECT/TM_THUNDER_WAVE, see PORT_BACKLOG); substituted TM_RETURN, the
; closest available Normal-type TM (Safari Center EggBomb->TM_SWIFT precedent).
SSAnne1FRoomsTmBodySlamScript:
	itemball TM_RETURN

SSAnne1FRoomsGentleman3Script:
	jumptextfaceplayer SSAnne1FRoomsGentleman3Text

SSAnne1FRoomsGentleman1BattleText:
	text "I travel alone"
	line "on my journeys!"

	para "My #MON are my"
	line "only friends!"
	done

SSAnne1FRoomsGentleman1EndBattleText:
	text "My, my"
	line "friends..."
	done

SSAnne1FRoomsGentleman1AfterBattleText:
	text "You should be"
	line "nice to friends!"
	done

SSAnne1FRoomsGentleman2BattleText:
	text "You pup! How dare"
	line "you barge in!"
	done

SSAnne1FRoomsGentleman2EndBattleText:
	text "Humph!"
	line "You rude child!"
	done

SSAnne1FRoomsGentleman2AfterBattleText:
	text "I wish to be left"
	line "alone! Get out!"
	done

SSAnne1FRoomsYoungsterBattleText:
	text "I love #MON!"
	line "Do you?"
	done

SSAnne1FRoomsYoungsterEndBattleText:
	text "Wow!"
	line "You're great!"
	done

SSAnne1FRoomsYoungsterAfterBattleText:
	text "Let me be your"
	line "friend, OK?"

	para "Then we can trade"
	line "#MON!"
	done

SSAnne1FRoomsCooltrainerFBattleText:
	text "I collected these"
	line "#MON from all"
	cont "around the world!"
	done

SSAnne1FRoomsCooltrainerFEndBattleText:
	text "Oh no!"
	line "I went around the"
	cont "world for these!"
	done

SSAnne1FRoomsCooltrainerFAfterBattleText:
	text "You hurt my poor"
	line "worldly #MON!"

	para "I demand that you"
	line "heal them at a"
	cont "#MON CENTER!"
	done

SSAnne1FRoomsGirl1Text:
	text "Waiter, I would"
	line "like a cherry pie"
	cont "please!"
	done

SSAnne1FRoomsMiddleAgedManText:
	text "A cruise is so"
	line "elegant yet cozy!"
	done

SSAnne1FRoomsLittleGirlText:
	text "I always travel"
	line "with WIGGLYTUFF!"
	done

SSAnne1FRoomsWigglytuffText:
	text "WIGGLYTUFF: Puup"
	line "pupuu!"
	done

SSAnne1FRoomsGirl2Text:
	text "We are cruising"
	line "around the world."
	done

SSAnne1FRoomsGentleman3Text:
	text "Ssh! I'm a GLOBAL"
	line "POLICE agent!"

	para "I'm on the trail"
	line "of TEAM ROCKET!"
	done

SSAnne1FRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, SS_ANNE_1F, 3
	warp_event 10,  0, SS_ANNE_1F, 4
	warp_event 20,  0, SS_ANNE_1F, 5
	warp_event  0, 10, SS_ANNE_1F, 6
	warp_event 10, 10, SS_ANNE_1F, 7
	warp_event 20, 10, SS_ANNE_1F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGentlemanAugust, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGentlemanBenedict, -1
	object_event 11, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterWaldo, -1
	object_event 13, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerLassTessa, -1
	object_event 22,  3, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGirl1Script, -1
	object_event  0, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsMiddleAgedManScript, -1
	object_event  2, 11, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsLittleGirlScript, -1
	object_event  3, 11, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsWigglytuffScript, -1
	object_event 10, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGirl2Script, -1
	object_event 12, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSAnne1FRoomsTmBodySlamScript, -1
	object_event 21, 13, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FRoomsGentleman3Script, -1
