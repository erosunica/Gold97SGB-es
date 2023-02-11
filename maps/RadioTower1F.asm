	object_const_def ; object_event constants
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_GENTLEMAN
	const RADIOTOWER1F_COOLTRAINER_F
	const RADIOTOWER1F_GRUNTM12

RadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext UnknownText_0x5ceba
	buttonsound
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext UnknownText_0x5cf3a
	buttonsound
	closetext
	;applymovement RADIOTOWER1F_GENTLEMAN, MovementData_0x5ce71
	opentext
	writetext UnknownText_0x5cf5a
	buttonsound
	waitsfx
	writetext UnknownText_0x5cf79
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	buttonsound
	special CheckForLuckyNumberWinners
	closetext
	;applymovement RADIOTOWER1F_GENTLEMAN, MovementData_0x5ce74
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	jump .NoPrize

.GameOver:
	writetext UnknownText_0x5cf7e
	waitbutton
	closetext
	end

.FirstPlace:
	writetext UnknownText_0x5cfb5
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.SecondPlace:
	writetext UnknownText_0x5d023
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.ThirdPlace:
	writetext UnknownText_0x5d076
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.NoPrize:
	writetext UnknownText_0x5d0c0
	waitbutton
	closetext
	end

.BagFull:
	writetext UnknownText_0x5d0e6
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .ReceptionistTakeover
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext UnknownText_0x5d12d
	yesorno
	iffalse .NoQuiz
	writetext UnknownText_0x5d1f2
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d231
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d282
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d2bc
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d30e
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d37b
	buttonsound
	stringtotext .RadioCardText, MEM_BUFFER_1
	scall .ReceiveItem
	writetext UnknownText_0x5d3c0
	buttonsound
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext UnknownText_0x5d3e5
	waitbutton
	closetext
	end
.ReceptionistTakeover:
	writetext ReceptionistTakeoverText
	waitbutton
	closetext
	end

.RadioCardText:
	db "TARJ. RADIO@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext UnknownText_0x5d409
	waitbutton
	closetext
	end

.NoQuiz:
	writetext UnknownText_0x5d443
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText


RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText
	
TrainerGruntM12:
	trainer GRUNTM, GRUNTM_12, EVENT_BEAT_ROCKET_GRUNTM_12, GruntM12SeenText, GruntM12BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM12AfterBattleText
	waitbutton
	closetext
	end

MovementData_0x5ce71:
	step RIGHT
	turn_head UP
	step_end

MovementData_0x5ce74:
	step LEFT
	turn_head UP
	step_end
	
GruntM12SeenText:
	text "¡Bienvenido a la"
	line "TORRE RADIO!"

	para "¡Estoy seguro de"
	line "que hoy el TEAM"
	para "ROCKET podrá"
	line "ofrecerte todo"
	cont "lo que estás"
	cont "buscando!"
	done
	
GruntM12BeatenText:
	text "Con eso no me"
	line "refería a perder"
	cont "un combate…"
	done
	
GruntM12AfterBattleText:
	text "¡El TEAM ROCKET se"
	line "está esforzando"
	para "por hacernos"
	line "sentir como en"
	cont "casa!"
	done

ReceptionistTakeoverText:
	text "Hola."

	para "No vamos a llevar"
	line "a cabo ningún"
	para "evento o guía"
	line "mientras siga"
	cont "esta situación."
	done

UnknownText_0x5ce77:
	text "¡Bienvenidos!"
	done

UnknownText_0x5ceba:
	text "¿Quieres probar en"
	line "el NÚMERO DE LA"
	cont "SUERTE?"

	para "¿Compruebo los"
	line "números ID de tus"
	cont "#MON?"

	para "Si tienes suerte,"
	line "ganarás un premio."
	done

UnknownText_0x5cf3a:
	text "El número de esta"
	line "semana es @"
	text_ram wStringBuffer3
	text "."
	done

UnknownText_0x5cf5a:
	text "A ver si coincide"
	line "con tu número."
	done

UnknownText_0x5cf79:
	text "<……>"
	line "<……>"
	done

UnknownText_0x5cf7e:
	text "Vuelve la próxima"
	line "semana y participa"
	para "otra vez en el"
	line "N.° DE LA SUERTE."
	done

