	object_const_def ; object_event constants
	const SANSKRITGYM_PRYCE
	const SANSKRITGYM_BUENA1
;	const SANSKRITGYM_ROCKER1
	const SANSKRITGYM_BUENA2
	const SANSKRITGYM_ROCKER2
	const SANSKRITGYM_ROCKER3
	const SANSKRITGYM_GYM_GUY

BlueForestGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestGymPryceScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_PRYCE
	iftrue RematchScriptPryce
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptPryce
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall BlueForestGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_ROUTE_112_SNOW_STORM; for workers south of town
	setevent EVENT_STAND_CITY_ZOO_MONS; makes normal pokes in zoo disappear
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse BlueForestGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end
	
RematchScriptPryce:
	opentext
	writetext PryceRematchText
	waitbutton
	closetext
	winlosstext PryceRematchWinText, 0
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_PRYCE
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptPryce:
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
BlueForestGym_NoRoomForIcyWind:
	closetext
	end


BlueForestGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

BlueForestGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iftrue .PryceNotAround
	checkevent EVENT_BEAT_PRYCE
	iftrue .BlueForestGymGuyWinScript
	writetext BlueForestGymGuyText
	waitbutton
	closetext
	end
	
.PryceNotAround:
	writetext BlueForestGymGuyNotAroundText
	waitbutton
	closetext
	end

.BlueForestGymGuyWinScript:
	writetext BlueForestGymGuyWinText
	waitbutton
	closetext
	end

BlueForestGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext PRYCE, PRYCE1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

PryceRematchText:
	text "Así que ya has"
	line "vuelto de la LIGA."
	
	para "No debes asumir"
	line "que estás por"
	para "encima de los"
	line "gélidos vientos de"
	para "las montañas por"
	line "haber escalado"
	cont "hasta la cima."
	
	para "¡Permíteme mos-"
	line "trarte el arsenal"
	cont "de todo cuanto he"
	cont "aprendido!"
	done

PryceRematchWinText:
	text "Quizás hay algo"
	line "que es propio de"
	cont "la juventud…"
	done

PryceAfterRematchText:
	text "Me impresiona"
	line "tu valor."

	para "Con tu gran"
	line "voluntad, sé que"
	para "puedes superar"
	line "todos los"
	cont "obstáculos."
	done

BlueForestGymGuyNotAroundText:
	text "¡Eh, chico!"

	para "¡FREDO es un"
	line "combatiente frío"
	cont "como el hielo!"

	para "Pero tiene un"
	line "corazón de oro."

	para "Le importan los"
	line "#MON tanto como"
	cont "su familia."

	para "Pasa los días"
	line "entrenando"
	para "severamente en el"
	line "PASAJE ABISAL."

	para "A lo que me"
	line "refiero es que no"
	cont "suele estar por"
	cont "aquí."

	para "Pasará un rato"
	line "hasta que vuelva."

	para "Si quieres comba-"
	line "tir, a lo mejor"
	cont "te conviene ir a"
	cont "buscarlo."
	done

PryceText_Intro:
	text "Me alegra volver a"
	line "verte."

	para "Los #MON"
	line "tienen muchas"
	para "experiencias a lo"
	line "largo de sus"
	para "vidas, al igual"
	line "que nosotros."

	para "Yo también he"
	line "visto y sufrido"
	cont "mucho durante mi"
	cont "vida."

	para "Por eso he"
	line "decidido, en mi"
	para "vejez, centrarme"
	line "en lo que es"
	cont "importante."

	para "#MON."
	line "Familia."

	para "Son las cosas"
	line "que más aprecio."

	para "Asegúrate de"
	line "dedicar tiempo a"
	cont "aquello que"
	cont "aprecias."

	para "Sin embargo, un"
	line "buen combate"
	para "sigue siendo una"
	line "experiencia impor-"
	cont "tante."

	para "Permíteme"
	line "enseñarte de lo"
	cont "que hablo."
	done

