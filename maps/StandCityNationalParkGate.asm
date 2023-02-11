	object_const_def ; object_event constants
	const STANDCITYNATIONALPARKGATE_OFFICER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER2
	const STANDCITYNATIONALPARKGATE_ROCKER
	const STANDCITYNATIONALPARKGATE_POKEFAN_M
	const STANDCITYNATIONALPARKGATE_YOUNGSTER3
	const STANDCITYNATIONALPARKGATE_YOUNGSTER4
	const STANDCITYNATIONALPARKGATE_LASS
	const STANDCITYNATIONALPARKGATE_YOUNGSTER5
	const STANDCITYNATIONALPARKGATE_YOUNGSTER6
	const STANDCITYNATIONALPARKGATE_YOUNGSTER7
	const STANDCITYNATIONALPARKGATE_OFFICER2

StandCityNationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_STANDCITYNATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	priorityjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_103_NATIONAL_PARK_GATE
	iftrue .Return
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear STANDCITYNATIONALPARKGATE_OFFICER1
	disappear STANDCITYNATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	turnobject PLAYER, UP
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar 1
	vartomem MEM_BUFFER_0
	writetext UnknownText_0x6b284
	yesorno
	iffalse .GoBackToContest
	writetext UnknownText_0x6b2c5
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	applymovement PLAYER, MovementData_0x6add1
	pause 15
	special FadeInQuickly
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext UnknownText_0x6b300
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear STANDCITYNATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear STANDCITYNATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear STANDCITYNATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route102OfficerScriptContest:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	scall Route102ParkGate_DayToText
	writetext UnknownText_0x6add5
	yesorno
	iffalse .DecidedNotToJoinContest
	checkcode VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6ae87
	buttonsound
	waitsfx
	writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6aecc
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, DOWN
	applymovement PLAYER, ExitBuildingMovement
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.LeaveMonsWithOfficer:
	checkcode VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	checkcode VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext UnknownText_0x6afb0
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6b021
	buttonsound
	writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext UnknownText_0x6b0c6
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext UnknownText_0x6b081
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext UnknownText_0x6b0f2
	waitbutton
	closetext
	end

.BoxFull:
	writetext UnknownText_0x6b166
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext UnknownText_0x6b209
	waitbutton
	closetext
	end

Route102Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext UnknownText_0x6b32b
	waitbutton
	closetext
	end

.Sunstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem HEART_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	closetext
	end

.Everstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext UnknownText_0x6b910
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer UnknownText_0x6b370

StandCityNationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	writetext UnknownText_0x6b370
	waitbutton
	closetext
	end

Route102ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign:
; duplicate of BugCatchingContestExplanationSign in Route103NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

ExitBuildingMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x6add1:
	big_step UP
	big_step UP
;	big_step RIGHT
	turn_head UP
	step_end

UnknownText_0x6add5:
	text "Hoy es @"
	text_ram wStringBuffer3
	text "."
	line "Eso significa que"
	para "hoy es el Concurso"
	line "Captura de Bichos."

	para "Las reglas son"
	line "sencillas."

	para "Usa uno de tus"
	line "#MON y captura"
	para "un #MON bicho"
	line "para ganar."

	para "¿Te gustaría"
	line "intentarlo?"
	done

UnknownText_0x6ae87:
	text "Aquí tienes las"
	line "PARQUE BALL para"
	cont "el Concurso."
	done

UnknownText_0x6aeb1:
	text "<PLAYER> recibió"
	line "20 PARQUE BALL."
	done

UnknownText_0x6aecc:
	text "Aquel que consiga"
	line "el #MON bicho"
	para "más fuerte será el"
	line "ganador."

	para "Tienes 20 minutos."

	para "Si te quedas sin"
	line "PARQUE BALL, ya no"
	cont "puedes seguir."

	para "Puedes quedarte"
	line "el último #MON"
	cont "que captures."

	para "¡Sal y captura"
	line "el #MON bicho"
	para "más fuerte que"
	line "encuentres!"
	done

UnknownText_0x6afb0:
	text "¡Oh, oh…!"

	para "Tienes más de un"
	line "#MON."

	para "Tendrás que usar"
	line "a @"
	text_ram wStringBuffer3
	text ","

	para "el primer #MON"
	line "de tu equipo."

	para "¿Te parece bien?"
	done

UnknownText_0x6b021:
	text "Bien, guardaremos"
	line "los otros #MON"
	cont "mientras compites."
	done

UnknownText_0x6b055:
	text "Los #MON de"
	line "<PLAYER> se quedan"
	cont "con el AYUDANTE."
	done

UnknownText_0x6b081:
	text "Elige el #MON"
	line "que usarás en el"

	para "Concurso y luego"
	line "ven a verme."
	done

UnknownText_0x6b0c6:
	text "Muy bien."
	line "Esperamos verte"
	cont "pronto por aquí."
	done

UnknownText_0x6b0f2:
	text "¡Oh, oh…!"
	line "El primer #MON"
	para "de tu equipo no"
	line "puede luchar."

	para "Sustitúyelo por"
	line "el #MON que"
	para "quieras usar y"
	line "luego ven a verme."
	done

UnknownText_0x6b166:
	text "¡Oh, oh…!"
	line "Tu equipo y tu"

	para "CAJA del PC están"
	line "llenos."

	para "No tienes sitio"
	line "para guardar el"
	cont "#MON bicho."

	para "Haz sitio en tu"
	line "equipo o en la"

	para "CAJA del PC y"
	line "luego ven a verme."
	done

