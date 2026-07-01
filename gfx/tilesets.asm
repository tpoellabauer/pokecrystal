MACRO tilecoll
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

TilesetKantoGFX::
INCBIN "gfx/tilesets/kanto.2bpp.lz"

TilesetKantoMeta::
INCBIN "data/tilesets/kanto_metatiles.bin"

TilesetKantoColl::
INCLUDE "data/tilesets/kanto_collision.asm"

Tileset0GFX::
TilesetJohtoGFX::
INCBIN "gfx/tilesets/johto.2bpp.lz"

Tileset0Meta::
TilesetJohtoMeta::
INCBIN "data/tilesets/johto_metatiles.bin"

Tileset0Coll::
TilesetJohtoColl::
INCLUDE "data/tilesets/johto_collision.asm"

TilesetIcePathGFX::
INCBIN "gfx/tilesets/ice_path.2bpp.lz"

TilesetIcePathMeta::
INCBIN "data/tilesets/ice_path_metatiles.bin"

TilesetIcePathColl::
INCLUDE "data/tilesets/ice_path_collision.asm"

TilesetPlayersRoomGFX::
INCBIN "gfx/tilesets/players_room.2bpp.lz"

TilesetPlayersRoomMeta::
INCBIN "data/tilesets/players_room_metatiles.bin"

TilesetPlayersRoomColl::
INCLUDE "data/tilesets/players_room_collision.asm"


SECTION "Tileset Data 2", ROMX

TilesetPokecenterGFX::
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl::
INCLUDE "data/tilesets/pokecenter_collision.asm"

TilesetPortGFX::
INCBIN "gfx/tilesets/port.2bpp.lz"

TilesetPortMeta::
INCBIN "data/tilesets/port_metatiles.bin"

TilesetPortColl::
INCLUDE "data/tilesets/port_collision.asm"

TilesetPlayersHouseGFX::
INCBIN "gfx/tilesets/players_house.2bpp.lz"

TilesetPlayersHouseMeta::
INCBIN "data/tilesets/players_house_metatiles.bin"

TilesetPlayersHouseColl::
INCLUDE "data/tilesets/players_house_collision.asm"

TilesetMansionGFX::
INCBIN "gfx/tilesets/mansion.2bpp.lz"

TilesetMansionMeta::
INCBIN "data/tilesets/mansion_metatiles.bin"

TilesetMansionColl::
INCLUDE "data/tilesets/mansion_collision.asm"

TilesetCaveGFX::
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveMeta::
TilesetDarkCaveMeta::
INCBIN "data/tilesets/cave_metatiles.bin"

TilesetCaveColl::
TilesetDarkCaveColl::
INCLUDE "data/tilesets/cave_collision.asm"


SECTION "Tileset Data 3", ROMX

TilesetTowerGFX::
INCBIN "gfx/tilesets/tower.2bpp.lz"

TilesetTowerMeta::
INCBIN "data/tilesets/tower_metatiles.bin"

TilesetTowerColl::
INCLUDE "data/tilesets/tower_collision.asm"

TilesetLabGFX::
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabMeta::
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl::
INCLUDE "data/tilesets/lab_collision.asm"

TilesetMartGFX::
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin"

TilesetMartColl::
INCLUDE "data/tilesets/mart_collision.asm"

TilesetGameCornerGFX::
INCBIN "gfx/tilesets/game_corner.2bpp.lz"

TilesetGameCornerMeta::
INCBIN "data/tilesets/game_corner_metatiles.bin"

TilesetGameCornerColl::
INCLUDE "data/tilesets/game_corner_collision.asm"

TilesetTrainStationGFX::
INCBIN "gfx/tilesets/train_station.2bpp.lz"

TilesetTrainStationMeta::
INCBIN "data/tilesets/train_station_metatiles.bin"

TilesetTrainStationColl::
INCLUDE "data/tilesets/train_station_collision.asm"

