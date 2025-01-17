	object_const_def ; object_event constants
	const DAITO_MILTANK1
	const DAITO_MILTANK2
	const DAITO_MILTANK3
	const DAITO_JANINE
	const DAITO_FARMER1
	const DAITO_FARMER2
	const DAITO_GEOFFREY
	const APPLETREE1
	const APPLETREE2
	const APPLETREE3
	const APPLETREE4
	const APPLETREE5
	const APPLETREE6
	const APPLETREE7

DaitoRanch_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setevent EVENT_GEOFFREY_GONE_TO_DAITO
	setflag ENGINE_FLYPOINT_DAITO
	return

DaitoRanchSign:
	jumptext DaitoRanchSignText
	
DaitoRanchSignText:
	text "RANCHO DAITO"

	para "Productores de"
	line "leche de las ISLAS"
	cont "PONIENTES"
	done

SummerHomeSign:
	jumpstd PokecenterSignScript
	
SummerHomeSignText:
	text "CASA DE VERANEO DE"
	line "GODOFREDO EL"
	cont "JARDINERO"
	done

DaitoRanchMiltank:
	opentext
	writetext DaitoRanchMiltankText
	cry MILTANK
	waitbutton
	closetext
	end
	
DaitoRanchJanine:
	jumptextfaceplayer DaitoRanchJanineText
	
AppleOrchardSign:
	jumptext AppleOrchardSignText
	
DaitoRanchJanineText:
	text "Es un lugar"
	line "encantador,"
	cont "¿verdad?"
	done

AppleOrchardSignText:
	text "HUERTO DE MANZANAS"
	line "DAITO"
	done

Appletree1:
	fruittree FRUITTREE_TREE_DAITO_1
	
Appletree2:
	fruittree FRUITTREE_TREE_DAITO_2
	
Appletree3:
	fruittree FRUITTREE_TREE_DAITO_3
	
Appletree4:
	fruittree FRUITTREE_TREE_FIX_34; not used because doesn't respawn?
	
Appletree5:
	fruittree FRUITTREE_TREE_FIX_35; not used because doesn't respawn?
	
Appletree6:
	fruittree FRUITTREE_TREE_DAITO_4
	
Appletree7:
	fruittree FRUITTREE_TREE_DAITO_5

Route105FruitTree1:
	fruittree FRUITTREE_TREE_DAITO_6

Route105FruitTree2:
	fruittree FRUITTREE_TREE_DAITO_7


DaitoRanchMiltankText:
	text "MILTANK: ¡Muu!"
	done
	
DaitoFarmer1Script:
	jumptextfaceplayer DaitoFarmer1Text
	
DaitoFarmer1Text:
	text "¿Ves esos árboles?"

	para "Esto es lo que se"
	line "llama un"
	cont "cortavientos."

	para "Protege los"
	line "cultivos de ser"
	cont "dañados por el"
	cont "vendaval."
	done

DaitoFarmer2Script:
	jumptextfaceplayer DaitoFarmer2Text
	
DaitoFarmer2Text:
	text "Este campo de"
	line "cultivo ahora está"
	para "lleno de flores"
	line "porque estamos"
	para "ciclando la tierra"
	line "de cara a la"
	para "próxima estación"
	line "de siembra."

	para "Si miras bien a lo"
	line "mejor encuentras"
	cont "algunas bayas."
	done

HiddenBerry1:
	hiddenitem MIRACLEBERRY, EVENT_DAITO_HIDDENBERRY1
	
HiddenBerry2:
	hiddenitem GOLD_BERRY, EVENT_DAITO_HIDDENBERRY2
	
HiddenBerry3:
	hiddenitem MYSTERYBERRY, EVENT_DAITO_HIDDENBERRY3
	
HiddenBerry4:
	hiddenitem BITTER_BERRY, EVENT_DAITO_HIDDENBERRY4


DaitoGeoffPatioScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue .geoffpart2
	writetext GeoffThanksVisitText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
.geoffpart2:
	writetext GeoffIslandLifeText
	waitbutton
.NoRoom:
	closetext
	end

GeoffThanksVisitText:
	text "Oye, ¿no nos"
	line "conocimos en la"
	cont "RUTA 104?"

	para "Era agotador"
	line "cultivar en el"
	para "desierto, ¡así que"
	line "vine a trabajar"
	cont "en este RANCHO!"

	para "Ya que te has"
	line "tomado la molestia"
	para "de venir hasta"
	line "aquí para verme,"
	para "¡a esta bebida"
	line "invita la casa!"
	done

GeoffIslandLifeText:
	text "¿Qué te parece"
	line "este sitio?"

	para "Una vista"
	line "preciosa, ¿verdad?"

	para "Mucho mejor que el"
	line "esperpento de la"
	cont "RUTA 104."

	para "¡Aquí también"
	line "puedo cultivar"
	para "toda clase de"
	line "plantas"
	cont "tropicales!"

	para "Ven más tarde y te"
	line "contaré todo sobre"
	cont "ellas."
	done


DaitoRanch_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13, 28, DAITO_RANCH_HOUSE, 1
	warp_event  9, 29, DAITO_RANCH_BARN, 1
	warp_event 21, 32, GARDENER_GEOFF_DAITO_HOUSE, 1
	warp_event  9,  5, DAITO_RANCH_ORCHARD_HOUSE, 1
	warp_event 23, 38, DAITO_POKECENTER_1F, 1
	warp_event 21, 45, DAITO_RANCH_OTHER_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 14, 31, BGEVENT_READ, DaitoRanchSign
	bg_event 24, 38, BGEVENT_READ, SummerHomeSign
	bg_event 14, 12, BGEVENT_READ, AppleOrchardSign
	bg_event 13, 49, BGEVENT_ITEM, HiddenBerry1
	bg_event 16, 48, BGEVENT_ITEM, HiddenBerry2
	bg_event 14, 47, BGEVENT_ITEM, HiddenBerry3
	bg_event 17, 47, BGEVENT_ITEM, HiddenBerry4

	db 14 ; object events
	object_event 10, 39, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DaitoRanchMiltank, -1
	object_event 14, 38, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DaitoRanchMiltank, -1
	object_event 13, 40, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DaitoRanchMiltank, -1
	object_event 13, 34, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaitoRanchJanine, -1
	object_event 18, 45, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DaitoFarmer1Script, -1
	object_event 14, 48, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DaitoFarmer2Script, -1
	object_event 22, 29, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT,0, 0, -1, DAY, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DaitoGeoffPatioScript, -1
	object_event 14,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Appletree1, -1
	object_event 15, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Appletree2, -1
	object_event 20,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Appletree3, -1
	object_event 18,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route105FruitTree1, -1
	object_event 17, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route105FruitTree2, -1
	object_event 19, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Appletree6, -1
	object_event 16,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Appletree7, -1
