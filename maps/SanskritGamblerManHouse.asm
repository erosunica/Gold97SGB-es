	object_const_def ; object_event constants
	const SANSKRITGAMBLERMANHOUSE_GAMBLER_MAN

SanskritGamblerManHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SanskritGamblerManHouseGamblerManScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	iftrue .GotCoinCase
	writetext SanskritGamblerManHouseGamblerManText_Question
	yesorno
	iffalse .Refused
	writetext SanskritGamblerManHouseGamblerManText_Yes
	buttonsound
	verbosegiveitem COIN_CASE
	writetext SanskritGamblerManHouseGamblerManText_GiveCoinCase
	waitbutton
	closetext
	setevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	end

.Refused:
	writetext SanskritGamblerManHouseGamblerManText_No
	waitbutton
	closetext
	end

.GotCoinCase:
	writetext SanskritGamblerManHouseGamblerManText_After
	waitbutton
	closetext
	end


SanskritGamblerManHouseGamblerManText_Question:
	text "PUEBLO SÁNSCRITO"
	line "nunca ha destacado"
	cont "por sus activida-"
	cont "des de ocio."

	para "Hasta que abrieron"
	line "el CASINO MARÍTIMO"
	cont "aquí cerca, claro."

	para "Paso mucho tiempo"
	line "allí."

	para "Creo que está"
	line "empezando a ser un"
	cont "problema."

	para "¡Ya sé! ¡Deberías"
	line "quedarte esto!"
	
	para "¿Podrías"
	line "aceptarlo?"
	done
	
SanskritGamblerManHouseGamblerManText_Yes:
	text "¡Bien! ¡Quizá tú"
	line "serás más respon-"
	cont "sable que yo!"
	done
	
SanskritGamblerManHouseGamblerManText_GiveCoinCase:
	text "¡El CASINO"
	line "MARÍTIMO es"
	cont "divertidísimo!"

	para "Pero ten cuidado,"
	line "no dejes que sea"
	cont "una adicción."
	done
	
SanskritGamblerManHouseGamblerManText_No:
	text "Vaya. Creo que más"
	line "bien debería"
	para "trabajar en mi"
	line "autocontrol…"
	done
	
SanskritGamblerManHouseGamblerManText_After:
	text "Vaya peso me he"
	line "quitado de encima."
	done


SanskritGamblerManHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 2
	warp_event  5,  7, SANSKRIT_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritGamblerManHouseGamblerManScript, -1
