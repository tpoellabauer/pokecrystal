	object_const_def
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_POKEDEX
	const MRFUJISHOUSE_MR_FUJI

; Gen 1 Mr. Fuji already home + gives the Poke Flute outright; the Team Rocket
; kidnap-and-rescue at Pokemon Tower isn't ported yet (see PORT_BACKLOG), so this
; skips straight to the post-rescue state instead of gating on that scene.

MrFujisHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFujisHouseSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_RESCUED_MR_FUJI
	iftrue .MrFujiHadBeenPraying
	writetext MrFujisHouseSuperNerdMrFujiIsntHereText
	waitbutton
	closetext
	end

.MrFujiHadBeenPraying:
	writetext MrFujisHouseSuperNerdMrFujiHadBeenPrayingText
	waitbutton
	closetext
	end

MrFujisHouseLassScript:
	faceplayer
	opentext
	checkevent EVENT_RESCUED_MR_FUJI
	iftrue .PokemonAreNiceToHug
	writetext MrFujisHouseLassThisIsMrFujisHouseText
	waitbutton
	closetext
	end

.PokemonAreNiceToHug:
	writetext MrFujisHouseLassPokemonAreNiceToHugText
	waitbutton
	closetext
	end

MrFujisHouseMrFujiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POKE_FLUTE
	iftrue .HasFluteHelpedYou
	writetext MrFujisHouseMrFujiGiveFluteText
	giveitem POKE_FLUTE
	iffalse .BagFull
	getitemname STRING_BUFFER_3, POKE_FLUTE
	writetext MrFujisHouseMrFujiReceivedPokeFluteText
	waitsfx
	specialsound
	waitbutton
	itemnotify
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
	writetext MrFujisHouseMrFujiPokeFluteNoRoomText
	waitbutton
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

MrFujisHousePokedexScript:
	jumptext MrFujisHousePokedexText

MrFujisHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrFujisHouseSuperNerdMrFujiIsntHereText:
	text "That's odd, MR.FUJI"
	line "isn't here."
	cont "Where'd he go?"
	done

MrFujisHouseSuperNerdMrFujiHadBeenPrayingText:
	text "MR.FUJI had been"
	line "praying alone for"
	cont "CUBONE's mother."
	done

MrFujisHouseLassThisIsMrFujisHouseText:
	text "This is really"
	line "MR.FUJI's house."

	para "He's really kind!"

	para "He looks after"
	line "abandoned and"
	cont "orphaned #MON!"
	done

MrFujisHouseLassPokemonAreNiceToHugText:
	text "It's so warm!"
	line "#MON are so"
	cont "nice to hug!"
	done

MrFujisPsyduckText:
	text "PSYDUCK: Gwappa!"
	done

MrFujisNidorinoText:
	text "NIDORINO: Gaoo!"
	done

MrFujisHouseMrFujiGiveFluteText:
	text "MR.FUJI: <PLAYER>."

	para "Your #DEX quest"
	line "may fail without"
	cont "love for your"
	cont "#MON."

	para "I think this may"
	line "help your quest."
	done

MrFujisHouseMrFujiReceivedPokeFluteText:
	text "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer3
	text "!"
	done

MrFujisHouseMrFujiPokeFluteNoRoomText:
	text "You must make"
	line "room for this!"
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

MrFujisHousePokedexText:
	text "#MON Monthly"
	line "Grand Prize"
	cont "Drawing!"

	para "The application"
	line "form is..."

	para "Gone! It's been"
	line "clipped out!"
	done

MrFujisHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 2
	warp_event  3,  7, LAVENDER_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  6,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  6,  4, SPRITE_RHYDON, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  1,  3, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MrFujisHousePokedexScript, -1
	object_event  3,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisHouseMrFujiScript, -1
