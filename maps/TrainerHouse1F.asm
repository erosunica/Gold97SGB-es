	object_const_def ; object_event constants
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "Bienvenido a la"
	line "CASA DEL"
	para "ENTRENADOR, el"
	line "lugar más popular"
	cont "de CIUDAD VERDE."

	para "Es sólo para"
	line "entrenadores."

	para "Puedes luchar"
	line "contra los mejores"
	para "entrenadores en el"
	line "piso de abajo."
	done

TrainerHouse1FCooltrainerMText:
	text "La CIUDAD VERDE"
	line "es la más cercana"
	cont "al MT. FUJI."

	para "Construyeron este"
	line "lugar debido al"
	para "gran número de"
	line "entrenadores que"
	para "pasaban de camino"
	line "al MT. FUJI."
	done

TrainerHouse1FCooltrainerFText:
	text "Aquí abajo tienen"
	line "lugar combates"
	cont "de entrenamiento."

	para "Me encantaría ver"
	line "lo bien que luchan"
	para "los entrenadores"
	line "de NIHON."
	done

TrainerHouse1FYoungsterText:
	text "No podrás ganar el"
	line "CAMPEONATO si no"
	para "luchas con toda la"
	line "gente que encuen-"
	cont "tres por ahí."

	para "El CAMPEÓN de"
	line "KOBAN viajó por"
	para "las ciudades y"
	line "pueblos de ISLAS"
	cont "PONIENTES."
	done

TrainerHouse1FGentlemanText:
	text "¡Ah…! Estoy"
	line "descansando de los"
	cont "combates #MON."
	done

TrainerHouseSign1Text:
	text "Los combates de"
	line "entrenamiento se"
	para "celebran en HALL"
	line "DE ENTRENAMIENTO."

	para "Los entrenadores"
	line "más hábiles están"
	cont "invitados."
	done

TrainerHouseSign2Text:
	text "No existen reglas"
	line "sobre los combates"
	para "de prueba. Al"
	line "igual que en los"
	para "combates reales,"
	line "aquí vale todo."
	done

TrainerHouseIllegibleText:
	text "¿Qué es esto?"
	line "¿Una estrategia?"

	para "Esta letra se"
	line "parece a las"
	para "huellas de ONIX…"
	line "¡Es ilegible…!"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 13, IEJIMA_TOWN, 3
	warp_event  3, 13, IEJIMA_TOWN, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	db 5 ; object events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
