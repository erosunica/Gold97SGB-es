	object_const_def ; object_event constants
	const WESTPORTPPSPEECHHOUSE_FISHER
	const WESTPORTPPSPEECHHOUSE_LASS


WestportPPSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportPPSpeechHouseFisherScript:
	jumptextfaceplayer WestportPPSpeechHouseFisherText

WestportPPSpeechHouseLassScript:
	jumptextfaceplayer WestportPPSpeechHouseLassText

WestportPPSpeechHouseBookshelf2:
	jumpstd DifficultBookshelfScript

WestportPPSpeechHouseBookshelf1:
	jumpstd MagazineBookshelfScript

WestportPPSpeechHouseRadio:
	jumpstd Radio2Script

WestportPPSpeechHouseFisherText:
	text "Un día estaba"
	line "luchando y mis"

	para "#MON no se"
	line "podían mover."

	para "Sus movimientos no"
	line "tenían ningún"

	para "PUNTO de PODER"
	line "o PP."
	done

WestportPPSpeechHouseLassText:
	text "A veces, un"
	line "#MON sano no"
	para "puede usar sus"
	line "movimientos."

	para "Si ocurre esto,"
	line "cúralo en el"

	para "CENTRO #MON"
	line "o usa un objeto."
	done

WestportPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, WESTPORT_CITY, 13
	warp_event  5,  7, WESTPORT_CITY, 13

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  1, BGEVENT_READ, WestportPPSpeechHouseBookshelf1
	bg_event  5,  1, BGEVENT_READ, WestportPPSpeechHouseBookshelf2
	bg_event  6,  1, BGEVENT_READ, WestportPPSpeechHouseRadio

	db 2 ; object events
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportPPSpeechHouseFisherScript, -1
	object_event  1,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPPSpeechHouseLassScript, -1
