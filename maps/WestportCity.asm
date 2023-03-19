	object_const_def ; object_event constants
	const WESTPORTCITY_YOUNGSTER1
	const WESTPORTCITY_COOLTRAINER_F
	const WESTPORTCITY_ROCKER
	const WESTPORTCITY_YOUNGSTER2
	const WESTPORTCITY_LASS
	const WESTPORTCITY_GRAMPS
	const WESTPORTCITY_ROCKET1
	const WESTPORTCITY_ROCKET2
	const WESTPORTCITY_ROCKET3
	const WESTPORTCITY_ROCKET4
	const WESTPORTCITY_ROCKET5
	const WESTPORTCITY_ROCKET6
	const WESTPORTCITY_FAIRY
	const WESTPORTCITY_ROCKETEXTRA

WestportCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_WESTPORT
	setflag ENGINE_REACHED_WESTPORT
	return




WestportCityYoungster1Script:
	jumptextfaceplayer WestportCityYoungster1Text

WestportCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext WestportCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext WestportCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

WestportCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext WestportCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext WestportCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

WestportCityYoungster2Script:
	jumptextfaceplayer WestportCityYoungster2Text

WestportCityLassScript:
	jumptextfaceplayer WestportCityLassText

WestportCityGrampsScript:
	jumptextfaceplayer WestportCityGrampsText

WestportCityRocketScoutScript:
	opentext
	writetext WestportCityRocketScoutText1
	buttonsound
	faceplayer
	writetext WestportCityRocketScoutText2
	waitbutton
	closetext
	end

WestportCityRocket1Script:
	jumptextfaceplayer WestportCityRocket1Text

WestportCityRocket2Script:
	jumptextfaceplayer WestportCityRocket2Text

WestportCityRocket3Script:
	jumptextfaceplayer WestportCityRocket3Text

WestportCityRocket4Script:
	jumptextfaceplayer WestportCityRocket4Text

WestportCityRocket5Script:
	jumptextfaceplayer WestportCityRocket5Text

WestportCityRocket6Script:
	jumptextfaceplayer WestportCityRocket6Text


WestportCityRadioTowerSign:
	jumptext WestportCityRadioTowerSignText

WestportDeptStoreSign:
	jumptext WestportDeptStoreSignText

TeknosGymSign:
	jumptext TeknosGymSignText

WestportCitySign:
	jumptext WestportCitySignText


WestportCityNameRaterSign:
;	setevent EVENT_BEAT_ELITE_FOUR
;	giveitem S_S_TICKET
;	setevent EVENT_FAST_SHIP_FIRST_TIME
;	setevent EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
;	clearevent EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	jumptext WestportCityNameRaterSignText


WestportCityPokecenterSign:
	jumpstd PokecenterSignScript
	
WestportCityDocksSign:
	jumptext WestportCityDocksSignText
	
WestportCityMonScript:
	faceplayer
	opentext
	writetext WestportCityMonText
	cry BLISSEY
	waitbutton
	closetext
	end
	
RivalAfterRadioTower1:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject WESTPORTCITY_ROCKET5, 31, 13
	appear WESTPORTCITY_ROCKET5
	applymovement WESTPORTCITY_ROCKET5, WestportSilverWalksUp1
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTower2:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject WESTPORTCITY_ROCKET5, 31, 13
	appear WESTPORTCITY_ROCKET5
	applymovement WESTPORTCITY_ROCKET5, WestportSilverWalksUp2
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTowerMain:
	opentext
	writetext SilverHasItFiguredOut
	waitbutton
	closetext
	showemote EMOTE_SHOCK, WESTPORTCITY_ROCKET5, 15
	opentext
	writetext SilverHasItFiguredOut2
	waitbutton
	closetext
	applymovement WESTPORTCITY_ROCKET5, WestportSilverGetsOutOfHere
	setscene SCENE_DEFAULT
	special RestartMapMusic
	disappear WESTPORTCITY_ROCKET5
	setevent EVENT_SILVER_IN_WESTPORT
	end

