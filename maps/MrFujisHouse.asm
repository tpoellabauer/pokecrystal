	object_const_def
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY
	const MRFUJISHOUSE_MR_FUJI

; Gen 1 Mr. Fuji already home + gives the Poke Flute outright; the Team Rocket
; kidnap-and-rescue at Pokemon Tower isn't ported yet (see PORT_BACKLOG), so this
; skips straight to the post-rescue state instead of gating on that scene.

MrFujisHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFujisHouseSuperNerdScript:
	jumptextfaceplayer MrFujisHouseSuperNerdText

MrFujisHouseLassScript:
	jumptextfaceplayer MrFujisHouseLassText

MrFujisHouseMrFujiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POKE_FLUTE
	iftrue .HasFluteHelpedYou
	writetext MrFujisHouseMrFujiGiveFluteText
	verbosegiveitem POKE_FLUTE
	iffalse .BagFull
	setevent EVENT_GOT_POKE_FLUTE
	writetext MrFujisHouseMrFujiFluteExplanationText
	waitbutton
	closetext
	end

.HasFluteHelpedYou:
	writetext MrFujisHouseMrFujiHasFluteHelpedYouText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end

MrFujisHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrFujisHouseSuperNerdText:
	text "MR.FUJI had been"
	line "praying alone for"
	cont "CUBONE's mother."
	done

MrFujisHouseLassText:
	text "Some cold-hearted"
	line "people stop caring"
	cont "for their #MON."

	para "Grandpa takes in"
	line "the poor homeless"

	para "#MON and takes"
	line "care of them."
	done

MrFujisPsyduckText:
	text "PSYDUCK: Gu-guwa?"
	done

MrFujisNidorinoText:
	text "NIDORINO: Gyun!"
	done

MrFujisPidgeyText:
	text "PIDGEY: Pijji!"
	done

MrFujisHouseMrFujiGiveFluteText:
	text "MR.FUJI: Your"
	line "#DEX quest may"
	cont "fail without love"
	cont "for your #MON."

	para "I think this may"
	line "help your quest."
	done

MrFujisHouseMrFujiFluteExplanationText:
	text "Upon hearing #"
	line "FLUTE, sleeping"
	cont "#MON will"
	cont "spring awake."

	para "It works on all"
	line "sleeping #MON."
	done

MrFujisHouseMrFujiHasFluteHelpedYouText:
	text "MR.FUJI: Has my"
	line "FLUTE helped you?"
	done

MrFujisHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 2
	warp_event  3,  7, LAVENDER_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrFujisHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrFujisHouseBookshelf

	def_object_events
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  7,  4, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  5,  5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  1,  3, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPidgey, -1
	object_event  4,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisHouseMrFujiScript, -1
