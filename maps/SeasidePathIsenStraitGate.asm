	object_const_def ; object_event constants
	const SEASIDEPATHISENSTRAITGATE_OFFICER
	const SEASIDEPATHISENSTRAITGATE_BUG_CATCHER

SeasidePathIsenStraitGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SeasidePathIsenStraitGateOfficerScript:
	jumptextfaceplayer SeasidePathIsenStraitGateOfficerText

SeasidePathIsenStraitGateBugCatcherScript:
	jumptextfaceplayer SeasidePathIsenStraitGateBugCatcherText
	
SeasidePathIsenStraitGateBugCatcherText:
	text "Los #MON"
	line "salvajes de aquí"
	cont "son muy fuertes."

	para "Mucho más que los"
	line "del continente,"
	cont "diría yo."
	done

SeasidePathIsenStraitGateOfficerText:
	text "He oído que el"
	line "ESTRECHO ISEN"
	para "esconde restos"
	line "ocultos de"
	para "experimentos"
	line "secretos para"
	cont "crear un #MON"
	cont "artificial."

	para "¿Qué podría"
	line "significar eso?"
	done



SeasidePathIsenStraitGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ISEN_STRAIT, 1
	warp_event  1,  7, ISEN_STRAIT, 1
	warp_event  8,  7, SEASIDE_PATH, 1
	warp_event  9,  7, SEASIDE_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeasidePathIsenStraitGateOfficerScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeasidePathIsenStraitGateBugCatcherScript, -1
