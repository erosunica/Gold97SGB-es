	object_const_def ; object_event constants
	const KANTO_HOTEL_NURSE
	const KANTO_HOTEL_ROCKER
	const KANTO_HOTEL_JANINE
	const KANTO_HOTEL_CLERK

KantoHotel_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHotelJanine:
	jumptextfaceplayer KantoHotelJanineText

KantoHotelNurse:
	jumptextfaceplayer KantoHotelNurseText

KantoHotelRocker:
	jumptextfaceplayer KantoHotelRockerText
	
KantoHotelClerk:
	jumptextfaceplayer KantoHotelClerkText
	
KantoHotelClerkText:
	text "Lo siento, pero no"
	line "nos quedan"
	cont "habitaciones."
	done

KantoHotelJanineText:
	text "¡Mi novio y yo"
	line "estamos de"
	cont "vacaciones!"
	done

KantoHotelRockerText:
	text "Nunca había estado"
	line "en KANTO."

	para "Hay mucho que ver"
	line "por aquí."
	done

KantoHotelNurseText:
	text "¿#MON? No, este"
	line "hotel es para"
	cont "personas."

	para "Estamos llenos."
	done

KantoHotel_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  7, KANTO_REGION, 16
	warp_event  2,  7, KANTO_REGION, 33

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelNurse, -1
	object_event 10,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelRocker, -1
	object_event 12,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelJanine, -1
	object_event 14,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoHotelClerk, -1
