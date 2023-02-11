	object_const_def ; object_event constants
	const KOBANHOUSE_2_GURU

KobanHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanHouse2GuruScript:
	jumptextfaceplayer KobanHouse2GuruText
	
KobanHouse2GuruText:
	text "Se dice que los"
	line "#MON dragón aún"
	para "viven en la"
	line "MANDÍBULA DRAGÓN."

	para "Nunca he"
	line "encontrado ninguno"
	cont "pescando."

	para "Quizás haya que"
	line "tener algo mejor"
	cont "que una CAÑA"
	cont "VIEJA…"
	done

KobanHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KOBAN_ISLAND, 4
	warp_event  4,  7, KOBAN_ISLAND, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2, 3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanHouse2GuruScript, -1
