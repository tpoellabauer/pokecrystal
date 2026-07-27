; issue #178 audit: CERULEANCITY_FISHER (added vs Red) checks EVENT_RETURNED_MACHINE_PART /
; EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM -- part of the cross-map Power Plant questline, see the
; full writeup in maps/PowerPlant.asm. Keep, won't-fix. (CERULEANCITY_YOUNGSTER has its own,
; separate rationale -- see comment at its script label below.)
	object_const_def
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD1
	const CERULEANCITY_SUPER_NERD2
	const CERULEANCITY_GUARD1
	const CERULEANCITY_COOLTRAINER_F1
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F2
	const CERULEANCITY_SUPER_NERD3
	const CERULEANCITY_GUARD2
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER
	const CERULEANCITY_RIVAL
	const CERULEANCITY_ROCKET

CeruleanCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlypointCallback

CeruleanCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerd1Script:
	jumptextfaceplayer CeruleanCitySuperNerd1Text

; Gen 1 "you're making an encyclopedia on #MON?" NPC.
CeruleanCitySuperNerd2Script:
	jumptextfaceplayer CeruleanCitySuperNerd2Text

; Gen 1 "the people here were robbed... TEAM ROCKET" guard NPC (one of two identical guards
; flanking the burgled house's back alley, see GUARD2 below).
CeruleanCityGuard1Script:
	jumptextfaceplayer CeruleanCityGuardText

CeruleanCityGuard2Script:
	jumptextfaceplayer CeruleanCityGuardText

CeruleanCitySlowbro:
	opentext
	random 4
	ifequal 0, .TookASnooze
	ifequal 1, .IsLoafingAround
	ifequal 2, .TurnedAway
	writetext CeruleanCitySlowbroIgnoredOrdersText
	sjump .Done

.TookASnooze:
	writetext CeruleanCitySlowbroTookASnoozeText
	sjump .Done

.IsLoafingAround:
	writetext CeruleanCitySlowbroIsLoafingAroundText
	sjump .Done

.TurnedAway:
	writetext CeruleanCitySlowbroTurnedAwayText

.Done:
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerF1Script:
	faceplayer
	opentext
	random 3
	ifequal 0, .UseSonicboom
	ifequal 1, .Punch
	writetext CeruleanCityCooltrainerF1SlowbroWithdrawText
	sjump .Done

.UseSonicboom:
	writetext CeruleanCityCooltrainerF1SlowbroUseSonicboomText
	sjump .Done

.Punch:
	writetext CeruleanCityCooltrainerF1SlowbroPunchText

.Done:
	waitbutton
	closetext
	end

; Gen 1 "I want a bright red BICYCLE!" NPC.
CeruleanCityCooltrainerF2Script:
	jumptextfaceplayer CeruleanCityCooltrainerF2Text

; Gen 1 "this is CERULEAN CAVE! ...only the #MON LEAGUE champion is allowed in!" lore NPC,
; positioned by the cave mouth.
CeruleanCitySuperNerd3Script:
	jumptextfaceplayer CeruleanCitySuperNerd3Text

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

; issue #178 audit: CERULEANCITY_YOUNGSTER has no Red equivalent. His gate,
; EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY, greps to only this map file (self-contained --
; it's the same map's own BERSERK_GENE hiddenitem, see below), unlike the Fisher's questline
; flags. Keep anyway: he's a same-map flavor reaction to a same-map hidden-item pickup (the
; standard "comment on a nearby hiddenitem" NPC pattern used elsewhere in this port), not
; dangling/orphaned GSC content -- no evidence he's a broken reference needing removal.
CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

; Gen 1 rival battle 3 (walkthrough "Rival battle 3"), triggered heading north toward Route 24.
; Ambushes the player at a coord trigger in Gen1 (scripts/CeruleanCity.asm); simplified to a
; talk-triggered battle (precedent: Events 1-4 used talk-triggered handoffs instead of Gen1
; auto-ambush). Roster is Rival1Data's Cerulean tier (Pidgeotto/Abra/Rattata + type-counter
; starter, Lv15-18) via the RIVAL1_CERULEAN_* trainer parties.
CeruleanCityRivalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CERULEAN_RIVAL
	iftrue .AlreadyBattled
	writetext CeruleanCityRivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_CHOSE_CHARMANDER
	iftrue .Charmander
	checkevent EVENT_CHOSE_SQUIRTLE
	iftrue .Squirtle
	loadtrainer RIVAL1, RIVAL1_CERULEAN_CHARMANDER
	sjump .Fight
.Squirtle:
	loadtrainer RIVAL1, RIVAL1_CERULEAN_BULBASAUR
	sjump .Fight
.Charmander:
	loadtrainer RIVAL1, RIVAL1_CERULEAN_SQUIRTLE
