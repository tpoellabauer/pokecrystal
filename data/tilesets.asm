MACRO tileset
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
	dw NULL
	dw \1PalMap
ENDM

; Associated data:
; - The *GFX, *Meta, and *Coll are defined in gfx/tilesets.asm
; - The *PalMap are defined in gfx/tileset_palette_maps.asm
; - The *Anim are defined in data/tileset_anims.asm

Tilesets::
; entries correspond to TILESET_* constants (see constants/tileset_constants.asm)
	table_width TILESET_LENGTH
	tileset Tileset0
	tileset TilesetJohto
	tileset TilesetJohtoModern
	tileset TilesetKanto
	tileset TilesetBattleTowerOutside
	tileset TilesetHouse
	tileset TilesetPlayersHouse
	tileset TilesetPokecenter
	tileset TilesetGate
	tileset TilesetPort
	tileset TilesetLab
	tileset TilesetFacility
	tileset TilesetMart
	tileset TilesetMansion
	tileset TilesetGameCorner
	tileset TilesetEliteFourRoom
	tileset TilesetTraditionalHouse
	tileset TilesetTrainStation
	tileset TilesetChampionsRoom
	tileset TilesetLighthouse
	tileset TilesetPlayersRoom
	tileset TilesetPokeComCenter
	tileset TilesetBattleTowerInside
	tileset TilesetTower
	tileset TilesetCave
	tileset TilesetPark
	tileset TilesetRuinsOfAlph
	tileset TilesetRadioTower
	tileset TilesetUnderground
	tileset TilesetIcePath
	tileset TilesetDarkCave
	tileset TilesetForest
	tileset TilesetBetaWordRoom
	tileset TilesetHoOhWordRoom
	tileset TilesetKabutoWordRoom
	tileset TilesetOmanyteWordRoom
	tileset TilesetAerodactylWordRoom
	tileset TilesetGen1Overworld
	tileset TilesetGen1RedsHouse
	tileset TilesetGen1House
	tileset TilesetGen1Lab
	tileset TilesetGen1Pokecenter
	tileset TilesetGen1Gym
	tileset TilesetGen1Forest
	tileset TilesetGen1Gate
	tileset TilesetGen1Ship
	tileset TilesetGen1ShipPort
	tileset TilesetGen1Cemetery
	tileset TilesetGen1Interior
	tileset TilesetGen1Cavern
	tileset TilesetGen1Lobby
	tileset TilesetGen1Mansion
	tileset TilesetGen1Club
	tileset TilesetGen1Facility
	tileset TilesetGen1Plateau
	tileset TilesetGen1Underground
	tileset TilesetGen1Mart
	tileset TilesetGen1Dojo
	tileset TilesetGen1Museum
	tileset TilesetGen1ForestGate
	assert_table_length NUM_TILESETS + 1
