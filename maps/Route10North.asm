Route10North_MapScripts:
	def_scene_scripts

	def_callbacks

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  1, ROUTE_10_POKECENTER_1F, 1
	warp_event  3,  9, POWER_PLANT, 1
	; Gen 1 geometry (issue #65): Route10's real Rock Tunnel entrance
	; (pokeredDisassembly warp_event 8, 17, ROCK_TUNNEL_1F, 1) -- carved into the
	; mountain-wall block (8,3) as blockid $06, the same Kanto-tileset cave-mouth
	; blockid SilverCaveOutside's own warp already uses.
	warp_event 16,  7, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, PowerPlantSign
	bg_event 12,  1, BGEVENT_READ, Route10PokecenterSign

	def_object_events
