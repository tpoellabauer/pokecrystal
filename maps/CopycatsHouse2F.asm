	object_const_def
	const COPYCATSHOUSE2F_COPYCAT
	const COPYCATSHOUSE2F_DODUO
	const COPYCATSHOUSE2F_MONSTER
	const COPYCATSHOUSE2F_BIRD
	const COPYCATSHOUSE2F_FAIRY

CopycatsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1 gate: Copycat trades a POKE_DOLL for TM31 MIMIC (one-time). MIMIC was plumbed
; as a real Crystal TM in the old ITEM_DC slot (see item_constants.asm / items.asm), so
; this is now the faithful Gen 1 trade rather than flavor text.
CopycatScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_MIMIC
	iftrue .GotTM
	checkitem POKE_DOLL
	iftrue .HasDoll
	writetext CopycatText
	waitbutton
	closetext
	end

.HasDoll:
	writetext CopycatDollText
	promptbutton
	verbosegiveitem TM_MIMIC
	iffalse .NoRoom
	takeitem POKE_DOLL
	setevent EVENT_GOT_TM_MIMIC
	writetext CopycatThanksText
	waitbutton
	closetext
	end

.NoRoom:
	closetext
	end

.GotTM:
	writetext CopycatMimicText
	waitbutton
	closetext
	end

CopycatText:
	text "<PLAYER>: Hi! Do"
	line "you like #MON?"

	para "<PLAYER>: Uh no, I"
	line "just asked you."

	para "<PLAYER>: Huh?"
	line "You're strange!"

	para "COPYCAT: Hmm?"
	line "Quit mimicking?"

	para "But, that's my"
	line "favorite hobby!"
	done

CopycatDollText:
	text "COPYCAT: Oh! That"
	line "DOLL! I've always"
	cont "wanted one!"

	para "I know! Let's"
	line "trade for my TM!"
	done

CopycatThanksText:
	text "COPYCAT: Thanks!"
	line "This DOLL is so"
	cont "me!"
	done

CopycatMimicText:
	text "COPYCAT: MIMIC"
	line "copies the foe's"
	cont "move. Just like"
	cont "me! Hee hee!"
	done

CopycatsHouse2FDoduoScript:
	jumptextfaceplayer CopycatsHouse2FDoduoText

CopycatsHouse2FDoduoText:
	text "DODUO: Giiih!"

	para "MIRROR MIRROR ON"
	line "THE WALL, WHO IS"
	cont "THE FAIREST ONE"
	cont "OF ALL?"
	done

CopycatsHouse2FMonsterDollScript:
	jumptextfaceplayer CopycatsHouse2FRareDollText

CopycatsHouse2FBirdDollScript:
	jumptextfaceplayer CopycatsHouse2FRareDollText

CopycatsHouse2FFairyDollScript:
	jumptextfaceplayer CopycatsHouse2FRareDollText

CopycatsHouse2FRareDollText:
	text "This is a rare"
	line "#MON! Huh?"
	cont "It's only a doll!"
	done

CopycatsHouse2FSNES:
	jumptext CopycatsHouse2FSNESText

CopycatsHouse2FSNESText:
	text "A game with MARIO"
	line "wearing a bucket"
	cont "on his head!"
	done

CopycatsHouse2FPC:
	jumptext CopycatsHouse2FPCText

CopycatsHouse2FPCText:
	text "..."

	para "My Secrets!"

	para "Skill: Mimicry!"
	line "Hobby: Collecting"
	cont "dolls!"
	cont "Favorite #MON:"
	cont "CLEFAIRY!"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  1, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  5, BGEVENT_READ, CopycatsHouse2FSNES
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FPC

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatScript, -1
	object_event  4,  6, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoduoScript, -1
	object_event  5,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FMonsterDollScript, -1
	object_event  2,  0, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FBirdDollScript, -1
	object_event  1,  6, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FFairyDollScript, -1
