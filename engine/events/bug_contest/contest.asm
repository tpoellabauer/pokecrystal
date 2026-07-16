GiveParkBalls:
	xor a
	ld [wContestMon], a
	ld a, BUG_CONTEST_BALLS
	ld [wParkBallsRemaining], a
	farcall StartBugContestTimer
	ret

; Gen1's Safari Zone reuses this same ball counter (wParkBallsRemaining ==
; wSafariBallsRemaining, see ram/wram.asm) and has its own step-counted (not wall-clock)
; timer -- wSafariTimeRemaining + STATUSFLAGS2_SAFARI_GAME_F already exist in vanilla
; Crystal as vestigial leftovers of GSC's own cut Kanto Safari Zone (StartMenu_
; PrintSafariGameStatus in engine/menus/menu_2.asm reads wSafariTimeRemaining as "x/500"
; but is itself unreferenced), so this just re-arms them: DoSafariStep
; (engine/overworld/events.asm, wired into CountStep like DoRepelStep) decrements
; wSafariTimeRemaining once per overworld step and ejects the player via
; SafariZoneTimeUpScript (below) when it reaches 0, mirroring Gen1's SafariZoneCheckSteps.
; Called from SafariZoneGate.asm's entrance-fee script, both on first payment and on
; every free re-entry (each visit gets a fresh 30 balls + 500 steps, matching Gen1).
GiveSafariBalls:
	ld a, SAFARI_ZONE_BALLS
	ld [wSafariBallsRemaining], a
	ld a, LOW(SAFARI_ZONE_STEPS)
	ld [wSafariTimeRemaining], a
	ld a, HIGH(SAFARI_ZONE_STEPS)
	ld [wSafariTimeRemaining + 1], a
	ld hl, wStatusFlags2
	set STATUSFLAGS2_SAFARI_GAME_F, [hl]
	ret

; Ejection script for DoSafariStep (engine/overworld/events.asm): the step-timer's own
; expiry. Out-of-balls mid-battle already ejects via the shared Bug Contest ball-counter
; code (engine/battle/core.asm's CheckContestBattleOver, since wParkBallsRemaining ==
; wSafariBallsRemaining) -- this is the overworld-side "ran out of steps" counterpart,
; same warp-out idiom as BugContestResultsWarpScript above. Lands at SafariZoneGate's
; (3, 5), the same tile a normal Fuchsia-side entrant arrives at (SafariZoneGate.asm's
; warp_event #1).
SafariZoneTimeUpScript::
	warp SAFARI_ZONE_GATE, 3, 5
	end

SafariZoneTimeUpText:
	text_far _SafariZoneTimeUpText
	text_end

BugCatchingContestBattleScript::
	loadvar VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	readmem wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

BugCatchingContestOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestTimeUpText
	waitbutton
	sjump BugCatchingContestReturnToGateScript

BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestIsOverText
	waitbutton

BugCatchingContestReturnToGateScript:
	closetext
	jumpstd BugContestResultsWarpScript

BugCatchingContestTimeUpText:
	text_far _BugCatchingContestTimeUpText
	text_end

BugCatchingContestIsOverText:
	text_far _BugCatchingContestIsOverText
	text_end
