	object_const_def ; object_event constants
	const RYUKYU_RESTAURANT_CLERK_1
	const RYUKYU_RESTAURANT_CLERK_2
	const RYUKYU_RESTAURANT_PRIZE_VENDOR
	const RYUKYU_RESTAURANT_COIN_VENDOR
	const RYUKYU_RESTAURANT_BAR
	const RYUKYU_RESTAURANT_POKEFAN_M
	const RYUKYU_RESTAURANT_COOLTRAINER_F
	const RYUKYU_RESTAURANT_COOLTRAINER_M
	const RYUKYU_RESTAURANT_TWIN
	const RYUKYU_RESTAURANT_TEACHER
	const RYUKYU_RESTAURANT_POKEFAN_M2
	const RYUKYU_RESTAURANT_SUPER_NERD
	const RYUKYU_RESTAURANT_JANINE

RyukyuRestaurant_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckForRoomPassRestaurant
	

.CheckForRoomPassRestaurant:
	checkitem ROOM_PASS
	iffalse .TheatreClosed
	disappear RYUKYU_RESTAURANT_CLERK_1
	disappear RYUKYU_RESTAURANT_CLERK_2
	return

.TheatreClosed:
	appear RYUKYU_RESTAURANT_CLERK_1
	appear RYUKYU_RESTAURANT_CLERK_2
	return
	
RyukyuRestaurantPokefanMScript:
	faceplayer
	opentext
	writetext RyukyuRestaurantPokefanMText
	waitbutton
	closetext
	turnobject RYUKYU_RESTAURANT_POKEFAN_M, LEFT
	end

RyukyuRestaurantBarScript:
	jumptextfaceplayer RyukyuRestaurantBarText

RyukyuRestaurantGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript
	
RyukyuRestaurantCooltrainerMScript:
	jumptextfaceplayer RyukyuRestaurantCooltrainerMText
	
RyukyuRestaurantCooltrainerFScript:
	jumptextfaceplayer RyukyuRestaurantCooltrainerFText
	
RyukyuRestaurantTwinScript:
	jumptextfaceplayer RyukyuRestaurantTwinText
	
RyukyuRestaurantTeacherScript:
	jumptextfaceplayer RyukyuRestaurantTeacherText
	
RyukyuRestaurantPokefanM2Script:
	jumptextfaceplayer RyukyuRestaurantPokefanM2Text
	
RyukyuRestaurantSuperNerdScript:
	jumptextfaceplayer RyukyuRestaurantSuperNerdText
	
RyukyuRestaurantJanineScript:
	jumptextfaceplayer RyukyuRestaurantJanineText
	
RyukyuRestaurantClerk:
	jumptextfaceplayer RyukyuRestaurantClerkText
	
RyukyuRestaurantGameCornerSlotsMachineScript:
	random 6
	ifequal 0, RyukyuRestaurantGameCornerLuckySlotsMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

RyukyuRestaurantGameCornerLuckySlotsMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

RyukyuRestaurantGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end
	


RyukyuRestaurantGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext RyukyuRestaurantGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse RyukyuRestaurantGameCornerPrizeVendor_NoCoinCaseScript
	writetext RyukyuRestaurantGameCornerPrizeVendorWhichPrizeText
RyukyuRestaurantGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu RyukyuRestaurantGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Fire
	ifequal 2, .Water
	ifequal 3, .Thunder
	jump RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript

.Fire:
	checkcoins 800
	ifequal HAVE_LESS, RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext FIRE_STONE, MEM_BUFFER_0
	scall RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript
	giveitem FIRE_STONE
	iffalse RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump RyukyuRestaurantGameCornerTMVendor_FinishScript

.Water:
	checkcoins 800
	ifequal HAVE_LESS, RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext WATER_STONE, MEM_BUFFER_0
	scall RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript
	giveitem WATER_STONE
	iffalse RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump RyukyuRestaurantGameCornerTMVendor_FinishScript

.Thunder:
	checkcoins 800
	ifequal HAVE_LESS, RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext THUNDERSTONE, MEM_BUFFER_0
	scall RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript
	giveitem THUNDERSTONE
	iffalse RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump RyukyuRestaurantGameCornerTMVendor_FinishScript

RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

RyukyuRestaurantGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext RyukyuRestaurantGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump RyukyuRestaurantGameCornerTMVendor_LoopScript

RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

RyukyuRestaurantGameCornerPrizeVendor_NoCoinCaseScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end
	
RyukyuRestaurantTheatreScript:
	jumptext RyukyuRestaurantTheatreText

RyukyuRestaurantGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIEDRA FUEGO  800@"
	db "PIEDRA AGUA   800@"
	db "PIEDRATRUENO  800@"
	db "SALIR@"
	
RyukyuRestaurantPokefanM2Text:
	text "¡A mis #MON les"
	line "gusta la comida de"
	cont "este sitio más que"
	cont "a mí!"
	done

RyukyuRestaurantSuperNerdText:
	text "¡Este es el lugar"
	line "donde mejor se"
	cont "come de todo"
	cont "NIHON!"
	done

RyukyuRestaurantJanineText:
	text "¡El servicio aquí"
	line "es tan bueno como"
	cont "la comida!"
	done

RyukyuRestaurantCooltrainerFText:
	text "¡Camarero!"

	para "¡Más agua, por"
	line "favor!"
	done

RyukyuRestaurantCooltrainerMText:
	text "¡La comida aquí es"
	line "deliciosa!"
	done

RyukyuRestaurantTwinText:
	text "¡Quiero un trozo"
	line "de tarta!"
	done

RyukyuRestaurantTeacherText:
	text "¡Debes comer"
	line "verduras!"
	done

RyukyuRestaurantPokefanMText:
	text "¡Esta máquina está"
	line "trucada!"

	para "¡Nadie más va a"
	line "usarla!"
	done

RyukyuRestaurantTheatreText:
	text "TEATRO RYUKYU"
	line "Abajo"
	done

RyukyuRestaurantGameCornerPrizeVendorIntroText:
	text "¡Hola!"
	line "¡Aquí cambiamos"
	para "tus fichas por"
	line "premios fabulosos!"
	done

RyukyuRestaurantGameCornerPrizeVendorWhichPrizeText:
	text "¿Qué premio"
	line "quieres?"
	done

RyukyuRestaurantGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "¿De acuerdo?"
	done

RyukyuRestaurantGameCornerPrizeVendorHereYouGoText:
	text "¡Aquí tienes!"
	done

RyukyuRestaurantGameCornerPrizeVendorNeedMoreCoinsText:
	text "¡Vaya! ¡Necesitas"
	line "más fichas!"
	done

RyukyuRestaurantGameCornerPrizeVendorNoMoreRoomText:
	text "Lo siento. No"
	line "tienes más sitio."
	done

RyukyuRestaurantGameCornerPrizeVendorQuitText:
	text "Vale. ¡Guarda tus"
	line "fichas y vuelve"
	cont "cuando quieras!"
	done

RyukyuRestaurantGameCornerPrizeVendorNoCoinCaseText:
	text "¡Vaya! No tienes"
	line "MONEDERO."
	done
	
RyukyuRestaurantClerkText:
	text "Lo siento, pero el"
	line "acceso al TEATRO"
	para "es sólo para los"
	line "huéspedes del"
	cont "HOTEL."

	para "Necesitas un PASE"
	line "HOTEL para entrar."
	done

RyukyuRestaurantBarText:
	text "¡Bienvenido!"

	para "¡Espero que"
	line "disfrute de nues-"
	cont "tras ofertas de"
	cont "ocio en el HOTEL"
	cont "RYUKYU!"
	done

RyukyuRestaurant_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10, 17, RYUKYU_CITY, 11
	warp_event 11, 17, RYUKYU_CITY, 11
	warp_event 19,  4, RYUKYU_HOTEL, 7
	warp_event 19,  5, RYUKYU_HOTEL, 8
	warp_event 14,  1, RYUKYU_THEATRE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event  1, 10, BGEVENT_LEFT, RyukyuRestaurantGameCornerSlotsMachineScript
	bg_event  1, 11, BGEVENT_LEFT, RyukyuRestaurantGameCornerSlotsMachineScript
	bg_event  1, 12, BGEVENT_LEFT, RyukyuRestaurantGameCornerSlotsMachineScript
	bg_event  1, 15, BGEVENT_LEFT, RyukyuRestaurantGameCornerCardFlipMachineScript
	bg_event  1, 14, BGEVENT_LEFT, RyukyuRestaurantGameCornerCardFlipMachineScript
	bg_event  1, 13, BGEVENT_LEFT, RyukyuRestaurantGameCornerCardFlipMachineScript
	bg_event 15,  0, BGEVENT_READ, RyukyuRestaurantTheatreScript
	
	db 14 ; object events
	object_event 15,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantClerk, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 14,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantClerk, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event  0,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantGameCornerTMVendorScript, -1
	object_event  0,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantGameCornerCoinVendorScript, -1
	object_event  5,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantBarScript, -1
	object_event  2, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantPokefanMScript, -1
	object_event  5, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantCooltrainerFScript, -1
	object_event  8, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantCooltrainerMScript, -1
	object_event  7, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantTwinScript, -1
	object_event  5,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantTeacherScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantPokefanM2Script, -1
	object_event 12,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantSuperNerdScript, -1
	object_event 14, 10, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantJanineScript, -1
