	object_const_def
	const ROUTE15_COOLTRAINER_F1
	const ROUTE15_COOLTRAINER_F2
	const ROUTE15_COOLTRAINER_M1
	const ROUTE15_COOLTRAINER_M2
	const ROUTE15_BEAUTY1
	const ROUTE15_BEAUTY2
	const ROUTE15_BIKER1
	const ROUTE15_BIKER2
	const ROUTE15_COOLTRAINER_F3
	const ROUTE15_COOLTRAINER_F4
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: CoolTrainerF sprite, JR.TRAINER(F) class.
TrainerRoute15CoolTrainerF1:
	trainer JR_TRAINER_F, JR_TRAINER_F_9, EVENT_BEAT_ROUTE_15_TRAINER_0, Route15CoolTrainerF1SeenText, Route15CoolTrainerF1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15CoolTrainerF1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15CoolTrainerF2:
	trainer JR_TRAINER_F, JR_TRAINER_F_10, EVENT_BEAT_ROUTE_15_TRAINER_1, Route15CoolTrainerF2SeenText, Route15CoolTrainerF2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15CoolTrainerF2AfterBattleText
	waitbutton
	closetext
	end

; Gen 1: CoolTrainerM sprite, BIRD_KEEPER class.
TrainerRoute15CoolTrainerM1:
	trainer BIRD_KEEPER, LOUIE, EVENT_BEAT_ROUTE_15_TRAINER_2, Route15CoolTrainerM1SeenText, Route15CoolTrainerM1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15CoolTrainerM1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15CoolTrainerM2:
	trainer BIRD_KEEPER, MARCO, EVENT_BEAT_ROUTE_15_TRAINER_3, Route15CoolTrainerM2SeenText, Route15CoolTrainerM2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15CoolTrainerM2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15Beauty1:
	trainer BEAUTY, ROSA1, EVENT_BEAT_ROUTE_15_TRAINER_4, Route15Beauty1SeenText, Route15Beauty1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15Beauty1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15Beauty2:
	trainer BEAUTY, CANDACE, EVENT_BEAT_ROUTE_15_TRAINER_5, Route15Beauty2SeenText, Route15Beauty2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15Beauty2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15Biker1:
	trainer BIKER, LOGAN, EVENT_BEAT_ROUTE_15_TRAINER_6, Route15Biker1SeenText, Route15Biker1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15Biker1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15Biker2:
	trainer BIKER, TRENT, EVENT_BEAT_ROUTE_15_TRAINER_7, Route15Biker2SeenText, Route15Biker2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15Biker2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15CoolTrainerF3:
	trainer JR_TRAINER_F, JR_TRAINER_F_11, EVENT_BEAT_ROUTE_15_TRAINER_8, Route15CoolTrainerF3SeenText, Route15CoolTrainerF3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15CoolTrainerF3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute15CoolTrainerF4:
	trainer JR_TRAINER_F, JR_TRAINER_F_12, EVENT_BEAT_ROUTE_15_TRAINER_9, Route15CoolTrainerF4SeenText, Route15CoolTrainerF4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route15CoolTrainerF4AfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

; Gen 1: TM_RAGE (TM20). Rage isn't a TM in Gen 2, so this is substituted with the
; closest available Normal-type attacking TM, following the same substitution precedent
; as TM_BODY_SLAM/TM_HORN_DRILL -> TM_RETURN and TM_EGG_BOMB -> TM_SWIFT.
Route15TMRage:
	itemball TM_HEADBUTT

Route15CoolTrainerF1SeenText:
	text "Let me try out the"
	line "#MON I just"
	cont "got in a trade!"
	done

Route15CoolTrainerF1BeatenText:
	text "Not"
	line "good enough!"
	prompt

Route15CoolTrainerF1AfterBattleText:
	text "You can't change"
	line "the nickname of"
	cont "any #MON you"
	cont "get in a trade."

	para "Only the Original"
	line "Trainer can."
	done

Route15CoolTrainerF2SeenText:
	text "You look gentle,"
	line "so I think I can"
	cont "beat you!"
	done

