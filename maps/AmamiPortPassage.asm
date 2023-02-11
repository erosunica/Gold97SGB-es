	object_const_def ; object_event constants
	const AMAMIPORTPASSAGE_TEACHER
	const AMAMIPORTPASSAGE_GRAMPS
	const AMAMIPORTPASSAGE_ABRA
	const AMAMIPORTPASSAGE_CLERK

AmamiPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollFriday

.DollFriday:
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .DollFridayAppears
	disappear AMAMIPORTPASSAGE_CLERK
	return

.DollFridayAppears:
	appear AMAMIPORTPASSAGE_CLERK
	return
	

;-------------
	
TravelingDollSalesmanFriday:
	faceplayer
	opentext
	writetext DollSalesmanTextFriday
	waitbutton
DollSalesmanFriday_LoopScript:
	writetext DollSalesmanTextFriday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanFridayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanFriday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_VOLTORB_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_WEEDLE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_WEEDLE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_GEODUDE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GEODUDE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanFriday
	waitbutton
	jump DollSalesmanFriday_LoopScript

	
DollSalesmanFridayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "VOLTORB     5000¥@"
	db "WEEDLE      5000¥@"
	db "GEODUDE     5000¥@"
	db "SALIR@"
	
DollSalesmanFriday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanFriday_HereYouGoText
	waitbutton
	jump DollSalesmanFriday_LoopScript

DollSalesmanFriday_Cancel:
	writetext DollSalesmanFridayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanFridayNoMoney:
	writetext DollSalesmanFridayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollFriday:
	text "¿Quieres enviar"
	line "este MUÑECO al PC"
	cont "de tu dormitorio?"
	done

AlreadyHaveDecorItemTextSalesmanFriday:
	text "¡Ya tienes este"
	line "MUÑECO!"
	done

DollSalesmanFriday_HereYouGoText:
	text "¡Listo!"
	done
	
DollSalesmanFridayComeAgain:
	text "¡Espero que"
	line "volvamos a vernos!"
	done
	
DollSalesmanFridayNoMoneyText:
	text "¡Lo siento, no"
	line "tienes suficiente"
	cont "dinero!"
	done
	
DollSalesmanTextFriday:
	text "¡Hola!"
	
	para "¡Soy un vendedor"
	line "de MUÑECOS"
	cont "ambulante!"
	
	para "¿Sabes lo que"
	line "significa?"
	
	para "¡Que soy la"
	line "persona que buscas"
	para "si quieres decorar"
	line "tu dormitorio!"
	
	para "¡Mi ubicación y lo"
	line "que vendo cambia a"
	para "diario, así que no"
	line "me pierdas de"
	cont "vista!"
	done
	
DollSalesmanTextFriday_AskWhichPrizeText:
	text "¿Qué MUÑECO"
	line "quieres?"
	done
	
;---------------------------------



AmamiPortPassageTeacherScript:
	jumptextfaceplayer AmamiPortPassageTeacherText
	
TeleportGuyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_AMAMI_WARP_GUY
	iftrue .SkipTeleportTextAmami
	writetext TeleportGuyText1
	buttonsound
	setevent EVENT_TALKED_TO_AMAMI_WARP_GUY
.SkipTeleportTextAmami
	writetext TeleportGuyText1_2
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	waitsfx
	warp WESTPORT_PORT_PASSAGE, 13, 2
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end


AmamiPortPassageTeacherText:
	text "El S.S. AQUA zarpa"
	line "hacia PONIENTE"
	cont "los miércoles y"
	cont "domingos."
	done

TeleportGuyText1:
	text "¿No quieres subir"
	line "al barco?"

	para "¿O es que hoy no"
	line "va a zarpar?"

	para "Bueno, escucha."

	para "¡Mi querido ABRA"
	line "puede llevarte de"
	para "vuelta al"
	line "continente en un"
	cont "instante!"

	para "Tengo a un amigo"
	line "esperándome en el"
	cont "MUELLE PONIENTE."

	para "¡Te enviaré con"
	line "él!"

	para "¿Qué me dices?"
	done

TeleportGuyText1_2:
	text "¿Quieres ir a"
	line "CIUDAD PONIENTE?"
	done

TeleportGuyYesText:
	text "Vale. Concéntrate"
	line "en la imagen de"
	cont "CIUDAD PONIENTE…"
	done

TeleportGuyNoText:
	text "Vale, vale."
	line "¡Aquí estaré!"
	done

AbraText:
	text "ABRA: Aabra…"
	done


AmamiPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, AMAMI_TOWN, 1
	warp_event 19,  5, AMAMI_TOWN, 2
	warp_event 15, 14, AMAMI_PORT_PASSAGE, 4
	warp_event 15,  4, AMAMI_PORT_PASSAGE, 3
	warp_event  3, 14, AMAMI_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 18,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AmamiPortPassageTeacherScript, EVENT_TELEPORT_GUY
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
	object_event  5, 13, SPRITE_CLERK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanFriday, EVENT_DOLL_SALESMAN_FRIDAY
