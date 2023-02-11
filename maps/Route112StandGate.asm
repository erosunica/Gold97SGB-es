	object_const_def ; object_event constants
	const ROUTE112STANDGATE_OFFICER
	const ROUTE112STANDGATE_GRAMPS
	const ROUTE112STANDGATE_RIVAL

Route112StandGate_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute112StandGateRival ; SCENE_DEFAULT
	scene_script .SceneRoute112StandGateNothing ;

	db 0 ; callbacks

.SceneRoute112StandGateRival
	end

.SceneRoute112StandGateNothing
	end
	
R36GateMoveIntoPlace1:
	applymovement PLAYER, R36M1
	jump Route102GateRivalScript
	end
	
R36GateMoveIntoPlace2:
	applymovement PLAYER, R36M2
	jump Route102GateRivalScript
	end
	
R36GateMoveIntoPlace3:
	applymovement PLAYER, R36M3
	jump Route102GateRivalScript
	end
	
R36GateMoveIntoPlace4:
	applymovement PLAYER, R36M4
	jump Route102GateRivalScript
	end
	
Route102GateRivalScript:
	disappear ROUTE112STANDGATE_RIVAL
	pause 10
	playsound SFX_EXIT_BUILDING
	waitsfx
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject ROUTE112STANDGATE_RIVAL, 4, 7
	appear ROUTE112STANDGATE_RIVAL
	applymovement ROUTE112STANDGATE_RIVAL, R36DummyMove
	pause 20
	opentext
	writetext R36GSilverGreets
	waitbutton
	closetext
	applymovement ROUTE112STANDGATE_RIVAL, R36GSilverWalksToYou
	opentext
	writetext R36GSilverGreets2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE112STANDGATE_RIVAL, 15
	opentext
	writetext R36GSilverGreets3
	waitbutton
	closetext
	pause 5
	applymovement ROUTE112STANDGATE_RIVAL, SilverChecksGuard
	pause 25
	opentext
	writetext R36GSilverGreets3_5
	waitbutton
	closetext
	turnobject ROUTE112STANDGATE_RIVAL, RIGHT
	opentext
	writetext R36GSilverGreets4
	waitbutton
	closetext
	applymovement ROUTE112STANDGATE_RIVAL, SilverChecksGuard2
	pause 5
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .R36GPalssio
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .R36GChikorita
	winlosstext Route102GSilverWinText, Route102GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GPalssio:
	winlosstext Route102GSilverWinText, Route102GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GChikorita:
	winlosstext Route102GSilverWinText, Route102GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GAfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route102GRivalAfterText
	waitbutton
	closetext
	applymovement ROUTE112STANDGATE_RIVAL, Route102GRivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE112STANDGATE_RIVAL
	setscene SCENE_ROUTE_112_STAND_GATE_NOTHING
	setevent EVENT_SILVER_IN_STAND_GATE
	waitsfx
	playmapmusic
	end

	
Route112StandGateOfficerScript:
;	clearevent EVENT_STAND_CITY_ZOO_MONS
;	setevent EVENT_CLEARED_RADIO_TOWER
;	setevent EVENT_BEAT_OKERA
;	setevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	jumptextfaceplayer Route112StandGateOfficerText

Route112StandGateGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RocketsGoneRoute102Gate
	writetext StandCitySomethingIsUpText
	waitbutton
	closetext
	end
	
.RocketsGoneRoute102Gate
	writetext StandCityIsDoingBetterText
	waitbutton
	closetext
	end

SilverChecksGuard2:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

SilverChecksGuard:
	step LEFT
	step LEFT
	step_end

Route102GRivalBattleExitMovement:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

R36DummyMove:
	step_end
	
R36M1:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
R36M2:
	step DOWN
	step DOWN
	step_end
	
R36M3:
	step LEFT
	step DOWN
	step DOWN
	step_end
	
R36M4:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end
	
R36GSilverWalksToYou:
	step UP
	step UP
	step UP
	step_end
	
Route102GSilverWinText:
	text "¿Qué? ¡¿Otra vez?!"
	done

Route102GSilverLossText:
	text "¡Jaja! ¡Toma!"
	done

Route102GRivalAfterText:
	text "¡Uau, sí que te"
	line "estás esforzando"
	para "en criar a tus"
	line "#MON para que"
	cont "sean tan fuertes!"

	para "¡Voy a tener que"
	line "hacerlo aún más!"

	para "Por cierto,"
	line "cuidado si vas a"
	cont "CIUDAD ENHIESTA."

	para "Parece que hay"
	line "algunos #MON"
	cont "enfermos."

	para "¡No dejes que los"
	line "tuyos se enfermen"
	cont "si quieres que se"
	cont "fortalezcan!"

	para "¡Bueno, me voy!"
	line "¡Nos vemos!"
	done

R36GSilverGreets:
	text "<RIVAL>:"
	line "¡<PLAYER>!"
	done

R36GSilverGreets2:
	text "¡Cuánto tiempo!"

	para "¿Cómo te ha ido"
	line "en tu viaje?"
	para "¡Espera!"

	para "¡La verdad es que"
	line "no me importa!"

	para "¡Lo que quiero"
	line "saber es cómo de"
	para "fuerte se ha hecho"
	line "tu equipo!"

	para "¡Mis #MON son"
	line "muy fuertes!"

	para "¡Ya casi estoy"
	line "listo para la"
	cont "LIGA!"

	para "¡Te lo voy a"
	line "demostrar!"
	done

R36GSilverGreets3:
	text "¡Ah, espera!"

	para "¡Debemos asegurar-"
	line "nos de que podemos"
	cont "combatir aquí!"
	done

R36GSilverGreets3_5:
	text "…"
	done

R36GSilverGreets4:
	text "¡Bien!"

	para "¡Ha dicho que"
	line "podemos mientras"
	cont "tengamos cuidado!"

	para "¡Allá voy!"
	done

StandCityIsDoingBetterText:
	text "Me alegra que los"
	line "#MON se sientan"
	cont "mejor."
	done

Route112StandGateOfficerText:
	text "CIUDAD ENHIESTA es"
	line "conocida por sus"
	para "preciosos parques"
	line "y espacios verdes."
	done

StandCitySomethingIsUpText:
	text "Está pasando"
	line "algo en CIUDAD"
	cont "ENHIESTA."

	para "Juraría que he"
	line "visto a unos tipos"
	para "que parecen"
	line "miembros del"
	cont "TEAM ROCKET."
	done

Route112StandGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_112, 1
	warp_event  5,  0, ROUTE_112, 2
	warp_event  4,  7, STAND_CITY, 8
	warp_event  5,  7, STAND_CITY, 9

	db 4 ; coord events
	coord_event 3, 1, SCENE_DEFAULT, R36GateMoveIntoPlace1
	coord_event 4, 1, SCENE_DEFAULT, R36GateMoveIntoPlace2
	coord_event 5, 1, SCENE_DEFAULT, R36GateMoveIntoPlace3
	coord_event 6, 1, SCENE_DEFAULT, R36GateMoveIntoPlace4

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route112StandGateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route112StandGateGrampsScript, -1
	object_event  4,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_IN_STAND_GATE
