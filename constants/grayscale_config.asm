; Gen 1 Kanto on Crystal — grayscale bake switch.
;
; GRAYSCALE = 1 (default) bakes the DMG 4-shade grayscale look into every palette at
; build time: RGB macro output (constants/../macros/gfx.asm) and pic .gbcpal generation
; (tools/gbcpal) both snap each color to gray = (R+G+B)/3, rounded to the nearest of the
; canonical DMG levels {0,10,21,31}. This covers Gen 1 Kanto content and Gen 2 (GSC)
; content alike — the whole ROM renders grayscale-only.
;
; Distinct from VANILLA_RED (vanilla_config.asm): that flag pins Gen-1-parity engine
; behavior; this flag controls color vs. grayscale rendering. Set GRAYSCALE to 0
; (rgbasm -D GRAYSCALE=0, or `make crystal GRAYSCALE=0`) to build in full color for GSC
; regression comparisons against stock Crystal.

	IF !DEF(GRAYSCALE)
DEF GRAYSCALE EQU 1
	ENDC
