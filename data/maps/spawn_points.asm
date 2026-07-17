MACRO spawn
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants
	table_width 4

	spawn REDS_HOUSE_2F,               2,  3 ; SPAWN_HOME: Gen 1 start in Red's bedroom
	spawn VIRIDIAN_POKECENTER_1F,      5,  3

	spawn PALLET_TOWN,                 5,  6
	spawn VIRIDIAN_CITY,              23, 26
	spawn PEWTER_CITY,                13, 26
	spawn CERULEAN_CITY,              19, 18 ; Gen 1 pokecenter
	spawn ROUTE_10_NORTH,             11,  2
	spawn VERMILION_CITY,             11,  4 ; Gen 1 pokecenter
	spawn LAVENDER_TOWN,               3,  6 ; Gen 1 pokecenter
	spawn SAFFRON_CITY,                9, 30
	spawn CELADON_CITY,               41, 10 ; Gen 1 pokecenter
	spawn FUCHSIA_CITY,               19, 28
	spawn CINNABAR_ISLAND,            11, 12
	spawn ROUTE_23,                    9,  6
	spawn ROUTE_4,                    11,  6 ; Gen 1 pokecenter (Mt Moon respawn-only, not fly menu)

	spawn NEW_BARK_TOWN,              13,  6
	spawn CHERRYGROVE_CITY,           29,  4
	spawn VIOLET_CITY,                31, 26
	spawn ROUTE_32,                   11, 74
	spawn AZALEA_TOWN,                15, 10
	spawn CIANWOOD_CITY,              23, 44
	spawn GOLDENROD_CITY,             15, 28
	spawn OLIVINE_CITY,               13, 22
	spawn ECRUTEAK_CITY,              23, 28
	spawn MAHOGANY_TOWN,              15, 14
	spawn LAKE_OF_RAGE,               21, 29
	spawn BLACKTHORN_CITY,            21, 30
	spawn SILVER_CAVE_OUTSIDE,        23, 20
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2

	spawn N_A,                        -1, -1

	assert_table_length NUM_SPAWNS + 1