TilesetForestMeta::
INCBIN "data/tilesets/forest_metatiles.bin"


SECTION "Tileset Data 4", ROMX

TilesetEliteFourRoomGFX::
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"

TilesetEliteFourRoomMeta::
INCBIN "data/tilesets/elite_four_room_metatiles.bin"

TilesetEliteFourRoomColl::
INCLUDE "data/tilesets/elite_four_room_collision.asm"

TilesetParkGFX::
INCBIN "gfx/tilesets/park.2bpp.lz"

TilesetParkMeta::
INCBIN "data/tilesets/park_metatiles.bin"

TilesetParkColl::
INCLUDE "data/tilesets/park_collision.asm"

TilesetRadioTowerGFX::
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"

TilesetRadioTowerMeta::
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl::
INCLUDE "data/tilesets/radio_tower_collision.asm"

TilesetUndergroundGFX::
INCBIN "gfx/tilesets/underground.2bpp.lz"

TilesetUndergroundMeta::
INCBIN "data/tilesets/underground_metatiles.bin"

TilesetUndergroundColl::
INCLUDE "data/tilesets/underground_collision.asm"

TilesetDarkCaveGFX::
INCBIN "gfx/tilesets/dark_cave.2bpp.lz"

UnusedTilesetJohtoMeta:: ; unreferenced
INCBIN "data/tilesets/unused_johto_metatiles.bin"

UnusedTilesetJohtoColl:: ; unreferenced
INCLUDE "data/tilesets/unused_johto_collision.asm"


SECTION "Tileset Data 5", ROMX

TilesetPokeComCenterGFX::
INCBIN "gfx/tilesets/pokecom_center.2bpp.lz"

TilesetPokeComCenterMeta::
INCBIN "data/tilesets/pokecom_center_metatiles.bin"

TilesetPokeComCenterColl::
INCLUDE "data/tilesets/pokecom_center_collision.asm"

TilesetBattleTowerInsideGFX::
INCBIN "gfx/tilesets/battle_tower_inside.2bpp.lz"

TilesetBattleTowerInsideMeta::
INCBIN "data/tilesets/battle_tower_inside_metatiles.bin"

TilesetBattleTowerInsideColl::
INCLUDE "data/tilesets/battle_tower_inside_collision.asm"

TilesetGateGFX::
INCBIN "gfx/tilesets/gate.2bpp.lz"

TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin"

TilesetGateColl::
INCLUDE "data/tilesets/gate_collision.asm"

TilesetJohtoModernGFX::
TilesetBattleTowerOutsideGFX::
INCBIN "gfx/tilesets/johto_modern.2bpp.lz"

TilesetJohtoModernMeta::
INCBIN "data/tilesets/johto_modern_metatiles.bin"

TilesetJohtoModernColl::
INCLUDE "data/tilesets/johto_modern_collision.asm"

TilesetTraditionalHouseGFX::
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseMeta::
INCBIN "data/tilesets/traditional_house_metatiles.bin"

TilesetTraditionalHouseColl::
INCLUDE "data/tilesets/traditional_house_collision.asm"


SECTION "Tileset Data 6", ROMX

TilesetForestGFX::
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetChampionsRoomGFX::
INCBIN "gfx/tilesets/champions_room.2bpp.lz"

TilesetChampionsRoomMeta::
INCBIN "data/tilesets/champions_room_metatiles.bin"

TilesetChampionsRoomColl::
INCLUDE "data/tilesets/champions_room_collision.asm"

TilesetHouseGFX::
INCBIN "gfx/tilesets/house.2bpp.lz"

TilesetHouseMeta::
INCBIN "data/tilesets/house_metatiles.bin"

TilesetHouseColl::
INCLUDE "data/tilesets/house_collision.asm"

TilesetLighthouseGFX::
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"

TilesetLighthouseMeta::
INCBIN "data/tilesets/lighthouse_metatiles.bin"

