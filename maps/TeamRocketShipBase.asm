	object_const_def ; object_event constants
	const SHIP_ROCKET_1
	const SHIP_ROCKET_2
	const SHIP_ENTRANCE_1
	const SHIP_ROCKET_3
	const SHIP_CAPTAIN_R
	const SHIP_ROCKET_4
	const SHIP_ROCKET_5
	const SHIP_BURGLAR
	const SHIP_ITEMBALL
	const SHIP_IMPOSTOR
	const SHIP_ITEMBALL_2

TeamRocketShipBase_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneTeamRocketShipBaseGreetings ; SCENE_DEFAULT
	scene_script .SceneTeamRocketShipBaseImposter ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckBasementKey


.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock 28,28, $28 ; locked door
	return

.SceneTeamRocketShipBaseGreetings
	end

.SceneTeamRocketShipBaseImposter
	end

RocketGreetingsScript:
	moveobject SHIP_ENTRANCE_1, 3, 7
	appear SHIP_ENTRANCE_1
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip
	showemote EMOTE_SHOCK, SHIP_ENTRANCE_1, 25
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip2
	opentext
	writetext NotGonnaStandByText
	waitbutton
	closetext
	winlosstext RocketEntranceShip_WinText, RocketEntranceShip_LossText
	loadtrainer GRUNTF, GRUNTF_2
	startbattle
	reloadmapafterbattle
	jump .returnfrombattleshipentrance
	
.returnfrombattleshipentrance
	opentext
	writetext RocketEntranceShip_AfterText
	waitbutton
	closetext
	applymovement SHIP_ENTRANCE_1, Movement_StepDownFromMeShip
	disappear SHIP_ENTRANCE_1
	setscene SCENE_TEAM_ROCKET_SHIP_BASE_IMPOSTOR
	end
	
ImposterAndCaptainScript:
	showemote EMOTE_SHOCK, SHIP_IMPOSTOR, 15
	turnobject SHIP_IMPOSTOR, DOWN
	opentext
	writetext ImposterGreetingText
	waitbutton
	closetext
	applymovement SHIP_IMPOSTOR, ImposterWalksToMe
	opentext
	writetext ImposterGreetingText2
	waitbutton
	closetext
	turnobject SHIP_IMPOSTOR, UP
	pause 15
	opentext
	writetext ImposterTellsCaptainText
	waitbutton
	closetext
	pause 15
	applymovement SHIP_IMPOSTOR, ImposterWalksToCaptain
	opentext
	writetext CaptainBeckons
	waitbutton
	closetext
	pause 15
	applymovement PLAYER, PlayerWalksToCaptain
	jump CaptainRocketScript
	

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext UnknownText_0x7c5b0
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	waitbutton
	closetext
	changeblock 28, 28, $2b ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext UnknownText_0x7c5c3
	waitbutton
	closetext
	end

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM11AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM13AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM22:
	trainer GRUNTM, GRUNTM_22, EVENT_BEAT_ROCKET_GRUNTM_22, GruntM22SeenText, GruntM22BeatenText, 0, .Script


.Script:
	setevent EVENT_ROCKET_KEY_DIALOGUE
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .HowdYouGetThat
	opentext
	writetext GruntM22AfterBattleText
	waitbutton
	closetext
	end

.HowdYouGetThat
	opentext
	writetext GruntM22HowdGetKey
	waitbutton
	closetext
	end


CaptainRocketScript:
	special FadeOutMusic
	pause 15
	faceplayer
	opentext
	writetext CaptainRBeforeText
	waitbutton
	closetext
	pause 10
	turnobject SHIP_CAPTAIN_R, LEFT
	opentext
	writetext CaptainRTellsImposterOff
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SHIP_IMPOSTOR, 15
	turnobject SHIP_IMPOSTOR, RIGHT
	opentext
	writetext ImposterOakIsShocked
	waitbutton
	closetext
	pause 15
	opentext
	writetext CaptainRTellsImposterOff2
	waitbutton
	closetext
	pause 15
	opentext
	writetext ImposterOakIsShocked2
	waitbutton
	closetext
	applymovement SHIP_IMPOSTOR, ImposterLeavesRoom
	playsound SFX_EXIT_BUILDING
	disappear SHIP_IMPOSTOR
	pause 5
	turnobject SHIP_CAPTAIN_R, DOWN
	opentext
	writetext CaptainRFinishesSpeech
	waitbutton
	closetext
	winlosstext CaptainRWinText, CaptainRLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext CaptainRAfterText
	waitbutton
	closetext
