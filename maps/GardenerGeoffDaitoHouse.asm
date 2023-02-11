	object_const_def ; object_event constants
	const DAITOHOUSE_GEOFFREY
	const DAITOHOUSE_GNOTE

GardenerGeoffDaitoHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GeoffInsideScript:
	faceplayer
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue gotjuiceoutside
	opentext
	writetext GeoffInsideMeetText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse NoRoomGeoff
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
gotjuiceoutside:
	opentext
	writetext WantFactText
	yesorno
	iffalse EndConvo
	random 5
	jump GeoffJumptable
EndConvo:
	writetext AhOkText
	waitbutton
NoRoomGeoff:
	closetext
	end
	
GeoffJumptable:
	ifequal 0, papayas
	ifequal 1, coconuts
	ifequal 2, mangoes
	ifequal 3, bananas
	ifequal 4, pineapples
	
papayas:
	writetext PapayaText
	waitbutton
	jump NoRoomGeoff
	
	
WantFactText:
	text "¿Quieres que te"
	line "hable sobre"
	para "algunas de las"
	line "frutas tropicales"
	para "que he estado"
	line "cultivando?"
	done

AhOkText:
	text "Está bien. Tal vez"
	line "en otro momento."
	done

PapayaText:
	text "Las papayas son"
	line "unas de las frutas"
	para "tropicales más"
	line "fáciles de"
	cont "cultivar."

	para "Lo único que"
	line "tienes que hacer"
	para "es arrojar las"
	line "semillas en tu"
	cont "jardín y verlas"
	cont "crecer."

	para "¡Germinan tan bien"
	line "que es como ver"
	cont "crecer la hierba!"

	para "Las plantas macho"
	line "no producen fruto,"
	para "así que no dudes"
	line "en cortarlas."
	done
	
coconuts:
	writetext CoconutText
	waitbutton
	jump NoRoomGeoff
	
CoconutText:
	text "La gente suele"
	line "pensar que los"
	para "cocos son esferas"
	line "marrones y"
	cont "peludas."

	para "En realidad, sólo"
	line "tienen ese aspecto"
	para "cuando se les"
	line "quita la cáscara"
	cont "densa y fibrosa."

	para "La mejor manera de"
	line "descascarar un"
	para "coco es con la"
	line "garra de un marti-"
	para "llo de carpintero,"
	line "abriendo a golpes"
	para "la cáscara y luego"
	line "separándola en"
	cont "partes."

	para "Este truco te"
	line "vendrá bien si"
	para "acabas naufragando"
	line "en una isla con un"
	cont "carpintero."
	done
	
mangoes:
	writetext MangoText
	waitbutton
	jump NoRoomGeoff
	
MangoText:
	text "Los mangos tardan"
	line "unos cuantos meses"
	para "en madurar"
	line "completamente en"
	cont "el árbol."

	para "Y los árboles"
	line "pueden tardar años"
	para "en crecer lo"
	line "suficiente como"
	cont "para dar un solo"
	cont "mango."

	para "Algunas culturas"
	line "comen los mangos"
	cont "inmaduros."

	para "Son ascórbicos, y"
	line "morderlos es un"
	cont "suplicio."

	para "¡Yo me los como"
	line "así de todas"
	para "formas porque no"
	line "tengo paciencia!"
	done
	
	
bananas:
	writetext BananaText
	waitbutton
	jump NoRoomGeoff
	
BananaText:
	text "Los plátanos son"
	line "una de las frutas"
	cont "más reconocibles."

	para "¿Pero sabías que"
	line "los plátanos que"
	para "ves en el"
	line "supermercado son"
	cont "genéticamente"
	cont "idénticos?"

	para "Los cultivos"
	line "comerciales de"
	para "plátano no tienen"
	line "semillas debido a"
	para "la domesticación,"
	line "por lo que deben"
	cont "propagarse por el"
	cont "tallo."

	para "¡Significa que"
	line "todos los platane-"
	para "ros que veas en un"
	line "cultivo son"
	cont "prácticamente"
	cont "idénticos!"

	para "Hubo una vez que"
	line "una plaga provocó"
	para "la extinción por"
	line "completo de un"
	para "cultivar de"
	line "plátanos, ¡así que"
	para "los productores"
	line "tuvieron que"
	para "cambiar a uno que"
	line "fuese inmune!"
	done
	
	
	
pineapples:
	writetext PineappleText
	waitbutton
	jump NoRoomGeoff

PineappleText:
	text "Al igual que los"
	line "plátanos, ¡la"
	para "mayoría de las"
	line "piñas son iguales"
	para "debido a su forma"
	line "de propagación!"

	para "Prueba esto en"
	line "casa si vives en"
	para "un lugar lo"
	line "bastante cálido:"

	para "Guarda la parte"
	line "superior de la"
	para "piña que hayas"
	line "comprado y"
	cont "plántala."

	para "Riégala, cuídala"
	line "bien y pronto la"
	para "verás crecer de"
	line "nuevo, ¡e incluso"
	para "le saldrá una"
	line "nueva piña!"

	para "Repite el proceso"
	line "para tener tantas"
	cont "piñas como"
	cont "quieras."
	done

GeoffInsideMeetText:
	text "Oye, ¿no nos"
	line "conocimos en la"
	cont "RUTA 104?"

	para "Era agotador"
	line "cultivar en el"
	para "desierto, ¡así que"
	line "vine a trabajar"
	cont "en este RANCHO!"

	para "Ya que te has"
	line "tomado la molestia"
	para "de venir hasta"
	line "aquí para verme,"
	para "¡a esta bebida"
	line "invita la casa!"
	done


GeoffOutNote:
	jumptext GeoffOutNoteText
	
GeoffOutNoteText:
	text "Salí a buscar"
	line "provisiones,"
	cont "volveré por la"
	cont "tarde."

	para "Firmado:"
	line "GODOFREDO"
	done

GardenerGeoffDaitoHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 3
	warp_event  5,  7, DAITO_RANCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN,0, 0, -1, NITE, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GeoffInsideScript, -1
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, MORN, PAL_OW_GRAY, OBJECTTYPE_SCRIPT, 0, GeoffOutNote, -1
