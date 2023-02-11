	object_const_def ; object_event constants
	const SILENTHILLS_LASS
	const SILENTHILLS_YOUNGSTER
	const SILENTHILLS_BUG_CATCHER
	const SILENTHILLS_BUG_CATCHER2
	const SILENTHILLS_FRUIT_TREE1
	const SILENTHILLS_SUNNY
	const SILENTHILLS_FRUIT_TREE2
	const SILENTHILLS_FRUIT_TREE3
	const SILENTHILLS_ROCKER
	const SILENTHILLS_POKEBALL

SilentHills_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear SILENTHILLS_SUNNY
	return

.SunnyAppears:
	appear SILENTHILLS_SUNNY
	return

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingClayton:
	trainer FLEDGLING, CLAYTON, EVENT_BEAT_FLEDGLING_CLAYTON, FledglingClaytonSeenText, FledglingClaytonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingClaytonAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	writetext SunnyGivesGiftText1
	buttonsound
	jump .next
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

SilentHillsSign:
	jumptext SilentHillsSignText

SilentHillsSign2:
	jumptext SilentHillsSign2Text

SilentHillsFruitTree1:
	fruittree FRUITTREE_TREE_SILENT_HILLS_1

SilentHillsFruitTree2:
	fruittree FRUITTREE_TREE_SILENT_HILLS_2

SilentHillsFruitTree3:
	fruittree FRUITTREE_TREE_SILENT_HILLS_3

SilentHillsHiddenEther:
	hiddenitem ETHER, EVENT_SILENT_HILLS_HIDDEN_ETHER
	
AmpareCavernB1FPotion:
	itemball POTION
	
SilentHillsRockerScript:
	jumptextfaceplayer SilentHillsRockerText
	
SilentHillsRockerText:
	text "¡Yo no soy"
	line "entrenador, pero"
	cont "hay unos cuantos"
	cont "más adelante!"
	
	para "Si te ven, tendrás"
	line "que combatir."
	
	para "¡Asegúrate de"
	line "estar preparado!"
	done

BugCatcherDonSeenText:
	text "¡Estas colinas"
	line "parecen un buen"
	para "lugar para"
	line "encontrar más"
	cont "bichos!"
	done

BugCatcherDonBeatenText:
	text "Perdí. Qué mal…"
	done

BugCatcherDonAfterBattleText:
	text "Me quedé sin #"
	line "BALLS mientras"
	cont "capturaba #MON."

	para "Tendría que haber"
	line "comprado más…"
	done
	
YoungsterAlbertSeenText:
	text "No te he visto"
	line "antes por aquí."

	para "¿Crees que eres"
	line "fuerte?"
	done

YoungsterAlbertBeatenText:
	text "¡Sí eres fuerte!"
	done

YoungsterAlbertAfterBattleText:
	text "Quiero intentar"
	line "ser el mejor con"
	cont "mis #MON"
	cont "favoritos."

	para "No pienso usar los"
	line "mismos que todos"
	cont "los demás."
	done
	
FledglingClaytonSeenText:
	text "Soy nuevo en esto…"
	line "Ah, ¿tú también?"
	done

FledglingClaytonBeatenText:
	text "¡Eres duro!"
	done

FledglingClaytonAfterBattleText:
	text "Me gusta pensar"
	line "que incluso perder"
	para "me ayuda a crecer"
	line "como entrenador."
	done
	
LassEllenSeenText:
	text "¡Pero qué mono"
	line "eres!"

	para "¡Me gustas, pero"
	line "no por eso me"
	cont "contendré!"
	done

LassEllenBeatenText:
	text "Veamos…"
	line "Uy, ¿ya está?"
	done

LassEllenAfterBattleText:
	text "¡Debes ser bueno"
	line "si me has"
	cont "derrotado!"
	
	para "¡Sigue así!"
	done

MeetSunnyText:
	text "DOMINGO: ¡Hola!"

	para "Soy DOMINGO, por"
	line "el día. Es decir,"
	cont "¡hoy es domingo!"
	done

SunnyGivesGiftText1:
	text "¡Me dijeron que te"
	line "diera esto si te"
	cont "veía!"
	done

SunnyGivesGiftText2:
	text "¡Me dijeron que te"
	line "diera esto si te"
	cont "veía!"
	done

SunnyGaveGiftText:
	text "DOMINGO: Eso…"

	para "¡Um…!"

	para "¿Qué era…?"

	para "…"

	para "¡Ah! ¡Ahora lo"
	line "recuerdo!"

	para "Debería llevarlo"
	line "un #MON con"
	cont "habilidades"
	cont "eléctricas."

	para "¡Mi hermana LUNA"
	line "dice que mejora"
	cont "las habilidades"
	cont "eléctricas!"
	done

SunnySundayText:
	text "DOMINGO: Mis"
	line "hermanos son"
	para "LUNA, MARTA,"
	line "MIGUEL, JOSUÉ,"
	cont "VICKI y SABINO."

	para "¡Son todos"
	line "mayores que yo!"
	done

SunnyNotSundayText:
	text "DOMINGO: ¿Hoy no"
	line "es domingo?"
	cont "¡Um…! ¡Lo olvidé!"
	done

SilentHillsSignText:
	text "COLINAS SILENTES"
	
	para "Un punto de"
	line "encuentro para"
	cont "entrenadores"
	done

SilentHillsSign2Text:
	text "Hacia el norte"
	line "CIUDAD PAGOTA"
	done

SilentHills_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  4,  0, ROUTE_101N, 3
	warp_event  5,  0, ROUTE_101N, 3
	warp_event  6,  0, ROUTE_101N, 3
	warp_event  7,  0, ROUTE_101N, 4
	warp_event  8,  0, ROUTE_101N, 4
	warp_event  9,  0, ROUTE_101N, 4
	warp_event 49, 28, ROUTE_101, 1
	warp_event 49, 29, ROUTE_101, 1
	warp_event 49, 30, ROUTE_101, 2
	warp_event 49, 31, ROUTE_101, 2
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event 47, 28, BGEVENT_READ, SilentHillsSign
	bg_event  9,  4, BGEVENT_READ, SilentHillsSign2
	bg_event 21, 13, BGEVENT_ITEM, SilentHillsHiddenEther

	db 10 ; object events
	object_event 34, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerLassEllen, -1
	object_event  7, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterAlbert, -1
	object_event 41, 19, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDon, -1
	object_event 15, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFledglingClayton, -1
	object_event 25, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree1, -1
	object_event 26, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_SILENT_HILLS_SUNNY_OF_SUNDAY
	object_event 24, 27, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree2, -1
	object_event 27, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree3, -1
	object_event 41, 28, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilentHillsRockerScript, -1
	object_event 19,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FPotion, EVENT_AMPARE_CAVERN_B1F_POTION
