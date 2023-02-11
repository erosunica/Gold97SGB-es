	object_const_def ; object_event constants
	const KANTOHOUSE_3_GRANNY
	const KANTOHOUSE_3_GRAMPS

KantoHouse3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHouse3Granny:
	jumptextfaceplayer KantoHouse3GrannyText
	
KantoHouse3Gramps:
	jumptextfaceplayer KantoHouse3GrampsText
	
KantoHouse3GrannyText:
	text "Mi querido marido"
	line "y yo hemos vivido"
	cont "aquí durante"
	cont "décadas."

	para "Me hace muy feliz"
	line "haber pasado este"
	cont "tiempo con él."
	done

KantoHouse3GrampsText:
	text "Mi amada esposa y"
	line "yo fuimos grandes"
	cont "entrenadores hace"
	cont "tiempo."

	para "Pero ahora pasamos"
	line "los días aquí"
	para "juntos, y no"
	line "podría ser más"
	cont "feliz."
	done


KantoHouse3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 26
	warp_event  5,  7, KANTO_REGION, 26

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse3Granny, -1
	object_event  7,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse3Gramps, -1
