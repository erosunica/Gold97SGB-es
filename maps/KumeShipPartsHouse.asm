	object_const_def ; object_event constants
	const KUMESHIPPARTSHOUSE_GURU

KumeShipPartsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuelLineGuruScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .SSAquaDoingGreat
	checkevent EVENT_GOT_FUEL_LINE
	iffalse .GiveCard
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	end
	
.SSAquaDoingGreat
	writetext SSAquaDoingGreatText
	waitbutton
	closetext
	end
	
.GiveCard
	writetext YouNeedAFuelLine
	waitbutton
	verbosegiveitem CARD_KEY
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	setevent EVENT_GOT_FUEL_LINE
	end
	
SSAquaDoingGreatText:
	text "¡Hola chico!"

	para "¡He oído que el"
	line "S.S.AQUA está"
	para "surcando los mares"
	line "como nunca!"
	done

YouNeedAFuelLine:
	text "¡Anda, hola!"

	para "¿Necesitas piezas"
	line "para embarcaciones"
	cont "marítimas?"

	para "¡Yo soy tu hombre!"

	para "…"

	para "¡Oh, vaya!"

	para "¿El S.S.AQUA"
	line "necesita un nuevo"
	cont "TUBO COMBUSTIBLE?"

	para "Claro, ¡ese barco"
	line "es una maravilla"
	cont "moderna!"

	para "Te daré la pieza"
	line "que necesitas,"
	cont "¡y gratis!"
	done

AlreadyGotFuelLineText:
	text "Muy bien, chico."
	line "¡Esto debe de ser"
	cont "lo que necesitan!"

	para "¡Serás un héroe"
	line "para toda la"
	cont "tripulación!"
	done

KumeShipPartsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KUME_CITY, 3
	warp_event  3,  7, KUME_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuelLineGuruScript, -1
