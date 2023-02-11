	object_const_def ; object_event constants
	const TEAMROCKETBASEOFFICE_POKE_BALL1
	const TEAMROCKETBASEOFFICE_POKE_BALL2
	const TEAMROCKETBASEOFFICE_POKE_BALL3
	const TEAMROCKETBASEOFFICE_GRUNT1
	const TEAMROCKETBASEOFFICE_GRUNT2
	const TEAMROCKETBASEOFFICE_GRUNT3
	const TEAMROCKETBASEOFFICE_GRUNT4
	const TEAMROCKETBASEOFFICE_GRUNT5
	const TEAMROCKETBASEOFFICE_IMPOSTOR
	const TEAMROCKETBASEOFFICE_EXECUTIVE

TeamRocketBaseOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeamRocketBaseOfficeHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseOfficeNugget:
	itemball NUGGET

TeamRocketBaseOfficeGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseOfficeHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_OFFICE_HIDDEN_REVIVE
	
RocketBossRoomGrunt1:
	jumptextfaceplayer RocketBossRoomGrunt1Text

RocketBossRoomGrunt2:
	jumptextfaceplayer RocketBossRoomGrunt2Text

RocketBossRoomGrunt3:
	jumptextfaceplayer RocketBossRoomGrunt3Text

RocketBossRoomGrunt4:
	jumptextfaceplayer RocketBossRoomGrunt4Text

RocketBossRoomGrunt5:
	jumptextfaceplayer RocketBossRoomGrunt5Text
	
ExecutiveConfrontationScene:
	turnobject PLAYER, UP
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScene2:
	applymovement PLAYER, PlayerStepsUpToImposter
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScript:
	pause 15
	opentext
	writetext ImposterTellsYouToSeeExecutive
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalksToExecutive
	pause 20
	opentext
	writetext TheExecutiveGreeting
	waitbutton
	closetext
	winlosstext ExecutiveWinText, ExecutiveLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ExecutiveSceneAfterBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEOFFICE_EXECUTIVE, ExecutiveLeavesOffice
	disappear TEAMROCKETBASEOFFICE_EXECUTIVE
	disappear TEAMROCKETBASEOFFICE_IMPOSTOR
	setevent EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
	setscene SCENE_TEAMROCKETBASEOFFICE_NOTHING
	end
	
TeamRocketBaseOfficePassword:
	opentext
	writetext BadSecurityPractices
	waitbutton
	closetext
	setevent EVENT_ROUTE_105_BATTLE
	end
	
PlayerStepsUpToImposter:
	step UP
	step_end
	
PlayerWalksToExecutive:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
ExecutiveLeavesOffice:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
RocketBossRoomGrunt1Text:
	text "Estos son los úl-"
	line "timos preparativos"
	para "antes de que"
	line "nuestra máquina"
	cont "esté totalmente"
	cont "lista."

	para "¡Estoy seguro de"
	line "que ya no hay nada"
	para "que pueda interpo-"
	line "nerse en nuestro"
	cont "plan!"
	done

RocketBossRoomGrunt2Text:
	text "El OAK IMPOSTOR"
	line "hizo un gran tra-"
	para "bajo convenciendo"
	line "a la gente de"
	para "CIUDAD ENHIESTA de"
	line "que no se preocu-"
	cont "pasen por lo que"
	cont "hiciésemos aquí."
	done

RocketBossRoomGrunt3Text:
	text "El EJECUTIVO es la"
	line "única persona que"
	para "conoce la contra-"
	line "seña para apagar"
	para "la antena de"
	line "control mental."

	para "Aunque es muy"
	line "olvidadizo…"
	done

RocketBossRoomGrunt4Text:
	text "¡El mundo no sabe"
	line "lo que le espera"
	para "cuando nuestra"
	line "máquina esté"
	para "cargada al máximo"
	line "y hagamos que"
	para "todos los #MON"
	line "trabajen para"
	cont "nosotros!"
	done

RocketBossRoomGrunt5Text:
	text "¡Según mis"
	line "cálculos, la señal"
	para "de control mental"
	line "debería estar a"
	para "pleno rendimiento"
	line "la semana que"
	cont "viene!"
	done

