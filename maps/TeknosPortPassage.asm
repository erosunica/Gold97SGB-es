	object_const_def ; object_event constants
	const TEKNOSPORTPASSAGE_CLERK

TeknosPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollThursday

.DollThursday:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .DollThursdayAppears
	disappear TEKNOSPORTPASSAGE_CLERK
	return

.DollThursdayAppears:
	appear TEKNOSPORTPASSAGE_CLERK
	return


;-------------
	
TravelingDollSalesmanThursday:
	faceplayer
	opentext
	writetext DollSalesmanTextThursday
	waitbutton
DollSalesmanThursday_LoopScript:
	writetext DollSalesmanTextThursday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanThursdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanThursday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanThursdayNoMoney
	writetext SendItemToPCTextDollThursday
	yesorno
	iffalse DollSalesmanThursday_Cancel
	checkevent EVENT_DECO_GENGAR_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GENGAR_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanThursday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanThursdayNoMoney
	writetext SendItemToPCTextDollThursday
	yesorno
	iffalse DollSalesmanThursday_Cancel
	checkevent EVENT_DECO_SHELLDER_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SHELLDER_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanThursday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanThursdayNoMoney
	writetext SendItemToPCTextDollThursday
	yesorno
	iffalse DollSalesmanThursday_Cancel
	checkevent EVENT_DECO_GRIMER_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GRIMER_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanThursday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanThursday
	waitbutton
	jump DollSalesmanThursday_LoopScript

	
DollSalesmanThursdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "GENGAR      5000¥@"
	db "SHELLDER    5000¥@"
	db "GRIMER      5000¥@"
	db "SALIR@"
	
DollSalesmanThursday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanThursday_HereYouGoText
	waitbutton
	jump DollSalesmanThursday_LoopScript

DollSalesmanThursday_Cancel:
	writetext DollSalesmanThursdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanThursdayNoMoney:
	writetext DollSalesmanThursdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollThursday:
	text "¿Quieres enviar"
	line "este MUÑECO al PC"
	cont "de tu habitación?"
	done

AlreadyHaveDecorItemTextSalesmanThursday:
	text "¡Ya tienes este"
	line "MUÑECO!"
	done

DollSalesmanThursday_HereYouGoText:
	text "¡Listo!"
	done
	
DollSalesmanThursdayComeAgain:
	text "¡Espero que"
	line "volvamos a vernos!"
	done
	
DollSalesmanThursdayNoMoneyText:
	text "¡Lo siento, no"
	line "tienes suficiente"
	cont "dinero!"
	done
	
DollSalesmanTextThursday:
	text "¡Hola!"
	
	para "¡Soy un vendedor"
	line "de MUÑECOS"
	cont "ambulante!"
	
	para "¿Sabes lo que"
	line "significa?"
	
	para "¡Que soy la"
	line "persona que buscas"
	para "si quieres decorar"
	line "tu habitación!"
	
	para "¡Mi ubicación y lo"
	line "que vendo cambia a"
	para "diario, así que no"
	line "me pierdas de"
	cont "vista!"
	done
	
DollSalesmanTextThursday_AskWhichPrizeText:
	text "¿Qué MUÑECO"
	line "quieres?"
	done
	
;---------------------------------


	
TeknosPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 14, TEKNOS_CITY, 1
	warp_event 14, 14, TEKNOS_CITY, 2
	warp_event 14, 16, TEKNOS_PORT_PASSAGE, 4
	warp_event 3, 2, TEKNOS_PORT_PASSAGE, 3
	warp_event 3, 14, TEKNOS_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events	
	object_event 11, 15, SPRITE_CLERK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanThursday, EVENT_DOLL_SALESMAN_THURSDAY
