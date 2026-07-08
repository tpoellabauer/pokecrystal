	object_const_def
	const ROUTE24_ROCKET
	const ROUTE24_NUGGET_LEADER
	const ROUTE24_COOLTRAINER_M1
	const ROUTE24_COOLTRAINER_M2
	const ROUTE24_LASS1
	const ROUTE24_YOUNGSTER1
	const ROUTE24_LASS2
	const ROUTE24_YOUNGSTER2

; Gen 1 "Nugget Bridge" roster (`pokeredDisassembly/scripts/Route24.asm`), added alongside the
; existing Route24Rocket machine-part quest NPC rather than replacing it (that NPC is wired into a
; real cross-map quest with PowerPlant/CeruleanGym/Route25 -- see EVENT_ROUTE_24_ROCKET). The Gen 1
; leader's forced-walk-after-reward trick isn't replicated; the Nugget is a normal post-battle
; verbosegiveitem instead.
Route24_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerNuggetLeaderRoute24:
	trainer GRUNTM, GRUNTM_65, EVENT_BEAT_ROUTE_24_ROCKET_LEADER, NuggetLeaderRoute24SeenText, NuggetLeaderRoute24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_ROUTE_24_NUGGET
	iftrue .AlreadyGot
	writetext NuggetLeaderRoute24PrizeText
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_ROUTE_24_NUGGET
	writetext NuggetLeaderRoute24JoinRocketText
	waitbutton
	closetext
	end

.AlreadyGot:
	writetext NuggetLeaderRoute24TopLeaderText
	waitbutton
	closetext
	end

.NoRoom:
	closetext
	end

TrainerCooltrainerm2Route24:
	trainer JR_TRAINER_M, JR_TRAINER_M_6, EVENT_BEAT_ROUTE_24_TRAINER_0, Cooltrainerm2Route24SeenText, Cooltrainerm2Route24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerm2Route24AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerm3Route24:
	trainer JR_TRAINER_M, JR_TRAINER_M_7, EVENT_BEAT_ROUTE_24_TRAINER_1, Cooltrainerm3Route24SeenText, Cooltrainerm3Route24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Cooltrainerm3Route24AfterBattleText
	waitbutton
	closetext
	end

TrainerLassFelicia:
	trainer LASS, FELICIA, EVENT_BEAT_ROUTE_24_TRAINER_2, LassFeliciaSeenText, LassFeliciaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassFeliciaAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterRamon:
	trainer YOUNGSTER, RAMON, EVENT_BEAT_ROUTE_24_TRAINER_3, YoungsterRamonSeenText, YoungsterRamonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterRamonAfterBattleText
	waitbutton
	closetext
	end

TrainerLassRosie:
	trainer LASS, ROSIE, EVENT_BEAT_ROUTE_24_TRAINER_4, LassRosieSeenText, LassRosieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassRosieAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterPhilip:
	trainer BUG_CATCHER, PHILIP, EVENT_BEAT_ROUTE_24_TRAINER_5, YoungsterPhilipSeenText, YoungsterPhilipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterPhilipAfterBattleText
	waitbutton
	closetext
	end

Route24ThunderWave:
	itemball TM_THUNDER_WAVE

NuggetLeaderRoute24SeenText:
	text "I saw your feat"
	line "from the grass!"
	done

NuggetLeaderRoute24BeatenText:
	text "Arrgh! You are"
	line "good!"
	done

NuggetLeaderRoute24PrizeText:
	text "Congratulations!"
	line "You beat our 5"
	cont "contest trainers!"

	para "You just earned a"
	line "fabulous prize!"
	done

NuggetLeaderRoute24JoinRocketText:
	text "By the way, would"
	line "you like to join"
	cont "TEAM ROCKET?"

	para "We're a group"
	line "dedicated to evil"
	cont "using #MON!"

	para "...Just kidding!"
	line "Get going!"
	done

NuggetLeaderRoute24TopLeaderText:
	text "With your ability,"
	line "you could become"
	cont "a top leader in"
	cont "TEAM ROCKET!"
	done

