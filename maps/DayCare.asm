	object_const_def ; object_event constants
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	return

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	return

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	buttonsound
	closetext
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext DayCareText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd DifficultBookshelfScript

Text_GrampsLookingForYou:
	text "El abuelo te"
	line "estaba buscando."
	done

Text_DayCareManTalksAboutEggTicket:
	text "Soy el ENCARGADO"
	line "de la GUARDERÍA."

	para "Hay algo nuevo en"
	line "PONIENTE llamado"
	cont "CENTRO DE CAMBIO."

	para "Me dieron un"
	line "TICKET HUEVO que"
	para "puede ser cambiado"
	line "por un HUEVO RARO."

	para "Pero como tengo"
	line "una GUARDERÍA, no"
	para "lo necesito. Mejor"
	line "te lo quedas tú."
	done

DayCareManText_GiveOddEgg:
	text "Soy el ENCARGADO"
	line "de la GUARDERÍA."

	para "¿Sabes algo acerca"
	line "de los HUEVOS?"

	para "He estado cuidando"
	line "#MON junto con"
	cont "mi esposa."

	para "¡Y hemos consegui-"
	line "do un HUEVO!"

	para "¿A que es"
	line "increíble?"

	para "¿Qué? ¿Te gusta"
	line "este HUEVO?"

	para "¡Entonces,"
	line "quédatelo!"
	done

DayCareText_ComeAgain:
	text "Vuelve cuando"
	line "quieras."
	done

DayCareText_GotOddEgg:
	text "¡<PLAYER> recibió"
	line "el HUEVO RARO!"
	done

DayCareText_DescribeOddEgg:
	text "Lo encontré"
	line "mientras cuidaba"
	para "el #MON de"
	line "alguien."

	para "Pero el entrenador"
	line "no quiso el HUEVO,"
	para "así que lo dejé"
	line "por aquí."
	done

DayCareText_PartyFull:
	text "No tienes sitio"
	line "para esto."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ROUTE_106, 7
	warp_event  1,  7, ROUTE_106, 7
	warp_event  4,  7, ROUTE_106, 8
	warp_event  5,  7, ROUTE_106, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  0, BGEVENT_READ, DayCareBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
