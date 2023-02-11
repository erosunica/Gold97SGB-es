	object_const_def ; object_event constants
	const STANDMART_CLERK
	const STANDMART_FISHER
	const STANDMART_COOLTRAINER_F

StandMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_STAND
	closetext
	end

StandMartFisherScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandMartFisherRocketsGone
	writetext StandMartFisherText
	waitbutton
	closetext
	end
	
.StandMartFisherRocketsGone
	writetext StandMartFisherText2
	waitbutton
	closetext
	end

StandMartCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OKERA
	iftrue .StandMartCooltrainerFRocketsGone
	writetext StandMartCooltrainerFText
	waitbutton
	closetext
	end
	
.StandMartCooltrainerFRocketsGone
	writetext StandMartCooltrainerFText2
	waitbutton
	closetext
	end

StandMartFisherText:
	text "Me pregunto cómo"
	line "le habrá afectado"
	para "a la TIENDA el"
	line "cierre del ZOO…"
	done

StandMartFisherText2:
	text "Quería comprar"
	line "recuerdos del"
	para "ZOO de CIUDAD"
	line "ENHIESTA, pero"
	cont "aquí no venden"
	cont "ninguno."
	done

StandMartCooltrainerFText:
	text "¿Has combatido"
	line "contra VELASCO?"
	para "Está en la edad"
	line "del pavo, pero"
	cont "sabe combatir muy"
	cont "bien."
	done
	
StandMartCooltrainerFText2:
	text "¡Hala, la MEDALLA"
	line "OCASO!"

	para "¿Fue un combate"
	line "duro?"
	done

StandMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, STAND_CITY, 1
	warp_event  5,  7, STAND_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandMartClerkScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, StandMartFisherScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandMartCooltrainerFScript, -1
