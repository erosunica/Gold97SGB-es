	object_const_def ; object_event constants
	const NANJO_FOREST_YOUNGSTER
	const NANJO_FOREST_BUG_CATCHER
	const NANJO_FOREST_SILVER
	const NANJO_FOREST_ITEMBALL_1
	const NANJO_FOREST_ITEMBALL_2
	const NANJO_FOREST_ITEMBALL_3
	const NANJO_FOREST_ITEMBALL_4
	const NANJO_FOREST_TREE_1
	const NANJO_FOREST_TREE_2

NanjoForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekSZ
	
.CheckDayOfWeekSZ:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdaySZ
.disapearSZSilver
	disappear NANJO_FOREST_SILVER
	return
	
.WednesdaySZ
	checkevent EVENT_DEFEATED_SILVER_IN_NANJO_FOREST
	iftrue .disapearSZSilver
	appear NANJO_FOREST_SILVER
	return

LuckyEggYoungsterScript:
	faceplayer
	checkevent EVENT_GOT_LUCKY_EGG_FROM_NANJO_FOREST_GUY
	iftrue .AlreadyGaveLuckyEgg
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .TryGivingLuckyEgg
.NoLuckyEggYet
	opentext
	writetext NoLuckyEggYetText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.TryGivingLuckyEgg
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoLuckyEggYet
	checkevent EVENT_TALKED_TO_NANJO_FOREST_GUY_ONCE
	iffalse .SetUpLuckyEgg
	opentext
	writetext HeresLuckyEggText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse .NoEggFull
	writetext WhatDoesLuckyEggDoText
	waitbutton
	closetext
	setevent EVENT_GOT_LUCKY_EGG_FROM_NANJO_FOREST_GUY
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.NoEggFull
	closetext
	end
	
.SetUpLuckyEgg
	opentext
	writetext NoLuckyEggYetText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_NANJO_FOREST_GUY_ONCE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveLuckyEgg
	opentext
	writetext AlreadyGaveLuckyEggText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
LuckyEggBugCatcherScript:
	faceplayer
	opentext
	writetext LuckyEggBugCatcherText
	waitbutton
	closetext
	turnobject NANJO_FOREST_BUG_CATCHER, RIGHT
	end
	
NanjoFruitTree1:
	fruittree FRUITTREE_TREE_NANJO_FOREST
	
NanjoFruitTree2:
	fruittree FRUITTREE_TREE_NANJO_FOREST_2
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	setevent EVENT_DEFEATED_SILVER_IN_NANJO_FOREST
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playmapmusic
	end
	
.TalkToSilverAfterBattle
	faceplayer
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	end
	

NanjoForestMaxRevive:
	itemball MAX_REVIVE

NanjoForestUltraBall:
	itemball ULTRA_BALL

NanjoForestFullHeal:
	itemball FULL_HEAL

NanjoForestFullRestore:
	itemball FULL_RESTORE
	
NanjoForestSign:
	jumptext NanjoForestSignText
	
NanjoForestSign2:
	jumptext NanjoForestSign2Text
	
NanjoForestSignText:
	text "“PROHIBIDO TIRAR"
	line "BASURA”"

	para "Por favor,"
	line "recógela tú mismo."
	done

NanjoForestSign2Text:
	text "Salida hacia el"
	line "GRAN CANAL LEVANTE"
	done

NanjoForestSilverBefore:
	text "<RIVAL>: ¡Hola,"
	line "<PLAYER>!"

	para "¡Cuánto tiempo!"

	para "He venido a las"
	line "ISLAS a seguir"
	para "entrenando y"
	line "estrechando lazos"
	cont "con mis #MON."

	para "He aprendido más"
	line "sobre cómo"
	cont "trabajar en equipo"
	cont "con ellos."

	para "Nos hemos unido"
	line "mucho últimamente."

	para "¡Pero también nos"
	line "hemos hecho mucho"
	cont "más fuertes!"

	para "¡Ya sabes lo que"
	line "eso significa!"
	done

NanjoForestSilverTextWin:
	text "¡Me has ganado!"
	done

NanjoForestSilverTextLoss:
	text "¡Bien!"
	done

NanjoForestSilverAfter:
	text "Uf, menudo"
	line "combate."

	para "Creo que ya he"
	line "entrenado lo"
	cont "suficiente por"
	cont "aquí."

	para "¡A lo mejor"
	line "volvemos a vernos"
	cont "en alguna otra"
	cont "parte!"
	done

WhatDoesLuckyEggDoText:
	text "Me pregunto de"
	line "dónde viene."

	para "¿Podrá usarlo un"
	line "#MON?"
	done

HeresLuckyEggText:
	text "¡Oye, mira esto!"

	para "¡He encontrado"
	line "algo!"

	para "¿Será un HUEVO?"

	para "Ni idea, pero"
	line "puedes quedártelo."
	done

AlreadyGaveLuckyEggText:
	text "Nunca sabes qué te"
	line "podrás encontrar"
	cont "por aquí."
	done

NoLuckyEggYetText:
	text "Estoy buscando"
	line "cosas interesantes"
	cont "que llegan a la"
	cont "orilla."

	para "Encuentro muchos"
	line "objetos como"
	cont "POCIONES y CURA"
	cont "TOTAL."

	para "¡Una vez incluso"
	line "encontré una"
	cont "PEPITA!"

	para "Seguro que tú"
	line "también encuentras"
	cont "algo que merezca"
	cont "la pena."

	para "Vuelve en otra"
	line "ocasión para"
	cont "buscar conmigo."

	para "Compartiré algo de"
	line "lo que encuentre"
	cont "contigo."
	done

LuckyEggBugCatcherText:
	text "¡Mi hermano y yo"
	line "encontramos un"
	para "montón de cosas"
	line "chulas que llegan"
	cont "a la orilla!"

	para "¡No todo es"
	line "basura, a veces"
	cont "encontramos"
	cont "tesoros!"
	done	

NanjoForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0, 18, URASOE_TRAIL, 3
	warp_event  0, 19, URASOE_TRAIL, 4
	warp_event 39,  6, GREAT_EAST_STRAIT, 1
	warp_event 39,  7, GREAT_EAST_STRAIT, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 29, 21, BGEVENT_READ, NanjoForestSign
	bg_event 37,  7, BGEVENT_READ, NanjoForestSign2

	db 9 ; object events
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LuckyEggYoungsterScript, -1
	object_event 23,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LuckyEggBugCatcherScript, -1
	object_event  6,  8, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_SILVER_APPEARS_IN_NANJO_FOREST
	object_event 32, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_PICKED_UP_MAX_REVIVE_FROM_NANJO_FOREST
	object_event 12,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_PICKED_UP_ULTRA_BALL_FROM_NANJO_FOREST
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_PICKED_UP_FULL_HEAL_FROM_NANJO_FOREST
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_PICKED_UP_FULL_RESTORE_FROM_NANJO_FOREST
	object_event 33, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree1, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree2, -1
