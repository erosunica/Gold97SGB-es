	object_const_def ; object_event constants
	const MTFUJIINTERIOR_POKE_BALL1
	const MTFUJIINTERIOR_POKE_BALL2
	const MTFUJIINTERIOR_POKE_BALL3
	const MTFUJIINTERIOR_POKE_BALL4
	const MTFUJIINTERIOR_POKE_BALL5
	const MTFUJIINTERIOR_COOLTRAINER_M
	const MTFUJIINTERIOR_COOLTRAINER_M2
	const MTFUJIINTERIOR_COOLTRAINER_F
	const MTFUJIINTERIOR_INSTRUCTOR
	const MTFUJIINTERIOR_SWIMMERM
	const MTFUJIINTERIOR_SWIMMERF
	const MTFUJIINTERIOR_ENGINEER
	const MTFUJIINTERIOR_COOLTRAINER_M3
	const MTFUJIINTERIOR_COOLTRAINER_F2

MtFujiInteriorLower_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


MtFujiInteriorLowerTMEarthquake:
	itemball TM_EARTHQUAKE

MtFujiInteriorLowerMaxRevive:
	itemball MAX_REVIVE

MtFujiInteriorLowerFullRestore:
	itemball FULL_RESTORE

MtFujiInteriorLowerFullHeal:
	itemball FULL_HEAL

MtFujiInteriorLowerHPUp:
	itemball HP_UP

MtFujiInteriorLowerHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_MT_FUJI_INTERIOR_LOWER_HIDDEN_MAX_POTION

MtFujiInteriorLowerHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_MT_FUJI_INTERIOR_LOWER_HIDDEN_FULL_HEAL

TrainerCooltrainermCody:
	trainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end


TrainerInstructorGeoff:
	trainer INSTRUCTOR, GEOFF, EVENT_BEAT_INSTRUCTOR_GEOFF, InstructorGeoffSeenText, InstructorGeoffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorGeoffAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLisa:
	trainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLisaAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerDavidson:
	trainer ENGINEER, DAVIDSON, EVENT_BEAT_ENGINEER_DAVIDSON, EngineerDavidsonSeenText, EngineerDavidsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerDavidsonAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_COOLTRAINERM_ERICK, CooltrainermErickSeenText, CooltrainermErickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermErickAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

CooltrainermErickSeenText:
	text "¿Ya estás cansado?"
	done

CooltrainermErickBeatenText:
	text "Creo que yo sí"
	line "estoy cansado."
	done

CooltrainermErickAfterBattleText:
	text "Todavía queda un"
	line "trecho hasta la"
	cont "cima."

	para "He oído que el"
	line "último tramo es"
	cont "como un laberinto."
	done

CooltrainermJakeSeenText:
	text "Estoy haciendo"
	line "los últimos"
	para "preparativos para"
	line "la LIGA #MON."
	done

CooltrainermJakeBeatenText:
	text "¡Caramba!"
	done

CooltrainermJakeAfterBattleText:
	text "Va a ser difícil"
	line "ganar en la LIGA."

	para "Tengo que entre-"
	line "narme mucho más."

	para "Dicen que el ALTO"
	line "MANDO es más duro"
	cont "que los LÍDERES de"
	cont "GIMNASIO."
	done

CooltrainerfJoyceSeenText:
	text "Si has llegado tan"
	line "lejos, debes de"
	cont "ser el no va más."

	para "¡Voy a dar todo"
	line "lo que tengo en"
	cont "este combate!"
	done

CooltrainerfJoyceBeatenText:
	text "¡No! ¡No puedo"
	line "creerlo!"
	done

CooltrainerfJoyceAfterBattleText:
	text "Como había vencido"
	line "a ocho LÍDERES de"

	para "GIMNASIO, me"
	line "confié demasiado."

	para "Tendré que"
	line "esforzarme más."
	done

InstructorGeoffSeenText:
	text "Aquí los entrena-"
	line "dores son muy"
	cont "fuertes."

	para "Cada combate puede"
	line "ser una gran"
	para "experiencia de la"
	line "que aprender."
	done

InstructorGeoffBeatenText:
	text "De aquí me llevo"
	line "algo aprendido."
	done

InstructorGeoffAfterBattleText:
	text "Los #MON"
	line "salvajes de aquí"
	cont "también son muy"
	cont "fuertes."
	done

