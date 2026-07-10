	object_const_def
	const SAFARIZONEWARDENSHOME_LASS
	const SAFARIZONEWARDENSHOME_WARDEN

SafariZoneWardensHome_MapScripts:
	def_scene_scripts

	def_callbacks

; Gen 1: the Warden himself (SPRITE_WARDEN -> SPRITE_GRAMPS, no Gen 2 sheet, precedent:
; BillsHouse's grandpa) waits here for his lost GOLD TEETH (SafariZoneWest.asm's item ball),
; trading them for HM04 Strength (pokeredDisassembly/scripts/WardensHouse.asm's real reward --
; not HM01 Cut). Simplified from Gen 1's 3-way randomized gibberish (he can't talk clearly
; without his teeth) to one flavor line, matching the project's usual "simplify where faithful"
; convention. Reuses EVENT_GOT_HM04_STRENGTH (OlivineCafe's own Strength gift flag) so a player
; who's already gotten Strength there isn't handed a second copy; verbosegiveitem-before-takeitem
; (precedent: CopycatsHouse2F's doll->TM31 trade) keeps the Gold Teeth in the bag if it's full.
SafariZoneWardenScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .AlreadyThanked
	checkitem GOLD_TEETH
	iftrue .HasGoldTeeth
	writetext SafariZoneWardenGibberishText
	waitbutton
	closetext
	end

.HasGoldTeeth:
	writetext SafariZoneWardenGaveGoldTeethText
	promptbutton
	verbosegiveitem HM_STRENGTH
	iffalse .NoRoom
	takeitem GOLD_TEETH
	setevent EVENT_GAVE_GOLD_TEETH
	setevent EVENT_GOT_HM04_STRENGTH
	writetext SafariZoneWardenThanksText
	waitbutton
	closetext
	end

.NoRoom:
	closetext
	end

.AlreadyThanked:
	writetext SafariZoneWardenExplanationText
	waitbutton
	closetext
	end

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd PictureBookshelfScript

SafariZoneWardenGibberishText:
	text "WARDEN: Hff hoo"
	line "hefifoo hee?"

	para "(He's lost his"
	line "teeth and can't"
	cont "talk clearly.)"
	done

SafariZoneWardenGaveGoldTeethText:
	text "WARDEN: Hoh! Hoo"
	line "fown mah geef!"

	para "(You show him the"
	line "GOLD TEETH.)"
	done

SafariZoneWardenThanksText:
	text "WARDEN: Thanks,"
	line "kid! Now I can"
	cont "talk right again!"

	para "Let me give you"
	line "something for"
	cont "your trouble."
	done

SafariZoneWardenExplanationText:
	text "WARDEN: STRENGTH"
	line "lets #MON move"

	para "boulders when"
	line "you're outside of"
	cont "battle."
	done

; Rewritten 2026-07-10 alongside the Warden's Gold Teeth quest (see SafariZoneWardenScript
; below) -- the old "he's on vacation overseas" flavor contradicted the Warden sitting right
; there in the same house, so this now explains *why* he's sulking instead.
WardensGranddaughterText1:
	text "My grandpa is the"
	line "SAFARI ZONE WAR-"
	cont "DEN."

	para "He lost his gold"
	line "teeth and refuses"

	para "to run SAFARI ZONE"
	line "without them."

	para "He's right over"
	line "there, sulking."
	done

WardensGranddaughterText2:
	text "Many people were"
	line "disappointed that"

	para "SAFARI ZONE closed"
	line "down, but Grandpa"
	cont "is so stubborn…"
	done

WardenPhotoText:
	text "It's a photo of a"
	line "grinning old man"

	para "who's surrounded"
	line "by #MON."
	done

SafariZonePhotoText:
	text "It's a photo of a"
	line "huge grassy plain"

	para "with rare #MON"
	line "frolicking in it."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWardenScript, -1
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
