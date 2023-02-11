	object_const_def ; object_event constants
	const BLUEFORESTROUTE111GATE_OFFICER
	const BLUEFORESTROUTE111GATE_YOUNGSTER

BlueForestRoute111Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestRoute111GateOfficerScript:
	jumptextfaceplayer BlueForestRoute111GateOfficerText

BlueForestRoute111GateYoungsterScript:
	jumptextfaceplayer BlueForestRoute111GateYoungsterText

BlueForestRoute111GateOfficerText:
	text "NIHON es conocido"
	line "por tener aguas"
	cont "bravas en el"
	cont "norte."

	para "El mejor ejemplo"
	line "es la zona que"
	para "rodea la que"
	line "llaman ISLA"
	cont "REMOLINO."

	para "¡No vayas al norte"
	line "sin prepararte"
	cont "bien!"
	done

BlueForestRoute111GateYoungsterText:
	text "He oído que viven"
	line "#MON raros en"
	cont "ISLA REMOLINO."
	done

BlueForestRoute111Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_111, 3
	warp_event  5,  0, ROUTE_111, 4
	warp_event  4,  7, BLUE_FOREST, 9
	warp_event  5,  7, BLUE_FOREST, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BlueForestRoute111GateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestRoute111GateYoungsterScript, -1
