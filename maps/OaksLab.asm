	object_const_def ; object_event constants
	const OAKSOLDLAB_AIDE

OaksLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text
	
OaksLabPC:
	jumptext OaksLabPCText
	
OaksOldLabAideScript:
	jumptextfaceplayer OaksOldLabAideText
	
OaksOldLabAideText:
	text "¡Hola!"

	para "¡El PROF. OAK está"
	line "estudiando en"
	cont "PUEBLO SILENTE!"

	para "Me he quedado para"
	line "cuidar de su viejo"
	cont "LABORATORIO."
	done

OaksLabPoster1Text:
	text "Pulsa START para"
	line "acceder al MENÚ."
	done

OaksLabPoster2Text:
	text "La opción GUARDAR"
	line "está en el MENÚ."

	para "Utilízala con"
	line "frecuencia."
	done

OaksLabPCText:
	text "No está encendido…"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_REGION, 17
	warp_event  4,  7, KANTO_REGION, 18

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 1 ; object events
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OaksOldLabAideScript, -1

