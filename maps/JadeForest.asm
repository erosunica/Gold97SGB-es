	object_const_def ; object_event constants
	const JADEFOREST_ROCKER
	const JADEFOREST_POKE_BALL1
	;const JADEFOREST_KURT
	const JADEFOREST_LASS
	const JADEFOREST_YOUNGSTER2
	const JADEFOREST_POKE_BALL2
	const JADEFOREST_POKE_BALL3
	const JADEFOREST_POKE_BALL4
	const JADEFOREST_HIKER
	const JADEFOREST_FIREBREATHER
	const JADEFOREST_COOLTRAINERF
	const ROUTEU4U_FRUIT_TREE1
	const ROUTEU4U_FRUIT_TREE2
	const ROUTEU4U_FRUIT_TREE3

JadeForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


JadeForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	buttonsound
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBugCatcherWayne:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWayneAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

JadeForestLassScript:
	jumptextfaceplayer Text_JadeForestLass

JadeForestRevive:
	itemball REVIVE

JadeForestPrettyTail:
	itemball PRETTY_TAIL

JadeForestAntidote:
	itemball ANTIDOTE

JadeForestEther:
	itemball ETHER

JadeForestHiddenEther:
	hiddenitem ETHER, EVENT_JADE_FOREST_HIDDEN_ETHER

JadeForestHiddenPowerWings:
	hiddenitem POWER_WINGS, EVENT_JADE_FOREST_HIDDEN_SUPER_POTION

JadeForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_JADE_FOREST_HIDDEN_FULL_HEAL

JadeForestHiddenAwakening:
	hiddenitem AWAKENING, EVENT_JADE_FOREST_HIDDEN_AWAKENING

JadeForestBoulder:
; unused
	jumpstd StrengthBoulderScript

JadeForestSignpost:
	clearevent EVENT_BEAT_BUG_CATCHER_WAYNE
	jumptext JadeForestSignpostText

JadeForestSignpost2:
	jumptext JadeForestSignpost2Text
	

RouteU4UFruitTree1:
	fruittree FRUITTREE_TREE_JADE_FOREST_1

RouteU4UFruitTree2:
	fruittree FRUITTREE_TREE_JADE_FOREST_2

RouteU4UFruitTree3:
	fruittree FRUITTREE_TREE_JADE_FOREST_3
	
Text_HeadbuttIntro:
	text "¿Que qué hago?"

	para "Agitar los árboles"
	line "con GOLPE CABEZA."

	para "Es muy divertido."
	line "¡Toma, pruébalo!"
	done

Text_HeadbuttOutro:
	text "Agita los árboles"
	line "con GOLPE CABEZA."

	para "A veces caen"
	line "#MON dormidos."
	done

Text_JadeForestLass:
	text "Hay muchos #MON"
	line "en el BOSQUE con"
	para "movimientos que"
	line "provocan cambios"
	cont "de estado."
	
	para "No te vendría mal"
	line "llevar objetos"
	cont "curativos."
	done

JadeForestSignpostText:
	text "Hay tantos árboles"
	line "en el BOSQUE JADE"
	para "que no se ve ni"
	line "el cielo."

	para "Por favor, busca"
	line "objetos que puedan"
	cont "haber caído."
	done
	
JadeForestSignpost2Text:
	text "Salida por la"
	line "derecha a RUTA 106"
	done

BugCatcherWayneSeenText:
	text "¡No me des estos"
	line "sustos!"

	para "¡Un #MON ha"
	line "escapado asustado!"
	done

BugCatcherWayneBeatenText:
	text "Nunca antes había"
	line "visto a ese"
	cont "#MON…"
	done

BugCatcherWayneAfterBattleText:
	text "Al usar GOLPE CA-"
	line "BEZA en ese árbol,"
	para "cayó un #MON"
	line "que no había visto"
	cont "en mi vida."

	para "Creo que debo usar"
	line "GOLPE CABEZA en"
	cont "más sitios."
	done

HikerLeonardSeenText:
	text "¡Voy a seguir en"
	line "este BOSQUE hasta"
	para "que haya visto a"
	line "todos los #MON"
	cont "que viven aquí!"
	done

HikerLeonardBeatenText:
	text "¡Debería seguir"
	line "dedicándome al"
	cont "alpinismo!"
	done

HikerLeonardAfterBattleText:
	text "El BOSQUE tiene"
	line "muchas especies de"
	para "#MON que no"
	line "aparecen en ningu-"
	cont "na otra parte."
	done


FirebreatherBillSeenText:
	text "¡Mis #MON de"
	line "fuego arrasan con"
	para "todo lo que haya"
	line "en este BOSQUE!"
	done

FirebreatherBillBeatenText:
	text "¡Auch!"
	done

FirebreatherBillAfterBattleText:
	text "Debo tener cuidado"
	line "de no incendiar"
	cont "los árboles."
	done
	

CooltrainerfGwenSeenText:
	text "¡No me he perdido!"

	para "¡E incluso si lo"
	line "estuviera, mi"
	para "equipo está"
	line "preparado contra"
	cont "cualquier"
	cont "entrenador!"
	done

CooltrainerfGwenBeatenText:
	text "Es importante"
	line "estar preparado."
	done

CooltrainerfGwenAfterBattleText:
	text "¡Te digo que sé"
	line "por dónde voy!"
	done

JadeForest_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  0, 26, ROUTE_106, 3
	warp_event  0, 27, ROUTE_106, 4
	warp_event 49, 26, ROUTE_106, 5
	warp_event 49, 27, ROUTE_106, 6
	warp_event  4, 56, ROUTE_U10U, 4
	warp_event  4, 57, ROUTE_U10U, 5
	warp_event  4,  4, JADE_FOREST_SNORLAX_ROOM, 1
	warp_event  5,  4, JADE_FOREST_SNORLAX_ROOM, 2
	
	db 0 ; coord events

	db 6 ; bg events
	bg_event 27, 41, BGEVENT_READ, JadeForestSignpost
	bg_event 32,  6, BGEVENT_ITEM, JadeForestHiddenEther
	bg_event 13, 55, BGEVENT_ITEM, JadeForestHiddenPowerWings
	bg_event 30, 53, BGEVENT_ITEM, JadeForestHiddenFullHeal
	bg_event 30, 43, BGEVENT_ITEM, JadeForestHiddenAwakening
	bg_event 39, 29, BGEVENT_READ, JadeForestSignpost2

	db 13 ; object events
	object_event 19,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JadeForestHeadbuttGuyScript, -1
	object_event 23, 55, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestRevive, EVENT_JADE_FOREST_REVIVE
	;object_event 12, 29, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JADE_FOREST_KURT
	object_event 17, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, JadeForestLassScript, -1
	object_event 34, 40, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherWayne, -1
	object_event 31, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestPrettyTail, EVENT_JADE_FOREST_X_ATTACK
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestAntidote, EVENT_JADE_FOREST_ANTIDOTE
	object_event 42,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestEther, EVENT_JADE_FOREST_ETHER
	object_event 27, 35, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerHikerLeonard, -1
	object_event 43, 51, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 19, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfGwen, -1
	object_event 13, 49, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree1, -1
	object_event 12, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree2, -1
	object_event 15, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree3, -1