;between these comments is end of demo text that can be removed
;	opentext
;	writetext Text_EndDemo
;	waitbutton
;	closetext
;	opentext
;	writetext Text_ReceivedMineralBadgeDemo
;	playsound SFX_GET_BADGE
;	waitsfx
;	setflag ENGINE_MINERALBADGE
;	verbosegiveitem HM_FLY
;	closetext
;	opentext
;	writetext Text_EndDemo2
;	waitbutton
;	closetext
; comment
	special FadeBlackQuickly
	special HealParty
	pause 15
	setevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	clearevent EVENT_SUNPOINT_DOCKS_NPCS
	setevent EVENT_PRYCE_IN_GYM
	setevent EVENT_PRYCE_IN_HOME
	setmapscene ROUTE_104, SCENE_ROUTE104_NOTHING
	warp SUNPOINT_DOCKS, 13, 3
	end
	

TrainerGruntM25:
	trainer GRUNTM, GRUNTM_25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM25AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF3AfterBattleText
	waitbutton
	closetext
	end
	

TrainerBurglarEddie:
	trainer BURGLAR, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEddieAfterBattleText
	waitbutton
	closetext
	end
	
TeamRocketShipBaseSmokeBall:
	itemball SMOKE_BALL
	
TeamRocketShipBaseAmuletCoin:
	itemball AMULET_COIN
	
TrashCanBoatScript:
	jumptext TrashCanBoatText

	
Movement_StepUpToMeShip:
	step UP
	step_end
	
Movement_StepUpToMeShip2:
	step UP
	step UP
	step UP
	step_end
	
Movement_StepDownFromMeShip:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ImposterWalksToMe:
	step DOWN
	;step LEFT
	;turn_head DOWN
	step_end
	
ImposterWalksToCaptain:
	step UP
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end
	
PlayerWalksToCaptain:
	step UP
	step UP
	step UP
	step_end
	
ImposterLeavesRoom:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
TrashCanBoatText:
	text "Aquí dentro no"
	line "hay nada…"
	done

GruntM22SeenText:
	text "Te has adentrado"
	line "mucho en el barco."

	para "¡Pero no llegarás"
	line "más lejos!"
	done

GruntM22BeatenText:
	text "Al CAPITÁN no le"
	line "va a gustar esto…"
	done

GruntM22AfterBattleText:
	text "¡Já! ¡No te voy a"
	line "dejar pasar solo"
	cont "porque me hayas"
	cont "derrotado!"

	para "¡Más que nada"
	line "porque no puedo!"

	para "¡La puerta está"
	line "cerrada y no tengo"
	cont "la LLAVE del"
	cont "BARCO!"

	para "En realidad, creo"
	line "que aparte del"
	para "CAPITÁN, nadie más"
	line "tiene una en el"
	cont "barco."

	para "¡Y no podrás"
	line "llegar hasta él"
	cont "sin una!"

	para "¡Parece que se la"
	line "tendrás que quitar"
	para "a otro miembro del"
	line "TEAM ROCKET!"
	done

GruntM11SeenText:
	text "¿Qué haces aquí?"
	para "¡Fuera de mi"
	line "camino!"
	done

GruntM11BeatenText:
	text "¡Estás en mi"
	line "camino!"
	done

GruntM11AfterBattleText:
	text "En serio, no me"
	line "traigo nada entre"
	cont "manos."

	para "Es solo que me"
	line "gusta ser parte de"
	para "la tripulación"
	line "porque así puedo"
	cont "ir en barco."
	done

GruntM25SeenText:
	text "¡Já! ¡Apuesto a"
	line "que no me espera-"
	cont "bas aquí!"

	para "¡Muy mal, porque"
	line "aquí estoy!"
	done

GruntM25BeatenText:
	text "Creo que seguiré"
	line "en este armario…"
	done

GruntM25AfterBattleText:
	text "Aquí dentro nadie"
	line "me molesta."
	done

GruntM13SeenText:
	text "¡Qué me importa si"
	line "te has perdido!"

	para "Apareciste aquí,"
	line "¡eres sólo una"
	cont "víctima!"
	done

GruntM13BeatenText:
	text "¡Seguro! Te crees"
	line "genial, ¿verdad?"
	done

