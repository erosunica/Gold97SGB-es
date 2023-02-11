	object_const_def ; object_event constants
	const ROUTE103WESTPORTGATE_OFFICER
	const ROUTE103WESTPORTGATE_POKEFAN_F
	const ROUTE103WESTPORTGATE_FISHER

Route103WestportGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RandyScript:
	faceplayer
	opentext
	writetext UnknownText_0x69ddd
	waitbutton
	closetext
	end
	
GiftSpearowMail:
	db FLOWER_MAIL
	db   "CUEVA OSCURA lleva"
	next "a otro camino@"

GiftSpearowName:
	db "ESPI@"

GiftSpearowOTName:
	db "LUCAS@"

	db 0 ; filler

Route103WestportGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FoughtBellignan
	writetext Route103WestportGatePokefanFText
	waitbutton
	closetext
	end

.FoughtBellignan
	writetext Route103WestportGatePokefanFText_FoughtBellignan
	waitbutton
	closetext
	end

Route103WestportGateFisherScript:
	jumptextfaceplayer Route103WestportGateFisherText

UnknownText_0x69ddd:
	text "CIUDAD PONIENTE"
	line "me aburre."
	
	para "A todo el mundo le"
	line "encanta la ciudad,"
	para "pero me gustaría"
	line "vivir en un sitio"
	cont "tranquilo."
	done

UnknownText_0x69e48:
	text "¿Lo harás? Genial."
	line "¡Gracias, joven!"

	para "Mi amigo es un"
	line "chico gordinflón"
	para "que siempre está"
	line "durmiendo."

	para "¡Le reconocerás"
	line "enseguida!"
	done

UnknownText_0x69eb8:
	text "<PLAYER> recibió"
	line "#MON con CARTA."
	done

UnknownText_0x69ed6:
	text "Puedes leerla,"
	line "¡pero no la"
	cont "pierdas! ¡RUTA 31!"

	para "Ah, sí. Un extraño"
	line "árbol bloqueaba el"
	cont "camino."

	para "¿Lo habrán"
	line "retirado ya?"
	done

UnknownText_0x69f56:
	text "No puedes llevar"
	line "otro #MON…"
	done

UnknownText_0x69f74:
	text "¡Oh…! Entonces,"
	line "no importa…"
	done

UnknownText_0x69f8b:
	text "¡Gracias, joven!"
	line "¡Muchas gracias"
	para "por habérselo"
	line "llevado!"

	para "¡Toma esto por"
	line "las molestias!"
	done

UnknownText_0x69fd9:
	text "¿A que mi amigo"
	line "estaba durmiendo?"
	cont "Te lo dije."
	done

Route103WestportGatePokefanFText:
	text "El sitio al norte"
	line "de aquí suele ser"
	para "inestable por la"
	line "falta de follaje."
	
	para "El camino ha sido"
	line "bloqueado por un"
	cont "desplome de rocas."
	
	para "No creo que puedas"
	line "ir ahora hacia"
	cont "allí."
	done

Route103WestportGatePokefanFText_FoughtBellignan:
	text "El camino ya está"
	line "despejado."
	
	para "Menos mal, porque"
	line "los viajeros"
	para "querían visitar"
	line "PUEBLO BIRDON."
	done

Route103WestportGateFisherText:
	text "Me pregunto"
	line "cuántos tipos de"

	para "#MON hay en"
	line "el mundo."

	para "Hace un año, el"
	line "PROF. OAK dijo que"
	para "había 150 tipos"
	line "distintos."
	done

Route103WestportGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_103, 1
	warp_event  5,  0, ROUTE_103, 2
	warp_event  4,  7, WESTPORT_CITY, 7
	warp_event  5,  7, WESTPORT_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route103WestportGatePokefanFScript, -1
	object_event  6,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103WestportGateFisherScript, -1
