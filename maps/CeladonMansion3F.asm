	object_const_def
	const CELADONMANSION3F_PROGRAMMER
	const CELADONMANSION3F_GRAPHIC_ARTIST
	const CELADONMANSION3F_WRITER
	const CELADONMANSION3F_GAME_DESIGNER

CeladonMansion3F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansion3FProgrammerScript:
	jumptextfaceplayer CeladonMansion3FProgrammerText

CeladonMansion3FGraphicArtistScript:
	jumptextfaceplayer CeladonMansion3FGraphicArtistText

CeladonMansion3FWriterScript:
	jumptextfaceplayer CeladonMansion3FWriterText

; Gen 1 game designer checks caught #dex count (150, all Kanto species minus
; Mew) and shows a special completed-dex line + the Diploma on success.
; Ported using the readvar VAR_DEXCAUGHT + ifgreater idiom (see Route2Gate.asm
; and RuinsOfAlph Unown gates).
CeladonMansion3FGameDesignerScript:
	faceplayer
	opentext
	readvar VAR_DEXCAUGHT
	ifgreater 149, .DexComplete
	writetext CeladonMansion3FGameDesignerText
	waitbutton
	closetext
	end

.DexComplete:
	writetext CeladonMansion3FGameDesignerCompletedDexText
	promptbutton
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	special Diploma
	closetext
	end

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FGameProgramPC:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FPlayingGamePC:
	jumptext CeladonMansion3FPlayingGameText

CeladonMansion3FGameScriptPC:
	jumptext CeladonMansion3FGameScriptText

CeladonMansion3FProgrammerText:
	text "Me? I'm the"
	line "programmer!"
	done

CeladonMansion3FGraphicArtistText:
	text "I'm the graphic"
	line "artist!"
	cont "I drew you!"
	done

CeladonMansion3FWriterText:
	text "I wrote the story!"
	line "Isn't ERIKA cute?"

	para "I like MISTY a"
	line "lot too!"

	para "Oh, and SABRINA,"
	line "I like her!"
	done

CeladonMansion3FGameDesignerText:
	text "Is that right?"

	para "I'm the game"
	line "designer!"

	para "Filling up your"
	line "#DEX is tough,"
	cont "but don't quit!"

	para "When you finish,"
	line "come tell me!"
	done

CeladonMansion3FGameDesignerCompletedDexText:
	text "What? You caught"
	line "'em all?"

	para "Amazing! Take"
	line "this DIPLOMA as"
	cont "proof!"
	done

CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "Development Room"
	done

CeladonMansion3FGameProgramText:
	text "It's the game"
	line "program! Messing"
	cont "with it could bug"
	cont "out the game!"
	done

CeladonMansion3FPlayingGameText:
	text "Someone's playing"
	line "a game instead of"
	cont "working!"
	done

CeladonMansion3FGameScriptText:
	text "It's the script!"
	line "Better not look"
	cont "at the ending!"
	done

CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event  1,  3, BGEVENT_READ, CeladonMansion3FGameProgramPC
	bg_event  4,  3, BGEVENT_READ, CeladonMansion3FPlayingGamePC
	bg_event  1,  6, BGEVENT_READ, CeladonMansion3FGameScriptPC
	bg_event  4,  9, BGEVENT_READ, CeladonMansion3FDevRoomSign

	def_object_events
	object_event  0,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion3FProgrammerScript, -1
	object_event  3,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion3FGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion3FWriterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion3FGameDesignerScript, -1
