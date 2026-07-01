; Gen 1 Kanto on Crystal — "vanilla Red parity" master switch.
;
; VANILLA_RED = 1 builds a PRISTINE copy of Pokemon Red on the Gen 2 engine: the port
; is configured to match the original as closely as possible, with none of the mod-only
; additions layered on top. It is the default while the port is being matched to Red.
;
; This does NOT restore stock Crystal — the Gen 1 look, Gen 1 Kanto maps, and the Red
; start in Red's bedroom are core to the port and always on. VANILLA_RED instead pins
; the remaining engine behaviors that still differ from Red to their Gen 1 values, and
; (as they land) disables mod-only extras that Red never had:
;
;   * Day/night: Red has no time-of-day cycle -> time of day is pinned to DAY, so
;     overworld palettes and time-gated encounters never shift (engine/rtc/rtc.asm).
;   * (planned) trainer auto-scaling and universal rematches are mod-only; VANILLA_RED
;     forces them off so a vanilla build behaves exactly like Red.
;
; Set VANILLA_RED to 0 (rgbasm -D VANILLA_RED=0) for the full "enhanced mod" build once
; those extras exist. The map-comparison tooling (tools/compare) builds and diffs the
; VANILLA_RED image against real pokered.gbc to drive the port to an exact match.

	IF !DEF(VANILLA_RED)
DEF VANILLA_RED EQU 1
	ENDC
