; Gen 1 Kanto on Crystal: ported Red SFX (see tools/port_sfx.py). Selected by the
; MUSIC_SOURCE option bit (wOptions), same toggle as RedMusic -- see GetSFXHeader
; in audio/engine.asm.

SECTION "Red SFX Pointers", ROMX

INCLUDE "audio/sfx_red_pointers.asm"

SECTION "Red SFX", ROMX

Sfx_RedBallPoof:
	channel_count 2
	channel 5, Sfx_RedBallPoof_Ch5
	channel 8, Sfx_RedBallPoof_Ch8

Sfx_RedBallPoof_Ch5:
	duty_cycle 2
	pitch_sweep 1, 6
	square_note 15, 15, 2, 1024
	pitch_sweep 0, 8
	sound_ret

Sfx_RedBallPoof_Ch8:
	noise_note 15, 10, 2, 34
	sound_ret

Sfx_RedCaughtMon:
	channel_count 3
	channel 5, Sfx_RedCaughtMon_Ch5
	channel 6, Sfx_RedCaughtMon_Ch6
	channel 7, Sfx_RedCaughtMon_Ch7

Sfx_RedCaughtMon_Ch5:
	tempo 256
	volume 7, 7
	duty_cycle 3
	note_type 6, 11, 2
	octave 3
	note E_, 2
	note F#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note D#, 1
	note D#, 1
	note_type 6, 11, 5
	note E_, 8
	sound_ret

Sfx_RedCaughtMon_Ch6:
	duty_cycle 2
	note_type 6, 12, 2
	octave 4
	note G#, 2
	note G#, 1
	note G#, 1
	note E_, 2
	note E_, 1
	note E_, 1
	note B_, 2
	note B_, 1
	note B_, 1
	note A_, 2
	note A_, 1
	note A_, 1
	note_type 6, 12, 5
	note G#, 8
	sound_ret

Sfx_RedCaughtMon_Ch7:
	note_type 6, 1, 0
	octave 4
	note B_, 2
	rest 2
	octave 5
	note C#, 2
	rest 2
	note D#, 2
	rest 2
	note F#, 2
	note G_, 2
	note G#, 4
	sound_ret

Sfx_RedCut:
	channel_count 1
	channel 8, Sfx_RedCut_Ch8

Sfx_RedCut_Ch8:
	noise_note 2, 15, 7, 36
	noise_note 2, 15, 7, 52
	noise_note 4, 15, 7, 68
	noise_note 8, 15, 4, 85
	noise_note 8, 15, 1, 68
	sound_ret

Sfx_RedDamage:
	channel_count 1
	channel 8, Sfx_RedDamage_Ch8

Sfx_RedDamage_Ch8:
	noise_note 2, 15, 4, 68
	noise_note 2, 15, 4, 20
	noise_note 15, 15, 1, 50
	sound_ret

Sfx_RedDoubleslap:
	channel_count 1
	channel 8, Sfx_RedDoubleslap_Ch8

Sfx_RedDoubleslap_Ch8:
	noise_note 8, 15, 1, 50
	noise_note 8, 15, 1, 51
	sound_ret

Sfx_RedFly:
	channel_count 1
	channel 8, Sfx_RedFly_Ch8

Sfx_RedFly_Ch8:
	noise_note 2, 15, 1, 18
	noise_note 2, 0, 0, 0
	noise_note 2, 10, 1, 18
	noise_note 2, 0, 0, 0
	noise_note 2, 13, 1, 18
	noise_note 2, 0, 0, 0
	noise_note 2, 8, 1, 18
	noise_note 2, 0, 0, 0
	noise_note 2, 11, 1, 18
	noise_note 2, 0, 0, 0
	noise_note 2, 6, 1, 18
	noise_note 2, 0, 0, 0
	noise_note 2, 9, 1, 18
	noise_note 2, 0, 0, 0
	noise_note 2, 4, 1, 18
	noise_note 2, 0, 0, 0
	sound_ret

Sfx_RedIntroWhoosh:
	channel_count 1
	channel 8, Sfx_RedIntroWhoosh_Ch8

