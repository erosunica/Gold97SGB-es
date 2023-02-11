	object_const_def ; object_event constants
	const HYDROBIKER1
	const HYDROBIKER2
	const HYDROBIKER3
	const HYDROBIKER4
	const HYDROBIKER5
	const HYDROBIKER6
	const HYDROBIKER7
	const HYDROBIKER8
	const HYDROBIKER9
	const HYDROEMPLOYEE1
	const HYDROEMPLOYEE2
	const HYDROEMPLOYEE3
	const HYDROEMPLOYEE4
	const HYDROEMPLOYEE5

HydroPlant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBikerKazu:
	trainer BIKER, KAZU, EVENT_BEAT_BIKER_KAZU, BikerKazuSeenText, BikerKazuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerKazuAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerBenny:
	trainer BIKER, BENNY, EVENT_BEAT_BIKER_BENNY, BikerBennySeenText, BikerBennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerBennyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end


TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end


TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end
	
HydroPlantLassScript:
	jumptextfaceplayer HydroPlantLassText

HydroPlantGentlemanScript:
	jumptextfaceplayer HydroPlantGentlemanText

HydroPlantGentlenman2Script:
	jumptextfaceplayer HydroPlantGentlenman2Text

HydroPlantRockerScript:
	jumptextfaceplayer HydroPlantRockerText
	

HydroPlantTeacherScript:
	jumptextfaceplayer HydroPlantTeacherText
	
HydroPlantNugget:
	hiddenitem NUGGET, EVENT_HYDRO_PLANT_NUGGET
	
HydroPlantTeacherText:
	text "¡Oh, hola!"

	para "Has sido tú quien"
	line "ha echado a esos"
	cont "MOTORISTAS,"
	cont "¿verdad?"

	para "¡Muchas gracias!"
	done

HydroPlantRockerText:
	text "¡No puedo esperar"
	line "a contarle a mis"
	para "amigos lo que ha"
	line "pasado hoy en el"
	cont "trabajo!"
	done

HydroPlantGentlenman2Text:
	text "¡No había manera"
	line "de trabajar con"
	para "esos MOTORISTAS"
	line "armando tanto"
	cont "jaleo!"
	done

HydroPlantGentlemanText:
	text "¡El día de hoy ha"
	line "sido de lo más"
	cont "interesante!"
	done

HydroPlantLassText:
	text "¡La energía que se"
	line "genera en esta"
	para "PLANTA abastece a"
	line "todas las ISLAS"
	cont "PONIENTES!"
	done

BikerRileySeenText:
	text "¿Trabajas aquí?"
	done

BikerRileyBeatenText:
	text "¡Estoy despedido!"
	done

BikerRileyAfterBattleText:
	text "¡Creo que por fin"
	line "hemos espantado a"
	para "todos los"
	line "trabajadores!"
	done

BikerCharlesSeenText:
	text "¿Has venido a"
	line "aguarnos la"
	cont "fiesta?"
	done

BikerCharlesBeatenText:
	text "¡Odio perder!"
	done

BikerCharlesAfterBattleText:
	text "¡Lo único que"
	line "queremos es montar"
	cont "en moto!"
	done

BikerHarrisSeenText:
	text "¿Que qué tramamos?"

	para "Nada, de verdad."

	para "¡Solo queremos"
	line "divertirnos!"
	done
 
BikerHarrisBeatenText:
	text "¡Se acabó la"
	line "diversión!"
	done

BikerHarrisAfterBattleText:
	text "No creo que a"
	line "nadie le importe"
	para "quedarse sin agua"
	line "un rato, ¿no?"
	done

BikerDwayneSeenText:
	text "¿Conoces algún"
	line "sitio donde poder"
	cont "ir tranquilamente"
	cont "en moto?"
	done

BikerDwayneBeatenText:
	text "¡Me has parado en"
	line "seco!"
	done

BikerDwayneAfterBattleText:
	text "Supongo que iré en"
	line "moto por PUEBLO"
	cont "IEJIMA con los"
	cont "demás."
	done

BikerKazuSeenText:
	text "¡Somos los"
	line "MOTORISTAS ISLEÑOS"
	cont "de NIHON!"

	para "Qué pasa, ¿nunca"
	line "has oído hablar de"
	cont "nosotros?"
	done

BikerKazuBeatenText:
	text "¡MOTORISTA ISLEÑO"
	line "caído!"
	done

BikerKazuAfterBattleText:
	text "Lo sé, el nombre"
	line "no termina de"
	para "tener gancho, ni"
	line "siquiera entre mis"
	cont "amigos."
	done

BikerBennySeenText:
	text "¡Aquí no hay sitio"
	line "para sosainas!"
	done

