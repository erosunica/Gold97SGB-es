	object_const_def ; object_event constants
	const KKHOUSE2_GRAMPS

KikaiHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KKHouse2GrampsScript:
	jumptextfaceplayer KKHouse2GrampsText
	
KKHouse2GrampsText:
	text "Un hombre llamado"
	line "BRUNO entrena en"
	cont "la cima de la"
	cont "CALDERA."

	para "Es mucho más fuer-"
	line "te que cualquier"
	para "otro luchador que"
	line "haya venido a"
	cont "entrenar aquí."

	para "De hecho, ¡es un"
	line "miembro de reserva"
	para "del ALTO MANDO de"
	line "la LIGA de NIHON!"
	done

KikaiHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KIKAI_VILLAGE, 4
	warp_event  5,  7, KIKAI_VILLAGE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse2GrampsScript, -1
