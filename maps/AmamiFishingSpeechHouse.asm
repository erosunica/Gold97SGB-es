	object_const_def ; object_event constants
	const AMAMIFISHINGSPEECHHOUSE_FISHING_GURU

AmamiFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Soy el GURÚ PESCA-"
	line "DOR, el mayor de"
	para "los HERMANOS"
	line "PESCADORES."

	para "¿Sabes quién es el"
	line "PESCADOR DAVID?"
	para "Suele pescar en la"
	line "RUTA 44."

	para "Me contó un truco"
	line "asombroso por"
	cont "teléfono."

	para "Gracias a él,"
	line "capturé un montón"
	para "de #MON raros."
	line "¡Menudo día fue"
	cont "ese!"
	done

FishingDudesHousePhotoText:
	text "Es una foto de"
	line "gente pescando…"

	para "Lo están pasando"
	line "muy bien…"
	done

AmamiFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AMAMI_TOWN, 1
	warp_event  3,  7, AMAMI_TOWN, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
