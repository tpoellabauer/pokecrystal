	object_const_def
	const ROUTE12_SNORLAX
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_COOLTRAINER_M
	const ROUTE12_SUPER_NERD
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_FISHER5
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: sleeping SNORLAX blocks the path south until woken; reuses the exact
; VermilionCity SNORLAX pattern (SnorlaxAwake special, forced wild battle, disappears).
Route12Snorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext Route12SnorlaxText
	waitbutton
	closetext
	end

.Awake:
	writetext Route12SnorlaxWokeUpText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 30
	startbattle
	disappear ROUTE12_SNORLAX
	setevent EVENT_ROUTE_12_SNORLAX
	reloadmapafterbattle
	end

; Gen 1: SuperNerd sprite, ROCKER class -- Gen 2 renamed ROCKER to GUITARIST.
TrainerRoute12SuperNerd:
	trainer GUITARIST, WYATT, EVENT_BEAT_ROUTE_12_TRAINER_5, Route12SuperNerdSeenText, Route12SuperNerdBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route12SuperNerdAfterBattleText
	waitbutton
	closetext
	end

; Gen 1: CoolTrainerM sprite, JR.TRAINER(M) class.
TrainerRoute12CoolTrainerM:
	trainer JR_TRAINER_M, JR_TRAINER_M_5, EVENT_BEAT_ROUTE_12_TRAINER_2, Route12CoolTrainerMSeenText, Route12CoolTrainerMBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route12CoolTrainerMAfterBattleText
	waitbutton
	closetext
	end

TrainerRoute12Fisher1:
	trainer FISHER, WADE, EVENT_BEAT_ROUTE_12_TRAINER_0, Route12Fisher1SeenText, Route12Fisher1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route12Fisher1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute12Fisher2:
	trainer FISHER, LEROY_ROUTE12, EVENT_BEAT_ROUTE_12_TRAINER_1, Route12Fisher2SeenText, Route12Fisher2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route12Fisher2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute12Fisher3:
	trainer FISHER, HANK_ROUTE12, EVENT_BEAT_ROUTE_12_TRAINER_3, Route12Fisher3SeenText, Route12Fisher3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route12Fisher3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute12Fisher4:
	trainer FISHER, CHET, EVENT_BEAT_ROUTE_12_TRAINER_4, Route12Fisher4SeenText, Route12Fisher4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route12Fisher4AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute12Fisher5:
	trainer FISHER, DUSTY, EVENT_BEAT_ROUTE_12_TRAINER_6, Route12Fisher5SeenText, Route12Fisher5BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route12Fisher5AfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

; Gen 1: this ball holds TM_PAY_DAY, which has no Gen2 TM equivalent -- subbed with
; TM_RETURN (Normal-type), same precedent as SS Anne's TM_BODY_SLAM / Rocket Hideout's
; TM_HORN_DRILL, TM_DOUBLE_EDGE subs.
Route12PayDayTM:
	itemball TM_RETURN

Route12Iron:
	itemball IRON

Route12SnorlaxText:
	text "A sleeping #MON"
	line "blocks the way!"
	done

Route12SnorlaxWokeUpText:
	text "SNORLAX woke up!"

	para "It attacked in a"
	line "grumpy rage!"
	done

Route12Fisher1SeenText:
	text "Yeah! I got a"
	line "bite, here!"
	done

Route12Fisher1BeatenText:
	text "Tch!"
	line "Just a small fry!"
	prompt

Route12Fisher1AfterBattleText:
	text "Hang on! My line's"
	line "snagged!"
	done

Route12Fisher2SeenText:
	text "Be patient!"
	line "Fishing is a"
	cont "waiting game!"
	done

Route12Fisher2BeatenText:
	text "That"
	line "one got away!"
	prompt

Route12Fisher2AfterBattleText:
	text "With a better ROD,"
	line "I could catch"
	cont "better #MON!"
	done

Route12CoolTrainerMSeenText:
	text "Have you found a"
	line "MOON STONE?"
	done

Route12CoolTrainerMBeatenText:
	text "Oww!"
	prompt

Route12CoolTrainerMAfterBattleText:
	text "I could have made"
	line "my #MON evolve"
	cont "with MOON STONE!"
	done

Route12SuperNerdSeenText:
	text "Electricity is my"
	line "specialty!"
	done

Route12SuperNerdBeatenText:
	text "Unplugged!"
	prompt

Route12SuperNerdAfterBattleText:
	text "Water conducts"
	line "electricity, so"
	cont "you should zap"
	cont "sea #MON!"
	done

Route12Fisher3SeenText:
	text "The FISHING FOOL"
	line "vs. #MON KID!"
	done

Route12Fisher3BeatenText:
	text "Too"
	line "much!"
	prompt

Route12Fisher3AfterBattleText:
	text "You beat me at"
	line "#MON, but I'm"
	cont "good at fishing!"
	done

Route12Fisher4SeenText:
	text "I'd rather be"
	line "working!"
	done

Route12Fisher4BeatenText:
	text "It's"
	line "not easy…"
	prompt

Route12Fisher4AfterBattleText:
	text "It's all right."
	line "Losing doesn't"
	cont "bug me any more."
	done

Route12Fisher5SeenText:
	text "You never know"
	line "what you could"
	cont "catch!"
	done

Route12Fisher5BeatenText:
	text "Lost"
	line "it!"
	prompt

Route12Fisher5AfterBattleText:
	text "I catch MAGIKARP"
	line "all the time, but"
	cont "they're so weak!"
	done

Route12SignText:
	text "ROUTE 12"

	para "NORTH TO LAVENDER"
	line "TOWN"
	done

FishingSpotSignText:
	text "SPORT FISHING AREA"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 77, ROUTE_12_SUPER_ROD_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 13, 13, BGEVENT_READ, Route12Sign
	bg_event 11, 63, BGEVENT_READ, FishingSpotSign

	def_object_events
	object_event 10, 62, SPRITE_SNORLAX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route12Snorlax, EVENT_ROUTE_12_SNORLAX
	object_event 14, 31, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerRoute12Fisher1, -1
	object_event  5, 39, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerRoute12Fisher2, -1
	object_event 11, 92, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute12CoolTrainerM, -1
	object_event 14, 76, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerRoute12SuperNerd, -1
	object_event 12, 40, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerRoute12Fisher3, -1
	object_event  9, 52, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute12Fisher4, -1
	object_event  6, 87, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute12Fisher5, -1
	object_event 14, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12PayDayTM, EVENT_ROUTE_12_TM_PAY_DAY
	object_event  5, 89, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Iron, EVENT_ROUTE_12_IRON
