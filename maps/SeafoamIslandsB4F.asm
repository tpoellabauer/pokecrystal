; Seafoam Islands B4F
; Gen 1 source: pokeredDisassembly/scripts/SeafoamIslandsB4F.asm
; Gen 1 gates Articuno behind a boulder puzzle that stops a "strong current" via bespoke forced-
; joypad-simulation asm (RLE movement lists driving the player across the current) -- no Gen 2
; macro equivalent exists, and the 2 boulders here only exist to feed that gate (see
; SeafoamIslands1F.asm's note on the skipped optional relay puzzle across the other floors, same
; reasoning applies here for consistency). Simplified to a direct encounter, same pattern as
; PowerPlant's Zapdos: Articuno is a normal wild-encounter object, no gate.

	object_const_def
	const SEAFOAMISLANDSB4F_ARTICUNO

SeafoamIslandsB4F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB4FBouldersSign:
	jumptext SeafoamIslandsB4FBouldersSignText

SeafoamIslandsB4FDangerSign:
	jumptext SeafoamIslandsB4FDangerSignText

SeafoamIslandsB4FArticuno:
	opentext
	writetext SeafoamIslandsB4FArticunoBattleText
	closetext
	cry ARTICUNO
	loadwildmon ARTICUNO, 50
	startbattle
	ifequal LOSE, .NotBeaten
	disappear SEAFOAMISLANDSB4F_ARTICUNO
	setevent EVENT_BEAT_ARTICUNO
.NotBeaten:
	reloadmapafterbattle
	end

SeafoamIslandsB4FBouldersSignText:
	text "Boulders might"
	line "change the flow"
	cont "of water!"
	done

SeafoamIslandsB4FDangerSignText:
	text "DANGER"
	line "Fast current!"
	done

SeafoamIslandsB4FArticunoBattleText:
	text "Gyaoo!"
	done

SeafoamIslandsB4FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_SEAFOAM_ISLANDS_B4F_HIDDEN_ULTRA_BALL

SeafoamIslandsB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20, 17, SEAFOAM_ISLANDS_B3F, 6
	warp_event 21, 17, SEAFOAM_ISLANDS_B3F, 7
	warp_event 11,  7, SEAFOAM_ISLANDS_B3F, 2
	warp_event 25,  4, SEAFOAM_ISLANDS_B3F, 3

	def_coord_events

	def_bg_events
	bg_event  9, 15, BGEVENT_READ, SeafoamIslandsB4FBouldersSign
	bg_event 23,  1, BGEVENT_READ, SeafoamIslandsB4FDangerSign
	bg_event 25, 17, BGEVENT_ITEM, SeafoamIslandsB4FHiddenUltraBall

	def_object_events
	object_event  6,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FArticuno, EVENT_BEAT_ARTICUNO
