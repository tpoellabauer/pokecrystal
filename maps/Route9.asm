	object_const_def
	const ROUTE9_COOLTRAINER_F1
	const ROUTE9_COOLTRAINER_M1
	const ROUTE9_COOLTRAINER_M2
	const ROUTE9_COOLTRAINER_F2
	const ROUTE9_HIKER1
	const ROUTE9_HIKER2
	const ROUTE9_YOUNGSTER1
	const ROUTE9_HIKER3
	const ROUTE9_YOUNGSTER2
	const ROUTE9_TM_TELEPORT

Route9_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainerf1Route9:
	trainer JR_TRAINER_F, JR_TRAINER_F_3, EVENT_BEAT_ROUTE_9_TRAINER_0, Cooltrainerf1Route9SeenText, Cooltrainerf1Route9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerf1Route9AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerm1Route9:
	trainer JR_TRAINER_M, JR_TRAINER_M_3, EVENT_BEAT_ROUTE_9_TRAINER_1, Cooltrainerm1Route9SeenText, Cooltrainerm1Route9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerm1Route9AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerm2Route9:
	trainer JR_TRAINER_M, JR_TRAINER_M_4, EVENT_BEAT_ROUTE_9_TRAINER_2, Cooltrainerm2Route9SeenText, Cooltrainerm2Route9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerm2Route9AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerf2Route9:
	trainer JR_TRAINER_F, JR_TRAINER_F_4, EVENT_BEAT_ROUTE_9_TRAINER_3, Cooltrainerf2Route9SeenText, Cooltrainerf2Route9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerf2Route9AfterBattleText
	waitbutton
	closetext
	end

TrainerHikerCurtis:
	trainer HIKER, CURTIS, EVENT_BEAT_ROUTE_9_TRAINER_4, HikerCurtisSeenText, HikerCurtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerCurtisAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerBuford:
	trainer HIKER, BUFORD, EVENT_BEAT_ROUTE_9_TRAINER_5, HikerBufordSeenText, HikerBufordBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBufordAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterStuart:
	trainer BUG_CATCHER, STUART, EVENT_BEAT_ROUTE_9_TRAINER_6, YoungsterStuartSeenText, YoungsterStuartBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterStuartAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDarrell:
	trainer HIKER, DARRELL, EVENT_BEAT_ROUTE_9_TRAINER_7, HikerDarrellSeenText, HikerDarrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDarrellAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterClay:
	trainer BUG_CATCHER, CLAY, EVENT_BEAT_ROUTE_9_TRAINER_8, YoungsterClaySeenText, YoungsterClayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterClayAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

; Gen1 field itemball. TM_TELEPORT (TM30) has no Gen2 equivalent -> TM_RETURN substitute
; (Normal-type, same precedent as RocketHideoutB2F/B3F's TM_HORN_DRILL/TM_DOUBLE_EDGE subs).
; object_item whitelisted.
Route9TmTeleport:
	itemball TM_RETURN

Cooltrainerf1Route9SeenText:
	text "You have #MON"
	line "with you!"
	cont "You're mine!"
	done

Cooltrainerf1Route9BeatenText:
	text "You deceived me!"
	done

Cooltrainerf1Route9AfterBattleText:
	text "You need light to"
	line "get through that"
	cont "dark tunnel ahead."
	done

Cooltrainerm1Route9SeenText:
	text "Who's that walking"
	line "with those good"
	cont "looking #MON?"
	done

Cooltrainerm1Route9BeatenText:
	text "Out like a light!"
	done

Cooltrainerm1Route9AfterBattleText:
	text "Keep walking!"
	done

Cooltrainerm2Route9SeenText:
	text "I'm taking ROCK"
	line "TUNNEL to go to"
	cont "LAVENDER..."
	done

Cooltrainerm2Route9BeatenText:
	text "Can't measure up!"
	done

Cooltrainerm2Route9AfterBattleText:
	text "Are you off to"
	line "ROCK TUNNEL too?"
	done

Cooltrainerf2Route9SeenText:
	text "Don't you dare"
	line "condescend me!"
	done

Cooltrainerf2Route9BeatenText:
	text "No! You're too"
	line "much!"
	done

Cooltrainerf2Route9AfterBattleText:
	text "You're obviously"
	line "talented! Good"
	cont "luck to you!"
	done

HikerCurtisSeenText:
	text "Bwahaha!"
	line "Great! I was"
	cont "bored, eh!"
	done

HikerCurtisBeatenText:
	text "Keep it coming,"
	line "eh!"

	para "Oh wait. I'm out"
	line "of #MON!"
	done

HikerCurtisAfterBattleText:
	text "You sure had guts"
	line "standing up to me"
	cont "there, eh?"
	done

HikerBufordSeenText:
	text "Hahaha!"
	line "Aren't you a"
	cont "little toughie!"
	done

HikerBufordBeatenText:
	text "What's that?"
	done

HikerBufordAfterBattleText:
	text "Hahaha! Kids"
	line "should be tough!"
	done

YoungsterStuartSeenText:
	text "I got up early"
	line "every day to"
	cont "raise my #MON"
	cont "from cocoons!"
	done

YoungsterStuartBeatenText:
	text "WHAT?"

	para "What a total"
	line "waste of time!"
	done

YoungsterStuartAfterBattleText:
	text "I have to collect"
	line "more than bugs to"
	cont "get stronger..."
	done

HikerDarrellSeenText:
	text "Hahahaha!"
	line "Come on, dude!"
	done

HikerDarrellBeatenText:
	text "Hahahaha!"
	line "You beat me fair!"
	done

HikerDarrellAfterBattleText:
	text "Hahahaha!"
	line "Us hearty guys"
	cont "always laugh!"
	done

YoungsterClaySeenText:
	text "Go, my super bug"
	line "#MON!"
	done

YoungsterClayBeatenText:
	text "My bugs..."
	done

YoungsterClayAfterBattleText:
	text "If you don't like"
	line "bug #MON, you"
	cont "bug me!"
	done

Route9SignText:
	text "ROUTE 9"

	para "CERULEAN CITY -"
	line "ROCK TUNNEL"
	done

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

Route9_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event 25,  7, BGEVENT_READ, Route9Sign
	bg_event 14,  7, BGEVENT_ITEM, Route9HiddenEther

	def_object_events
	object_event 13, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerf1Route9, -1
	object_event 24,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerm1Route9, -1
	object_event 31,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerm2Route9, -1
	object_event 48,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerf2Route9, -1
	object_event 16, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 11, TrainerHikerCurtis, -1
	object_event 43,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 6, TrainerHikerBuford, -1
	object_event 22,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 13, TrainerYoungsterStuart, -1
	object_event 45, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerHikerDarrell, -1
	object_event 40,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 14, TrainerYoungsterClay, -1
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route9TmTeleport, EVENT_ROUTE_9_TM_TELEPORT