BadSecurityPractices:
	text "¿Qué es esto?"
	para "El EJECUTIVO tiene"
	line "una nota pegada al"
	cont "ordenador…"
	para "¡Es la contraseña"
	line "de la consola!"

	para "…"
	para "¡<PLAYER> memorizó"
	line "la contraseña!"
	done

ExecutiveSceneAfterBattleText:
	text "¡Argh!"

	para "Me habrás ganado"
	line "en un combate,"
	cont "pero poco importa."

	para "¡A nuestra máquina"
	line "le falta cada vez"
	para "menos para que se"
	line "cargue al máximo!"

	para "Tus #MON me"
	line "habrán derrotado"
	para "ahora, ¡pero no"
	line "importará cuando"
	cont "estén bajo mi"
	cont "control!"

	para "Ahora, si me"
	line "disculpas, ¡tengo"
	para "asuntos importan-"
	line "tes que atender!"
	done

ExecutiveWinText:
	text "¡No me lo puedo"
	line "creer!"
	done

ExecutiveLossText:
	text "¡JÁ!"
	done

TheExecutiveGreeting:
	text "¿Entiendes en el"
	line "lío que te has"
	cont "metido?"
	para "Está claro que no,"
	line "porque de lo"
	para "contrario, no"
	line "estarías aquí."

	para "…"
	para "Me recuerdas,"
	line "¿verdad?"
	para "Fui el CAPITÁN del"
	line "barco de"
	cont "cargamento."

	para "Pero por encima de"
	line "todo, soy el prin-"
	cont "cipal EJECUTIVO"
	cont "del TEAM ROCKET."

	para "Solo estoy por"
	line "detrás de nuestro"
	cont "líder, GIOVANNI."

	para "¿Me equivoco si"
	line "asumo que has"
	para "averiguado lo que"
	line "estamos haciendo"
	cont "aquí?"
	para "¡Todo el dinero y"
	line "los recursos que"
	para "hemos reunido los"
	line "hemos usado para"
	para "este, nuestro"
	line "objetivo final!"

	para "¡Hemos fabricado"
	line "un dispositivo que"
	para "emite una potente"
	line "onda que puede"
	para "usarse para"
	line "controlar la mente"
	cont "de los #MON!"

	para "¡Muy pronto, todos"
	line "los #MON obede-"
	cont "cerán las órdenes"
	cont "del TEAM ROCKET!"

	para "¡Les daremos mejor"
	line "uso del que nadie"
	cont "podría darles!"

	para "¡Me niego a dejar"
	line "que te sigas"
	para "interponiendo en"
	line "nuestro camino!"
	done

ImposterTellsYouToSeeExecutive:
	text "Parece que ninguno"
	line "de nuestros"
	cont "SOLDADOS pudo"
	cont "detenerte."

	para "Pero honestamente,"
	line "ya lo esperábamos"
	cont "a estas alturas."

	para "Deberías ir a ver"
	line "al EJECUTIVO."

	para "Aunque sé que lo"
	line "ibas a hacer de"
	cont "todos modos."

	para "No está muy"
	line "contento con esta"
	cont "situación."

	para "Si yo fuese tú, me"
	line "preocuparía."
	done


TeamRocketBaseOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 24, 17, TEAM_ROCKET_BASE_B2F, 4
	warp_event 25, 17, TEAM_ROCKET_BASE_B2F, 5

	db 2 ; coord events
	coord_event  7, 12, SCENE_DEFAULT, ExecutiveConfrontationScene
	coord_event  7, 13, SCENE_DEFAULT, ExecutiveConfrontationScene2


	db 3 ; bg events
	bg_event  9,  1, BGEVENT_ITEM, TeamRocketBaseOfficeHiddenRevive
	bg_event  6,  1, BGEVENT_READ, TeamRocketBaseOfficePassword
	bg_event  7,  1, BGEVENT_READ, TeamRocketBaseOfficePassword


	db 10 ; object events
	object_event  9, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeHyperPotion, EVENT_TEAM_ROCKET_BASE_OFFICE_HYPER_POTION
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeNugget, EVENT_TEAM_ROCKET_BASE_OFFICE_NUGGET
	object_event 24,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeGuardSpec, EVENT_TEAM_ROCKET_BASE_OFFICE_GUARD_SPEC
	object_event 21,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt1, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 28,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt2, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 22, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt3, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 19,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt4, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 25,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt5, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event  7, 11, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