SwimmermHaroldSeenText:
	text "¿Estás usando un"
	line "#MON para"
	cont "cruzar la cueva?"

	para "¡Si estuvieras"
	line "listo para la"
	cont "LIGA, irías"
	cont "nadando!"
	done

SwimmermHaroldBeatenText:
	text "¡Glup…!"
	done

SwimmermHaroldAfterBattleText:
	text "Supongo que saber"
	line "nadar no significa"
	para "mucho en un"
	line "combate #MON."
	done

SwimmerfLisaSeenText:
	text "El agua es más"
	line "cálida de lo que"
	cont "me esperaba."
	done

SwimmerfLisaBeatenText:
	text "¡Hundida!"
	done

SwimmerfLisaAfterBattleText:
	text "Prefiero nadar en"
	line "cuevas que al aire"
	cont "libre."
	done

EngineerDavidsonSeenText:
	text "¡Encontraré una"
	line "manera de llegar"
	para "más rápido a la"
	line "cima que caminando"
	cont "por esas cuevas!"
	done

EngineerDavidsonBeatenText:
	text "Creo que iré"
	line "caminando."
	done

EngineerDavidsonAfterBattleText:
	text "Eres bastante"
	line "fuerte."

	para "¡No pierdas en la"
	line "LIGA o me sentiré"
	para "peor de haber"
	line "perdido contra ti!"
	done

CooltrainermCodySeenText:
	text "El MT. FUJI es muy"
	line "grande."

	para "¡Será mejor que"
	line "estés preparado,"
	para "porque vas a estar"
	line "por aquí un buen"
	cont "rato!"
	done

CooltrainermCodyBeatenText:
	text "¡Maldición!"
	line "¡Ojalá tuviera"
	cont "mejores #MON!"
	done

CooltrainermCodyAfterBattleText:
	text "Esta montaña está"
	line "dividida en cinco"
	cont "partes distintas."

	para "¡Esta es solo la"
	line "primera!"
	done
	
CooltrainerfQuinnSeenText:
	text "¡Estás ahí!"
	line "¿Quieres luchar?"
	done

CooltrainerfQuinnBeatenText:
	text "He perdido…"
	done

CooltrainerfQuinnAfterBattleText:
	text "Eres fuerte."

	para "Seguro que te has"
	line "entrenado mucho."
	done


MtFujiInteriorLower_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  9, 51, CROWN_CITY, 5
	warp_event 17, 41, MOUNT_FUJI_OUTSIDE, 1
	warp_event  5, 33, MOUNT_FUJI_OUTSIDE, 2
	warp_event 29, 23, MOUNT_FUJI_OUTSIDE, 3
	warp_event 23, 15, MOUNT_FUJI_OUTSIDE, 4
	warp_event  5,  3, MOUNT_FUJI_OUTSIDE, 5
	warp_event 34, 25, MT_FUJI_INTERIOR_LOWER, 8
	warp_event 34, 42, MT_FUJI_INTERIOR_LOWER, 7
	warp_event 31,  2, MT_FUJI_INTERIOR_UPPER, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 23, 22, BGEVENT_ITEM, MtFujiInteriorLowerHiddenMaxPotion
	bg_event  3, 40, BGEVENT_ITEM, MtFujiInteriorLowerHiddenFullHeal

	db 14 ; object events
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerTMEarthquake, EVENT_MT_FUJI_INTERIOR_LOWER_TM_EARTHQUAKE
	object_event 37, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerMaxRevive, EVENT_MT_FUJI_INTERIOR_LOWER_MAX_REVIVE
	object_event 11, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerFullRestore, EVENT_MT_FUJI_INTERIOR_LOWER_FULL_RESTORE
	object_event  7, 41, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerFullHeal, EVENT_MT_FUJI_INTERIOR_LOWER_FULL_HEAL
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerHPUp, EVENT_MT_FUJI_INTERIOR_LOWER_HP_UP
	object_event 13, 46, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event 31, 44, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermJake, -1
	object_event 24, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfJoyce, -1
	object_event 18, 49, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerInstructorGeoff, -1
	object_event 10, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 18, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLisa, -1
	object_event 28, 24, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerEngineerDavidson, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermErick, -1
	object_event 27, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfQuinn, -1
