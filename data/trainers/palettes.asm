TrainerPalettes:
; entries correspond to trainer classes

; Each .gbcpal is generated from the corresponding .png, and
; only the middle two colors are included, not black or white.

	table_width COLOR_SIZE * 2

PlayerPalette: ; Chris uses the same colors as Cal
INCBIN "gfx/trainers/cal.final.gbcpal", middle_colors
KrisPalette: ; Kris shares Falkner's palette
INCBIN "gfx/trainers/falkner.final.gbcpal", middle_colors
INCBIN "gfx/trainers/whitney.final.gbcpal", middle_colors
INCBIN "gfx/trainers/bugsy.final.gbcpal", middle_colors
INCBIN "gfx/trainers/morty.final.gbcpal", middle_colors
INCBIN "gfx/trainers/pryce.final.gbcpal", middle_colors
INCBIN "gfx/trainers/jasmine.final.gbcpal", middle_colors
INCBIN "gfx/trainers/chuck.final.gbcpal", middle_colors
INCBIN "gfx/trainers/clair.final.gbcpal", middle_colors
INCBIN "gfx/trainers/rival1.final.gbcpal", middle_colors
INCBIN "gfx/trainers/oak.final.gbcpal", middle_colors
INCBIN "gfx/trainers/will.final.gbcpal", middle_colors
INCBIN "gfx/trainers/cal.final.gbcpal", middle_colors
INCBIN "gfx/trainers/bruno.final.gbcpal", middle_colors
INCBIN "gfx/trainers/karen.final.gbcpal", middle_colors
INCBIN "gfx/trainers/koga.final.gbcpal", middle_colors
INCBIN "gfx/trainers/champion.final.gbcpal", middle_colors
INCBIN "gfx/trainers/brock.final.gbcpal", middle_colors
INCBIN "gfx/trainers/misty.final.gbcpal", middle_colors
INCBIN "gfx/trainers/lt_surge.final.gbcpal", middle_colors
INCBIN "gfx/trainers/scientist.final.gbcpal", middle_colors
INCBIN "gfx/trainers/erika.final.gbcpal", middle_colors
INCBIN "gfx/trainers/youngster.final.gbcpal", middle_colors
INCBIN "gfx/trainers/schoolboy.final.gbcpal", middle_colors
INCBIN "gfx/trainers/bird_keeper.final.gbcpal", middle_colors
INCBIN "gfx/trainers/lass.final.gbcpal", middle_colors
INCBIN "gfx/trainers/janine.final.gbcpal", middle_colors
INCBIN "gfx/trainers/cooltrainer_m.final.gbcpal", middle_colors
INCBIN "gfx/trainers/cooltrainer_f.final.gbcpal", middle_colors
INCBIN "gfx/trainers/beauty.final.gbcpal", middle_colors
INCBIN "gfx/trainers/pokemaniac.final.gbcpal", middle_colors
INCBIN "gfx/trainers/grunt_m.final.gbcpal", middle_colors
INCBIN "gfx/trainers/gentleman.final.gbcpal", middle_colors
INCBIN "gfx/trainers/skier.final.gbcpal", middle_colors
INCBIN "gfx/trainers/teacher.final.gbcpal", middle_colors
INCBIN "gfx/trainers/sabrina.final.gbcpal", middle_colors
INCBIN "gfx/trainers/bug_catcher.final.gbcpal", middle_colors
INCBIN "gfx/trainers/fisher.final.gbcpal", middle_colors
INCBIN "gfx/trainers/swimmer_m.final.gbcpal", middle_colors
INCBIN "gfx/trainers/swimmer_f.final.gbcpal", middle_colors
INCBIN "gfx/trainers/sailor.final.gbcpal", middle_colors
INCBIN "gfx/trainers/super_nerd.final.gbcpal", middle_colors
INCBIN "gfx/trainers/rival2.final.gbcpal", middle_colors
INCBIN "gfx/trainers/guitarist.final.gbcpal", middle_colors
INCBIN "gfx/trainers/hiker.final.gbcpal", middle_colors
INCBIN "gfx/trainers/biker.final.gbcpal", middle_colors
INCBIN "gfx/trainers/blaine.final.gbcpal", middle_colors
INCBIN "gfx/trainers/burglar.final.gbcpal", middle_colors
INCBIN "gfx/trainers/firebreather.final.gbcpal", middle_colors
INCBIN "gfx/trainers/juggler.final.gbcpal", middle_colors
INCBIN "gfx/trainers/blackbelt_t.final.gbcpal", middle_colors
INCBIN "gfx/trainers/executive_m.final.gbcpal", middle_colors
INCBIN "gfx/trainers/psychic_t.final.gbcpal", middle_colors
INCBIN "gfx/trainers/picnicker.final.gbcpal", middle_colors
INCBIN "gfx/trainers/camper.final.gbcpal", middle_colors
INCBIN "gfx/trainers/executive_f.final.gbcpal", middle_colors
INCBIN "gfx/trainers/sage.final.gbcpal", middle_colors
INCBIN "gfx/trainers/medium.final.gbcpal", middle_colors
INCBIN "gfx/trainers/boarder.final.gbcpal", middle_colors
INCBIN "gfx/trainers/pokefan_m.final.gbcpal", middle_colors
INCBIN "gfx/trainers/kimono_girl.final.gbcpal", middle_colors
INCBIN "gfx/trainers/twins.final.gbcpal", middle_colors
INCBIN "gfx/trainers/pokefan_f.final.gbcpal", middle_colors
INCBIN "gfx/trainers/red.final.gbcpal", middle_colors
INCBIN "gfx/trainers/blue.final.gbcpal", middle_colors
INCBIN "gfx/trainers/officer.final.gbcpal", middle_colors
INCBIN "gfx/trainers/grunt_f.final.gbcpal", middle_colors
INCBIN "gfx/trainers/mysticalman.final.gbcpal", middle_colors
INCBIN "gfx/trainers/schoolboy.final.gbcpal", middle_colors
INCBIN "gfx/trainers/picnicker.final.gbcpal", middle_colors
INCBIN "gfx/trainers/biker.final.gbcpal", middle_colors
INCBIN "gfx/trainers/psychic_t.final.gbcpal", middle_colors
INCBIN "gfx/trainers/executive_m.final.gbcpal", middle_colors
INCBIN "gfx/trainers/biker.final.gbcpal", middle_colors ; cue_ball (Gen 1 sprite is SPRITE_BIKER)
INCBIN "gfx/trainers/beauty.final.gbcpal", middle_colors ; lorelei (no dedicated pic ported)
INCBIN "gfx/trainers/medium.final.gbcpal", middle_colors ; agatha (no dedicated pic ported)

	assert_table_length NUM_TRAINER_CLASSES + 1