TilesetLighthouseColl::
INCLUDE "data/tilesets/lighthouse_collision.asm"

TilesetForestColl::
INCLUDE "data/tilesets/forest_collision.asm"

TilesetFacilityGFX::
INCBIN "gfx/tilesets/facility.2bpp.lz"

TilesetFacilityMeta::
INCBIN "data/tilesets/facility_metatiles.bin"

TilesetFacilityColl::
INCLUDE "data/tilesets/facility_collision.asm"

TilesetBattleTowerOutsideMeta::
INCBIN "data/tilesets/battle_tower_outside_metatiles.bin"

TilesetBattleTowerOutsideColl::
INCLUDE "data/tilesets/battle_tower_outside_collision.asm"

TilesetBetaWordRoomMeta::
INCBIN "data/tilesets/beta_word_room_metatiles.bin"

TilesetBetaWordRoomColl::
TilesetHoOhWordRoomColl::
TilesetKabutoWordRoomColl::
TilesetOmanyteWordRoomColl::
TilesetAerodactylWordRoomColl::
INCLUDE "data/tilesets/beta_word_room_collision.asm"


SECTION "Tileset Data 7", ROMX

TilesetRuinsOfAlphGFX::
TilesetBetaWordRoomGFX::
TilesetHoOhWordRoomGFX::
TilesetKabutoWordRoomGFX::
TilesetOmanyteWordRoomGFX::
TilesetAerodactylWordRoomGFX::
INCBIN "gfx/tilesets/ruins_of_alph.2bpp.lz"

TilesetRuinsOfAlphMeta::
INCBIN "data/tilesets/ruins_of_alph_metatiles.bin"

TilesetRuinsOfAlphColl::
INCLUDE "data/tilesets/ruins_of_alph_collision.asm"


SECTION "Tileset Data 8", ROMX

TilesetHoOhWordRoomMeta::
INCBIN "data/tilesets/ho_oh_word_room_metatiles.bin"

TilesetKabutoWordRoomMeta::
INCBIN "data/tilesets/kabuto_word_room_metatiles.bin"

TilesetOmanyteWordRoomMeta::
INCBIN "data/tilesets/omanyte_word_room_metatiles.bin"

TilesetAerodactylWordRoomMeta::
INCBIN "data/tilesets/aerodactyl_word_room_metatiles.bin"

; Ported Gen 1 Kanto overworld tileset (grayscale via the global palette hook).
TilesetGen1OverworldGFX::
INCBIN "gfx/tilesets/gen1_overworld.2bpp.lz"

TilesetGen1OverworldMeta::
INCBIN "data/tilesets/gen1_overworld_metatiles.bin"

TilesetGen1OverworldColl::
INCLUDE "data/tilesets/gen1_overworld_collision.asm"

TilesetGen1RedsHouseGFX::
INCBIN "gfx/tilesets/gen1_reds_house.2bpp.lz"

TilesetGen1RedsHouseMeta::
INCBIN "data/tilesets/gen1_reds_house_metatiles.bin"

TilesetGen1RedsHouseColl::
INCLUDE "data/tilesets/gen1_reds_house_collision.asm"

TilesetGen1HouseGFX::
INCBIN "gfx/tilesets/gen1_house.2bpp.lz"

TilesetGen1HouseMeta::
INCBIN "data/tilesets/gen1_house_metatiles.bin"

TilesetGen1HouseColl::
INCLUDE "data/tilesets/gen1_house_collision.asm"

TilesetGen1LabGFX::
INCBIN "gfx/tilesets/gen1_lab.2bpp.lz"

TilesetGen1LabMeta::
INCBIN "data/tilesets/gen1_lab_metatiles.bin"

TilesetGen1LabColl::
INCLUDE "data/tilesets/gen1_lab_collision.asm"

SECTION "Gen 1 Tileset gen1_pokecenter", ROMX

