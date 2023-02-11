	object_const_def ; object_event constants
	const ALLOYGOODRODHOUSE_FISHING_GURU

AlloyGoodRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
; unused
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "El canal que pasa"
	line "a través de la"
	para "ciudad es un sitio"
	line "popular para"
	cont "pescar."

	para "¿No te gustaría"
	line "tener una CAÑA y"
	cont "pescar ahí?"
	done

GiveGoodRodText:
	text "¡Ah, ja, ja! ¡Ya"
	line "tenemos alguien"
	cont "más que pesca!"
	done

GaveGoodRodText:
	text "No sólo hay peces"
	line "en el mar. Allá"
	para "donde haya agua"
	line "los encontrarás."
	done

DontWantGoodRodText:
	text "¿Quééé? ¿¡No te"
	line "gusta pescar!?"
	cont "¡Incomprensible!"
	done

HaveGoodRodText:
	text "¿Qué tal va todo?"
	line "¿Pica el grande?"
	done

AlloyGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 6
	warp_event  5,  7, ALLOY_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
