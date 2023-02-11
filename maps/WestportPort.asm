	object_const_def ; object_event constants
	const WESTPORTPORT_SAILOR1
;	const WESTPORTPORT_SAILOR2
	const WESTPORTPORT_SAILOR3
	const WESTPORTPORT_FISHING_GURU1
	const WESTPORTPORT_FISHING_GURU2
	const WESTPORTPORT_YOUNGSTER
	const WESTPORTPORT_COOLTRAINER_F

WestportPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_WESTPORTPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear WESTPORTPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod ALLOY_CITY
	end

WestportPortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue WestportPortAlreadyRodeScript
	writetext DepartureTimeText
	waitbutton
	closetext
	turnobject WESTPORTPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WESTPORTPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
.FirstTime:
	clearevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	appear WESTPORTPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

WestportPortSailorAtGangwayScriptTeknos:
	faceplayer
	opentext
	writetext DepartureTimeText
	waitbutton
	closetext
	turnobject WESTPORTPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WESTPORTPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	warpfacing UP, TEKNOS_PORT, 4, 9
	end

WestportPortAlreadyRodeScript:
	writetext SorryCantBoardText
	waitbutton
	closetext
	end

WestportPortWalkUpToShipScript:
	appear WESTPORTPORT_SAILOR1
	turnobject WESTPORTPORT_SAILOR3, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .skip
	turnobject PLAYER, LEFT
	checkflag ENGINE_HIVEBADGE
	iftrue WestportPortSailorFerryToTeknosScript
	opentext
	writetext WestportPortSailorBeforeHiveBadgeText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end
	
.skip:
	end

WestportPortSailorOriginalScript:
	writetext WelcomeToTheDocksAfterHOF
	loadmenu WestportDocksAfterHOFMenu
	verticalmenu
	closewindow
	ifequal 1, .Teknos
	ifequal 2, .Islands
	jump WestportDocksCancel
.Islands
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
;	yesorno
;	iffalse WestportPortNotRidingMoveAwayScript
	writetext AskForTicketText
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext FlashTheTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScript

.NoTicket:
	writetext DontHaveTicketWhoopsText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipMonday:
	writetext NoTripsToIslandsTodayText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipFriday:
	writetext NoTripsToIslandsToday2Text
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.skip:
	end
	
.Teknos
	writetext WestportPortSailorGoToTeknosText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScriptTeknos
	end
	
	
WestportDocksAfterHOFMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 3, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "CIUDAD TEKNOS@"
	db "ISLAS PONIENTES@"
	db "SALIR@"
	
WestportDocksCancel:
	writetext HopeToSeeYouAgainText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end
	
WestportPortSailorFerryToTeknosScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue WestportPortSailorOriginalScript
	writetext WestportPortSailorGoToTeknosText
	yesorno
	iffalse .NotGoing
	writetext WestportPortSailorGoToTeknosText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScriptTeknos
	end
	
	
.NotGoing:
	writetext WestportPortSailorNotGoingToTeknosText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortNotRidingScript:
	writetext HopeToSeeYouAgainText
	waitbutton
	closetext
	end

WestportPortNotRidingMoveAwayScript:
	writetext HopeToSeeYouAgainText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortSailorAfterHOFScript:
	faceplayer
	opentext
	jump WestportPortAlreadyRodeScript

WestportPortSailorBeforeHOFScript:

	end



WestportPortFishingGuru1Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru1Text
	waitbutton
	closetext
	turnobject WESTPORTPORT_FISHING_GURU1, UP
	end

WestportPortFishingGuru2Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru2Text
	waitbutton
	closetext
	turnobject WESTPORTPORT_FISHING_GURU2, UP
	end

WestportPortYoungsterScript:
	faceplayer
	opentext
	writetext WestportPortYoungsterText
	waitbutton
	closetext
	turnobject WESTPORTPORT_YOUNGSTER, DOWN
	end

WestportPortCooltrainerFScript:
	faceplayer
	opentext
	writetext WestportPortCooltrainerFText
	waitbutton
	closetext
	turnobject WESTPORTPORT_COOLTRAINER_F, DOWN
	end

WestportPortHiddenProtein:
	hiddenitem PROTEIN, EVENT_WESTPORT_PORT_HIDDEN_PROTEIN

MovementData_0x74a30:
	step DOWN
	step_end

MovementData_0x74a32:
	step UP
	step_end

MovementData_0x74a34:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74a37:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a3f:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a49:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
WelcomeToTheDocksAfterHOF:
	text "Bienvenido al"
	line "MUELLE PONIENTE."

	para "Nuestros servicios"
	line "ahora incluyen"
	para "viajes tanto a"
	line "CIUDAD TEKNOS"
	para "como a ISLAS"
	line "PONIENTES."

	para "¿Dónde te gustaría"
	line "ir hoy?"
	done

WestportPortSailorNotGoingToTeknosText:
	text "¡Esperamos volver"
	line "a verte!"
	done

WestportPortSailorGoToTeknosText:
	text "Bienvenido al"
	line "MUELLE PONIENTE."

	para "¿Te gustaría ir en"
	line "barco hasta CIUDAD"
	cont "TEKNOS?"
	done

WestportPortSailorGoToTeknosText2:
	text "¡Muy bien!"

	para "Zarpamos a CIUDAD"
	line "TEKNOS."
	done

DepartureTimeText:
	text "El barco va a"
	line "zarpar. Por favor,"
	cont "sube a bordo."
	done

SorryCantBoardText:
	text "Lo siento. No"
	line "puedes embarcar."
	done

AskForTicketText:
	text "¿Puedo ver tu"
	line "TICKET BARCO?"
	done

HopeToSeeYouAgainText:
	text "¡Esperamos volver"
	line "a verte!"
	done

FlashTheTicketText:
	text "<PLAYER> enseña"
	line "el TICKET BARCO."

	para "Muy bien."
	line "¡Gracias, joven!"
	done

DontHaveTicketWhoopsText:
	text "<PLAYER> intenta"
	line "enseñar el TICKET"
	cont "BARCO…"

	para "¡Pero no lo tiene!"

	para "¡Lo siento!"
	line "Para viajar a"
	para "ISLAS PONIENTES,"
	line "necesitas un"
	cont "TICKET BARCO."
	done

NoTripsToIslandsTodayText:
	text "Lo sentimos, pero"
	line "el siguiente barco"
	para "a ISLAS PONIENTES"
	line "zarpará el lunes."

	para "Hoy solo tenemos"
	line "barcos a CIUDAD"
	cont "TEKNOS."
	done

NoTripsToIslandsToday2Text:
	text "Lo sentimos, pero"
	line "el próximo barco a"
	para "ISLAS PONIENTES"
	line "zarpará el"
	cont "viernes."

	para "Hoy solo tenemos"
	line "barcos a CIUDAD"
	cont "TEKNOS."
	done

WestportPortFishingGuru1Text:
	text "Aquí es fácil"
	line "atrapar SHELLDER."

	para "En otros sitios"
	line "son raros."
	done

WestportPortFishingGuru2Text:
	text "¿Tienes alguna"
	line "CAÑA?"

	para "Las distintas"
	line "CAÑAS sirven para"
	cont "atrapar distintos"
	cont "#MON."
	done

WestportPortYoungsterText:
	text "¡El S.S. AQUA usa"
	line "propulsores para"
	cont "surcar las olas!"
	done

WestportPortCooltrainerFText:
	text "En las ISLAS hay"
	line "muchos #MON."

	para "¡Ojalá pudiera ir!"
	done

WestportPortSailorBeforeHiveBadgeText:
	text "Lo sentimos mucho,"
	line "pero por ahora,"
	para "el MUELLE PONIENTE"
	line "está cerrado por"
	cont "mantenimiento."

	para "Aunque pareces un"
	line "entrenador fuerte…"
	para "¿Ya has desafiado"
	line "a ANTÓN?"
	para "Inténtalo y"
	line "regresa más tarde."

	para "Para entonces,"
	line "seguro que ya"
	cont "habremos acabado."
	done


WestportPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  7, WESTPORT_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	db 1 ; coord events
	coord_event  7, 15, SCENE_DEFAULT, WestportPortWalkUpToShipScript

	db 1 ; bg events
	bg_event  1, 22, BGEVENT_ITEM, WestportPortHiddenProtein

	db 6 ; object events
	object_event  7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAtGangwayScript, EVENT_WESTPORT_PORT_SAILOR_AT_GANGWAY
;	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorBeforeHOFScript, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAfterHOFScript, -1
	object_event  4, 12, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru1Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  3,  9, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru2Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  2, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WestportPortYoungsterScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportPortCooltrainerFScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
