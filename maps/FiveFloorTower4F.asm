	object_const_def ; object_event constants
	const TINTOWER4F_POKE_BALL1
	const TINTOWER4F_SAGE1
	const TINTOWER4F_SAGE2
	const TINTOWER4F_SAGE3
	const TINTOWER4F_SAGE4

FiveFloorTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
FiveFloorTower4FSign:
	setevent EVENT_READ_5F4F_SIGN
	jumptext FiveFloorTower4FSignText
	
FiveFloorTower4FSignText:
	text "Es una estatua de"
	line "HO-OH."

	para "El #MON ave"
	line "de la leyenda que"
	para "antaño anidó en la"
	line "cima de esta"
	cont "torre."

	para "Debemos honrar"
	line "su nido para que"
	cont "un día pueda"
	cont "regresar."
	done



FiveFloorTower4FEscapeRope:
	itemball ESCAPE_ROPE
	
TrainerSageLi:
	trainer SAGE, LI, EVENT_BEAT_SAGE_LI, SageLiSeenText, SageLiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end


SageLiSeenText:
	text "Siento que"
	line "sugerirte que"
	para "emprendieras este"
	line "viaje fue la"
	cont "decisión correcta."
	done

SageLiBeatenText:
	text "¡Lo sabía!"
	done

SageLiAfterBattleText:
	text "Por favor,"
	line "continúa hasta el"
	cont "último piso."
	done
	
TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end


SageGakuSeenText:
	text "Pasamos nuestros"
	line "días reflexionando"
	cont "con diligencia."
	done

SageGakuBeatenText:
	text "Me siento"
	line "realizado."
	done

SageGakuAfterBattleText:
	text "La mente puede"
	line "dejar ir y venir"
	para "incontables"
	line "recuerdos día tras"
	cont "día."
	done
	
TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end


SageMasaSeenText:
	text "No tengo mucho que"
	line "decir."
	done

SageMasaBeatenText:
	text "…"
	done

SageMasaAfterBattleText:
	text "Llega a la cima."
	done
	
TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageKojiAfterBattleText
	waitbutton
	closetext
	end


SageKojiSeenText:
	text "Deseo ver al ave"
	line "sagrada algún día"
	cont "con mis propios"
	cont "ojos."
	done

SageKojiBeatenText:
	text "Ojalá así sea."
	done

SageKojiAfterBattleText:
	text "Espero que te"
	line "hayas sentido"
	cont "iluminado."
	done


FiveFloorTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  1, FIVE_FLOOR_TOWER_3F, 2
	warp_event  7,  7, FIVE_FLOOR_TOWER_5F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower4FSign

	db 5 ; object events
	object_event  0,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FiveFloorTower4FEscapeRope, EVENT_FIVE_FLOOR_TOWER_4F_ESCAPE_ROPE
	object_event  3,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageLi, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 6, TrainerSageGaku, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  4,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageMasa, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  7,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageKoji, EVENT_ALLOY_CAPTAIN_AT_HOME
