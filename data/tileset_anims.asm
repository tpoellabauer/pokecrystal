MACRO tileframe
	if _NARG == 2
		dw \2 ; argument
	else
		dw 0
	endc
	dw \1 ; function
ENDM

Tileset0Anim:
TilesetJohtoModernAnim:
TilesetKantoAnim:
	tileframe AnimateWaterTile,        vTiles2 tile $14
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateWaterPalette
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetParkAnim:
	tileframe AnimateWaterTile,        vTiles2 tile $14
	tileframe WaitTileAnimation
	tileframe AnimateFountainTile,     vTiles2 tile $5f
	tileframe WaitTileAnimation
	tileframe AnimateWaterPalette
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetForestAnim:
	tileframe ForestTreeLeftAnimation
	tileframe ForestTreeRightAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe ForestTreeLeftAnimation2
	tileframe ForestTreeRightAnimation2
	tileframe AnimateFlowerTile
	tileframe AnimateWaterTile,        vTiles2 tile $14
	tileframe AnimateWaterPalette
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohtoAnim:
	tileframe AnimateWaterTile,        vTiles2 tile $14
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateWaterPalette
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe AnimateWhirlpoolTile,    WhirlpoolFrames1
	tileframe AnimateWhirlpoolTile,    WhirlpoolFrames2
	tileframe AnimateWhirlpoolTile,    WhirlpoolFrames3
	tileframe AnimateWhirlpoolTile,    WhirlpoolFrames4
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

UnusedTilesetFlowerAnim: ; unreferenced
; Leftover from pokegold-spaceworld.
; Scrolls tile $03 like cave water, but also has the standard $03 flower tile.
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $03
	tileframe ScrollTileRightLeft,     wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $03
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

UnusedTilesetWaterAnim: ; unreferenced
; Leftover from pokegold-spaceworld.
; Scrolls tile $14 like cave water.
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $14
	tileframe ScrollTileRightLeft,     wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $14
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

TilesetPortAnim:
	tileframe AnimateWaterTile,        vTiles2 tile $14
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateWaterPalette
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetEliteFourRoomAnim:
	tileframe AnimateLavaBubbleTile2
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateLavaBubbleTile1
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

UnusedTilesetGenericAnim: ; unreferenced
; Leftover from pokegold-spaceworld.
; Scrolls tile $53 like a waterfall; scrolls tile $03 like cave water.
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $53
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $53
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $03
	tileframe ScrollTileRightLeft,     wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $03
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $53
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $53
	tileframe DoneTileAnimation

UnusedTilesetFontAnim: ; unreferenced
; Leftover from pokegold-spaceworld.
; Scrolls tile $54 like a waterfall; scrolls tile $03 like cave water.
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $54
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $54
	tileframe WaitTileAnimation
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $03
	tileframe ScrollTileRightLeft,     wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $03
	tileframe WaitTileAnimation
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $54
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $54
	tileframe DoneTileAnimation

TilesetCaveAnim:
TilesetDarkCaveAnim:
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $14
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileRightLeft,     wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $14
	tileframe FlickeringCaveEntrancePalette
	tileframe AnimateWaterPalette
	tileframe FlickeringCaveEntrancePalette
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $40
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $40
	tileframe FlickeringCaveEntrancePalette
	tileframe DoneTileAnimation

TilesetIcePathAnim:
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $35
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileRightLeft,     wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $35
	tileframe FlickeringCaveEntrancePalette
	tileframe AnimateWaterPalette
	tileframe FlickeringCaveEntrancePalette
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $31
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,          wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $31
	tileframe FlickeringCaveEntrancePalette
	tileframe DoneTileAnimation

TilesetTowerAnim:
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer9
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer10
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer7
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer8
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer5
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer6
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer3
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer4
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer1
	tileframe AnimateTowerPillarTile,  TowerPillarTilePointer2
	tileframe StandingTileFrame
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

UnusedTilesetRocketHouseAnim: ; unreferenced
; Leftover from pokegold-spaceworld.
; Scrolls tile $4f like cave water.
	tileframe ReadTileToAnimBuffer,    vTiles2 tile $4f
	tileframe ScrollTileRightLeft,     wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer, vTiles2 tile $4f
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

TilesetBattleTowerOutsideAnim:
TilesetHouseAnim:
TilesetPlayersHouseAnim:
TilesetPokecenterAnim:
TilesetGateAnim:
TilesetLabAnim:
TilesetFacilityAnim:
TilesetMartAnim:
TilesetMansionAnim:
TilesetGameCornerAnim:
TilesetTraditionalHouseAnim:
TilesetTrainStationAnim:
TilesetChampionsRoomAnim:
TilesetLighthouseAnim:
TilesetPlayersRoomAnim:
TilesetPokeComCenterAnim:
TilesetBattleTowerInsideAnim:
TilesetRuinsOfAlphAnim:
TilesetRadioTowerAnim:
TilesetUndergroundAnim:
TilesetBetaWordRoomAnim:
TilesetHoOhWordRoomAnim:
TilesetKabutoWordRoomAnim:
TilesetOmanyteWordRoomAnim:
TilesetAerodactylWordRoomAnim:
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

TilesetGen1OverworldAnim:
	tileframe DoneTileAnimation

TilesetGen1RedsHouseAnim:
	tileframe DoneTileAnimation

TilesetGen1HouseAnim:
	tileframe DoneTileAnimation

TilesetGen1LabAnim:
	tileframe DoneTileAnimation

TilesetGen1PokecenterAnim:
	tileframe DoneTileAnimation

TilesetGen1GymAnim:
	tileframe DoneTileAnimation

TilesetGen1ForestAnim:
	tileframe DoneTileAnimation

TilesetGen1GateAnim:
	tileframe DoneTileAnimation

TilesetGen1ShipAnim:
	tileframe DoneTileAnimation

TilesetGen1ShipPortAnim:
	tileframe DoneTileAnimation

TilesetGen1CemeteryAnim:
	tileframe DoneTileAnimation

TilesetGen1InteriorAnim:
	tileframe DoneTileAnimation

TilesetGen1CavernAnim:
	tileframe DoneTileAnimation

TilesetGen1LobbyAnim:
	tileframe DoneTileAnimation

TilesetGen1MansionAnim:
	tileframe DoneTileAnimation

TilesetGen1ClubAnim:
	tileframe DoneTileAnimation

TilesetGen1FacilityAnim:
	tileframe DoneTileAnimation

TilesetGen1PlateauAnim:
	tileframe DoneTileAnimation

TilesetGen1UndergroundAnim:
	tileframe DoneTileAnimation

TilesetGen1MartAnim:
	tileframe DoneTileAnimation

TilesetGen1DojoAnim:
	tileframe DoneTileAnimation

TilesetGen1MuseumAnim:
	tileframe DoneTileAnimation

TilesetGen1ForestGateAnim:
	tileframe DoneTileAnimation