UnknownText_0x6b209:
	text "¡Oh, oh…! Tienes"
	line "un HUEVO como"
	para "primer #MON"
	line "de tu equipo."

	para "Sustitúyelo por"
	line "el #MON que"
	para "quieras usar y"
	line "luego ven a verme."
	done

UnknownText_0x6b284:
	text "Aún te quedan"
	line "@"
	text_ram wStringBuffer3
	text " minuto(s)."

	para "¿Quieres terminar"
	line "ahora?"
	done

UnknownText_0x6b2c5:
	text "Bien. Por favor,"
	line "espera aquí a que"
	para "se anuncien los"
	line "ganadores."
	done

UnknownText_0x6b300:
	text "Bien. Por favor,"
	line "vuelve fuera y"
	cont "termina."
	done

UnknownText_0x6b32b:
	text "El Concurso ha"
	line "acabado. Esperamos"
	para "volver a veros por"
	line "aquí muy pronto."
	done

UnknownText_0x6b370:
	text "Algunos #MON"
	line "sólo aparecen en"
	cont "el PARQUE."
	done

BugCatchingContestant1BText:
	text "RAFA: ¡Uau!"
	line "Me has vencido."
	cont "No está mal."
	done

BugCatchingContestant1BStillCompetingText:
	text "RAFA: La suerte"
	line "cuenta mucho."

	para "Nunca se sabe qué"
	line "#MON va a"
	cont "aparecer."
	done

BugCatchingContestant2BText:
	text "SAM: Te envidio."
	line "Esta vez no"
	cont "lo he conseguido."
	done

BugCatchingContestant2BStillCompetingText:
	text "SAM: A lo mejor es"
	line "que has ganado"
	para "porque tus #MON"
	line "son grandes…"
	done

BugCatchingContestant3BText:
	text "NANO: ¡Eso es!"
	line "Voy a entrenar"
	cont "mejor a mis"
	cont "#MON."
	done

BugCatchingContestant3BStillCompetingText:
	text "NANO: Quizá ganes"
	line "más puntos por un"

	para "#MON de un"
	line "color inusual."
	done

BugCatchingContestant4BText:
	text "GUILLE: ¿Ganaste?"
	line "¿Qué has atrapado?"
	done

BugCatchingContestant4BStillCompetingText:
	text "GUILLE: Me alegra"
	line "haber atrapado el"

	para "#MON que"
	line "quería."
	done

BugCatchingContestant5BText:
	text "TINO: Enhorabuena."
	line "¡Te has ganado mi"
	cont "respeto!"
	done

BugCatchingContestant5BStillCompetingText:
	text "TINO: He atrapado"
	line "un SCYTHER, pero"
	cont "he perdido."
	done

BugCatchingContestant6BText:
	text "BENITO: El #MON"
	line "que has atrapado…"
	cont "es impresionante."
	done

BugCatchingContestant6BStillCompetingText:
	text "BENITO: Es más"
	line "fácil ganar con"
	para "un #MON bicho"
	line "de nivel alto."

	para "Pero creo que"
	line "también cuentan"
	cont "otros aspectos."
	done

BugCatchingContestant7BText:
	text "CINDY: ¿Ganaste?"
	line "¡Qué bien!"

	para "¿Te apetece buscar"
	line "#MON bicho"
	cont "conmigo?"
	done

BugCatchingContestant7BStillCompetingText:
	text "CINDY: ¡Adoro los"
	line "#MON bicho!"
	done

BugCatchingContestant8BText:
	text "KAI: ¡No…!"
	line "No me puedo creer"
	cont "que haya perdido."
	done

BugCatchingContestant8BStillCompetingText:
	text "KAI: ¡Dicen que"
	line "alguien ha ganado"
	cont "con un CATERPIE!"
	done

BugCatchingContestant9BText:
	text "SAMUEL: La próxima"
	line "vez ganaré yo."
	done

BugCatchingContestant9BStillCompetingText:
	text "SAMUEL: Vaya, creí"
	line "que obtendría más"
	cont "puntos…"
	done

BugCatchingContestant10BText:
	text "KOLDO: ¿Me das"
	line "algún consejo?"

	para "Quiero estudiar"
	line "tu estilo."
	done

BugCatchingContestant10BStillCompetingText:
	text "KOLDO: He"
	line "estudiado mucho,"
	para "pero eso no vale"
	line "para ganar."
	done

UnusedBellignanText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Bellignan.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "Dicen que hay"
	line "un #MON que"
	cont "parece un árbol."

	para "Se puede descubrir"
	line "su identidad con"
	cont "el SCOPE SILPH 2."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route103NationalParkGate.asm
	text "El Concurso de"
	line "Captura de Bichos"
	para "es los martes,"
	line "jueves y sábados."

	para "No sólo ganas un"
	line "premio por"
	para "participar,"
	line "sino que también"
	para "te quedarás con el"
	line "#MON bicho"
	cont "que tengas cuando"
	cont "termine."
	done

UnknownText_0x6b910:
	text "¡Vaya…! Tu MOCHILA"
	line "está llena."

	para "Guardaremos tu"
	line "premio, pero sólo"
	cont "hoy."

	para "Haz sitio en ella"
	line "y ven a verme."
	done

UnknownText_0x6b97f:
	text "¿<PLAYER>?"

	para "Aquí tienes el"
	line "premio que te"
	cont "guardábamos."
	done

StandCityNationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, NATIONAL_PARK, 1
	warp_event  1,  7, NATIONAL_PARK, 2
	warp_event  8,  7, STAND_CITY, 10
	warp_event  9,  7, STAND_CITY, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 12 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102OfficerScriptContest, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityNationalParkGateOfficerScript, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