GruntM13AfterBattleText:
	text "Debes de tener"
	line "hielo en las venas"
	para "para enfrentarte"
	line "al TEAM ROCKET."
	done

UnknownText_0x7c5b0:
	text "Puerta cerrada…"
	done

UnknownText_0x7c5c3:
	text "Puerta abierta."
	done

UnknownText_0x7c5d6:
	text "Puerta abierta con"
	line "LLAVE del BARCO."
	done

CaptainRBeforeText:
	text "Me impresiona que"
	line "hayas llegado"
	cont "hasta mí."

	para "Y me decepciona"
	line "que mi tripulación"
	cont "no haya podido"
	cont "detenerte."

	para "Son un puñado de"
	line "inútiles."

	para "Pero ya hemos"
	line "terminado nuestras"
	cont "operaciones."

	para "Regresaremos a"
	line "nuestra base."

	para "Nuestro plan"
	line "continuará según"
	cont "lo establecido."
	done

CaptainRTellsImposterOff:
	text "¡OAK IMPOSTOR!"
	done

ImposterOakIsShocked:
	text "OAK IMPOSTOR: ¡Sí,"
	line "señor!"
	done

CaptainRTellsImposterOff2:
	text "CAPITÁN: Retírate."

	para "Quiero estar a"
	line "solas con nuestro"
	cont "amigo."
	done

ImposterOakIsShocked2:
	text "OAK IMPOSTOR: ¡Sí,"
	line "CAPITÁN!"
	done

CaptainRFinishesSpeech:
	text "…"
	para "Veo que has"
	line "conocido a nuestro"
	cont "OAK IMPOSTOR."

	para "Sé que no pudo"
	line "engañarte."

	para "No esperaba que lo"
	line "lograse."

	para "Pero no es a ti"
	line "a quien debo"
	cont "convencer."

	para "Pronto nos será"
	line "de mucha utilidad."

	para "Por ahora, estamos"
	line "a punto de zarpar."

	para "¡Pero no sin antes"
	line "deshacerme de ti!"
	done

CaptainRWinText:
	text "Eres bueno."
	done

CaptainRLossText:
	text "¡Já!"
	done

CaptainRAfterText:
	text "Ya he comprobado"
	line "que puedes suponer"
	cont "todo un desafío."

	para "Pero ya tenemos"
	line "todo lo que"
	cont "necesitamos."

	para "¡Los materiales"
	line "para empezar a"
	para "construir nuestra"
	line "arma definitiva!"

	para "No es un arma que"
	line "haga daño físico,"
	cont "no."

	para "¡Pero muy pronto"
	line "nos dará el poder"
	para "para controlar a"
	line "todos los #MON!"

	para "Has entorpecido el"
	line "plan."

	para "¡Pero no lo has"
	line "arruinado!"

	para "¡Pronto sabrás más"
	line "de nosotros!"

	para "¡De hecho, todo el"
	line "mundo lo hará!"
	done

NotGonnaStandByText:
	text "Veo que has"
	line "asustado a nuestro"
	cont "guarda."

	para "¡Pero debes ser"
	line "más tonto de lo"
	para "que pareces si"
	line "crees que te voy"
	para "a dejar pasar así"
	line "sin más!"

	para "¡Inténtalo si es"
	line "que puedes!"
	done

RocketEntranceShip_WinText:
	text "¡Eres más duro de"
	line "lo que pensaba!"
	done

RocketEntranceShip_LossText:
	text "¡Já!"
	done

RocketEntranceShip_AfterText:
	text "¡Agh!"

	para "Mejor advierto al"
	line "CAPITÁN sobre ti."

	para "¡Él se hará cargo"
	line "de tu intrusión!"
	done

GruntF3SeenText:
	text "¿Qué tienes contra"
	line "el TEAM ROCKET?"
	done

GruntF3BeatenText:
	text "¡Nuestros planes"
	line "siguen siendo más"
	cont "grandes de lo que"
	cont "crees!"
	done

GruntF3AfterBattleText:
	text "Ya estamos a punto"
	line "de irnos de todos"
	cont "modos."
	done

BurglarEddieSeenText:
	text "¡Ssh! ¡No soy del"
	line "TEAM ROCKET!"

	para "Estoy en busca del"
	line "botín."
	done

BurglarEddieBeatenText:
	text "¡Impresionante!"
	done

BurglarEddieAfterBattleText:
	text "¿Robar a los malos"
	line "me convierte en"
	cont "alguien bueno?"
	done

Text_EndDemo:
	text "¡Muchas gracias"
	line "por jugar!"

	para "Aquí es donde"
	line "acaba la demo."

	para "Has completado"
	line "lo que hay de"
	cont "historia hasta"
	cont "ahora."

	para "¡Pero sigue"
	line "explorando y"
	cont "capturando"
	cont "#MON!"

	para "Tengo varias cosas"
	line "que te ayudarán a"
	cont "explorar más"
	cont "fácilmente."

	para "¡La MO02 VUELO y"
	line "la MEDALLA que"
	cont "necesitas para"
	cont "usarlo!"
	done
	
Text_ReceivedMineralBadgeDemo:
	text "<PLAYER> recibió la"
	line "MEDALLA MINERAL."
	done
	
Text_EndDemo2:
	text "¡Bien, nos vemos!"
	done

GruntM22HowdGetKey:
	text "¡¿Cómo has conse-"
	line "guido esa llave?!"
	done

ImposterGreetingText:
	text "¿Pero a quién"
	line "tenemos aquí?"
	done

ImposterGreetingText2:
	text "¿No me reconoces?"
	para "¡Soy yo, el PROF."
	line "OAK!"

	para "¡Ahora trabajo"
	line "para el TEAM"
	cont "ROCKET!"

	para "Debí suponer"
	line "que no te lo"
	cont "tragarías…"
	done

ImposterTellsCaptainText:
	text "¡Eh, CAPITÁN!"
	line "¡Tenemos un niño a"
	cont "bordo!"

	para "¡Debe ser el mismo"
	line "del que hemos"
	cont "oído hablar!"
	done

CaptainBeckons:
	text "CAPITÁN: ¡Ven"
	line "aquí, niño!"
	done

TeamRocketShipBase_MapEvents:
	db 0, 0 ; filler

	db 16 ; warp events
	warp_event  3,  1, SUNPOINT_DOCKS, 4
	warp_event  3,  8, TEAM_ROCKET_SHIP_BASE, 3
	warp_event 13,  1, TEAM_ROCKET_SHIP_BASE, 2
	warp_event 13, 12, TEAM_ROCKET_SHIP_BASE, 5
	warp_event 29,  1, TEAM_ROCKET_SHIP_BASE, 4
	warp_event 33,  3, TEAM_ROCKET_SHIP_BASE, 7
	warp_event  3, 18, TEAM_ROCKET_SHIP_BASE, 6
	warp_event 35,  3, TEAM_ROCKET_SHIP_BASE, 9
	warp_event 13, 24, TEAM_ROCKET_SHIP_BASE, 8
	warp_event 19, 19, TEAM_ROCKET_SHIP_BASE, 11
	warp_event  3, 34, TEAM_ROCKET_SHIP_BASE, 10
	warp_event 25, 19, TEAM_ROCKET_SHIP_BASE, 13
	warp_event 13, 34, TEAM_ROCKET_SHIP_BASE, 12
	warp_event 29, 29, TEAM_ROCKET_SHIP_BASE, 15
	warp_event 35, 22, TEAM_ROCKET_SHIP_BASE, 14
	warp_event 39, 22, TEAM_ROCKET_SHIP_BASE, 14

	db 2 ; coord events
	coord_event  3,  2, SCENE_DEFAULT, RocketGreetingsScript
	coord_event 35, 21, SCENE_TEAM_ROCKET_SHIP_BASE_IMPOSTOR, ImposterAndCaptainScript

	db 2 ; bg events
	bg_event 29, 29, BGEVENT_READ, BasementDoorScript
	bg_event 29,  7, BGEVENT_READ, TrashCanBoatScript


	db 11 ; object events
	object_event 11,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM11, -1
	object_event 31,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM13, -1
	object_event -6,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 30, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM22, -1
	object_event 35, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, CaptainRocketScript, -1
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM25, -1
	object_event  1, 26, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerGruntF3, -1
	object_event 26, 23, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, -1
	object_event  4, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketShipBaseSmokeBall, EVENT_WESTPORT_UNDERGROUND_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	object_event 35, 19, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketShipBaseAmuletCoin, EVENT_GOT_TEAM_ROCKET_AMULET_COIN



