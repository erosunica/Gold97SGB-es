	object_const_def ; object_event constants
	const KUME_SOCIAL_HOUSE_N64_LASS
	const KUME_SOCIAL_HOUSE_YOUNGSTER
	const KUME_SOCIAL_HOUSE_COOLTRAINER_F
	const KUME_SOCIAL_HOUSE_POKEFAN_F
	const KUME_SOCIAL_HOUSE_FISHER
	const KUME_SOCIAL_HOUSE_SAILOR

KumeSocialHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeSocialHouseN64LassScript:
	faceplayer
	opentext
	writetext SendN64LassOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, KumeSocialHouseN64LassRightScript
	jump KumeSocialHouseN64LassUpScript
	end
	
KumeSocialHouseN64LassRightScript:
	applymovement KUME_SOCIAL_HOUSE_N64_LASS, KumeSocialHouseN64LassRightMovement
	playsound SFX_EXIT_BUILDING
	disappear KUME_SOCIAL_HOUSE_N64_LASS
	setevent EVENT_GAME_HOUSE_NPC_IN_KUME_SOCIAL_HOUSE
	clearevent EVENT_LASS_FROM_KUME_AND_FRIENDS
	waitsfx
	end
	
KumeSocialHouseN64LassUpScript:
	applymovement KUME_SOCIAL_HOUSE_N64_LASS, KumeSocialHouseN64LassUpMovement
	playsound SFX_EXIT_BUILDING
	disappear KUME_SOCIAL_HOUSE_N64_LASS
	setevent EVENT_GAME_HOUSE_NPC_IN_KUME_SOCIAL_HOUSE
	clearevent EVENT_LASS_FROM_KUME_AND_FRIENDS
	waitsfx
	end
	
KumeSocialHouseSailorScript:
	jumptextfaceplayer KumeSocialHouseSailorText
	
KumeSocialHouseYoungsterScript:
	jumptextfaceplayer KumeSocialHouseYoungsterText
	
KumeSocialHouseCooltrainerfScript:
	jumptextfaceplayer KumeSocialHouseCooltrainerfText
	
KumeSocialHousePokefanfScript:
	jumptextfaceplayer KumeSocialHousePokefanfText
	
KumeSocialHouseFisherScript:
	jumptextfaceplayer KumeSocialHouseFisherText
	
KumeSocialHouseN64LassRightMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseN64LassUpMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseYoungsterText:
	text "Creo que MENTO es"
	line "el miembro más"
	cont "guay del ALTO"
	cont "MANDO."

	para "¡Ni punto de"
	line "comparación!"
	done

KumeSocialHouseSailorText:
	text "¿Ha podido alguien"
	line "acceder a las"
	cont "ISLAS DEL SUR?"

	para "He oído que allí"
	line "viven algunos"
	cont "#MON muy raros."
	done

KumeSocialHouseCooltrainerfText:
	text "¡La más guay"
	line "es MISTY, te lo"
	cont "digo yo!"

	para "¡Tiene mucho más"
	line "estilo!"
	done

KumeSocialHousePokefanfText:
	text "¡He oído que un"
	line "par de niños"
	para "derrotaron al"
	line "TEAM ROCKET!"

	para "La verdad es que"
	line "me cuesta creerlo."
	done

KumeSocialHouseFisherText:
	text "La gente viene"
	line "aquí a charlar y"
	cont "cotillear."

	para "Yo prefiero"
	line "escuchar."
	done

SendN64LassOffText:
	text "Hace tiempo que no"
	line "voy al continente."

	para "Estaría bien ir"
	line "allí otra vez."

	para "Tengo un amigo en"
	line "CIUDAD PONIENTE al"
	cont "que me gustaría"
	cont "visitar."

	para "Nos lo pasamos"
	line "bien solo con"
	para "vernos y jugar"
	line "videojuegos mien-"
	cont "tras charlamos."

	para "¿Qué?"

	para "¿Qué conoces un"
	line "sitio donde justo"
	cont "se hace eso?"

	para "Bueno, supongo que"
	line "no podría haber"
	para "mejor momento"
	line "para viajar hasta"
	cont "allí."

	para "¡Voy a ir prepa-"
	line "rando las maletas!"

	para "¡Gracias!"
	done
	
KumeSocialHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KUME_CITY, 5
	warp_event  3,  7, KUME_CITY, 5

	db 0 ; coord events

	db 0 ; bg events


	db 6 ; object events
	object_event  5,  1, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseN64LassScript, EVENT_GAME_HOUSE_NPC_IN_KUME_SOCIAL_HOUSE
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseYoungsterScript, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseCooltrainerfScript, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KumeSocialHousePokefanfScript, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseFisherScript, -1
	object_event  9,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseSailorScript, -1
