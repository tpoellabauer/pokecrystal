	object_const_def
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2
	const ROUTE19_COOLTRAINER_M1
	const ROUTE19_COOLTRAINER_M2
	const ROUTE19_SWIMMER1
	const ROUTE19_SWIMMER2
	const ROUTE19_SWIMMER3
	const ROUTE19_SWIMMER4
	const ROUTE19_SWIMMER5
	const ROUTE19_SWIMMER6
	const ROUTE19_SWIMMER7
	const ROUTE19_SWIMMER8

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Route19ClearRocksCallback

; Gen 1: Route19_Object has an EMPTY def_warp_events -- Route 19 is pure open water between
; Fuchsia City and Seafoam Islands, no gate building, no boulders. This whole rocks/gate
; mechanic (this callback, ROUTE19_FUCHSIA_GATE, and EVENT_CINNABAR_ROCKS_CLEARED, also used by
; Route19FuchsiaGate.asm + Route20.asm) is retained vanilla-GSC content spanning 3 maps; removing
; it here alone would orphan Route19FuchsiaGate's south exit warp. Out of scope for a
; Route19-only content pass (parity_static_whitelist.toml documents the resulting warp:1
; divergence, same treatment as ROUTE_17's Route17Route18Gate).
Route19ClearRocksCallback:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	endcallback

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

; Gen 1: CoolTrainerM sprite, SWIMMERM class -- same battle data as SWIMMER (2)/(3).
TrainerRoute19CoolTrainerM1:
	trainer SWIMMERM, KIRK1, EVENT_BEAT_ROUTE_19_TRAINER_0, Route19CoolTrainerM1SeenText, Route19CoolTrainerM1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19CoolTrainerM1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19CoolTrainerM2:
	trainer SWIMMERM, DEAN1, EVENT_BEAT_ROUTE_19_TRAINER_1, Route19CoolTrainerM2SeenText, Route19CoolTrainerM2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19CoolTrainerM2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19Swimmer1:
	trainer SWIMMERM, ARNIE, EVENT_BEAT_ROUTE_19_TRAINER_2, Route19Swimmer1SeenText, Route19Swimmer1BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer1AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19Swimmer2:
	trainer SWIMMERM, BRETT, EVENT_BEAT_ROUTE_19_TRAINER_3, Route19Swimmer2SeenText, Route19Swimmer2BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer2AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19Swimmer3:
	trainer SWIMMERM, HUGO, EVENT_BEAT_ROUTE_19_TRAINER_4, Route19Swimmer3SeenText, Route19Swimmer3BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer3AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19Swimmer4:
	trainer SWIMMERM, TREVOR1, EVENT_BEAT_ROUTE_19_TRAINER_5, Route19Swimmer4SeenText, Route19Swimmer4BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer4AfterBattleText
	waitbutton
	closetext
	end

; Gen 1: Swimmer sprite, BEAUTY class.
TrainerRoute19Swimmer5:
	trainer BEAUTY, WANDA, EVENT_BEAT_ROUTE_19_TRAINER_6, Route19Swimmer5SeenText, Route19Swimmer5BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer5AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19Swimmer6:
	trainer BEAUTY, IRENE1, EVENT_BEAT_ROUTE_19_TRAINER_7, Route19Swimmer6SeenText, Route19Swimmer6BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer6AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19Swimmer7:
	trainer SWIMMERM, NED1, EVENT_BEAT_ROUTE_19_TRAINER_8, Route19Swimmer7SeenText, Route19Swimmer7BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer7AfterBattleText
	waitbutton
	closetext
	end

TrainerRoute19Swimmer8:
	trainer BEAUTY, LOLA1, EVENT_BEAT_ROUTE_19_TRAINER_9, Route19Swimmer8SeenText, Route19Swimmer8BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext Route19Swimmer8AfterBattleText
	waitbutton
	closetext
	end

SwimmermHaroldSeenText:
	text "Have you ever gone"
	line "swimming in the"
	cont "sea at night?"
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "At night, the sea"
	line "turns black. It"

	para "feels like it will"
	line "swallow you up."
	done

SwimmermTuckerSeenText:
	text "Pant, pant…"
	line "Just… a little…"

	para "farther… to…"
	line "FUCHSIA…"
	done

SwimmermTuckerBeatenText:
	text "I'm drowning!"
	done

SwimmermTuckerAfterBattleText:
	text "I… asked my girl-"
	line "friend to swim to"
	cont "FUCHSIA… Gasp…"
	done

SwimmerfDawnSeenText:
	text "I'm disgusted by"
	line "wimpy people!"
	done

SwimmerfDawnBeatenText:
	text "I could beat you"
	line "at swimming…"
	done

SwimmerfDawnAfterBattleText:
	text "It's a quick swim"
	line "between FUCHSIA"

	para "and SEAFOAM IS-"
	line "LANDS…"

	para "Sheesh, some big"
	line "man my boyfriend"

	para "is! What a wimp!"
	done

SwimmermJeromeSeenText:
	text "Swimming?"
	line "I'm lousy at it."

	para "I'm just splashing"
	line "around in these"
	cont "shallow waters."
	done

SwimmermJeromeBeatenText:
	text "I thought I could"
	line "win."
	done

SwimmermJeromeAfterBattleText:
	text "I might be bad at"
	line "swimming, but I"
	cont "love the sea."
	done

Route19Fisher1Text:
	text "Sorry. This road"
	line "is closed for"
	cont "construction."

	para "If you want to get"
	line "to CINNABAR, you'd"

	para "better go south"
	line "from PALLET TOWN."
	done

Route19Fisher1Text_RocksCleared:
	text "I'm all sweaty."
	line "Time for a swim!"
	done

Route19Fisher2Text:
	text "Who knows how long"
	line "it would take to"
	cont "move this boulder…"
	done

Route19Fisher2Text_RocksCleared:
	text "The roadwork is"
	line "finally finished."

	para "Now I can go"
	line "fishing again."
	done

Route19CoolTrainerM1SeenText:
	text "Have to warm up"
	line "before my swim!"
	done

Route19CoolTrainerM1BeatenText:
	text "All"
	line "warmed up!"
	prompt

Route19CoolTrainerM1AfterBattleText:
	text "Thanks, kid! I'm"
	line "ready for a swim!"
	done

Route19CoolTrainerM2SeenText:
	text "Wait! You'll have"
	line "a heart attack!"
	done

Route19CoolTrainerM2BeatenText:
	text "Ooh!"
	line "That's chilly!"
	prompt

Route19CoolTrainerM2AfterBattleText:
	text "Watch out for"
	line "TENTACOOL!"
	done

Route19Swimmer1SeenText:
	text "I love swimming!"
	line "What about you?"
	done

Route19Swimmer1BeatenText:
	text "Belly"
	line "flop!"
	prompt

Route19Swimmer1AfterBattleText:
	text "I can beat #MON"
	line "at swimming!"
	done

Route19Swimmer2SeenText:
	text "What's beyond the"
	line "horizon?"
	done

Route19Swimmer2BeatenText:
	text "Glub!"
	prompt

Route19Swimmer2AfterBattleText:
	text "I see a couple of"
	line "islands!"
	done

Route19Swimmer3SeenText:
	text "I tried diving"
	line "for #MON, but"
	cont "it was a no go!"
	done

Route19Swimmer3BeatenText:
	text "Help!"
	prompt

Route19Swimmer3AfterBattleText:
	text "You have to fish"
	line "for sea #MON!"
	done

Route19Swimmer4SeenText:
	text "I look at the"
	line "sea to forget!"
	done

Route19Swimmer4BeatenText:
	text "Ooh!"
	line "Traumatic!"
	prompt

Route19Swimmer4AfterBattleText:
	text "I'm looking at the"
	line "sea to forget!"
	done

Route19Swimmer5SeenText:
	text "Oh, I just love"
	line "your ride! Can I"
	cont "have it if I win?"
	done

Route19Swimmer5BeatenText:
	text "Oh!"
	line "I lost!"
	prompt

Route19Swimmer5AfterBattleText:
	text "It's still a long"
	line "way to go to"
	cont "SEAFOAM ISLANDS."
	done

Route19Swimmer6SeenText:
	text "Swimming's great!"
	line "Sunburns aren't!"
	done

Route19Swimmer6BeatenText:
	text "Shocker!"
	prompt

Route19Swimmer6AfterBattleText:
	text "My boy friend"
	line "wanted to swim to"
	cont "SEAFOAM ISLANDS."
	done

Route19Swimmer7SeenText:
	text "These waters are"
	line "treacherous!"
	done

Route19Swimmer7BeatenText:
	text "Ooh!"
	line "Dangerous!"
	prompt

Route19Swimmer7AfterBattleText:
	text "I got a cramp!"
	line "Glub, glub…"
	done

Route19Swimmer8SeenText:
	text "I swam here, but"
	line "I'm tired."
	done

Route19Swimmer8BeatenText:
	text "I'm"
	line "exhausted…"
	prompt

Route19Swimmer8AfterBattleText:
	text "LAPRAS is so big,"
	line "it must keep you"
	cont "dry on water."
	done

Route19SignText:
	text "SEA ROUTE 19"

	para "FUCHSIA CITY -"
	line "SEAFOAM ISLANDS"
	done

CarefulSwimmingSignText:
	text "Please be careful"
	line "if you are swim-"
	cont "ming to SEAFOAM"
	cont "ISLANDS."

	para "FUCHSIA POLICE"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	; No warps here in Gen 1 (issue #44): Route19<->FuchsiaCity connects normally;
	; ROUTE_19_FUCHSIA_GATE was a GSC-era bogus border gate with no Gen1 counterpart.

	def_coord_events

	def_bg_events
	bg_event 11,  9, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	def_object_events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
	object_event  8,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute19CoolTrainerM1, -1
	object_event 13,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute19CoolTrainerM2, -1
	object_event 13, 25, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer1, -1
	object_event  4, 27, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer2, -1
	object_event 16, 31, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer3, -1
	object_event  9, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer4, -1
	object_event  8, 43, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer5, -1
	object_event 11, 43, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer6, -1
	object_event  9, 42, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer7, -1
	object_event 10, 44, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerRoute19Swimmer8, -1
