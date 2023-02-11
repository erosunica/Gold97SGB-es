	object_const_def ; object_event constants
	const KANTOMANSION2F_DEVELOPER

KantoMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansion2FComputer:
	jumptext KantoMansion2FComputerText

KantoMansion2FMeetingRoomSign:
	jumptext KantoMansion2FMeetingRoomSignText

KantoMansion2FBookshelf:
	jumpstd DifficultBookshelfScript
	
KantoMansionClerk:
	jumptextfaceplayer KantoMansionClerkText
	
KantoMansionClerkText:
	text "¡Hola! ¡Soy el"
	line "desarrollador!"

	para "El otro."

	para "Ese del que los de"
	line "arriba no querrían"
	cont "saber nada."

	para "¡Muchas gracias"
	line "por jugar y haber"
	cont "llegado hasta"
	cont "aquí!"

	para "He trabajado muy"
	line "duro en ello."

	para "Intenté que se"
	line "sintiese lo más"
	cont "auténtico posible."

	para "Quitando esta"
	line "ruptura de la"
	cont "cuarta pared,"
	cont "claro."
	done

KantoMansion2FComputerText:
	text "Es un ordenador"
	line "con un montón de"
	para "ventanas abiertas"
	line "de Paint, BGB,"
	para "Explorer,"
	line "Polished Map y"
	cont "Notepad++."
	done

KantoMansion2FMeetingRoomSignText:
	text "SALA DE REUNIONES"
	line "DE GAME FREAK"
	done

KantoMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, KANTO_MANSION_1F, 4
	warp_event  4,  0, KANTO_MANSION_3F, 2
	warp_event  6,  0, KANTO_MANSION_3F, 3
	warp_event  7,  0, KANTO_MANSION_1F, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  6, BGEVENT_READ, KantoMansion2FComputer
	bg_event  4,  9, BGEVENT_UP, KantoMansion2FMeetingRoomSign
	bg_event  0,  1, BGEVENT_READ, KantoMansion2FBookshelf
	bg_event  1,  6, BGEVENT_READ, KantoMansion2FComputer


	db 1 ; object events
	object_event  2,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoMansionClerk, -1
