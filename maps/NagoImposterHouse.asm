	object_const_def ; object_event constants
	const NAGOIMPOSTORHOUSE_FISHING_GURU
	const NAGOIMPOSTORHOUSE_DIGLETT
	const NAGOIMPOSTORHOUSE_ITEM_BALL

NagoImposterHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoImposterHouseImposterScript:
	jumptextfaceplayer NagoImposterHouseImposterText

NagoDiglett:
	opentext
	writetext NagoDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end
	
NagoImposterHouseAmuletCoin:; in case you miss it on the ship base
	itemball AMULET_COIN

NagoImposterHouseImposterText:
	text "OAK IMPOSTOR: Oh."

	para "Eres tú."

	para "…"

	para "No estoy aquí para"
	line "combatir o hacer"
	cont "alguna maldad."

	para "Me equivoqué al"
	line "trabajar con el"
	cont "TEAM ROCKET."

	para "Creo que me"
	line "cegaron las ansias"
	cont "de poder."

	para "Pero el TEAM"
	line "ROCKET, de equipo,"
	cont "tenía poco."

	para "Yo no significaba"
	line "nada para ellos."

	para "En el momento que"
	line "dejé de servirles"
	para "para engañar a la"
	line "gente, se"
	cont "deshicieron de mí"
	cont "enseguida."

	para "Sé lo que son, y"
	line "estoy intentando"
	cont "dejar esa vida"
	cont "atrás."

	para "No tienes que"
	line "perdonarme, pero"
	cont "esto es lo que soy"
	cont "ahora."
	done

NagoDiglettText:
	text "DIGLETT: Dig, dig."
	done

NagoImposterHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 2
	warp_event  5,  7, NAGO_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  4, SPRITE_SURGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, NagoImposterHouseImposterScript, EVENT_TELEPORT_GUY
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NagoDiglett, EVENT_TELEPORT_GUY
	object_event  0,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NagoImposterHouseAmuletCoin, EVENT_GOT_TEAM_ROCKET_AMULET_COIN
