	object_const_def ; object_event constants
	const KKHOUSE1_BLACKBELT
	const KKHOUSE1_GRANNY

KikaiHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KKHouse1BBScript:
	jumptextfaceplayer KKHouse1BBText
	
KKHouse1GrannyScript:
	jumptextfaceplayer KKHouse1GrannyText
	
KKHouse1BBText:
	text "¡He hecho todo el"
	line "camino desde el"
	para "DOJO KARATE en"
	line "CIUDAD ALEAR para"
	para "entrenar en la"
	line "CALDERA!"
	done

KKHouse1GrannyText:
	text "Los artistas"
	line "marciales que"
	para "viajan buscan"
	line "hospedarse aquí,"
	cont "en mi humilde"
	cont "hogar."

	para "Puede que no lo"
	line "parezca, pero hace"
	para "muchos años yo"
	line "también venía a"
	cont "entrenar a la"
	cont "CALDERA."
	done
	

KikaiHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KIKAI_VILLAGE, 3
	warp_event  5,  7, KIKAI_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse1BBScript, -1
	object_event  7,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse1GrannyScript, -1