BikerBennyBeatenText:
	text "Vale, eso ha"
	line "estado bien."
	done

BikerBennyAfterBattleText:
	text "El que me gana en"
	line "un combate #MON"
	cont "no puede ser un"
	cont "sosaina."
	done

BikerZekeSeenText:
	text "¿Crees que los"
	line "polis nos echarán"
	cont "si vienen?"
	done

BikerZekeBeatenText:
	text "¿Eres un poli?"
	done

BikerZekeAfterBattleText:
	text "Seguro que mi"
	line "madre se cabrearía"
	para "conmigo si me meto"
	line "en problemas con"
	cont "la ley."
	done

BikerJoelSeenText:
	text "¡Nadie nos dice a"
	line "los MOTORISTAS qué"
	cont "podemos o no"
	cont "hacer!"
	done

BikerJoelBeatenText:
	text "Supongo que no"
	line "puedo ganarte en"
	cont "un combate."
	done

BikerJoelAfterBattleText:
	text "¡Bah, qué más da!"

	para "¡Seguiré mi rumbo!"
	done

BikerGlennSeenText:
	text "¿Dónde están los"
	line "polis?"

	para "¿Los hemos"
	line "espantado también?"
	done

BikerGlennBeatenText:
	text "¡Tú no estás"
	line "asustado!"
	done

BikerGlennAfterBattleText:
	text "No les digas que"
	line "estamos aquí,"
	cont "¿vale?"
	done
	

HydroPlant_MapEvents:
	db 0, 0 ; filler

	db 28 ; warp events
	warp_event 18, 35, WEATHERED_TRAIL, 1
	warp_event 19, 35, WEATHERED_TRAIL, 2
	warp_event 29,  0, HYDRAULIC_CAVE, 1
	warp_event 30,  0, HYDRAULIC_CAVE, 1
	warp_event  5, 30, HYDRO_PLANT, 6
	warp_event  9, 31, HYDRO_PLANT, 5
	warp_event  9, 28, HYDRO_PLANT, 8
	warp_event 35,  2, HYDRO_PLANT, 7
	warp_event 13, 28, HYDRO_PLANT, 10
	warp_event 37, 11, HYDRO_PLANT, 9
	warp_event 19, 30, HYDRO_PLANT, 12
	warp_event  5, 27, HYDRO_PLANT, 11
	warp_event  3, 26, HYDRO_PLANT, 14
	warp_event  5,  2, HYDRO_PLANT, 13
	warp_event  3, 21, HYDRO_PLANT, 16
	warp_event 37, 29, HYDRO_PLANT, 15
	warp_event 33, 33, HYDRO_PLANT, 18
	warp_event 11, 20, HYDRO_PLANT, 17
	warp_event  3, 15, HYDRO_PLANT, 20
	warp_event 27, 32, HYDRO_PLANT, 19
	warp_event 13,  7, HYDRO_PLANT, 22
	warp_event 29,  8, HYDRO_PLANT, 21
	warp_event 11, 16, HYDRO_PLANT, 24
	warp_event 37, 23, HYDRO_PLANT, 23
	warp_event 15, 14, HYDRO_PLANT, 26
	warp_event  9,  2, HYDRO_PLANT, 25
	warp_event 29,  3, HYDRO_PLANT, 28
	warp_event 15, 35, HYDRO_PLANT, 27
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  8, BGEVENT_ITEM, HydroPlantNugget

	db 14 ; object events
	object_event 11, 33, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBikerBenny, EVENT_IEJIMA_TOWN_FIXED
	object_event 30, 16, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerBikerKazu, EVENT_IEJIMA_TOWN_FIXED
	object_event  8,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerDwayne, EVENT_IEJIMA_TOWN_FIXED
	object_event 10, 30, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBikerHarris, EVENT_IEJIMA_TOWN_FIXED
	object_event 27,  1, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerZeke, EVENT_IEJIMA_TOWN_FIXED
	object_event 19, 18, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerBikerCharles, EVENT_IEJIMA_TOWN_FIXED
	object_event 23, 31, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, EVENT_IEJIMA_TOWN_FIXED
	object_event 36,  3, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerBikerJoel, EVENT_IEJIMA_TOWN_FIXED
	object_event  7, 20, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerBikerGlenn, EVENT_IEJIMA_TOWN_FIXED
	object_event 10, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, HydroPlantLassScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event  3,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, HydroPlantTeacherScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 31, 29, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HydroPlantGentlemanScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 21, 19, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HydroPlantRockerScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 24, 16, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, HydroPlantGentlenman2Script, EVENT_IEJIMA_TOWN_NOT_FIXED
