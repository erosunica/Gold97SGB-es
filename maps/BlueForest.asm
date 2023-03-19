	object_const_def ; object_event constants
	const BLUE_FOREST_BLACK_BELT
	const BLUE_FOREST_COOLTRAINER_F1
	const BLUE_FOREST_YOUNGSTER1
	const BLUE_FOREST_SANTOS
	const BLUE_FOREST_COOLTRAINER_F2

BlueForest_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLUE_FOREST
	return

.Santos:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLUE_FOREST_SANTOS
	return

.SantosAppears:
	appear BLUE_FOREST_SANTOS
	return

BlueForestBlackBeltScript:
	jumptextfaceplayer BlackBeltText_WeirdRadio



BlueForestCooltrainerF1Script:
	jumptextfaceplayer BlueForestCooltrainerF1Text

BlueForestYoungsterScript:
	jumptextfaceplayer BlueForestYoungsterText

BlueForestCooltrainerF2Script:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iffalse .HotshotWow
	writetext BlueForestCooltrainerF2TextNotWow
	waitbutton
	closetext
	end
	
.HotshotWow
	writetext BlueForestCooltrainerF2Text
	waitbutton
	closetext
	end

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlueForestSign:
	jumptext BlueForestSignText

BlueForestGymSign:
	jumptext BlueForestGymSignText

DeepwaterPassageSign:
	jumptext DeepwaterPassageSignText

BlueForestPokecenterSign:
	;setmapscene ROUTE_112_STAND_GATE, SCENE_DEFAULT
	;clearevent EVENT_SILVER_IN_STAND_GATE
	jumpstd PokecenterSignScript

BlueForestMartSign:
	jumpstd MartSignScript

BlackBeltText_WeirdRadio:
	text "FREDO es nuestro"
	line "LÍDER de GIMNASIO."

	para "Puede parecer frío"
	line "por fuera, pero"
	cont "tiene un corazón"
	cont "de oro."
	done

BlueForestCooltrainerF1Text:
	text "¿Vas a hacer que"
	line "tus #MON"
	para "olviden algunos"
	line "movimientos?"
	para "La casa del QUITA-"
	line "MOVIMIENTOS está"
	cont "al oeste de aquí."
	done

BlueForestYoungsterText:
	text "Hay muchos #MON"
	line "de tipo hielo en"
	cont "el PASAJE ABISAL."
	done

MeetSantosText:
	text "SABINO: …"

	para "Es sábado…"

	para "Soy SABINO, por"
	line "sábado…"
	done

SantosGivesGiftText:
	text "Toma esto…"
	done

SantosGaveGiftText:
	text "SABINO: …"

	para "HECHIZO…"

	para "Mejora los"
	line "movimientos de"
	cont "tipo fantasma."

	para "Te voy a asustar…"
	done

SantosSaturdayText:
	text "SABINO: …"

	para "Nos vemos otro"
	line "sábado…"

	para "Pero ya no tendré"
	line "más regalos…"
	done

SantosNotSaturdayText:
	text "SABINO: Hoy no es"
	line "sábado…"
	done

BlueForestCooltrainerF2Text:
	text "¿En serio has"
	line "cruzado el PASAJE"
	cont "ABISAL?"
	para "¡Sí que das la"
	line "talla como"
	cont "entrenador!"
	done

BlueForestCooltrainerF2TextNotWow:
	text "Nunca he ido a"
	line "PUEBLO ESCARCHA."

	para "Atravesar el"
	line "PASAJE ABISAL me"
	cont "echa para atrás."
	done

BlueForestSignText:
	text "BOSQUE AZUL"

	para "Un tranquilo"
	line "retiro nevado"
	done

BlueForestGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE BOSQUE"
	cont "AZUL: FREDO"

	para "El maestro del"
	line "crudo invierno"
	done

DeepwaterPassageSignText:
	text "ENTRADA SUR DEL"
	line "PASAJE ABISAL"
	done

BlueForest_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 26, 21, BLUE_FOREST_GYM, 1
	warp_event  9,  9, BLUE_FOREST_DRAGON_SPEECH_HOUSE, 1
	warp_event 19, 13, BLUE_FOREST_EMYS_HOUSE, 1
	warp_event 25,  6, BLUE_FOREST_MART, 1
	warp_event 13, 18, BLUE_FOREST_POKECENTER_1F, 1
	warp_event  3, 22, MOVE_DELETERS_HOUSE, 1
	warp_event 27, 11, BLUE_FOREST_HOUSE_1, 1
	warp_event  5,  5, DEEPWATER_PASSAGE_ENTRANCE, 1
	warp_event 18,  3, BLUE_FOREST_ROUTE_111_GATE, 3
	warp_event 19,  3, BLUE_FOREST_ROUTE_111_GATE, 4
	warp_event 27, 21, BLUE_FOREST_GYM, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  2, 26, BGEVENT_READ, BlueForestSign
	bg_event 28, 22, BGEVENT_READ, BlueForestGymSign
	bg_event  4,  8, BGEVENT_READ, DeepwaterPassageSign
	bg_event 26,  6, BGEVENT_READ, BlueForestMartSign
	bg_event 14, 18, BGEVENT_READ, BlueForestPokecenterSign

	db 5 ; object events
	object_event 26, 23, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestBlackBeltScript, -1
	object_event 16, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BlueForestCooltrainerF1Script, -1
	object_event 13, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestYoungsterScript, -1
	object_event 16,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLUE_FOREST_SANTOS_OF_SATURDAY
	object_event 25, 16, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestCooltrainerF2Script, -1
