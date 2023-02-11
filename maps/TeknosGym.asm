	object_const_def ; object_event constants
	const TEKNOSGYM_WHITNEY
	const TEKNOSGYM_LASS1
	const TEKNOSGYM_LASS2
	const TEKNOSGYM_BUENA1
	const TEKNOSGYM_GYM_GUY

TeknosGym_MapScripts:
	db 0 ; scene scripts
	
	db 0 ; callbacks


TeknosGymWhitneyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_WHITNEY
	iftrue RematchScriptWhitney
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptWhitney
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	specialphonecall SPECIALCALL_ROBBED
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall TeknosGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	writetext Whitney_BadgeSpeech
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext Whitney_GoodLuck
	waitbutton
.NoRoomForAttract
	closetext
	end
	
RematchScriptWhitney:
	opentext
	writetext WhitneyRematchText
	waitbutton
	closetext
	winlosstext WhitneyRematchWinText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_WHITNEY
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptWhitney:
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

WhitneyRematchText:
	text "¿Has venido hasta"
	line "aquí solo para"
	cont "verme?"
	
	para "¿O has venido para"
	line "combatir de nuevo?"
	
	para "¡Sea lo que sea,"
	line "aquí me tienes!"
	done

WhitneyRematchWinText:
	text "¡Hala! ¡No me"
	line "extraña que me"
	cont "ganases antes!"
	done

WhitneyAfterRematchText:
	text "¡Oí que te"
	line "encargaste del"
	cont "TEAM ROCKET!"
	
	para "¡Me alegro! No he"
	line "vuelto a ver a un"
	para "solo ROCKET desde"
	line "que pasó lo del"
	cont "ACUARIO."
	done


TeknosGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end



TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end



TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end



TeknosGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	iftrue .whitneynothere
	checkevent EVENT_BEAT_WHITNEY
	iftrue .TeknosGymGuyWinScript
	writetext TeknosGymGuyText
	waitbutton
	closetext
	end
	
.whitneynothere
	writetext TeknosGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.TeknosGymGuyWinScript:
	writetext TeknosGymGuyWinText
	waitbutton
	closetext
	end

TeknosGymStatue:
;	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
;	specialphonecall SPECIALCALL_ROBBED
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

Whitney_GoodLuck:
	text "¡Buena suerte"
	line "con el desafío de"
	cont "la LIGA!"

	para "¡No dejes que nada"
	line "se interponga en"
	cont "tus sueños!"
	done

WhitneyBeforeText:
	text "¡Hola! ¡Soy"
	line "BLANCA!"

	para "¡Pero yo ya sé"
	line "quién eres,"
	cont "<PLAYER>!"
	
	para "¡Ya te has dado a"
	line "conocer por la"
	cont "ciudad!"
	
	para "Suelo ser yo la"
	line "que presta ayuda"
	para "cuando algo va"
	line "mal, ¡pero por lo"
	para "que veo, has"
	line "demostrado que"
	para "tienes lo que hace"
	line "falta tanto en la"
	para "MINA como en el"
	line "ACUARIO!"
	
	para "¡Así que quiero"
	line "darte las gracias!"
	
	para "¡Pero sé que estás"
	line "aquí para un"
	cont "combate!"
	
	para "¡Así que pienso"
	line "darte lo que"
	cont "buscas!"
	done

WhitneyShouldntBeSoSeriousText:
	text "¡Ja!"

	para "¡Veo que también"
	line "se te da bien"
	cont "combatir!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> recibió la"
	line "MEDALLA PLANICIE."
	done

Whitney_BadgeSpeech:
	text "La MEDALLA"
	line "PLANICIE aumenta"
	cont "la VELOCIDAD de"
	cont "tus #MON."

	para "¡Ah, toma esto"
	line "también!"
	done

WhitneyAttractText:
	text "¡Es ATRACCIÓN!"
	line "Utiliza todo el"
	para "encanto de un"
	line "#MON."

	para "¿No es perfecto"
	line "para una monada"
	cont "como yo?"
	done

LassCarrieSeenText:
	text "No dejes que te"
	line "impresione la"
	para "belleza de mis"
	line "#MON."
	cont "¡Son muy fuertes!"
	done

LassCarrieBeatenText:
	text "¡Vaya…! Pensaba"
	line "que eras débil…"
	done

LassCarrieAfterBattleText:
	text "¿Creen mis #MON"
	line "que soy guapa?"
	done

LassBridgetSeenText:
	text "Prefiero un"
	line "#MON mono a un"
	cont "#MON fuerte."

	para "¡Mis #MON son"
	line "monos y fuertes!"
	done

LassBridgetBeatenText:
	text "¡Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "Intento vencer a"
	line "BLANCA, pero…"
	cont "Es deprimente."

	para "¡De acuerdo! ¡Si"
	line "pierdo, volveré"
	para "a intentarlo"
	line "otra vez!"
	done

BridgetWhitneyCriesText:
	text "¡Oh, no! Has hecho"
	line "llorar a BLANCA."

	para "¡No te preocupes!"
	line "Pronto dejará de"
	para "llorar. Siempre"
	line "llora si pierde."
	done

BeautySamanthaSeenText:
	text "¡Hazlo lo mejor"
	line "que puedas o"
	cont "acabaré contigo!"
	done

BeautySamanthaBeatenText:
	text "¡No! ¡Oh, MEOWTH,"
	line "lo siento mucho!"
	done

BeautySamanthaAfterBattleText:
	text "Le había enseñado"
	line "a MEOWTH todo tipo"
	cont "de ataques…"
	done
	
TeknosGymGuyTextNotHere:
	text "¡Hola, joven"
	line "promesa!"
	
	para "A BLANCA se la"
	line "conoce por estar"
	para "siempre ocupada"
	line "implicándose en"
	para "los problemas de"
	line "la ciudad."
	
	para "¡Lo que quiero"
	line "decir es que no"
	cont "está aquí!"
	
	para "Algo debe estar"
	line "sucediendo en la"
	cont "ciudad."
	done

TeknosGymGuyText:
	text "¡Hola! ¿Vas a"
	line "combatir?"

	para "Este GIMNASIO es"
	line "para entrenadores"
	para "que usan #MON"
	line "de tipo normal."

	para "Te recomiendo usar"
	line "los #MON de"
	cont "tipo lucha."
	done

TeknosGymGuyWinText:
	text "¿Has ganado?"
	line "¡Genial! Yo estaba"
	para "ocupado mirando a"
	line "las chicas."
	done

TeknosGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, TEKNOS_CITY, 7
	warp_event  3, 17, TEKNOS_CITY, 13

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 14, BGEVENT_READ, TeknosGymStatue
	bg_event  4, 15, BGEVENT_READ, TeknosGymStatue

	db 5 ; object events
	object_event 16, 13, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TeknosGymWhitneyScript, EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	object_event  4,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerLassCarrie, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerLassBridget, -1
	object_event 17,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosGymGuyScript, -1
