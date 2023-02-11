	object_const_def ; object_event constants
	const SPROUTTOWER1F_SAGE1
	const SPROUTTOWER1F_SAGE2
	const SPROUTTOWER1F_SAGE3
	const SPROUTTOWER1F_SAGE4
	const SPROUTTOWER1F_POKE_BALL

FiveFloorTower1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FiveFloorPagotaTreeGone
	
.FiveFloorPagotaTreeGone
	setevent EVENT_PAGOTA_TREE_CUT
	return

TrainerSageChow:
	trainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

FiveFloorTower1FParlyzHeal:
	itemball PARLYZ_HEAL

FiveFloorTower1FStatue:
	jumptext FiveFloorTower1FStatueText
	
	
FiveFloorTower1FSign:
	setevent EVENT_READ_5F1F_SIGN
	jumptext FiveFloorTower1FSignText
	

SageChowSeenText:
	text "Montamos guardia"
	line "en esta torre."

	para "Así expresamos"
	line "nuestra gratitud a"
	cont "todos los #MON."
	done

SageChowBeatenText:
	text "Gra… ¡Gracias!"
	done

SageChowAfterBattleText:
	text "Todos los seres"
	line "vivos cooperan"
	cont "para sobrevivir."

	para "Deberíamos estar"
	line "agradecidos."
	done
	
TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end


SageNicoSeenText:
	text "La sagrada TORRE"
	line "GODAI fue cons-"
	cont "truida hace varios"
	cont "siglos."

	para "Es un honor para"
	line "nosotros mantener"
	cont "su legado."
	done


SageNicoBeatenText:
	text "Parece que lo"
	line "comprendes."
	done

SageNicoAfterBattleText:
	text "Esperamos que esta"
	line "torre se mantenga"
	para "tanto tiempo como"
	line "lo ha hecho hasta"
	cont "ahora."
	done

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end


SageJinSeenText:
	text "Todos los #MON"
	line "tienen una lección"
	cont "que enseñarnos."

	para "Nuestro deber es"
	line "tomarnos el tiempo"
	cont "para escucharlos."
	
	done

SageJinBeatenText:
	text "¿Los escuchas?"
	done

SageJinAfterBattleText:
	text "Los #MON"
	line "ilustran a los"
	cont "humanos."

	para "Mucho más de lo"
	line "que la gente pueda"
	cont "imaginar."
	done
	
TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end


SageTroySeenText:
	text "¿Para qué fue"
	line "erigida esta"
	cont "torre?"
	para "Nadie lo sabe."

	para "Pero antaño sirvió"
	line "de nido para un"
	cont "ave de leyendas."
	done

SageTroyBeatenText:
	text "Asegúrate de"
	line "honrar este lugar."
	done

SageTroyAfterBattleText:
	text "Medita cada paso"
	line "mientras subes por"
	cont "la torre."
	done

FiveFloorTower1FStatueText:
	text "Estatua #MON…"

	para "Parece muy"
	line "ilustre."
	done
	
FiveFloorTower1FSignText:
	text "Esta es la TORRE"
	line "GODAI."

	para "Un antiguo monu-"
	line "mento dedicado a"
	para "los #MON que"
	line "enriquecen la vida"
	cont "de los humanos."

	para "Lee minuciosamente"
	line "la inscripción de"
	para "cada estatua para"
	line "comprender sus"
	cont "lecciones."
	done

FiveFloorTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 7
	warp_event  4,  7, PAGOTA_CITY, 12
	warp_event  0,  1, FIVE_FLOOR_TOWER_2F, 1


	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, FiveFloorTower1FSign
	

	db 5 ; object events
	object_event  0,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageChow, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  1,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageNico, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  5,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageJin, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageTroy, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  7,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FiveFloorTower1FParlyzHeal, EVENT_SPROUT_TOWER1F_PARLYZ_HEAL
