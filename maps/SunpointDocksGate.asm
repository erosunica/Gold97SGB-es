	object_const_def ; object_event constants
	const SUNPOINTDOCKSGATE_OFFICER

SunpointDocksGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SunpointDocksGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iftrue .NoMoreBadBoat
	writetext SunpointDocksGateOfficerRocketsText
	waitbutton
	closetext
	end

.NoMoreBadBoat:
	writetext SunpointDocksGateOfficerGoodText
	waitbutton
	closetext
	end

SunpointDocksGateOfficerRocketsText:
	text "Está pasando algo"
	line "raro en el MUELLE."

	para "Unos tipos miste-"
	line "riosos han estado"
	para "trayendo bastante"
	line "carga cubierta por"
	cont "este acceso."

	para "No parece nada en"
	line "contra de la ley,"
	para "así que no deberia"
	line "meterme en esto…"
	para "Pero me ponen de"
	line "los nervios…"
	done

SunpointDocksGateOfficerGoodText:
	text "El MUELLE CALORINA"
	line "siempre está hasta"
	cont "arriba de gente."

	para "Es muy buen lugar"
	line "para verla pasar."
	done

SunpointDocksGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SUNPOINT_DOCKS, 2
	warp_event  5,  0, SUNPOINT_DOCKS, 3
	warp_event  4,  7, SUNPOINT_CITY, 8
	warp_event  5,  7, SUNPOINT_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SunpointDocksGateOfficerScript, -1