WestportSilverGetsOutOfHere:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
WestportSilverWalksUp1:
	step UP
;	step UP
	step UP
	step UP
	step UP
	step_end
	
WestportSilverWalksUp2:
	step UP
;	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end


	
SilverHasItFiguredOut:
	text "<RIVAL>: ¡<PLAYER>!"
	
	para "¡Creo que ya sé lo"
	line "que pasa!"
	
	para "¡El TEAM ROCKET"
	line "va a usar la"
	para "TORRE RADIO como"
	line "reemplazo de la"
	para "antena que"
	line "destruimos!"
	done
	
SilverHasItFiguredOut2:
	text "¿Pero qué?"
	
	para "¡Tenía razón!"
	
	para "¿Ya les has dado"
	line "su merecido?"
	
	para "¡Me he perdido la"
	line "mejor parte!"
	
	para "¡Bueno, mejor me"
	line "voy a seguir"
	cont "entrenando!"
	
	para "¡Solo necesito una"
	line "MEDALLA más antes"
	para "de subir el"
	line "MT. FUJI y ganar"
	cont "la LIGA!"

	para "¡Apuesto a que"
	line "puedo ganarte!"
	done
	
WestportCityMonText:
	text "BLISSEY:"
	line "¡Blibli!"
	done
	
WestportCityDocksSignText:
	text "MUELLE PONIENTE"
	
	para "Barcos diarios"
	line "hacia CIUDAD"
	cont "TEKNOS"
	done


WestportCityYoungster1Text:
	text "Sé que hay una"
	line "nueva TIENDA DE"
	para "BICIS, pero no la"
	line "encuentro."
	done

WestportCityCooltrainerF1Text:
	text "¡El hombre que"
	line "vive en esta casa"
	para "evaluará los motes"
	line "de tus #MON!"
	
	para "Incluso podrá"
	line "ponerles un nuevo"
	cont "mote."
	
	para "Pero no puedes"
	line "cambiar el mote de"
	para "un #MON que"
	line "hayas obtenido por"
	cont "intercambio."
	done

WestportCityCooltrainerF1Text_ClearedRadioTower:
	text "¡El hombre que"
	line "vive en esta casa"
	para "evaluará los motes"
	line "de tus #MON!"
	
	para "Incluso podrá"
	line "ponerles un nuevo"
	cont "mote."
	
	para "Pero no puedes"
	line "cambiar el mote de"
	para "un #MON que"
	line "hayas obtenido por"
	cont "intercambio."
	done

WestportCityCooltrainerF2Text:
	text "La TORRE RADIO de"
	line "CIUDAD PONIENTE es"
	cont "muy importante."

	para "Ahora están en"
	line "una campaña"
	cont "promocional."

	para "Modificarán tu"
	line "#GEAR para"
	para "que te sirva"
	line "también de radio."
	done

WestportCityCooltrainerF2Text_GotRadioCard:
	text "¡Oh, tu #GEAR"
	line "sirve de radio!"
	done

WestportCityYoungster2Text:
	text "Je, je…"

	para "Me he metido en"
	line "líos por jugar en"
	para "el sótano del"
	line "CENTRO COMERCIAL."
	done

WestportCityLassText:
	text "¡Mi BLISSEY puede"
	line "curar #MON"
	cont "usando un"
	cont "movimiento!"

	para "Algunos #MON"
	line "tienen movimientos"
	para "especiales que"
	line "pueden usar fuera"
	cont "de combate."
	done

WestportCityGrampsText:
	text "¡Uau! Esta ciudad"
	line "es muy grande."

	para "No sé dónde están"
	line "las cosas."
	done

WestportCityRocketScoutText1:
	text "Así que ésta es la"
	line "TORRE RADIO…"
	done

WestportCityRocketScoutText2:
	text "¿Qué quieres, eh?"
	line "¡Fuera!"
	done

WestportCityRocket1Text:
	text "¡Fuera de mi"
	line "camino! ¡Vete!"
	done

