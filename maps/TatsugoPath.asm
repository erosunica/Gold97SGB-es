	object_const_def ; object_event constants
	const TP_TEACHER
	const TP_INSTR
	const TP_SNERD
	const TP_SAILOR
	const TP_ITEMBALL

TatsugoPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end
	


SailorEugeneSeenText:
	text "Acabo de volver"
	line "del mar."

	para "¿Te apetece luchar"
	line "con mis #MON?"
	done

SailorEugeneBeatenText:
	text "¡Awaaargh!"
	done

SailorEugeneAfterBattleText:
	text "Mis #MON han"
	line "sido atrapados y"
	para "entrenados en el"
	line "extranjero."

	para "Me han acompañado"
	line "en esos largos"
	cont "viajes."
	done


TrainerTeacherHolly:
	trainer TEACHER, HOLLY, EVENT_BEAT_TEACHER_HOLLY, TeacherHollySeenText, TeacherHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHollyAfterBattleText
	waitbutton
	closetext
	end
	

TeacherHollySeenText:
	text "¡Perdona, pero"
	line "esto es una cita"
	cont "privada!"
	done

TeacherHollyBeatenText:
	text "¡Largo de aquí,"
	line "pelmazo!"
	done

TeacherHollyAfterBattleText:
	text "¡Como si no"
	line "tuviera que lidiar"
	para "ya con suficientes"
	line "niños en el"
	cont "colegio!"
	done


TrainerInstrMoshe:
	trainer INSTRUCTOR, MOSHE, EVENT_BEAT_INSTRUCTOR_MOSHE, InstrMosheSeenText, InstrMosheBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstrMosheAfterBattleText
	waitbutton
	closetext
	end
	

InstrMosheSeenText:
	text "Si estás buscando"
	line "clases particula-"
	cont "res, ¡has llegado"
	cont "en el momento"
	cont "equivocado!"
	done

InstrMosheBeatenText:
	text "¡Venga ya!"
	done

InstrMosheAfterBattleText:
	text "Es habitual que no"
	line "pueda siquiera"
	para "tener una cita sin"
	line "que venga un niño"
	cont "a incordiar."
	done

TrainerSNNorton:
	trainer SUPER_NERD, NORTON, EVENT_BEAT_SUPER_NERD_NORTON, SNNortonSeenText, SNNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SNNortonAfterBattleText
	waitbutton
	closetext
	end
	

SNNortonSeenText:
	text "¡Vengo todos los"
	line "días a la LAGUNA"
	cont "CORAZÓN!"

	para "¿Entonces por qué"
	line "todavía no tengo"
	cont "novia?"
	done

SNNortonBeatenText:
	text "Qué dura es la"
	line "vida de un NECIO."
	done

SNNortonAfterBattleText:
	text "¿Bañarme en la"
	line "LAGUNA CORAZÓN"
	para "aumentaría mis"
	line "posibilidades?"
	done
	
TatsugoPathHiddenPPUP:
	hiddenitem PP_UP, EVENT_TATSUGO_PATH_HIDDEN_PP_UP

TatsugoPathHiddenHeartStone:
	hiddenitem HEART_STONE, EVENT_TATSUGO_PATH_HIDDEN_HEART_STONE

TPItemball:
	itemball ULTRA_BALL

HeartPondSign:
	jumptext HeartPondSignText
	
HeartPondSignText:
	text "LAGUNA CORAZÓN"

	para "Un lugar de"
	line "encuentro para"
	cont "los amantes"
	done

KikaiStraitSign:
	jumptext KikaiStraitSignText
	
KikaiStraitSignText:
	text "SENDA TATSUGO"

	para "PUEBLO AMAMI -"
	line "VILLA KIKAI"
	done

TatsugoPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  9, AMAMI_TATSUGO_PATH_GATE, 4

	db 0 ; coord events

	db 4 ; bg events
	bg_event 21,  7, BGEVENT_READ, HeartPondSign
	bg_event 52, 10, BGEVENT_READ, KikaiStraitSign
	bg_event  4, 15, BGEVENT_ITEM, TatsugoPathHiddenPPUP
	bg_event 26, 12, BGEVENT_ITEM, TatsugoPathHiddenHeartStone

	db 5 ; object events
	object_event 19,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherHolly, -1
	object_event 19, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerInstrMoshe, -1
	object_event 35,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSNNorton, -1
	object_event 47, 12, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event 43, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TPItemball, EVENT_TATSUGO_PATH_ITEMBALL
