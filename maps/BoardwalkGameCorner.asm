	object_const_def ; object_event constants
	const BOARDWALKGAMECORNER_CLERK
	const BOARDWALKGAMECORNER_RECEPTIONIST1
	const BOARDWALKGAMECORNER_RECEPTIONIST2
	const BOARDWALKGAMECORNER_PHARMACIST1
	const BOARDWALKGAMECORNER_PHARMACIST2
	const BOARDWALKGAMECORNER_POKEFAN_M1
	const BOARDWALKGAMECORNER_COOLTRAINER_M
	const BOARDWALKGAMECORNER_POKEFAN_F
	const BOARDWALKGAMECORNER_COOLTRAINER_F
	const BOARDWALKGAMECORNER_GENTLEMAN
	const BOARDWALKGAMECORNER_POKEFAN_M2
	const BOARDWALKGAMECORNER_RECEPTIONIST3
	const BOARDWALKGAMECORNER_MOVETUTOR

BoardwalkGameCorner_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .move_tutor_outside
	ifequal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear BOARDWALKGAMECORNER_MOVETUTOR
	return

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear BOARDWALKGAMECORNER_MOVETUTOR
.finish
	return


BoardwalkGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript
	
;--------------------------------------

BoardwalkGameCornerDecorVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
BoardwalkGameCornerDecorVendor_LoopScript:
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerDecorVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Bed
	ifequal 2, .Carpet
	ifequal 3, .Plant
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Bed
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerBedsVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pink
	ifequal 2, .Polkadot
	ifequal 3, .Pikachu
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Pink
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.Polkadot
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Pikachu
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_4
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Carpet
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerCarpetVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .BlueCarpet
	ifequal 2, .YellowCarpet
	ifequal 3, .GreenCarpet
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.BlueCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.YellowCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.GreenCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_4
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Plant
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerPlantVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Magna
	ifequal 2, .Tropic
	ifequal 3, .Jumbo
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Magna
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_1
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.Tropic
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Jumbo
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemText
	waitbutton
	jump BoardwalkGameCornerDecorVendor_LoopScript

	
BoardwalkGameCornerDecorVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerDecorVendor_LoopScript
	
BoardwalkGameCornerPlantVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MEGAPLANTA   1800@"
	db "PLA.TROPICAL 1800@"
	db "PLA. COLOSAL 1800@"
	db "SALIR@"	

BoardwalkGameCornerCarpetVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ALF. AZUL    1800@"
	db "ALF.AMARILLA 1800@"
	db "ALF. VERDE   1800@"
	db "SALIR@"	

BoardwalkGameCornerBedsVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "EDREDÓN ROSA 1800@"
	db "EDRE.LUNARES 1800@"
	db "EDRE.PIKACHU 1800@"
	db "SALIR@"	

BoardwalkGameCornerDecorVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "EDREDONES@"
	db "ALFOMBRAS@"
	db "PLANTAS@"
	db "SALIR@"

;--------------------------------------

BoardwalkGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
BoardwalkGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Heart
	ifequal 3, .Moon
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.Poison:
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext POISON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem POISON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump BoardwalkGameCornerTMVendor_FinishScript

.Heart:
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext HEART_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem HEART_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump BoardwalkGameCornerTMVendor_FinishScript

.Moon:
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext MOON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem MOON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump BoardwalkGameCornerTMVendor_FinishScript

BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

BoardwalkGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerTMVendor_LoopScript

BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext BoardwalkGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext BoardwalkGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_CancelPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_NoCoinCaseScript:
	writetext BoardwalkGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

BoardwalkGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIEDRAVENENO  800@"
	db "PIEDRA ALMA   800@"
	db "PIEDRA LUNAR  800@"
	db "SALIR@"

BoardwalkGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .abra
	ifequal 2, .cubone
	ifequal 3, .bipulla
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.abra
	checkcoins 100
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem ABRA, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins 100
	jump .loop

.cubone
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem CUBONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte CUBONE
	special GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins 800
	jump .loop

.bipulla
	checkcoins 1500
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem BIPULLA, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte BIPULLA
	special GameCornerPrizeMonCheckDex
	givepoke BIPULLA, 15
	takecoins 1500
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        100@"
	db "CUBONE      800@"
	db "BIPULLA    1500@"
	db "SALIR@"

BoardwalkGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

BoardwalkGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_POKEFAN_M1, RIGHT
	end

BoardwalkGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_COOLTRAINER_M, LEFT
	end

BoardwalkGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanFText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_POKEFAN_F, RIGHT
	end

BoardwalkGameCornerCooltrainerFScript:
	jumptextfaceplayer BoardwalkGameCornerCooltrainerFText

BoardwalkGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerGentlemanText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_GENTLEMAN, RIGHT
	end

BoardwalkGameCornerPokefanM2Script:
	jumptextfaceplayer BoardwalkGameCornerPokefanM2Text

BoardwalkGameCornerLeftTheirDrinkScript:
	jumptext BoardwalkGameCornerLeftTheirDrinkText

BoardwalkGameCornerSlotsMachineScript:
	random 6
	ifequal 0, BoardwalkGameCornerLuckySlotsMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerLuckySlotsMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end
	
MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_MOVETUTOR, RIGHT
	end
	
AlreadyHaveDecorItemText:
	text "Ya tienes este"
	line "objeto."
	done
	
SendItemToHomePCText:
	text "¿Quieres enviar"
	line "este objeto al PC"
	cont "de tu habitación?"
	done

BoardwalkGameCornerPrizeVendorIntroText:
	text "¡Hola!"
	line "¡Aquí cambiamos"
	para "tus fichas por"
	line "premios fabulosos!"
	done

BoardwalkGameCornerPrizeVendorWhichPrizeText:
	text "¿Qué premio"
	line "quieres?"
	done

BoardwalkGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "¿De acuerdo?"
	done

BoardwalkGameCornerPrizeVendorHereYouGoText:
	text "¡Aquí tienes!"
	done

BoardwalkGameCornerPrizeVendorNeedMoreCoinsText:
	text "¡Vaya! ¡Necesitas"
	line "más fichas!"
	done

BoardwalkGameCornerPrizeVendorNoMoreRoomText:
	text "Lo siento. No"
	line "tienes más sitio."
	done

BoardwalkGameCornerPrizeVendorQuitText:
	text "Vale. ¡Guarda tus"
	line "fichas y vuelve"
	cont "cuando quieras!"
	done

BoardwalkGameCornerPrizeVendorNoCoinCaseText:
	text "¡Vaya! No tienes"
	line "MONEDERO."
	done

BoardwalkGameCornerPharmacistText:
	text "Yo siempre juego"
	line "en esta máquina."

	para "Gano más fichas"
	line "que en otras."
	done

BoardwalkGameCornerPokefanM1Text:
	text "Me encanta esta"
	line "nueva tragaperras."

	para "Es desafiante en"
	line "su justa medida."
	done

BoardwalkGameCornerCooltrainerMText:
	text "Vivir es un juego"
	line "y yo jugaré hasta"
	cont "el final."
	done

BoardwalkGameCornerPokefanFText:
	text "Las cartas…"
	line "Las prefiero a las"
	para "tragaperras porque"
	line "son más fáciles de"
	cont "acertar."

	para "Pero se gana mucho"
	line "menos."
	done

BoardwalkGameCornerCooltrainerFText:
	text "¡No pararé hasta"
	line "que gane!"
	done

BoardwalkGameCornerGentlemanText:
	text "Evolucioné a mi"
	line "#MON con una"
	cont "PIEDRAVENENO."

	para "Ha sido difícil"
	line "ganar bastantes"
	para "fichas, pero ha"
	line "merecido la pena."
	done

BoardwalkGameCornerPokefanM2Text:
	text "No gané en las"
	line "tragaperras y lo"
	para "perdí todo en las"
	line "cartas…"

	para "Me arriesgué"
	line "mucho, y fue para"
	cont "nada."
	done

MoveTutorInsideText:
	text "¡Uajaja! ¡Más fi-"
	line "chas, más fichas!"
	done

BoardwalkGameCornerLeftTheirDrinkText:
	text "Alguien se dejó la"
	line "bebida."

	para "Huele dulce."
	done

BoardwalkGameCorner_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 13, BOARDWALK, 7
	warp_event 11, 13, BOARDWALK, 8

	db 0 ; coord events

	db 31 ; bg events
	bg_event  6,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, BoardwalkGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  1, BGEVENT_LEFT, BoardwalkGameCornerLeftTheirDrinkScript

	db 13 ; object events
	object_event  3,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCoinVendorScript, -1
	object_event 16,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerTMVendorScript, -1
	object_event 18,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPrizeMonVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM2Script, -1
	object_event 14,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerDecorVendorScript, -1
	object_event  5,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_BOARDWALK_GAME_CORNER_MOVE_TUTOR