TilesetGen1PokecenterGFX::
INCBIN "gfx/tilesets/gen1_pokecenter.2bpp.lz"

TilesetGen1PokecenterMeta::
INCBIN "data/tilesets/gen1_pokecenter_metatiles.bin"

TilesetGen1PokecenterColl::
INCLUDE "data/tilesets/gen1_pokecenter_collision.asm"

SECTION "Gen 1 Tileset gen1_gym", ROMX

TilesetGen1GymGFX::
INCBIN "gfx/tilesets/gen1_gym.2bpp.lz"

TilesetGen1GymMeta::
INCBIN "data/tilesets/gen1_gym_metatiles.bin"

TilesetGen1GymColl::
INCLUDE "data/tilesets/gen1_gym_collision.asm"

SECTION "Gen 1 Tileset gen1_forest", ROMX

TilesetGen1ForestGFX::
INCBIN "gfx/tilesets/gen1_forest.2bpp.lz"

TilesetGen1ForestMeta::
INCBIN "data/tilesets/gen1_forest_metatiles.bin"

TilesetGen1ForestColl::
INCLUDE "data/tilesets/gen1_forest_collision.asm"

SECTION "Gen 1 Tileset gen1_gate", ROMX

TilesetGen1GateGFX::
INCBIN "gfx/tilesets/gen1_gate.2bpp.lz"

TilesetGen1GateMeta::
INCBIN "data/tilesets/gen1_gate_metatiles.bin"

TilesetGen1GateColl::
INCLUDE "data/tilesets/gen1_gate_collision.asm"

SECTION "Gen 1 Tileset gen1_ship", ROMX

TilesetGen1ShipGFX::
INCBIN "gfx/tilesets/gen1_ship.2bpp.lz"

TilesetGen1ShipMeta::
INCBIN "data/tilesets/gen1_ship_metatiles.bin"

TilesetGen1ShipColl::
INCLUDE "data/tilesets/gen1_ship_collision.asm"

SECTION "Gen 1 Tileset gen1_ship_port", ROMX

TilesetGen1ShipPortGFX::
INCBIN "gfx/tilesets/gen1_ship_port.2bpp.lz"

TilesetGen1ShipPortMeta::
INCBIN "data/tilesets/gen1_ship_port_metatiles.bin"

TilesetGen1ShipPortColl::
INCLUDE "data/tilesets/gen1_ship_port_collision.asm"

SECTION "Gen 1 Tileset gen1_cemetery", ROMX

TilesetGen1CemeteryGFX::
INCBIN "gfx/tilesets/gen1_cemetery.2bpp.lz"

TilesetGen1CemeteryMeta::
INCBIN "data/tilesets/gen1_cemetery_metatiles.bin"

TilesetGen1CemeteryColl::
INCLUDE "data/tilesets/gen1_cemetery_collision.asm"

SECTION "Gen 1 Tileset gen1_interior", ROMX

TilesetGen1InteriorGFX::
INCBIN "gfx/tilesets/gen1_interior.2bpp.lz"

TilesetGen1InteriorMeta::
INCBIN "data/tilesets/gen1_interior_metatiles.bin"

TilesetGen1InteriorColl::
INCLUDE "data/tilesets/gen1_interior_collision.asm"

SECTION "Gen 1 Tileset gen1_cavern", ROMX

TilesetGen1CavernGFX::
INCBIN "gfx/tilesets/gen1_cavern.2bpp.lz"

TilesetGen1CavernMeta::
INCBIN "data/tilesets/gen1_cavern_metatiles.bin"

TilesetGen1CavernColl::
INCLUDE "data/tilesets/gen1_cavern_collision.asm"

SECTION "Gen 1 Tileset gen1_lobby", ROMX

TilesetGen1LobbyGFX::
INCBIN "gfx/tilesets/gen1_lobby.2bpp.lz"

