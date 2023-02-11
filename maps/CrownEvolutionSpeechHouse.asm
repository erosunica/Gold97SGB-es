	object_const_def ; object_event constants
	const CROWNEVOLUTIONSPEECHHOUSE_LASS

CrownEvolutionSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownEvolutionSpeechHouseLassScript:
	jumptextfaceplayer CrownEvolutionSpeechHouseLassText

CrownEvolutionSpeechHouseLassText:
	text "Hace muchos años,"
	line "mi madre me contó"
	para "la historia de un"
	line "#MON mítico que"
	para "aparecía como un"
	line "fuego atravesando"
	para "el cielo diurno,"
	line "dejando una estela"
	cont "de ardientes"
	cont "cenizas."
	
	para "De las cenizas de"
	line "ese #MON,"
	para "nacieron tres"
	line "bestias legenda-"
	cont "rias que se"
	cont "dispersaron por la"
	cont "tierra."
	
	para "A día de hoy,"
	line "nadie ha visto a"
	cont "esas bestias en"
	cont "persona."
	done

CrownEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BIRDON_TOWN, 10
	warp_event  5,  7, BIRDON_TOWN, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownEvolutionSpeechHouseLassScript, -1
