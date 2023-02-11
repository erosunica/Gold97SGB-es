	object_const_def ; object_event constants
	const ROUTE103NATIONALPARKGATE_OFFICER1
	const ROUTE103NATIONALPARKGATE_YOUNGSTER
	const ROUTE103NATIONALPARKGATE_OFFICER2

Route103NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE103NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE103NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE103NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE103NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE103NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE103NATIONALPARKGATE_OFFICER1
	appear ROUTE103NATIONALPARKGATE_YOUNGSTER
	appear ROUTE103NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE103NATIONALPARKGATE_OFFICER1
	disappear ROUTE103NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE103NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route103NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE103NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route103NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route103NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd BugContestResultsWarpScript

.GoBackToContest:
	writetext Route103NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route103NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	waitsfx
	warp NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route103OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route103NationalParkGate_NoContestToday
	ifequal MONDAY, Route103NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route103NationalParkGate_NoContestToday
	ifequal FRIDAY, Route103NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route103NationalParkGate_ContestIsOver
	scall Route103NationalParkGate_GetDayOfWeek
	writetext Route103NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route103NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route103NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route103NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route103NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route103NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route103NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route103NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	waitsfx
	special SelectRandomBugContestContestants
	warp NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route103NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route103NationalParkGate_FacingLeft
	applymovement PLAYER, Route103NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route103NationalParkGate_FacingLeft:
	applymovement PLAYER, Route103NationalParkGatePlayerEnterParkMovement
	end

Route103NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route103NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route103NationalParkGate_NoRoomInBox

Route103NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route103NationalParkGate_FirstMonIsEgg
	writetext Route103NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route103NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route103NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route103NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route103NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route103NationalParkGate_OkayToProceed

Route103NationalParkGate_DeclinedToParticipate:
	writetext Route103NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route103NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route103NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route103NationalParkGate_FirstMonIsFainted:
	writetext Route103NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route103NationalParkGate_NoRoomInBox:
	writetext Route103NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route103NationalParkGate_FirstMonIsEgg:
	writetext Route103NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route103NationalParkGate_ContestIsOver:
	writetext Route103NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route103NationalParkGate_NoContestToday:
	jumptextfaceplayer Route103NationalParkGateOfficer1WeHoldContestsText

Route103NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route103NationalParkGate_ContestIsOver
	writetext Route103NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route103NationalParkGateYoungsterScript:
	jumptextfaceplayer Route103NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route103NationalParkGate_GetDayOfWeek:
	jumpstd DayToTextScript
	end

Route103NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route103NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route103NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route103NationalParkGateOfficer1AskToParticipateText:
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

Route103NationalParkGateOfficer1GiveParkBallsText:
	text "Aquí tienes las"
	line "PARQUE BALL para"
	cont "el Concurso."
	done

Route103NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> recibió"
	line "20 PARQUE BALL."
	done

Route103NationalParkGateOfficer1ExplainsRulesText:
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

Route103NationalParkGateOfficer1AskToUseFirstMonText:
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

Route103NationalParkGateOfficer1WellHoldYourMonText:
	text "Bien, guardaremos"
	line "los otros #MON"
	cont "mientras compites."
	done

Route103NationalParkGatePlayersMonLeftWithHelperText:
	text "Los #MON de"
	line "<PLAYER> se quedan"
	cont "con el AYUDANTE."
	done

Route103NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Elige el #MON"
	line "que usarás en el"

	para "Concurso y luego"
	line "ven a verme."
	done

Route103NationalParkGateOfficer1TakePartInFutureText:
	text "Muy bien."
	line "Esperamos verte"
	cont "pronto por aquí."
	done

Route103NationalParkGateOfficer1FirstMonCantBattleText:
	text "¡Oh, oh…!"
	line "El primer #MON"
	para "de tu equipo no"
	line "puede luchar."

	para "Sustitúyelo por"
	line "el #MON que"
	para "quieras usar y"
	line "luego ven a verme."
	done

Route103NationalParkGateOfficer1MakeRoomText:
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

Route103NationalParkGateOfficer1EggAsFirstMonText:
	text "¡Oh, oh…! Tienes"
	line "un HUEVO como"
	para "primer #MON"
	line "de tu equipo."

	para "Sustitúyelo por"
	line "el #MON que"
	para "quieras usar y"
	line "luego ven a verme."
	done

Route103NationalParkGateOfficer1WantToFinishText:
	text "Aún te quedan"
	line "@"
	text_ram wStringBuffer3
	text " minuto(s)."

	para "¿Quieres terminar"
	line "ahora?"
	done

Route103NationalParkGateOfficer1WaitAtNorthGateText:
	text "Bien. Espera en la"
	line "Entrada Norte a"
	para "que se anuncie a"
	line "los ganadores."
	done

Route103NationalParkGateOfficer1OkGoFinishText:
	text "Vale. Vuelve fuera"
	line "y termina el"
	cont "juego."
	done

Route103NationalParkGateOfficer1ContestIsOverText:
	text "El Concurso ha"
	line "acabado. Esperamos"
	para "volveros a ver"
	line "aquí pronto."
	done

Route103NationalParkGateOfficer1WeHoldContestsText:
	text "En el PARQUE se"
	line "suelen celebrar"
	para "muchos Concursos."
	line "Deberías probar."
	done

Route103NationalParkGateYoungsterText:
	text "¿Cuándo será el"
	line "próximo Concurso"
	cont "Captura de Bichos?"
	done

BugCatchingContestExplanationText:
	text "El Concurso de"
	line "Captura de Bichos"
	para "se celebra los"
	line "martes, jueves"
	cont "y sábados."

	para "No sólo ganarás un"
	line "premio por parti-"
	cont "cipar. Además,"
	cont "podrás quedarte"

	para "con un #MON"
	line "bicho que atrapes."
	done

Route103NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_103, 3
	warp_event  4,  7, ROUTE_103, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103OfficerScriptContest, EVENT_ROUTE_103_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route103NationalParkGateYoungsterScript, EVENT_ROUTE_103_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103NationalParkGateOfficerScript, EVENT_ROUTE_103_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