Sfx_RedIntroWhoosh_Ch8:
	noise_note 4, 2, -4, 32
	noise_note 3, 10, 0, 32
	noise_note 3, 11, 0, 33
	noise_note 3, 12, 0, 34
	noise_note 15, 13, 2, 36
	sound_ret

Sfx_RedLevelUp:
	channel_count 3
	channel 5, Sfx_RedLevelUp_Ch5
	channel 6, Sfx_RedLevelUp_Ch6
	channel 7, Sfx_RedLevelUp_Ch7

Sfx_RedLevelUp_Ch5:
	tempo 256
	volume 7, 7
	duty_cycle 2
	note_type 6, 11, 4
	octave 4
	note F_, 4
	note_type 4, 11, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note_type 6, 11, 3
	note D#, 2
	note D#, 2
	note E_, 2
	note_type 6, 11, 4
	note F_, 8
	sound_ret

Sfx_RedLevelUp_Ch6:
	vibrato 4, 2, 2
	duty_cycle 2
	note_type 6, 12, 4
	octave 4
	note A_, 4
	note_type 4, 12, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note_type 6, 12, 4
	note A#, 2
	note A#, 2
	note A#, 2
	note_type 6, 12, 4
	note A_, 8
	sound_ret

Sfx_RedLevelUp_Ch7:
	note_type 6, 1, 0
	octave 5
	note A_, 4
	note_type 4, 1, 0
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note_type 6, 1, 0
	note G_, 1
	rest 1
	note D#, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 8
	sound_ret

Sfx_RedNotVeryEffective:
	channel_count 1
	channel 8, Sfx_RedNotVeryEffective_Ch8

Sfx_RedNotVeryEffective_Ch8:
	noise_note 4, 8, -7, 85
	noise_note 2, 15, 4, 68
	noise_note 8, 15, 4, 34
	noise_note 15, 15, 2, 33
	sound_ret

Sfx_RedPeck:
	channel_count 1
	channel 8, Sfx_RedPeck_Ch8

Sfx_RedPeck_Ch8:
	noise_note 2, 10, 1, 18
	sound_ret

Sfx_RedPokeflute:
	channel_count 1
	channel 3, Sfx_RedPokeflute_Ch3

Sfx_RedPokeflute_Ch3:
	vibrato 16, 1, 4
	note_type 12, 1, 0
	octave 5
	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 2
	note G_, 2
	octave 6
	note C_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 5
	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 8
	rest 12
	sound_ret

Sfx_RedPound:
	channel_count 1
	channel 8, Sfx_RedPound_Ch8

Sfx_RedPound_Ch8:
	noise_note 2, 10, 1, 34
	sound_ret

Sfx_RedPsybeam:
	channel_count 3
	channel 5, Sfx_RedPsybeam_Ch5
	channel 6, Sfx_RedPsybeam_Ch6
	channel 8, Sfx_RedPsybeam_Ch8

Sfx_RedPsybeam_Ch5:
	duty_cycle_pattern 2, 2, 0, 1
	square_note 10, 15, 1, 1600
	square_note 10, 15, 3, 1664
	square_note 10, 15, 2, 1568
	sound_loop 4, Sfx_RedPsybeam_Ch5
	square_note 10, 15, 1, 1600
	sound_ret

Sfx_RedPsybeam_Ch6:
	duty_cycle_pattern 2, 3, 0, 3
	square_note 10, 15, 3, 1393
	square_note 7, 14, 3, 1329
	square_note 10, 15, 1, 1361
	sound_loop 4, Sfx_RedPsybeam_Ch6
	square_note 10, 15, 1, 1393
	sound_ret

Sfx_RedPsybeam_Ch8:
	noise_note 2, 13, 1, 74
	noise_note 2, 13, 2, 42
	sound_loop 21, Sfx_RedPsybeam_Ch8
	sound_ret

Sfx_RedRun:
	channel_count 1
	channel 8, Sfx_RedRun_Ch8

Sfx_RedRun_Ch8:
	noise_note 2, 6, 1, 35
	noise_note 2, 10, 1, 51
	noise_note 2, 12, 1, 51
	noise_note 2, 5, 1, 17
	noise_note 2, 15, 1, 51
	noise_note 2, 4, 1, 17
	noise_note 2, 12, 1, 51
	noise_note 2, 3, 1, 17
	noise_note 2, 8, 1, 51
	noise_note 2, 3, 1, 17
	noise_note 8, 4, 1, 51
	sound_ret