PryceText_Impressed:
	text "¡Ah! Me impresiona"
	line "tu valor."

	para "Con tu gran"
	line "voluntad, sé que"
	para "superarás todos"
	line "los obstáculos."

	para "¡Te mereces esta"
	line "MEDALLA!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> recibió la"
	line "MEDALLA GLACIAR."
	done

PryceText_GlacierBadgeSpeech:
	text "Esta MEDALLA sube"
	line "las habilidades"

	para "ESPECIALES de los"
	line "#MON."

	para "Y tus #MON"
	line "usarán TORBELLINO"
	para "para pasar los"
	line "torbellinos."

	para "¡Además, te voy a"
	line "hacer un regalo!"
	done

PryceText_IcyWindSpeech:
	text "Esta MT contiene"
	line "VIENTO HIELO."

	para "Causa daño y baja"
	line "la velocidad."

	para "Demuestra la dure-"
	line "za del invierno."
	done

PryceText_CherishYourPokemon:
	text "La primavera llega"
	line "cuando se derrite"
	para "el hielo y la"
	line "nieve."

	para "Tú y tus #MON"
	line "pasaréis juntos"
	cont "muchos años."

	para "¡Pasadlo bien!"
	done

BoarderBradSeenText:
	text "Este GIMNASIO"
	line "tiene un suelo"
	para "resbaladizo. ¿A"
	line "que es divertido?"

	para "¡Pero oye, aquí no"
	line "estamos jugando!"
	done

BoarderBradBeatenText:
	text "¿Ves lo serios"
	line "que somos?"
	done

BoarderBradAfterBattleText:
	text "Este GIMNASIO es"
	line "genial. ¡Me"
	para "encanta patinar"
	line "con mis #MON!"
	done

BoarderDouglasSeenText:
	text "Conozco el secreto"
	line "de FREDO."
	done

BoarderDouglasBeatenText:
	text "Te contaré el"
	line "secreto de FREDO."
	done

BoarderDouglasAfterBattleText:
	text "El secreto del"
	line "poder de FREDO…"

	para "Entrena en condi-"
	line "ciones extremas en"
	cont "el PASAJE ABISAL."
	done

SkierRoxanneSeenText:
	text "Para vencer a"
	line "FREDO, el LÍDER"
	para "del GIMNASIO,"
	line "piensa antes de"
	cont "patinar."
	done

SkierRoxanneBeatenText:
	text "¡No perderé ante"
	line "ti esquiando!"
	done

SkierRoxanneAfterBattleText:
	text "Si no patinas con"
	line "precisión, no"
	para "lograrás nada en"
	line "este GIMNASIO."
	done

SkierClarissaSeenText:
	text "¡Mira qué bien lo"
	line "hago!"
	done

SkierClarissaBeatenText:
	text "¡No! ¡He perdido!"
	done

SkierClarissaAfterBattleText:
	text "No debería haber"
	line "presumido sobre mi"
	cont "forma de esquiar."
	done

BlueForestGymGuyText:
	text "FREDO es veterano."
	line "Lleva entrenando"

	para "#MON desde hace"
	line "50 años."

	para "Dicen que es bueno"
	line "congelando a sus"
	para "rivales con los"
	line "ataques de hielo."

	para "¡Eso quiere decir"
	line "que deberías"
	para "derretirle con tu"
	line "ardiente ambición!"
	done

BlueForestGymGuyWinText:
	text "¡FREDO es bueno,"
	line "pero tú eres aún"
	cont "mejor!"

	para "¡Ha sido un gran"
	line "combate que acortó"
	para "distancias entre"
	line "generaciones!"
	done

BlueForestGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, BLUE_FOREST, 1
	warp_event  5, 17, BLUE_FOREST, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlueForestGymStatue
	bg_event  6, 15, BGEVENT_READ, BlueForestGymStatue

	db 6 ; object events
	object_event  3,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestGymPryceScript, EVENT_PRYCE_IN_GYM
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
;	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBoarderRonald, -1
	object_event  0, 17, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  0,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestGymGuyScript, -1