WestportCityRocket2Text:
	text "Asaltemos la TORRE"
	line "RADIO…"

	para "¿Qué? ¡Y a ti qué"
	line "te importa!"
	done

WestportCityRocket3Text:
	text "¿Los #MON?"
	line "¡Sólo son"
	para "herramientas para"
	line "ganar dinero!"
	done

WestportCityRocket4Text:
	text "Nuestro sueño se"
	line "cumplirá pronto…"

	para "Ha sido una lucha"
	line "tan larga…"
	done

WestportCityRocket5Text:
	text "¡Eh, tú! ¡No"
	line "recuerdo tu cara!"
	cont "¡Lárgate!"
	done

WestportCityRocket6Text:
	text "¡Prueba el"
	line "verdadero terror"
	cont "del TEAM ROCKET!"
	done

WestportCityRadioTowerSignText:
	text "TORRE RADIO DE"
	line "CIUDAD PONIENTE"
	para "SEDE DE JOPM"
	done

WestportDeptStoreSignText:
	text "CENTRO COMERCIAL"
	line "DE CIUDAD PONIENTE"

	para "¡Gran selección de"
	line "artículos #MON!"
	done

TeknosGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "PONIENTE: ANTÓN"

	para "La enciclopedia"
	line "andante de los"
	cont "#MON bicho"
	done

WestportCitySignText:
	text "CIUDAD PONIENTE"

	para "La radiante ciudad"
	line "costera de NIHON"
	done

WestportCityNameRaterSignText:
	text "INSPECTOR DE MOTES"

	para "Evalúa los motes"
	line "de tus #MON"
	done



WestportCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 14, 19, WESTPORT_GYM, 1
	warp_event 32, 19, WESTPORT_HAPPINESS_RATER, 1
	warp_event 35, 15, ROUTE_102_WEST_GATE, 1
	warp_event 26, 19, WESTPORT_NAME_RATER, 1
	warp_event 13,  5, WESTPORT_DEPT_STORE_1F, 1
	warp_event 31,  7, RADIO_TOWER_1F, 1
	warp_event 22,  5, ROUTE_103_WESTPORT_GATE, 3
	warp_event 25, 14, WESTPORT_POKECENTER_1F, 1
	warp_event 14,  5, WESTPORT_DEPT_STORE_1F, 2
	warp_event 23,  5, ROUTE_103_WESTPORT_GATE, 4
	warp_event 32,  7, RADIO_TOWER_1F, 2
	warp_event 15, 19, WESTPORT_GYM, 2
	warp_event 18, 12, WESTPORT_PP_SPEECH_HOUSE, 1
	warp_event  4,  8, WESTPORT_PORT_PASSAGE, 1
	warp_event  4,  9, WESTPORT_PORT_PASSAGE, 2

	db 2 ; coord events
	coord_event 31,  8, SCENE_WESTPORT_CITY_RIVAL, RivalAfterRadioTower1
	coord_event 32,  8, SCENE_WESTPORT_CITY_RIVAL, RivalAfterRadioTower2

	db 7 ; bg events

	bg_event 28,  9, BGEVENT_READ, WestportCityRadioTowerSign
	bg_event 16,  7, BGEVENT_READ, WestportDeptStoreSign
	bg_event 18, 20, BGEVENT_READ, TeknosGymSign
	bg_event 32, 12, BGEVENT_READ, WestportCitySign
	bg_event 24, 20, BGEVENT_READ, WestportCityNameRaterSign
	bg_event 26, 14, BGEVENT_UP, WestportCityPokecenterSign
	bg_event 12, 10, BGEVENT_READ, WestportCityDocksSign

	db 14 ; object events
	object_event 20, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster1Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 22, 17, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF1Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 27, 10, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF2Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 12,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster2Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 30, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityLassScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityGrampsScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 13,  6, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WestportCityRocket1Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 26, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WestportCityRocket2Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  6, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WestportCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WestportCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 15, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportCityRocket5Script, EVENT_SILVER_IN_WESTPORT
	object_event 32, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WestportCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 14, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WestportCityMonScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 18, 13, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WestportCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
