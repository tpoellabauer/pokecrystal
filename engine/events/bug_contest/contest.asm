GiveParkBalls:
	xor a
	ld [wContestMon], a
	ld a, BUG_CONTEST_BALLS
	ld [wParkBallsRemaining], a
	farcall StartBugContestTimer
	ret

; Gen1's Safari Zone reuses this same ball counter (wParkBallsRemaining ==
; wSafariBallsRemaining, see ram/wram.asm) but has its own step-counted (not wall-clock)
; timer that isn't wired yet (see docs/PORT_BACKLOG.md) -- this only grants the balls,
; called from SafariZoneGate.asm's entrance-fee script.
GiveSafariBalls:
	ld a, SAFARI_ZONE_BALLS
	ld [wSafariBallsRemaining], a
	ret

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
