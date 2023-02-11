	object_const_def ; object_event constants
	const MOTOBU_SWIMMER1
	const MOTOBU_SWIMMER2
	const MOTOBU_SWIMMER3
	const MOTOBU_COOLTRAINERM
	const MOTOBU_YOUNGSTER
	const MOTOBU_ITEM

MotobuPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermLiam:
	trainer COOLTRAINERM, LIAM, EVENT_BEAT_COOLTRAINERM_LIAM, CooltrainermLiamSeenText, CooltrainermLiamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermLiamAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfJill:
	trainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJillAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMary:
	trainer SWIMMERF, MARY, EVENT_BEAT_SWIMMERF_MARY, SwimmerfMarySeenText, SwimmerfMaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfMaryAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKatieAfterBattleText
	waitbutton
	closetext
	end

MotobuYoungsterScript:
	jumptextfaceplayer MotobuYoungsterText

MotobuPathItemball:
	itemball EARTHEN_CLAY
	
MotobuYoungsterText:
	text "¡Me fascina la"
	line "fuerza de los"
	para "entrenadores y los"
	line "#MON salvajes"
	cont "en las ISLAS!"
	done

CooltrainermLiamSeenText:
	text "¡He entrenado a"
	line "mi equipo para"
	para "que esté listo"
	line "contra cualquier"
	cont "oponente!"

	para "¡Dalo todo!"
	done

CooltrainermLiamBeatenText:
	text "Sí que lo diste"
	line "todo."
	done

CooltrainermLiamAfterBattleText:
	text "Creo que iré a"
	line "nadar un rato…"
	done

SwimmerfJillSeenText:
	text "¡El agua de por"
	line "aquí es muy agra-"
	cont "dable y cálida!"
	done

SwimmerfJillBeatenText:
	text "¡Ay!"
	done

SwimmerfJillAfterBattleText:
	text "Ir al CENTRO"
	line "#MON significa"
	para "tener que salir"
	line "del agua. En fin…"
	done

SwimmerfMarySeenText:
	text "¡Nadaré en"
	line "círculos alrededor"
	cont "de ti!"
	done

SwimmerfMaryBeatenText:
	text "¡Qué mareo!"
	done

SwimmerfMaryAfterBattleText:
	text "Creo que me va a"
	line "dar un golpe de"
	cont "calor."
	done

SwimmerfKatieSeenText:
	text "¡Ven que te"
	line "salpique!"
	done

SwimmerfKatieBeatenText:
	text "¡He acabado"
	line "salpicada yo!"
	done

SwimmerfKatieAfterBattleText:
	text "¿Quieres ver"
	line "cuánto aguanto la"
	cont "respiración?"
	done

MotobuPathSign:
	jumptext MotobuPathSignText
	
MotobuPathSignText:
	text "SENDA MOTOBU"

	para "VILLA NAGO -"
	line "PUEBLO IEJIMA"
	done


MotobuPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  7, MOTOBU_PATH_IEJIMA_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 50,  6, BGEVENT_READ, MotobuPathSign

	db 6 ; object events
	object_event 27,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfJill, -1
	object_event 32, 12, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMary, -1
	object_event 35,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKatie, -1
	object_event  6,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermLiam, -1
	object_event 14, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, MotobuYoungsterScript, -1
	object_event 12, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MotobuPathItemball, EVENT_MOTOBU_PATH_ITEMBALL


