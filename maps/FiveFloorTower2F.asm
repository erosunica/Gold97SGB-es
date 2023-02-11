	object_const_def ; object_event constants
	const SPROUTTOWER2F_MEDIUM1
	const SPROUTTOWER2F_MEDIUM2
	const SPROUTTOWER2F_MEDIUM3
	const SPROUTTOWER2F_MEDIUM4
	const SPROUTTOWER2F_POKE_BALL

FiveFloorTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FiveFloorTower2FSign:
	setevent EVENT_READ_5F2F_SIGN
	jumptext FiveFloorTower2FSignText

FiveFloorTower2FXAccuracy:
	itemball X_ACCURACY
	
TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end
	
FiveFloorTower2FSignText:
	text "Es la estatua de"
	line "un PIKACHU."

	para "PIKACHU nos re-"
	line "cuerda que incluso"
	para "el #MON más"
	line "popular merece ser"
	para "tratado con honor"
	line "y respeto, y no"
	para "como un mero"
	line "símbolo social."
	done


MediumMarthaSeenText:
	text "¿Qué te trae aquí?"
	done

MediumMarthaBeatenText:
	text "Tienes claro tu"
	line "propósito."
	done

MediumMarthaAfterBattleText:
	text "Solo los entrena-"
	line "dores más sabios"
	para "saben desentrañar"
	line "la esencial"
	para "importancia de la"
	line "relación entre los"
	cont "humanos y los"
	cont "#MON."
	done
	
TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end


MediumGraceSeenText:
	text "Cuando se realiza"
	line "correctamente, un"
	para "combate #MON"
	line "puede ser una"
	cont "experiencia"
	cont "espiritual."
	done

MediumGraceBeatenText:
	text "Espero que la"
	line "hayas sentido."
	done

MediumGraceAfterBattleText:
	text "En muchos aspec-"
	line "tos, los humanos"
	para "dependen de los"
	line "#MON más que"
	cont "ellos de nosotros."
	done
	
TrainerMediumBethany:
	trainer MEDIUM, BETHANY, EVENT_BEAT_MEDIUM_BETHANY, MediumBethanySeenText, MediumBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumBethanyAfterBattleText
	waitbutton
	closetext
	end


MediumBethanySeenText:
	text "¿Sientes una"
	line "presencia sobre-"
	cont "natural en este"
	cont "lugar?"
	done

MediumBethanyBeatenText:
	text "Mmm."
	done

MediumBethanyAfterBattleText:
	text "De una forma u"
	line "otra, todos la"
	cont "sentimos."
	done
	
TrainerMediumMargret:
	trainer MEDIUM, MARGRET, EVENT_BEAT_MEDIUM_MARGRET, MediumMargretSeenText, MediumMargretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMargretAfterBattleText
	waitbutton
	closetext
	end


MediumMargretSeenText:
	text "¡Ah! ¡Me has"
	line "desconcentrado!"
	done

MediumMargretBeatenText:
	text "Es importante"
	line "mantener la"
	cont "concentración."
	done

MediumMargretAfterBattleText:
	text "Enfócate en los"
	line "mensajes."
	done


FiveFloorTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  1, FIVE_FLOOR_TOWER_1F, 3
	warp_event  7,  7, FIVE_FLOOR_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower2FSign

	db 5 ; object events
	object_event  2,  3, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumMartha, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  2,  6, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumGrace, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  5,  3, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumBethany, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  5,  6, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumMargret, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  5,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FiveFloorTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