.Fight:
	winlosstext CeruleanCityRivalDefeatedText, CeruleanCityRivalVictoryText
	setlasttalked CERULEANCITY_RIVAL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CERULEAN_RIVAL
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CeruleanCityRivalAfterText
	waitbutton
	closetext
	special HealParty
	playmapmusic
	disappear CERULEANCITY_RIVAL
	end

.AlreadyBattled:
	writetext CeruleanCityRivalAfterText
	waitbutton
	closetext
	end

; Gen 1 Cerulean City TM28(Dig) Rocket thief (pokeredDisassembly/scripts/CeruleanCity.asm
; CeruleanCityRocketDefeatedScript/CeruleanCityRocketText): steals TM28 from the burgled house,
; gives it back once beaten. Simplified to a single post-battle hand-back (precedent
; TrainerNuggetLeaderRoute24 in maps/Route24.asm) rather than Gen1's two-step "agrees to return it,
; give it to him again next visit" sequence.
TrainerCeruleanCityRocket:
	trainer GRUNTM, GRUNTM_66, EVENT_BEAT_CERULEAN_ROCKET_THIEF, CeruleanCityRocketSeenText, CeruleanCityRocketBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_CERULEAN_TM28
	iftrue .AlreadyReturned
	writetext CeruleanCityRocketReturnText
	giveitem TM_DIG
	iffalse .NoRoom
	writetext CeruleanCityRocketReceivedTM28Text
	setevent EVENT_GOT_CERULEAN_TM28
	writetext CeruleanCityRocketIBetterGetMovingText
	waitbutton
	closetext
	disappear CERULEANCITY_ROCKET
	end

.AlreadyReturned:
	writetext CeruleanCityRocketAfterText
	waitbutton
	closetext
	end

.NoRoom:
	writetext CeruleanCityRocketTM28NoRoomText
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanCityTrainerTips:
	jumptext CeruleanCityTrainerTipsText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd PokecenterSignScript

CeruleanCityMartSign:
	jumpstd MartSignScript

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "You're a trainer"
	line "too? Collecting,"
	cont "fighting, it's a"
	cont "tough life."
	done

CeruleanCityCooltrainerMText2:
	text "You're collecting"
	line "every single kind"
	cont "of #MON?"

	para "That must be quite"
	line "a challenge, but"
	cont "it sounds fun too."
	done

CeruleanCitySuperNerd1Text:
	text "That bush in"
	line "front of the shop"
	cont "is in the way."

	para "There might be a"
	line "way around."
	done

CeruleanCitySuperNerd2Text:
	text "You're making an"
	line "encyclopedia on"
	cont "#MON? That"
	cont "sounds amusing."
	done

CeruleanCityGuardText:
	text "The people here"
	line "were robbed."

	para "It's obvious that"
	line "TEAM ROCKET is"
	cont "behind this most"
	cont "heinous crime!"

	para "Even our POLICE"
	line "force has trouble"
	cont "with the ROCKETs!"
	done

CeruleanCitySlowbroTookASnoozeText:
	text "SLOWBRO took a"
	line "snooze..."
	done

CeruleanCitySlowbroIsLoafingAroundText:
	text "SLOWBRO is"
	line "loafing around..."
	done

CeruleanCitySlowbroTurnedAwayText:
	text "SLOWBRO turned"
	line "away..."
	done

CeruleanCitySlowbroIgnoredOrdersText:
	text "SLOWBRO"
	line "ignored orders..."
	done

CeruleanCityCooltrainerF1SlowbroUseSonicboomText:
	text "OK! SLOWBRO!"
	line "Use SONICBOOM!"
	cont "Come on, SLOWBRO"
	cont "pay attention!"
	done

CeruleanCityCooltrainerF1SlowbroPunchText:
	text "SLOWBRO punch!"
	line "No! You blew it"
	cont "again!"
	done

CeruleanCityCooltrainerF1SlowbroWithdrawText:
	text "SLOWBRO, WITHDRAW!"
	line "No! That's wrong!"

	para "It's so hard to"
	line "control #MON!"

	para "Your #MON's"
	line "obedience depends"
	cont "on your abilities"
	cont "as a trainer!"
	done

CeruleanCityCooltrainerF2Text:
	text "I want a bright"
	line "red BICYCLE!"

	para "I'll keep it at"
	line "home, so it won't"
	cont "get dirty!"
	done

CeruleanCitySuperNerd3Text:
	text "This is CERULEAN"
	line "CAVE! Horribly"
	cont "strong #MON"
	cont "live in there!"

	para "The #MON LEAGUE"
	line "champion is the"
	cont "only person who"
	cont "is allowed in!"
	done

CeruleanCityFisherText:
	text "I'm a huge fan of"
	line "CERULEAN GYM's"
	cont "MISTY."
	done

CeruleanCityFisherRocketTipText:
	text "I saw this shady"
	line "guy go off toward"
	cont "CERULEAN's CAPE."
	done

CeruleanCityYoungsterText1:
	text "There used to be a"
	line "cave here that had"

	para "horribly powerful"
	line "#MON in it."
	done

CeruleanCityYoungsterText2:
	text "Ayuh?"

	para "My ITEMFINDER is"
	line "responding…"
	done

CeruleanCitySignText:
	text "CERULEAN CITY"

	para "A Mysterious Blue"
	line "Aura"
	cont "Surrounds It"
	done

CeruleanGymSignText:
	text "CERULEAN CITY"
	line "#MON GYM"
	cont "LEADER: MISTY"

	para "The Tomboyish"
	line "Mermaid!"
	done

CeruleanBikeShopSignText:
	text "There's a notice"
	line "here…"

	para "The BIKE SHOP has"
	line "moved to GOLDENROD"
	cont "CITY in JOHTO…"
	done

CeruleanCityTrainerTipsText:
	text "TRAINER TIPS"

	para "Pressing B Button"
	line "during evolution"
	cont "cancels the whole"
	cont "process."
	done

CeruleanLockedDoorText:
	text "It's locked…"
	done

CeruleanCityRivalBeforeText:
	text "<RIVAL>: Yo!"
	line "<PLAYER>!"

	para "You're still"
	line "struggling along"
	cont "back here?"

	para "I'm doing great!"
	line "I caught a bunch"
	cont "of strong and"
	cont "smart #MON!"

	para "Here, let me see"
	line "what you caught,"
	cont "<PLAYER>!"
	done

CeruleanCityRivalDefeatedText:
	text "Hey!"
	line "Take it easy!"
	cont "You won already!"
	done

CeruleanCityRivalVictoryText:
	text "Heh!"
	line "You're no match"
	cont "for my genius!"
	done

CeruleanCityRivalAfterText:
	text "<RIVAL>: Hey,"
	line "guess what?"

	para "I went to BILL's"
	line "and got him to"
	cont "show me his rare"
	cont "#MON!"

	para "That added a lot"
	line "of pages to my"
	cont "#DEX!"

	para "After all, BILL's"
	line "world famous as a"
	cont "#MANIAC!"

	para "He invented the"
	line "#MON Storage"
	cont "System on PC!"

	para "Since you're using"
	line "his system, go"
	cont "thank him!"

	para "Well, I better"
	line "get rolling!"
	cont "Smell ya later!"
	done

CeruleanCityRocketSeenText:
	text "Hey! Stay out!"
	line "It's not your"
	cont "yard! Huh? Me?"

	para "I'm an innocent"
	line "bystander! Don't"
	cont "you believe me?"
	done

CeruleanCityRocketBeatenText:
	text "Stop!"
	line "I give up! I'll"
	cont "leave quietly!"
	done

CeruleanCityRocketReturnText:
	text "OK! I'll return"
	line "the TM I stole!"
	done

CeruleanCityRocketReceivedTM28Text:
	text "<PLAYER> recovered"
	line "TM28!"
	done

CeruleanCityRocketIBetterGetMovingText:
	para "I better get"
	line "moving! Bye!"
	done

CeruleanCityRocketTM28NoRoomText:
	text "Make room for"
	line "this!"

	para "I can't run until"
	line "I give it to you!"
	done

CeruleanCityRocketAfterText:
	text "I gave back that"
	line "TM28, right?"
	done

CeruleanCityHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CERULEAN_CITY_HIDDEN_RARE_CANDY

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  9, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 27, 11, CERULEAN_POLICE_STATION, 1
	warp_event 13, 15, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 17, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 19, CERULEAN_GYM, 1
	warp_event 25, 25, CERULEAN_MART, 2
	warp_event  4, 11, CERULEAN_CAVE_1F, 1
	warp_event  9, 11, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 27,  9, CERULEAN_POLICE_STATION, 1

	def_coord_events

	def_bg_events
	bg_event 23, 19, BGEVENT_READ, CeruleanCitySign
	bg_event 17, 29, BGEVENT_READ, CeruleanCityTrainerTips
	bg_event 26, 25, BGEVENT_READ, CeruleanCityMartSign
	bg_event 20, 17, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 11, 25, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 27, 21, BGEVENT_READ, CeruleanGymSign
	bg_event 13, 25, BGEVENT_READ, CeruleanLockedDoor
	bg_event  2, 12, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene
	bg_event 15,  8, BGEVENT_ITEM, CeruleanCityHiddenRareCandy

	def_object_events
	object_event 31, 20, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 15, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerd1Script, -1
	object_event  9, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerd2Script, -1
	object_event 28, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityGuard1Script, -1
	object_event 29, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerF1Script, -1
	object_event 28, 26, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event  9, 27, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerF2Script, -1
	object_event  4, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerd3Script, -1
	object_event 27, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityGuard2Script, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
	object_event 20,  2, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityRivalScript, EVENT_BEAT_CERULEAN_RIVAL
	object_event 30,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCeruleanCityRocket, -1