UnknownText_0x5cfb5:
	text "¡Uauu! ¡Tus cinco"
	line "números coinciden!"

	para "¡Ya tenemos"
	line "ganador!"

	para "¡Has ganado una"
	line "MASTER BALL!"
	done

UnknownText_0x5d023:
	text "¡Oye! ¡Tus tres"
	line "últimos números"
	cont "coinciden!"

	para "¡Ganaste el"
	line "segundo premio:"
	cont "REPARTIR EXP!"
	done

UnknownText_0x5d076:
	text "¡Ooooh! ¡Tus dos"
	line "últimos números"
	cont "coinciden!"

	para "Ganaste el tercer"
	line "premio: MÁS PP."
	done

UnknownText_0x5d0c0:
	text "¡No! Tus números"
	line "ID no coinciden."
	done

UnknownText_0x5d0e6:
	text "No tienes sitio"
	line "para tu premio."

	para "Hazle sitio y"
	line "vuelve enseguida."
	done

UnknownText_0x5d12d:
	text "Ahora tenemos una"
	line "promoción"
	cont "especial."

	para "Acierta estas 5"
	line "preguntas y gana"
	cont "una TARJETA RADIO."

	para "Introdúcela en tu"
	line "#GEAR para oír"
	para "la radio siempre"
	line "que quieras."

	para "¿Quieres"
	line "participar?"
	done

UnknownText_0x5d1f2:
	text "1a Pregunta:"

	para "¿Hay #MON que"
	line "sólo aparecen por"
	cont "la mañana?"
	done

UnknownText_0x5d231:
	text "¡Correcto!"
	line "2a Pregunta:"

	para "¿Es verdad que no"
	line "puedes comprar una"

	para "BAYA en una"
	line "TIENDA?"
	done

UnknownText_0x5d282:
	text "¡Acertaste!"
	line "3a Pregunta:"

	para "¿Contiene la MO01"
	line "el movimiento"
	cont "DESTELLO?"
	done

UnknownText_0x5d2bc:
	text "¡Vas bien!"
	line "4a Pregunta:"

	para "¿PEGASO, el LÍDER"
	line "de GIMNASIO de"

	para "CIUDAD PAGOTA, usa"
	line "#MON pájaro?"
	done

UnknownText_0x5d30e:
	text "¡Guau! ¡Correcto!"
	line "Ésta es la última"
	cont "pregunta:"

	para "¿La ruta al norte"
	line "de CIUDAD PONIENTE"
	cont "se llama RUTA 102?"
	done

UnknownText_0x5d37b:
	text "¡Bingo!"
	line "¡Enhorabuena!"

	para "Éste es tu premio:"
	line "¡la TARJETA RADIO!"
	done

UnknownText_0x5d3c0:
	text "¡El #GEAR de"
	line "<PLAYER> se puede"
	cont "usar como radio!"
	done

UnknownText_0x5d3e5:
	text "Sintoniza nuestros"
	line "programas."
	done

UnknownText_0x5d409:
	text "Lo siento mucho,"
	line "pero te has"
	para "equivocado."
	line "¡Vuelve a probar!"
	done

UnknownText_0x5d443:
	text "¡Ah! Entiendo."
	line "Vuelve a probar si"
	cont "cambias de idea."
	done

RadioTower1FLassText:
	text "KEN es un DJ"
	line "fabuloso."

	para "Su voz es"
	line "realmente genial."
	done

RadioTower1FYoungsterText:
	text "Me gusta ROSA, de"
	line "la HORA #MON."

	para "Pude conocerla en"
	line "persona. ¡Es muy"
	cont "maja!"
	done

RadioTower1FDirectoryText:
	text "PB RECEPCIÓN"
	line "P1 ESTUDIO 1"

	para "P2 PERSONAL"
	line "P3 ESTUDIO 2"

	para "P4 ESTUDIO 3"
	
	para "P5 OFICINA DEL"
	line "   DIRECTOR"
	done

RadioTower1FLuckyChannelSignText:
	text "¡CANAL SUERTE!"

	para "¡Gana con los ID"
	line "de los #MON!"

	para "¡Cambia #MON"
	line "y reúne diferentes"
	cont "números ID!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, WESTPORT_CITY, 6
	warp_event  3,  7, WESTPORT_CITY, 11
	warp_event  7,  0, RADIO_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event  3,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	db 5 ; object events
	object_event  4,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, -1
	object_event  0,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM12, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