Sfx_RedSave:
	channel_count 2
	channel 5, Sfx_RedSave_Ch5
	channel 6, Sfx_RedSave_Ch6

Sfx_RedSave_Ch5:
	duty_cycle 2
	square_note 4, 15, 4, 1792
	square_note 2, 14, 4, 1536
	square_note 2, 14, 4, 1664
	square_note 2, 14, 4, 1728
	square_note 2, 14, 4, 1792
	square_note 2, 14, 4, 1952
	square_note 15, 15, 2, 2016
	sound_ret

Sfx_RedSave_Ch6:
	duty_cycle 2
	square_note 4, 0, 8, 0
	square_note 2, 13, 4, 1793
	square_note 2, 12, 4, 1537
	square_note 2, 12, 4, 1665
	square_note 2, 12, 4, 1729
	square_note 2, 12, 4, 1793
	square_note 2, 12, 4, 1953
	square_note 15, 13, 2, 2017
	sound_ret

Sfx_RedSuperEffective:
	channel_count 1
	channel 8, Sfx_RedSuperEffective_Ch8

Sfx_RedSuperEffective_Ch8:
	noise_note 4, 15, 1, 52
	noise_note 15, 15, 2, 100
	sound_ret

Sfx_RedVineWhip:
	channel_count 1
	channel 8, Sfx_RedVineWhip_Ch8

Sfx_RedVineWhip_Ch8:
	noise_note 1, 12, 2, 51
	noise_note 2, 15, 2, 33
	noise_note 1, 14, 2, 51
	noise_note 1, 12, 2, 50
	noise_note 1, 9, 2, 18
	noise_note 1, 11, 2, 49
	noise_note 12, 9, 1, 16
	noise_note 8, 15, 2, 65
	sound_ret

Sfx_RedHornDrill:
	channel_count 1
	channel 8, Sfx_RedHornDrill_Ch8

Sfx_RedHornDrill_Ch8:
	noise_note 3, 9, 2, 49
	noise_note 3, 11, 2, 50
	noise_note 3, 12, 2, 51
	noise_note 8, 15, 1, 84
	sound_ret

Sfx_RedPsychicM:
	channel_count 3
	channel 5, Sfx_RedPsychicM_Ch5
	channel 6, Sfx_RedPsychicM_Ch6
	channel 8, Sfx_RedPsychicM_Ch8

Sfx_RedPsychicM_Ch5:
	duty_cycle 2
	pitch_sweep 15, 7
	square_note 8, 12, 4, 1981
	square_note 8, 12, 4, 1982
	square_note 8, 12, 4, 1983
	square_note 8, 12, 4, 1984
	square_note 15, 12, 4, 1985
	square_note 15, 15, 2, 1984
	pitch_sweep 0, 8
	sound_ret

Sfx_RedPsychicM_Ch6:
	duty_cycle 2
	square_note 8, 12, 4, 1904
	square_note 8, 12, 4, 1889
	square_note 8, 12, 4, 1890
	square_note 8, 12, 4, 1891
	square_note 15, 12, 4, 1892
	square_note 15, 15, 2, 1892
	sound_ret

Sfx_RedPsychicM_Ch8:
	noise_note 15, 3, -7, 20
	noise_note 15, 12, -7, 19
	noise_note 15, 12, -7, 18
	noise_note 15, 12, -7, 17
	noise_note 15, 12, -7, 16
	noise_note 15, 12, 2, 16
	sound_ret

Sfx_RedTrainerAppeared:
	channel_count 1
	channel 5, Sfx_RedTrainerAppeared_Ch5

Sfx_RedTrainerAppeared_Ch5:
	duty_cycle 0
	square_note 0, 13, 2, 1792
	square_note 0, 13, 2, 1856
	square_note 0, 13, 2, 1920
	square_note 0, 13, 2, 1984
	square_note 10, 14, 1, 2016
	square_note 1, 0, 0, 0
	sound_ret
