	object_const_def ; object_event constants
	const FASTSHIPCABINS_SW_SSW_NW_FISHER
	const FASTSHIPCABINS_SW_SSW_NW_BUG_CATCHER
	const FASTSHIPCABINS_SW_SSW_NW_BUENA
	const FASTSHIPCABINS_SW_SSW_NW_ROCKER

FastShipCabins_SW_SSW_NW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, BugCatcherKenSeenText, BugCatcherKenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKenAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCassieAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristClyde:
	trainer GUITARIST, CLYDE, EVENT_BEAT_GUITARIST_CLYDE, GuitaristClydeSeenText, GuitaristClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
;	special Mobile_DummyReturnFalse
;	iftrue .mobile
	opentext
	writetext GuitaristClydeAfterBattleText
	waitbutton
	closetext
	end

.mobile
	opentext
	writetext GuitaristClydeAfterBattleMobileText
	waitbutton
	closetext
	end

FastShipBed:
	opentext
	writetext FastShipBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext FastShipBedText2
	waitbutton
	closetext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	iftrue .ArrivedAlloy
	opentext
	writetext FastShipArrivedAmamiText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedAlloy:
	opentext
	writetext FastShipArrivedAlloyText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd TrashCanScript

FirebreatherLyleSeenText:
	text "¡Voy a las ISLAS"
	line "para actuar en un"
	para "espectáculo de"
	line "comefuegos!"
	done

FirebreatherLyleBeatenText:
	text "La débil llama"
	line "pierde fuerza."
	done

FirebreatherLyleAfterBattleText:
	text "El fuego es débil"
	line "contra el agua."

	para "No te importa,"
	line "¿verdad?"
	done

BugCatcherKenSeenText:
	text "¡Voy a ver a mi"
	line "abuela para que me"
	para "atrape unos"
	line "cuantos bichos!"
	done

BugCatcherKenBeatenText:
	text "Ooooh, guau."
	line "¡Qué fuerte!"
	done

BugCatcherKenAfterBattleText:
	text "Encontrarás muchos"
	line "#MON en los"
	cont "árboles de NIHON."
	done

BeautyCassieSeenText:
	text "Intento olvidar a"
	line "mis enemigos."
	cont "¡Luchemos!"
	done

BeautyCassieBeatenText:
	text "Estoy desolada…"
	done

BeautyCassieAfterBattleText:
	text "Lo mejor para"
	line "curar las penas es"
	para "hacer un viaje en"
	line "barco."

	para "Pero los viajes en"
	line "FERRY son muy"
	cont "cortos."
	done

GuitaristClydeSeenText:
	text "Voy a una audición"
	line "de mis canciones"
	cont "en la TORRE RADIO"
	cont "de JOPM."
	done

GuitaristClydeBeatenText:
	text "¡Uauu!"
	line "¡Distorsión total!"
	done

GuitaristClydeAfterBattleMobileText:
	text "Iba a hacer mi"
	line "debut en el"
	para "CLUB BATALLA de"
	line "KANTO…"

	para "Debo regresar a"
	line "PUEBLO AMAMI para"
	cont "volver a entrenar…"
	done

GuitaristClydeAfterBattleText:
	text "Hablando de la"
	line "ESTACIÓN de RADIO,"

	para "¿cuál es el número"
	line "de la suerte de"
	cont "esta semana?"
	done

FastShipBedText1:
	text "¡Una buena cama!"
	line "A dormir…"
	done

FastShipBedText2:
	text "¡Ah! Vuelvo a"
	line "estar en forma."
	done

FastShipArrivedAlloyText:
	text "El FERRY S.S. AQUA"
	line "ha llegado a"
	cont "CIUDAD PONIENTE."
	done

FastShipArrivedAmamiText:
	text "El FERRY S.S. AQUA"
	line "ha llegado a"
	cont "PUEBLO AMAMI."
	done

FastShipCabins_SW_SSW_NW_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed
	bg_event  7,  7, BGEVENT_READ, FastShipCabinsNorthwestCabinTrashcan

	db 4 ; object events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerGuitaristClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
