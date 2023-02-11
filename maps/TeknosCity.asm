	object_const_def ; object_event constants
	const TEKNOSCITY_GRAMPS1
	const TEKNOSCITY_GRAMPS2
	const TEKNOSCITY_LASS1
	const TEKNOSCITY_LASS2
	const TEKNOSCITY_FISHER
	const TEKNOSCITY_YOUNGSTER
	const TEKNOSCITY_GRAMPS3
	const TEKNOSCITY_ROCKET1
	const TEKNOSCITY_ROCKET2
	const TEKNOSCITY_ROCKET3
	const TEKNOSCITY_ROCKET4
	const TEKNOSCITY_ROCKET5

TeknosCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearOpenBoardwalkPath

.ClearOpenBoardwalkPath:
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .Done
	changeblock 21,  7, $41 ; fence
	changeblock 23,  7, $41 ; fence
	changeblock 25,  7, $41 ; fence
	changeblock 21,  5, $21 ; water
	changeblock 23,  5, $21 ; water
	changeblock 25,  5, $21 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_TEKNOS
	return

TeknosCityGramps1Script:
	jumptextfaceplayer TeknosCityGramps1Text

TeknosCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .Gramps2Script2
	writetext TeknosCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext TeknosCityGramps2Text2
	waitbutton
	closetext
	end

TeknosCityGramps3Script:
	jumptextfaceplayer TeknosCityGramps3Text

TeknosCityLass1Script:
	jumptextfaceplayer TeknosCityLass1Text

TeknosCityLass2Script:
	jumptextfaceplayer TeknosCityLass2Text

	
TeknosCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .NoRockets
	writetext TeknosCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext TeknosCityFisherText
	waitbutton
	closetext
	end


TeknosCityRocket1Script:
;	setevent EVENT_WHITNEY_1_AQUARIUM
;	setevent EVENT_WHITNEY_2_AQUARIUM
;	setmapscene TEKNOS_AQUARIUM_1F, SCENE_DEFAULT
	jumptextfaceplayer TeknosCityRocket1Text
	
TeknosCityRocket2Script:
	jumptextfaceplayer TeknosCityRocket2Text
	
TeknosCityRocket3Script:
	jumptextfaceplayer TeknosCityRocket3Text
	
TeknosCityRocket4Script:
	jumptextfaceplayer TeknosCityRocket4Text
	
TeknosCityRocket5Script:
	jumptextfaceplayer TeknosCityRocket5Text

TeknosCityYoungsterScript:
	jumptextfaceplayer TeknosCityYoungsterText

TeknosCitySign:
	jumptext TeknosCitySignText

TinTowerSign:
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .TinTowerSign2
	jumptext TinTowerSignText
	
.TinTowerSign2
	jumptext TinTowerSignText2

BirdonGymSign:
	jumptext BirdonGymSignText
	
TeknosCityDocksSign:
	jumptext TeknosCityDocksText

TeknosDanceTheaterSign:
	jumptext TeknosDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

TeknosCityPokecenterSign:
	jumpstd PokecenterSignScript

TeknosCityMartSign:
	jumpstd MartSignScript

TeknosCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_TEKNOS_CITY_HIDDEN_HYPER_POTION
	
TeknosCityRocket3Text:
	text "¡Arrea!"

	para "¡Esto se va a"
	line "poner bueno!"
	done
	
TeknosCityRocket4Text:
	text "¡Ya casi es hora"
	line "de que nos demos a"
	cont "conocer!"
	done
	
TeknosCityRocket5Text:
	text "¡El ACUARIO no"
	line "sabe lo que le"
	cont "espera!"
	done

TeknosCityRocket1Text:
	text "¡Aléjate del"
	line "ACUARIO si sabes"
	para "lo que te"
	line "conviene, niño!"
	done
	
TeknosCityRocket2Text:
	text "¡Jejejeje!"

	para "¡Este lugar debe"
	line "estar lleno de"
	para "#MON raros que"
	line "podemos vender al"
	cont "mejor postor!"
	done

UnusedMissingDaughterText:
; unused
	text "Oh, no. Oh, no…"

	para "Mi hija ha"
	line "desaparecido."

	para "No… No creo que"
	line "haya ido a la"
	cont "TORRE QUEMADA."

	para "Le dije que no se"
	line "acercase…"

	para "Dicen que la gente"
	line "que va allí"
	cont "desaparece…"

	para "Ay, ¿qué debería ?"
	line "hacer…"
	done

TeknosCityGramps1Text:
	text "He vivido aquí"
	line "toda mi vida."

	para "La ciudad es mucho"
	line "más bulliciosa que"
	cont "cuando era joven."
	done

TeknosCityGramps2Text:
	text "La ciudad va a"
	line "crecer aún más"
	para "cuando hayan"
	line "terminado la"
	cont "PASARELA."

	para "Mucha gente irá y"
	line "vendrá por ella."
	done
	
