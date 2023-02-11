	object_const_def ; object_event constants
	const BLUE_FORESTDRAGONSPEECHHOUSE_GRANNY
	const BLUE_FORESTDRAGONSPEECHHOUSE_SLOWPOKE

BlueForestDragonSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestDragonSpeechHouseGrannyScript:
	jumptextfaceplayer BlueForestDragonSpeechHouseGrannyText

BlueForestDragonSpeechHouseDratiniScript:
	opentext
	writetext BlueForestDragonSpeechHouseDratiniText
	cry SLOWPOKE
	waitbutton
	closetext
	end

; unused
BlueForestDragonSpeechHousePictureBookshelf:
	jumpstd PictureBookshelfScript

; unused
BlueForestDragonSpeechHouseMagazineBookshelf:
	jumpstd MagazineBookshelfScript

BlueForestDragonSpeechHouseGrannyText:
	text "Al norte del"
	line "pueblo, en el"
	para "océano, se halla"
	line "la ISLA REMOLINO."

	para "Se le llama así"
	line "por los remolinos"
	cont "que la rodean."

	para "Es un peligroso"
	line "laberinto en el"
	cont "que es fácil"
	cont "perderse."

	para "Debes saber lo que"
	line "haces si piensas"
	cont "ir a explorarla."
	done

BlueForestDragonSpeechHouseDratiniText:
	text "SLOWPOKE: ¿Slow?"
	done

BlueForestDragonSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BLUE_FOREST, 2
	warp_event  4,  7, BLUE_FOREST, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestDragonSpeechHouseGrannyScript, -1
	object_event  5,  5, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, BlueForestDragonSpeechHouseDratiniScript, -1
