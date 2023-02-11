	object_const_def ; object_event constants
	const AMAMITOWNSUPERRODHOUSE_FISHING_GURU

AmamiTownSuperRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiTownSuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	buttonsound
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf:
; unused
	jumpstd PictureBookshelfScript

OfferSuperRodText:
	text "Veo que te gusta"
	line "pescar."

	para "¡No tengo ninguna"
	line "duda!"

	para "¿A que tengo"
	line "razón?"
	done

GiveSuperRodText:
	text "Sí, sí. ¡Justo lo"
	line "que pensaba!"

	para "¡Aquí tienes!"
	line "Toma esto. Es"
	cont "una SÚPERCAÑA."
	done

GaveSuperRodText:
	text "Intenta pescar"
	line "allí donde veas"
	cont "agua."

	para "Recuerda: puedes"
	line "capturar #MON"
	para "diferentes usando"
	line "distintas CAÑAS."
	
	para "La SÚPERCAÑA es"
	line "la mejor de todas."
	done

DontWantSuperRodText:
	text "¿Eh? ¿Me engañan"
	line "mis ojos?"
	done

AmamiTownSuperRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 8
	warp_event  5,  7, AMAMI_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiTownSuperRodHouseFishingGuruScript, -1
