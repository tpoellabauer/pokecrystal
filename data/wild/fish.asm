DEF time_group EQUS "0," ; use the nth TimeFishGroups entry

MACRO fishgroup
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	fishgroup 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super
; Gen 1 Kanto Super Rod groups (pokeredDisassembly/data/wild/super_rod.asm); Old/Good Rod are
; universal in Gen 1 (always MAGIKARP / GOLDEEN-POLIWAG) so all 10 Kanto groups share the same
; Old/Good sub-tables and only the Super sub-table varies -- see tools/port_fish.py.
	fishgroup 50 percent + 1, .KantoGroup1_Old,  .KantoGroup1_Good,  .KantoGroup1_Super
	fishgroup 50 percent + 1, .KantoGroup2_Old,  .KantoGroup2_Good,  .KantoGroup2_Super
	fishgroup 50 percent + 1, .KantoGroup3_Old,  .KantoGroup3_Good,  .KantoGroup3_Super
	fishgroup 50 percent + 1, .KantoGroup4_Old,  .KantoGroup4_Good,  .KantoGroup4_Super
	fishgroup 50 percent + 1, .KantoGroup5_Old,  .KantoGroup5_Good,  .KantoGroup5_Super
	fishgroup 50 percent + 1, .KantoGroup6_Old,  .KantoGroup6_Good,  .KantoGroup6_Super
	fishgroup 50 percent + 1, .KantoGroup7_Old,  .KantoGroup7_Good,  .KantoGroup7_Super
	fishgroup 50 percent + 1, .KantoGroup8_Old,  .KantoGroup8_Good,  .KantoGroup8_Super
	fishgroup 50 percent + 1, .KantoGroup9_Old,  .KantoGroup9_Good,  .KantoGroup9_Super
	fishgroup 50 percent + 1, .KantoGroup10_Old, .KantoGroup10_Good, .KantoGroup10_Super
	assert_table_length NUM_FISHGROUPS

.Shore_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.Shore_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     time_group 0
.Shore_Super:
	db  40 percent,     KRABBY,     40
	db  70 percent,     time_group 1
	db  90 percent + 1, KRABBY,     40
	db 100 percent,     KINGLER,    40

.Ocean_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Ocean_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     time_group 2
.Ocean_Super:
	db  40 percent,     CHINCHOU,   40
	db  70 percent,     time_group 3
	db  90 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40

.Lake_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     GOLDEEN,    10
.Lake_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     GOLDEEN,    20
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     time_group 4
.Lake_Super:
	db  40 percent,     GOLDEEN,    40
	db  70 percent,     time_group 5
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     SEAKING,    40

.Pond_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Pond_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     time_group 6
.Pond_Super:
	db  40 percent,     POLIWAG,    40
	db  70 percent,     time_group 7
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     POLIWAG,    40

.Dratini_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     time_group 8
.Dratini_Super:
	db  40 percent,     MAGIKARP,   40
	db  70 percent,     time_group 9
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     DRAGONAIR,  40

.Qwilfish_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   5
	db  85 percent + 1, MAGIKARP,   5
	db 100 percent,     QWILFISH,   5
.Qwilfish_Swarm_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     QWILFISH,   20
	db  90 percent + 1, QWILFISH,   20
	db 100 percent,     time_group 10
.Qwilfish_Swarm_Super:
	db  40 percent,     QWILFISH,   40
	db  70 percent,     time_group 11
	db  90 percent + 1, QWILFISH,   40
	db 100 percent,     QWILFISH,   40

.Remoraid_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     REMORAID,   10
.Remoraid_Swarm_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     REMORAID,   20
	db  90 percent + 1, REMORAID,   20
	db 100 percent,     time_group 12
.Remoraid_Swarm_Super:
	db  40 percent,     REMORAID,   40
	db  70 percent,     time_group 13
	db  90 percent + 1, REMORAID,   40
	db 100 percent,     REMORAID,   40

.Gyarados_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Gyarados_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     time_group 14
.Gyarados_Super:
	db  40 percent,     MAGIKARP,   40
	db  70 percent,     time_group 15
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     MAGIKARP,   40

.Dratini_2_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_2_Good:
	db  35 percent,     MAGIKARP,   10
	db  70 percent,     MAGIKARP,   10
	db  90 percent + 1, MAGIKARP,   10
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  40 percent,     MAGIKARP,   10
	db  70 percent,     time_group 17
	db  90 percent + 1, MAGIKARP,   10
	db 100 percent,     DRAGONAIR,  10

.WhirlIslands_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.WhirlIslands_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  40 percent,     KRABBY,     40
	db  70 percent,     time_group 19
	db  90 percent + 1, KINGLER,    40
	db 100 percent,     SEADRA,     40

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, TENTACOOL,  20
	db 100 percent,     time_group 20
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	db  40 percent,     TENTACOOL,  40
	db  70 percent,     time_group 21
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     QWILFISH,   40

.Remoraid_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Remoraid_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     time_group 6
.Remoraid_Super:
	db  40 percent,     POLIWAG,    40
	db  70 percent,     time_group 7
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     REMORAID,   40

; Gen 1 Kanto Super Rod groups. Old/Good Rod have no map-to-map variance in Gen 1 (Old Rod is
; always MAGIKARP lvl 5; Good Rod is a uniform 50/50 between GOLDEEN/POLIWAG lvl 10, see
; ItemUseOldRod/ItemUseGoodRod + data/wild/good_rod.asm in pokeredDisassembly), so every
; KantoGroup shares identical Old/Good sub-tables; only Super varies, 1:1 with
; pokeredDisassembly/data/wild/super_rod.asm's .Group1-.Group10 (uniform random pick, no
; Gen 2 time_group rare-species mechanic -- Gen 1 has none, so cutoffs are an even split of
; 100% across each group's species count instead of Crystal's usual 40/70/90/100 pattern).
.KantoGroup1_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup1_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup1_Super: ; pokeredDisassembly .Group1: TENTACOOL/POLIWAG
	db  50 percent,     TENTACOOL,    15
	db  100 percent,     POLIWAG,    15

.KantoGroup2_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup2_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup2_Super: ; pokeredDisassembly .Group2: GOLDEEN/POLIWAG
	db  50 percent,     GOLDEEN,    15
	db  100 percent,     POLIWAG,    15

.KantoGroup3_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup3_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup3_Super: ; pokeredDisassembly .Group3: PSYDUCK/GOLDEEN/KRABBY
	db  34 percent,     PSYDUCK,    15
	db  67 percent,     GOLDEEN,    15
	db  100 percent,     KRABBY,    15

.KantoGroup4_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup4_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup4_Super: ; pokeredDisassembly .Group4: KRABBY/SHELLDER
	db  50 percent,     KRABBY,    15
	db  100 percent,     SHELLDER,    15

.KantoGroup5_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup5_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup5_Super: ; pokeredDisassembly .Group5: POLIWHIRL/SLOWPOKE
	db  50 percent,     POLIWHIRL,    23
	db  100 percent,     SLOWPOKE,    15

.KantoGroup6_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup6_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup6_Super: ; pokeredDisassembly .Group6: DRATINI/KRABBY/PSYDUCK/SLOWPOKE
	db  25 percent,     DRATINI,    15
	db  50 percent,     KRABBY,    15
	db  75 percent,     PSYDUCK,    15
	db  100 percent,     SLOWPOKE,    15

.KantoGroup7_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup7_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup7_Super: ; pokeredDisassembly .Group7: TENTACOOL/KRABBY/GOLDEEN/MAGIKARP
	db  25 percent,     TENTACOOL,    5
	db  50 percent,     KRABBY,    15
	db  75 percent,     GOLDEEN,    15
	db  100 percent,     MAGIKARP,    15

.KantoGroup8_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup8_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup8_Super: ; pokeredDisassembly .Group8: STARYU/HORSEA/SHELLDER/GOLDEEN
	db  25 percent,     STARYU,    15
	db  50 percent,     HORSEA,    15
	db  75 percent,     SHELLDER,    15
	db  100 percent,     GOLDEEN,    15

.KantoGroup9_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup9_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup9_Super: ; pokeredDisassembly .Group9: SLOWBRO/SEAKING/KINGLER/SEADRA
	db  25 percent,     SLOWBRO,    23
	db  50 percent,     SEAKING,    23
	db  75 percent,     KINGLER,    23
	db  100 percent,     SEADRA,    23

.KantoGroup10_Old:
	db 100 percent,     MAGIKARP,   5
.KantoGroup10_Good:
	db 50 percent,     GOLDEEN,    10
	db 100 percent,     POLIWAG,    10
.KantoGroup10_Super: ; pokeredDisassembly .Group10: SEAKING/KRABBY/GOLDEEN/MAGIKARP
	db  25 percent,     SEAKING,    23
	db  50 percent,     KRABBY,    15
	db  75 percent,     GOLDEEN,    15
	db  100 percent,     MAGIKARP,    15

TimeFishGroups:
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ; 0
	db CORSOLA,    40,  STARYU,     40 ; 1
	db SHELLDER,   20,  SHELLDER,   20 ; 2
	db SHELLDER,   40,  SHELLDER,   40 ; 3
	db GOLDEEN,    20,  GOLDEEN,    20 ; 4
	db GOLDEEN,    40,  GOLDEEN,    40 ; 5
	db POLIWAG,    20,  POLIWAG,    20 ; 6
	db POLIWAG,    40,  POLIWAG,    40 ; 7
	db DRATINI,    20,  DRATINI,    20 ; 8
	db DRATINI,    40,  DRATINI,    40 ; 9
	db QWILFISH,   20,  QWILFISH,   20 ; 10
	db QWILFISH,   40,  QWILFISH,   40 ; 11
	db REMORAID,   20,  REMORAID,   20 ; 12
	db REMORAID,   40,  REMORAID,   40 ; 13
	db GYARADOS,   20,  GYARADOS,   20 ; 14
	db GYARADOS,   40,  GYARADOS,   40 ; 15
	db DRATINI,    10,  DRATINI,    10 ; 16
	db DRATINI,    10,  DRATINI,    10 ; 17
	db HORSEA,     20,  HORSEA,     20 ; 18
	db HORSEA,     40,  HORSEA,     40 ; 19
	db TENTACOOL,  20,  TENTACOOL,  20 ; 20
	db TENTACOOL,  40,  TENTACOOL,  40 ; 21
