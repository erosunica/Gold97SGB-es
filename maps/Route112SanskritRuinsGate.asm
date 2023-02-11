	object_const_def ; object_event constants
	const ROUTE112SANSKRITRUINSGATE_OFFICER
	const ROUTE112SANSKRITRUINSGATE_POKEFAN_M
	const ROUTE112SANSKRITRUINSGATE_YOUNGSTER

Route112SanskritRuinsGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route112SanskritRuinsGateOfficerScript:
	jumptextfaceplayer Route112SanskritRuinsGateOfficerText

Route112SanskritRuinsGatePokefanMScript:
	jumptextfaceplayer Route112SanskritRuinsGatePokefanMText

Route112SanskritRuinsGateYoungsterScript:
	jumptextfaceplayer Route112SanskritRuinsGateYoungsterText

Route112SanskritRuinsGateOfficerText:
	text "RUINAS ALFA"

	para "Lugar turístico"
	line "para observar y"
	cont "tocar."

	para "¡Intenta mover los"
	line "paneles de piedra!"
	done

Route112SanskritRuinsGatePokefanMText:
	text "¿Estás estudiando"
	line "las RUINAS?"

	para "Podrías dedicarte"
	line "a la ciencia."
	done

Route112SanskritRuinsGateYoungsterText:
	text "Hay dibujos en los"
	line "paneles de piedra."

	para "Intenté moverlos."
	line "Me pregunto qué"
	cont "serán."
	done

Route112SanskritRuinsGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, SANSKRIT_RUINS_OUTSIDE, 10
	warp_event  0,  5, SANSKRIT_RUINS_OUTSIDE, 11
	warp_event  9,  4, ROUTE_112, 2
	warp_event  9,  5, ROUTE_112, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route112SanskritRuinsGateOfficerScript, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route112SanskritRuinsGatePokefanMScript, -1
	object_event  1,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route112SanskritRuinsGateYoungsterScript, -1
