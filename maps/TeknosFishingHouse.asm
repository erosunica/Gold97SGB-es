	object_const_def ; object_event constants
	const TEKNOSFISHINGHOUSE_FISHER

TeknosFishingHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


BlisseySpeechHouseRadio:
	jumpstd Radio2Script
	

TeknosFishingHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext TeknosFishingHouseFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext TeknosFishingHouseFishingGuruText_Yes
	buttonsound
	verbosegiveitem OLD_ROD
	writetext TeknosFishingHouseFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext TeknosFishingHouseFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext TeknosFishingHouseFishingGuruText_After
	waitbutton
	closetext
	end


TeknosFishingHouseFishingGuruText_Question:
	text "El río de la RUTA"
	line "119 es un punto de"
	cont "pesca popular."
	
	para "¿Quieres pescar?"

	para "¿Quieres una de"
	line "mis CAÑAS?"
	done

TeknosFishingHouseFishingGuruText_Yes:
	text "Eso está bien."

	para "¡Ahora ya puedes"
	line "pescar!"
	done

TeknosFishingHouseFishingGuruText_GiveOldRod:
	text "¡Pescar es genial!"

	para "Si ves agua, ya"
	line "sea el mar o un"
	cont "río, utiliza tu"
	cont "CAÑA."
	done

TeknosFishingHouseFishingGuruText_No:
	text "¡Vaya! Me has"
	line "decepcionado…"
	done

TeknosFishingHouseFishingGuruText_After:
	text "Hola."
	line "¿Están picando?"
	done

TeknosFishingHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 4
	warp_event  5,  7, TEKNOS_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BlisseySpeechHouseRadio

	db 1 ; object events
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosFishingHouseFishingGuruScript, -1
