	object_const_def ; object_event constants
	const RYUKYU_HOTEL_RECEPTIONIST
	const RYUKYU_HOTEL_CLERK_1
	const RYUKYU_HOTEL_PLACEHOLDER
	const RYUKYU_HOTEL_CLERK_2
	const RYUKYU_HOTEL_YOUNGSTER
	const RYUKYU_HOTEL_BUG_CATCHER
	const RYUKYU_HOTEL_TEACHER
	const RYUKYU_HOTEL_LASS
	const RYUKYU_HOTEL_JANINE

RyukyuHotel_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckForRoomPass
	

.CheckForRoomPass:
	checkitem ROOM_PASS
	iffalse .UpstairsClosed
	appear RYUKYU_HOTEL_CLERK_2
	disappear RYUKYU_HOTEL_PLACEHOLDER
	disappear RYUKYU_HOTEL_CLERK_1
	return

.UpstairsClosed:
	disappear RYUKYU_HOTEL_CLERK_2
	appear RYUKYU_HOTEL_PLACEHOLDER
	appear RYUKYU_HOTEL_CLERK_1	
	return

RyukyuHotelHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_RYUKYU_HOTEL_HIDDEN_MAX_POTION
	
	
RyukyuHotelReceptionist:
	faceplayer
	checkevent EVENT_RETURNED_FUEL_LINE
	iffalse .NoPassYet
	checkevent EVENT_GOT_HOTEL_PASS
	iftrue .AfterGotHotelPass
	opentext
	writetext HotelReceptionistText2
	waitbutton
	writetext HotelReceptionistText
	special PlaceMoneyTopRight
	yesorno
	iffalse HotelReceptionist_NoSale
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, HotelReceptionist_NoMoney
;	giveitem MOOMOO_MILK; lolololol why was this here? Looks like the receptionist was handing out secret milk
	takemoney YOUR_MONEY, 10000
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext HotelReceptionist_GotPass
	waitbutton
	verbosegiveitem ROOM_PASS
	writetext HotelReceptionistText3
	waitbutton
	closetext
	disappear RYUKYU_HOTEL_CLERK_1
	disappear RYUKYU_HOTEL_PLACEHOLDER
	appear RYUKYU_HOTEL_CLERK_2
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK
	setevent EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_GOT_HOTEL_PASS
	end
	
.AfterGotHotelPass
	opentext
	writetext HotelReceptionistText3
	waitbutton
	closetext
	end
	
.NoPassYet
	opentext
	writetext HotelReceptionistText2
	waitbutton
	writetext HotelReceptionistText4
	waitbutton
	closetext
	end
	
HotelReceptionist_NoSale:
	writetext HotelReceptionistNoSaleText
	waitbutton
	closetext
	end
	
HotelReceptionist_NoMoney:
	writetext HotelReceptionistNoMoneyText
	waitbutton
	closetext
	end
	
RyukyuHotelClerk:
	jumptextfaceplayer RyukyuHotelClerkText
	
RyukyuHotelClerk2:
	jumptextfaceplayer RyukyuHotelClerk2Text
	
RyukyuHotelElevatorNeedsPass:
	jumptextfaceplayer RyukyuHotelElevatorNeedsPassText
	
RyukyuHotelYoungster:
	jumptextfaceplayer RyukyuHotelYoungsterText
	
RyukyuHotelBugCatcher:
	jumptextfaceplayer RyukyuHotelBugCatcherText
	
RyukyuHotelTeacher:
	jumptextfaceplayer RyukyuHotelTeacherText
	
RyukyuHotelLass:
	jumptextfaceplayer RyukyuHotelLassText
	
RyukyuHotelJanine:
	jumptextfaceplayer RyukyuHotelJanineText
	
RyukyuHotelYoungsterText:
	text "¡Nunca antes había"
	line "estado en un hotel"
	cont "tan grande!"
	done

RyukyuHotelBugCatcherText:
	text "¡Quiero ir a la"
	line "playa!"
	done

RyukyuHotelTeacherText:
	text "¡Nuestra habita-"
	line "ción del hotel es"
	cont "muy acogedora!"
	done

RyukyuHotelLassText:
	text "¿En qué planta"
	line "está mi"
	cont "habitación?"
	done

RyukyuHotelJanineText:
	text "¡El clima aquí es"
	line "una maravilla!"
	done

RyukyuHotelElevatorNeedsPassText:
	text "Se necesita un"
	line "PASE HOTEL para"
	cont "pasar…"
	done

RyukyuHotelClerkText:
	text "Lo siento mucho,"
	line "pero solo puedo"
	para "dejar pasar a"
	line "quien tenga un"
	cont "PASE HOTEL."
	done

RyukyuHotelClerk2Text:
	text "¡Bienvenido!"

	para "¡Muchos de nues-"
	line "tros inquilinos"
	para "son entrenadores"
	line "#MON expertos,"
	para "esperando a"
	line "combatir en sus"
	cont "habitaciones!"
	done

HotelReceptionistNoSaleText:
	text "¿No te interesa?"

	para "La oferta sigue"
	line "en pie."
	done

HotelReceptionistNoMoneyText:
	text "Vaya, creía que el"
	line "CAMPEÓN podría"
	cont "permitirse esto."
	done

HotelReceptionist_GotPass:
	text "¡Aquí tienes!"

	para "Tu habitación está"
	line "en la quinta"
	cont "planta."
	done

HotelReceptionistText:
	text "Oye… ¿Tú no eres"
	line "<PLAYER>?"

	para "Siendo el CAMPEÓN"
	line "de NIHON, seguro"
	para "que te interesa"
	line "reservar una de"
	cont "nuestras"
	cont "habitaciones."
 
	para "Te podemos ofrecer"
	line "un PASE HOTEL,"
	para "válido para todo"
	line "el año, por solo"
	cont "10000¥."

	para "¿Te interesa"
	line "nuestra oferta?"
	done

HotelReceptionistText2:
	text "¡Bienvenido al"
	line "HOTEL RYUKYU!"

	para "¡Somos la mejor"
	line "zona turística de"
	cont "todo NIHON!"

	para "¡Varias caras muy"
	line "conocidas han"
	para "reservado habita-"
	line "ciones en nuestro"
	cont "hotel!"
	done

HotelReceptionistText3:
	text "Conoces al PROF."
	line "OAK, ¿verdad?"

	para "Últimamente ha"
	line "venido a pasar"
	cont "aquí los fines de"
	cont "semana."
	done

HotelReceptionistText4:
	text "Si es cierto el"
	line "rumor de que el"
	para "S.S.AQUA está"
	line "fuera de servicio,"
	para "podría arruinar"
	line "los planes de"
	para "viaje de nuestros"
	line "futuros huéspedes…"
	done

RyukyuHotel_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 14,  9, RYUKYU_CITY, 12
	warp_event 15,  9, RYUKYU_CITY, 13
	warp_event 13,  9, RYUKYU_CITY, 12
	warp_event 16,  9, RYUKYU_CITY, 13
	warp_event 12,  9, RYUKYU_CITY, 12
	warp_event 17,  9, RYUKYU_CITY, 13
	warp_event  0,  6, RYUKYU_RESTAURANT, 3
	warp_event  0,  7, RYUKYU_RESTAURANT, 4
	warp_event 26,  0, RYUKYU_ELEVATOR, 1
	warp_event 29,  0, RYUKYU_HOTEL_2F, 2

	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 23,  4, BGEVENT_ITEM, RyukyuHotelHiddenMaxPotion

	db 9 ; object events
	object_event  6,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelReceptionist, -1
	object_event 29,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelClerk, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 26,  0, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelElevatorNeedsPass, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 28,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelClerk2, EVENT_HOTEL_UPSTAIRS_IS_NOT_BLOCKED
	object_event 14,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuHotelYoungster, -1
	object_event 24,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuHotelBugCatcher, -1
	object_event 25,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuHotelTeacher, -1
	object_event 21,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuHotelLass, -1
	object_event 18,  6, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuHotelJanine, -1