TilesetGen1LobbyMeta::
INCBIN "data/tilesets/gen1_lobby_metatiles.bin"

TilesetGen1LobbyColl::
INCLUDE "data/tilesets/gen1_lobby_collision.asm"

SECTION "Gen 1 Tileset gen1_mansion", ROMX

TilesetGen1MansionGFX::
INCBIN "gfx/tilesets/gen1_mansion.2bpp.lz"

TilesetGen1MansionMeta::
INCBIN "data/tilesets/gen1_mansion_metatiles.bin"

TilesetGen1MansionColl::
INCLUDE "data/tilesets/gen1_mansion_collision.asm"

SECTION "Gen 1 Tileset gen1_club", ROMX

TilesetGen1ClubGFX::
INCBIN "gfx/tilesets/gen1_club.2bpp.lz"

TilesetGen1ClubMeta::
INCBIN "data/tilesets/gen1_club_metatiles.bin"

TilesetGen1ClubColl::
INCLUDE "data/tilesets/gen1_club_collision.asm"

SECTION "Gen 1 Tileset gen1_facility", ROMX

TilesetGen1FacilityGFX::
INCBIN "gfx/tilesets/gen1_facility.2bpp.lz"

TilesetGen1FacilityMeta::
INCBIN "data/tilesets/gen1_facility_metatiles.bin"

TilesetGen1FacilityColl::
INCLUDE "data/tilesets/gen1_facility_collision.asm"

SECTION "Gen 1 Tileset gen1_plateau", ROMX

TilesetGen1PlateauGFX::
INCBIN "gfx/tilesets/gen1_plateau.2bpp.lz"

TilesetGen1PlateauMeta::
INCBIN "data/tilesets/gen1_plateau_metatiles.bin"

TilesetGen1PlateauColl::
INCLUDE "data/tilesets/gen1_plateau_collision.asm"

SECTION "Gen 1 Tileset gen1_underground", ROMX

TilesetGen1UndergroundGFX::
INCBIN "gfx/tilesets/gen1_underground.2bpp.lz"

TilesetGen1UndergroundMeta::
INCBIN "data/tilesets/gen1_underground_metatiles.bin"

TilesetGen1UndergroundColl::
INCLUDE "data/tilesets/gen1_underground_collision.asm"

SECTION "Gen 1 Tileset gen1_mart", ROMX

TilesetGen1MartGFX::
INCBIN "gfx/tilesets/gen1_mart.2bpp.lz"

TilesetGen1MartMeta::
INCBIN "data/tilesets/gen1_mart_metatiles.bin"

TilesetGen1MartColl::
INCLUDE "data/tilesets/gen1_mart_collision.asm"

SECTION "Gen 1 Tileset gen1_dojo", ROMX

TilesetGen1DojoGFX::
INCBIN "gfx/tilesets/gen1_dojo.2bpp.lz"

TilesetGen1DojoMeta::
INCBIN "data/tilesets/gen1_dojo_metatiles.bin"

TilesetGen1DojoColl::
INCLUDE "data/tilesets/gen1_dojo_collision.asm"

SECTION "Gen 1 Tileset gen1_museum", ROMX

TilesetGen1MuseumGFX::
INCBIN "gfx/tilesets/gen1_museum.2bpp.lz"

TilesetGen1MuseumMeta::
INCBIN "data/tilesets/gen1_museum_metatiles.bin"

TilesetGen1MuseumColl::
INCLUDE "data/tilesets/gen1_museum_collision.asm"

SECTION "Gen 1 Tileset gen1_forest_gate", ROMX

TilesetGen1ForestGateGFX::
INCBIN "gfx/tilesets/gen1_forest_gate.2bpp.lz"

TilesetGen1ForestGateMeta::
INCBIN "data/tilesets/gen1_forest_gate_metatiles.bin"

TilesetGen1ForestGateColl::
INCLUDE "data/tilesets/gen1_forest_gate_collision.asm"