Cooltrainerm2Route24SeenText:
	text "Huh? You beat our"
	line "leader?"
	done

Cooltrainerm2Route24BeatenText:
	text "No way!"
	done

Cooltrainerm2Route24AfterBattleText:
	text "You're pretty"
	line "strong yourself!"
	done

Cooltrainerm3Route24SeenText:
	text "This bridge is our"
	line "contest course!"
	done

Cooltrainerm3Route24BeatenText:
	text "Aww, beaten!"
	done

Cooltrainerm3Route24AfterBattleText:
	text "Nobody's made it"
	line "across yet!"
	done

LassFeliciaSeenText:
	text "This bridge has"
	line "the best view of"
	cont "the river!"
	done

LassFeliciaBeatenText:
	text "Oh no!"
	done

LassFeliciaAfterBattleText:
	text "Careful, the"
	line "current is fast"
	cont "down there!"
	done

YoungsterRamonSeenText:
	text "Everyone's testing"
	line "their #MON on"
	cont "this bridge!"
	done

YoungsterRamonBeatenText:
	text "Aw, man!"
	done

YoungsterRamonAfterBattleText:
	text "Keep training, you"
	line "might win the"
	cont "prize next time!"
	done

LassRosieSeenText:
	text "I heard there's a"
	line "prize for beating"
	cont "everyone here!"
	done

LassRosieBeatenText:
	text "Darn it!"
	done

LassRosieAfterBattleText:
	text "Go get that prize"
	line "from our leader!"
	done

YoungsterPhilipSeenText:
	text "I brought my bug"
	line "#MON to this"
	cont "bridge!"
	done

YoungsterPhilipBeatenText:
	text "My bugs lost..."
	done

YoungsterPhilipAfterBattleText:
	text "Bug #MON are"
	line "tougher than they"
	cont "look!"
	done

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInFromBlack
	playmapmusic
	end

Route24RocketSeenText:
	text "Hey, kid! Me am a"
	line "TEAM ROCKET member"
	cont "kind of guy!"

	para "Come from another"
	line "country, a trainer"
	cont "number one, me!"

	para "Think I did, if"
	line "stop the energy,"

	para "be big panic for"
	line "here people!"

	para "Secret it is my"
	line "mission, so tell"
	cont "you I not!"

	para "But! If win you do"
	line "versus me, a man I"

	para "be and mine secret"
	line "to you I tell."

	para "Hey, kid! Battle"
	line "begin we do!"
	done

Route24RocketBeatenText:
	text "Ayieeeh! No, no,"
	line "no, believe it I"
	cont "can't!"

	para "Strong very much"
	line "be you! Match I am"
	cont "not to you!"
	done

Route24RocketAfterBattleText:
	text "OK. Tell you mine"
	line "secret will I."

	para "MACHINE PART steal"
	line "by me, hide it I"

	para "did in GYM of the"
	line "CERULEAN."

	para "Inside water put"
	line "it I did. Look for"

	para "in water center of"
	line "GYM at."

	para "But you forget me"
	line "not!"

	para "Beat you for sure"
	line "will TEAM ROCKET."

	para "Come from JOHTO"
	line "will they, mine"

	para "friends, yes. Will"
	line "revenge they are."
	done

Route24RocketDisappearsText:
	text "…"

	para "You say what? TEAM"
	line "ROCKET bye-bye a"

	para "go-go? Broken it"
	line "is says you?"

	para "Oh, no! Should I"
	line "do what now on"
	cont "from, me?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 6, TrainerNuggetLeaderRoute24, -1
	object_event  2,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerm2Route24, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerm3Route24, -1
	object_event  3,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 7, TrainerLassFelicia, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterRamon, -1
	object_event  3, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 8, TrainerLassRosie, -1
	object_event  7, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 9, TrainerYoungsterPhilip, -1
	object_event  5, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24ThunderWave, EVENT_ROUTE_24_THUNDER_WAVE
