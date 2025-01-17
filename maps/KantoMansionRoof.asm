	object_const_def ; object_event constants
	const KANTOMANSIONROOF_FISHER

KantoMansionRoof_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansionRoofFisherScript:
	jumptextfaceplayer KantoMansionRoofFisherText

KantoMansionRoofGraffiti:
	jumptext KantoMansionRoofGraffitiText

KantoMansionRoofFisherText:
	text "Las alturas…"
	line "¡me encantan!"

	para "¡Me atrevería a"
	line "decir que lo único"
	para "que ama las"
	line "alturas tanto como"
	cont "yo es el humo!"
	done

KantoMansionRoofGraffitiText:
	text "Hay un graffiti"
	line "en la pared…"

	para "¡<PLAYER> añadió"
	line "un bigote!"
	done

KantoMansionRoof_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  1, KANTO_MANSION_3F, 1
	warp_event  6,  1, KANTO_MANSION_3F, 4
	warp_event  2,  7, KANTO_MANSION_ROOF_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  0,  6, BGEVENT_LEFT, KantoMansionRoofGraffiti

	db 1 ; object events
	object_event  1,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoMansionRoofFisherScript, -1