TeknosCityGramps2Text2:
	text "Debo admitirlo, me"
	line "encanta el CASINO"
	para "que acaba de abrir"
	line "al norte de aquí."
	done

TeknosCityLass1Text:
	text "TEKNOS solía ser"
	line "tranquila."

	para "Pero ha crecido"
	line "rápido, y creo que"
	para "no todo el mundo"
	line "se ha acostumbrado"
	cont "todavía."
	done

TeknosCityLass2Text:
	text "¡BLANCA es nuestra"
	line "LÍDER de GIMNASIO!"

	para "¡Siempre ha sido"
	line "de gran ayuda para"
	cont "la ciudad!"

	para "A veces es difícil"
	line "encontrarla en el"
	para "GIMNASIO, porque"
	line "suele estar fuera"
	para "comprobando si"
	line "puede ayudar en"
	cont "algo."
	done

TeknosCityLass2Text_ReleasedBeasts:
	text "Tres #MON"
	line "huyeron en tres"
	para "direcciones."
	line "¿Qué eran?"
	done

TeknosCityFisherText:
	text "A los MARINEROS"
	line "como yo no nos"
	cont "interesa mucho el"
	cont "ACUARIO."

	para "¡Ya vemos a todos"
	line "estos #MON en"
	cont "el mar! ¡Jojojo!"
	done

TeknosCityFisherText_TheresRockets:
	text "Esos tipos parecen"
	line "miembros del TEAM"
	cont "ROCKET."

	para "¿No se habían"
	line "esfumado?"
	done

TeknosCityYoungsterText:
	text "Lo he intentado"
	line "muchas veces, pero"
	para "nunca he podido"
	line "derrotar a BLANCA…"
	done

TeknosCityGramps3Text:
	text "TEKNOS empieza a"
	line "ser otra ciudad"
	cont "portuaria más."

	para "Siempre me ha"
	line "gustado visitarla."

	para "¡Espero que no"
	line "llegue a llenarse"
	cont "de gente!"
	done

TeknosCitySignText:
	text "CIUDAD TEKNOS"
	
	para "Una ciudad que"
	line "abraza el futuro"
	done

TinTowerSignText:
	text "¡PRÓXIMAMENTE!"

	para "¡PASARELA y"
	line "CASINO MARÍTIMO!"

	para "¡Un enclave junto"
	line "al mar que"
	para "conectará CIUDAD"
	line "TEKNOS y PUEBLO"
	para "SÁNSCRITO, con"
	line "juegos y premios"
	cont "a gogó!"
	done

TinTowerSignText2:
	text "¡PASARELA y CASINO"
	line "MARÍTIMO al norte!"

	para "¡Juegos, premios y"
	line "diversión!"
	done

BirdonGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "TEKNOS: BLANCA"

	para "¡Enérgica y"
	line "ambiciosa!"
	done

TeknosDanceTheaterSignText:
	text "ACUARIO DE"
	line "CIUDAD TEKNOS"
	done

BurnedTowerSignText:
	text "CASA DEL GURÚ"
	line "PESCADOR ARNOLDO"
	done
	
TeknosCityDocksText:
	text "MUELLE TEKNOS"
	done

TeknosCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 22, 31, TEKNOS_PORT_PASSAGE, 1
	warp_event 23, 31, TEKNOS_PORT_PASSAGE, 2
	warp_event 31, 10, TEKNOS_POKECENTER_1F, 1
	warp_event  7, 17, TEKNOS_FISHING_HOUSE, 1
	warp_event  7, 27, TEKNOS_AQUARIUM_1F, 2
	warp_event 31, 16, TEKNOS_MART, 1
	warp_event 10, 11, TEKNOS_GYM, 1
	warp_event 15, 17, TEKNOS_ITEMFINDER_HOUSE, 1
	warp_event  6, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event  9, 11, ROUTE_109_ROUTE_110_GATE, 4
	warp_event 22,  1, BOARDWALK_TEKNOS_GATE, 3
	warp_event 23,  1, BOARDWALK_TEKNOS_GATE, 4
	warp_event 11, 11, TEKNOS_GYM, 2
	warp_event 33, 20, TEKNOS_TRADE_HOUSE, 1

	db 0 ; coord events

	db 9 ; bg events
	bg_event 18, 20, BGEVENT_READ, TeknosCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, BirdonGymSign
	bg_event 10, 27, BGEVENT_READ, TeknosDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, TeknosCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, TeknosCityMartSign
	bg_event  5, 18, BGEVENT_ITEM, TeknosCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TeknosCityDocksSign

	db 12 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TeknosCityLass2Script, -1
	object_event 10, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TeknosCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket1Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket2Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7, 28, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket3Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  7, 30, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket4Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  6, 29, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket5Script, EVENT_ROCKETS_BLOCKING_AQUARIUM

	