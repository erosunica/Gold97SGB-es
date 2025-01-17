	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4


FiveFloorTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end


;SageLiScript:
;	faceplayer
;	opentext
;	checkevent EVENT_GOT_HM05_FLASH
;	iftrue .GotFlash
;	writetext SageLiSeenText
;	waitbutton
;	closetext
;	winlosstext SageLiBeatenText, 0
;	loadtrainer SAGE, LI
;	startbattle
;	reloadmapafterbattle
;	opentext
;	writetext SageLiTakeThisFlashText
;	buttonsound
;	verbosegiveitem TM_FLASH
;	setevent EVENT_GOT_HM05_FLASH
;	setevent EVENT_BEAT_SAGE_LI
;	writetext SageLiFlashExplanationText
;	waitbutton
;	closetext
;	end

;.GotFlash:
;	writetext SageLiAfterBattleText
;	waitbutton
;	closetext
;	end

FiveFloorTower3FSign:
	setevent EVENT_READ_5F3F_SIGN
	jumptext FiveFloorTower3FSignText
	
FiveFloorTower3FSignText:
	text "Es una estatua de"
	line "TENTACRUEL."
	
	para "A pesar de su"
	line "apariencia enorme"
	para "e intimidante,"
	line "TENTACRUEL nos"
	para "enseña que todos"
	line "los #MON"
	cont "tienen un corazón"
	cont "puro."
	
	para "Esta estatua"
	line "venera a un"
	para "TENTACRUEL que usó"
	line "sus tentáculos"
	para "para salvar a un"
	line "niño que se estaba"
	para "ahogando en el río"
	line "junto a esta"
	cont "torre."
	done


TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end


SageJeffreySeenText:
	text "¿Qué significa"
	line "para ti subir esta"
	cont "torre?"
	done

SageJeffreyBeatenText:
	text "Ya veo."
	done

SageJeffreyAfterBattleText:
	text "Debes encontrarle"
	line "sentido a tu"
	cont "viaje."

	para "Tanto en esta"
	line "torre como en lo"
	cont "que te depare"
	cont "después."
	done
	
TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end


SagePingSeenText:
	text "El tejado se"
	line "encuentra tras el"
	cont "quinto piso."

	para "Pero ni siquiera"
	line "nosotros somos"
	para "dignos de estar en"
	line "ese lugar sagrado."
	done

SagePingBeatenText:
	text "Pareces tratar"
	line "muy bien a tus"
	cont "#MON."
	done

SagePingAfterBattleText:
	text "Esperamos que un"
	line "día el tejado"
	para "vuelva a ser"
	line "el hogar del"
	para "ave arcoíris"
	line "de la leyenda."
	done
	
TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end


SageEdmondSeenText:
	text "Presiento que te"
	line "depara un largo"
	cont "viaje."
	done

SageEdmondBeatenText:
	text "Este ha sido"
	line "apenas un paso."
	done

SageEdmondAfterBattleText:
	text "¿Estás preparado"
	line "para aquello que"
	cont "se te encomiende?"
	done
	
TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end


SageNealSeenText:
	text "Lo has hecho bien"
	line "si has llegado"
	cont "hasta aquí."
	done

SageNealBeatenText:
	text "Por favor,"
	line "continúa."
	done

SageNealAfterBattleText:
	text "Si CÉSAR te"
	line "sugirió emprender"
	para "este viaje, debe"
	line "intuir un destino"
	cont "importante en tu"
	cont "futuro."
	done

FiveFloorTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, FIVE_FLOOR_TOWER_2F, 2
	warp_event  0,  1, FIVE_FLOOR_TOWER_4F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower3FSign

	db 4 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageJeffrey, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  5,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSagePing, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  4,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageEdmond, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  3,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNeal, EVENT_ALLOY_CAPTAIN_AT_HOME