Route15CoolTrainerF2BeatenText:
	text "No,"
	line "wrong!"
	prompt

Route15CoolTrainerF2AfterBattleText:
	text "I'm afraid of"
	line "BIKERs, they look"
	cont "so ugly and mean!"
	done

Route15CoolTrainerM1SeenText:
	text "When I whistle, I"
	line "can summon bird"
	cont "#MON!"
	done

Route15CoolTrainerM1BeatenText:
	text "Ow!"
	line "That's tragic!"
	prompt

Route15CoolTrainerM1AfterBattleText:
	text "Maybe I'm not cut"
	line "out for battles."
	done

Route15CoolTrainerM2SeenText:
	text "Hmm? My birds are"
	line "shivering! You're"
	cont "good, aren't you?"
	done

Route15CoolTrainerM2BeatenText:
	text "Just"
	line "as I thought!"
	prompt

Route15CoolTrainerM2AfterBattleText:
	text "Did you know moves"
	line "like EARTHQUAKE"
	cont "don't have any"
	cont "effect on birds?"
	done

Route15Beauty1SeenText:
	text "Oh, you're a"
	line "little cutie!"
	done

Route15Beauty1BeatenText:
	text "You looked"
	line "so cute too!"
	prompt

Route15Beauty1AfterBattleText:
	text "I forgive you!"
	line "I can take it!"
	done

Route15Beauty2SeenText:
	text "I raise #MON"
	line "because I live"
	cont "alone!"
	done

Route15Beauty2BeatenText:
	text "I didn't"
	line "ask for this!"
	prompt

Route15Beauty2AfterBattleText:
	text "I just like going"
	line "home to be with"
	cont "my #MON!"
	done

Route15Biker1SeenText:
	text "Hey kid! C'mon!"
	line "I just got these!"
	done

Route15Biker1BeatenText:
	text "Why"
	line "not?"
	prompt

Route15Biker1AfterBattleText:
	text "You only live"
	line "once, so I live"
	cont "as an outlaw!"
	done

Route15Biker2SeenText:
	text "Fork over all your"
	line "cash when you"
	cont "lose to me, kid!"
	done

Route15Biker2BeatenText:
	text "That"
	line "can't be true!"
	prompt

Route15Biker2AfterBattleText:
	text "I was just joking"
	line "about the money!"
	done

Route15CoolTrainerF3SeenText:
	text "What's cool?"
	line "Trading #MON!"
	done

Route15CoolTrainerF3BeatenText:
	text "I"
	line "said trade!"
	prompt

Route15CoolTrainerF3AfterBattleText:
	text "I trade #MON"
	line "with my friends!"
	done

Route15CoolTrainerF4SeenText:
	text "Want to play with"
	line "my #MON?"
	done

Route15CoolTrainerF4BeatenText:
	text "I was"
	line "too impatient!"
	prompt

Route15CoolTrainerF4AfterBattleText:
	text "I'll go train with"
	line "weaker people."
	done

Route15SignText:
	text "ROUTE 15"
	line "West to FUCHSIA"
	cont "CITY"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; No gate here in Gen 1 (issue #44): Route15<->FuchsiaCity connects normally;
	; Route15Gate1F is a real Gen1 mid-route Cycling-style checkpoint (see
	; pokeredDisassembly/data/maps/objects/Route15.asm) still unported -- deferred,
	; not part of this issue's scope (tracked as remaining work).

	def_coord_events

	def_bg_events
	bg_event 39,  9, BGEVENT_READ, Route15Sign

	def_object_events
	object_event 41, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute15CoolTrainerF1, -1
	object_event 53, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute15CoolTrainerF2, -1
	object_event 31, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute15CoolTrainerM1, -1
	object_event 35, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute15CoolTrainerM2, -1
	object_event 53, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute15Beauty1, -1
	object_event 41, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute15Beauty2, -1
	object_event 48, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute15Biker1, -1
	object_event 46, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute15Biker2, -1
	object_event 37,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute15CoolTrainerF3, -1
	object_event 18, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoute15CoolTrainerF4, -1
	object_event 18,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15TMRage, EVENT_ROUTE_15_TM_RAGE
