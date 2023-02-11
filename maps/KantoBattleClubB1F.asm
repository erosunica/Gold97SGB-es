;It seems like the branching scripts for whether you win or lose are backwards. Apparently this is
;also the case for ones that were in the final game, like rival 1 in crown city. But it's not
;apparent there because the text is the same in either case
	object_const_def ; object_event constants
	const BATTLECLUB_SUNDAY_FLEDGLING
	const BATTLECLUB_MONDAY_YOUNGSTER
	const BATTLECLUB_TUESDAY_LASS
	const BATTLECLUB_WEDNESDAY_SPORTSMAN
	const BATTLECLUB_THURSDAY_INSTRUCTOR
	const BATTLECLUB_FRIDAY_COOLTRAINERF
	const BATTLECLUB_SATURDAY_COOLTRAINERM
	const BATTLECLUB_RECEPTIONIST
	const BATTLECLUB_POKEFANM
	const BATTLECLUB_JANINE
	const BATTLECLUB_YOUNGSTER
	const BATTLECLUB_GENTLEMAN
	const BATTLECLUB_LASS
	const BATTLECLUB_YOUNGSTER2
	const BATTLECLUB_GRANNY


KantoBattleClubB1F_MapScripts:
	db 0 ; scene scripts

	db 0  ; callbacks
	
BattleClubScriptSun:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SundayBattleContinue
	jump BattleClubOver
	end

.SundayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSunday
	writetext SundayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSunday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SUNDAY_FLEDGLING, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SundayLeftWalk
	ifequal RIGHT, .SundayRightWalk
	ifequal UP, .SundayUpWalk
	ifequal DOWN, .SundayDownWalk

.SundayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SundayBattleContinue2
	end
	
.SundayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SundayBattleContinue2
	end
	
.SundayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SundayBattleContinue2
	end
	
.SundayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SundayBattleContinue2
	end
	
.NoBattleNowSunday
	writetext NoBattleNowSundayText
	waitbutton
	closetext
	end
	
.SundayBattleContinue2
	winlosstext SundayWinText, SundayLossText
	loadtrainer FLEDGLING, EARNEST
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSunday
	jump .AfterYourDefeatSunday
	end
	
.AfterVictoriousSunday
	opentext
	writetext SundayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSunday
	opentext
	writetext SundayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSunday
	jump BattleClubOver
	end
	
BattleClubScriptMon:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MondayBattleContinue
	jump BattleClubOver
	end

.MondayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledMonday
	writetext MondayTrainerGreeting
	yesorno
	iffalse .NoBattleNowMonday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_MONDAY_YOUNGSTER, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .MondayLeftWalk
	ifequal RIGHT, .MondayRightWalk
	ifequal UP, .MondayUpWalk
	ifequal DOWN, .MondayDownWalk

.MondayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .MondayBattleContinue2
	end
	
.MondayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .MondayBattleContinue2
	end
	
.MondayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .MondayBattleContinue2
	end
	
.MondayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .MondayBattleContinue2
	end
	
.NoBattleNowMonday
	writetext NoBattleNowMondayText
	waitbutton
	closetext
	end
	
.MondayBattleContinue2
	winlosstext MondayWinText, MondayLossText
	loadtrainer YOUNGSTER, JIMMY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousMonday
	jump .AfterYourDefeatMonday
	end
	
.AfterVictoriousMonday
	opentext
	writetext MondayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatMonday
	opentext
	writetext MondayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledMonday
	jump BattleClubOver
	end
	
BattleClubScriptTues:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .TuesdayBattleContinue
	jump BattleClubOver
	end

.TuesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledTuesday
	writetext TuesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowTuesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_TUESDAY_LASS, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .TuesdayLeftWalk
	ifequal RIGHT, .TuesdayRightWalk
	ifequal UP, .TuesdayUpWalk
	ifequal DOWN, .TuesdayDownWalk

.TuesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .TuesdayBattleContinue2
	end
	
.TuesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .TuesdayBattleContinue2
	end
	
.TuesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .TuesdayBattleContinue2
	end
	
.TuesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .TuesdayBattleContinue2
	end
	
.NoBattleNowTuesday
	writetext NoBattleNowTuesdayText
	waitbutton
	closetext
	end
	
.TuesdayBattleContinue2
	winlosstext TuesdayWinText, TuesdayLossText
	loadtrainer LASS, MICHELLE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousTuesday
	jump .AfterYourDefeatTuesday
	end
	
.AfterVictoriousTuesday
	opentext
	writetext TuesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatTuesday
	opentext
	writetext TuesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledTuesday
	jump BattleClubOver
	end

	
BattleClubScriptWed:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdayBattleContinue
	jump BattleClubOver
	end

.WednesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledWednesday
	writetext WednesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowWednesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_WEDNESDAY_SPORTSMAN, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .WednesdayLeftWalk
	ifequal RIGHT, .WednesdayRightWalk
	ifequal UP, .WednesdayUpWalk
	ifequal DOWN, .WednesdayDownWalk

.WednesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .WednesdayBattleContinue2
	end
	
.WednesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .WednesdayBattleContinue2
	end
	
.WednesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .WednesdayBattleContinue2
	end
	
.WednesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .WednesdayBattleContinue2
	end
	
.NoBattleNowWednesday
	writetext NoBattleNowWednesdayText
	waitbutton
	closetext
	end
	
.WednesdayBattleContinue2
	winlosstext WednesdayWinText, WednesdayLossText
	loadtrainer SPORTSMAN, MANNY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousWednesday
	jump .AfterYourDefeatWednesday
	end
	
.AfterVictoriousWednesday
	opentext
	writetext WednesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatWednesday
	opentext
	writetext WednesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledWednesday
	jump BattleClubOver
	end

BattleClubScriptThurs:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ThursdayBattleContinue
	jump BattleClubOver
	end

.ThursdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledThursday
	writetext ThursdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowThursday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_THURSDAY_INSTRUCTOR, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .ThursdayLeftWalk
	ifequal RIGHT, .ThursdayRightWalk
	ifequal UP, .ThursdayUpWalk
	ifequal DOWN, .ThursdayDownWalk

.ThursdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .ThursdayBattleContinue2
	end
	
.ThursdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .ThursdayBattleContinue2
	end
	
.ThursdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .ThursdayBattleContinue2
	end
	
.ThursdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .ThursdayBattleContinue2
	end
	
.NoBattleNowThursday
	writetext NoBattleNowThursdayText
	waitbutton
	closetext
	end
	
.ThursdayBattleContinue2
	winlosstext ThursdayWinText, ThursdayLossText
	loadtrainer INSTRUCTOR, MORGAN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousThursday
	jump .AfterYourDefeatThursday
	end
	
.AfterVictoriousThursday
	opentext
	writetext ThursdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatThursday
	opentext
	writetext ThursdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledThursday
	jump BattleClubOver
	end


BattleClubScriptFri:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .FridayBattleContinue
	jump BattleClubOver
	end

.FridayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledFriday
	writetext FridayTrainerGreeting
	yesorno
	iffalse .NoBattleNowFriday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_FRIDAY_COOLTRAINERF, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .FridayLeftWalk
	ifequal RIGHT, .FridayRightWalk
	ifequal UP, .FridayUpWalk
	ifequal DOWN, .FridayDownWalk

.FridayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .FridayBattleContinue2
	end
	
.FridayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .FridayBattleContinue2
	end
	
.FridayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .FridayBattleContinue2
	end
	
.FridayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .FridayBattleContinue2
	end
	
.NoBattleNowFriday
	writetext NoBattleNowFridayText
	waitbutton
	closetext
	end
	
.FridayBattleContinue2
	winlosstext FridayWinText, FridayLossText
	loadtrainer COOLTRAINERF, KATE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousFriday
	jump .AfterYourDefeatFriday
	end
	
.AfterVictoriousFriday
	opentext
	writetext FridayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatFriday
	opentext
	writetext FridayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledFriday
	jump BattleClubOver
	end
	

BattleClubScriptSat:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SaturdayBattleContinue
	jump BattleClubOver
	end

.SaturdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSaturday
	writetext SaturdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSaturday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SATURDAY_COOLTRAINERM, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SaturdayLeftWalk
	ifequal RIGHT, .SaturdayRightWalk
	ifequal UP, .SaturdayUpWalk
	ifequal DOWN, .SaturdayDownWalk

.SaturdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SaturdayBattleContinue2
	end
	
.SaturdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SaturdayBattleContinue2
	end
	
.SaturdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SaturdayBattleContinue2
	end
	
.SaturdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SaturdayBattleContinue2
	end
	
.NoBattleNowSaturday
	writetext NoBattleNowSaturdayText
	waitbutton
	closetext
	end
	
.SaturdayBattleContinue2
	winlosstext SaturdayWinText, SaturdayLossText
	loadtrainer COOLTRAINERM, ALLEN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSaturday
	jump .AfterYourDefeatSaturday
	end
	
.AfterVictoriousSaturday
	opentext
	writetext SaturdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSaturday
	opentext
	writetext SaturdayAfterYourDefeatText
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_ALLEN
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSaturday
	jump BattleClubOver
	end

BattleClubOver:
	writetext TrainerClubDone
	waitbutton
	closetext
	end
	
BattleClubReceptionistScript:
	jumptextfaceplayer BattleClubReceptionistText
	
BattleClubPokefanMScript:
	jumptextfaceplayer BattleClubPokefanMText

BattleClubJanineScript:
	jumptextfaceplayer BattleClubJanineText
	
BattleClubYoungsterScript:
	checkevent EVENT_BEAT_COOLTRAINERM_ALLEN
	iftrue .WowYouBeatAllen
	faceplayer
	opentext
	writetext BattleClubYoungsterText
	waitbutton
	closetext
	end

.WowYouBeatAllen
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_FROM_TRAINER_CLUB
	iftrue .AlreadyGotTogepi
	checkevent EVENT_ALREADY_GOT_CONGRATS_FROM_YOUNGSTER
	iftrue .AlreadyGotCongrats
	writetext BattleClubYoungsterText
	setevent EVENT_ALREADY_GOT_CONGRATS_FROM_YOUNGSTER
	waitbutton
.AlreadyGotCongrats
	writetext IHaveAWeirdEggText
	yesorno
	iffalse .DontTakeTogepi
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullTogepi
	writetext PlayerGotTogepiText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOGEPI, 5
	writetext GiveTogepiText
	waitbutton
	closetext
	setevent EVENT_GOT_TOGEPI_FROM_TRAINER_CLUB
	end
	
.AlreadyGotTogepi
	writetext BattleClubYoungsterTextBeat
	waitbutton
	closetext
	end
	
.DontTakeTogepi
	writetext NoTogepiText
	waitbutton
	closetext
	end
	
.PartyFullTogepi
	writetext PartyFullTogepiText
	waitbutton
	closetext
	end


BattleClubGentlemanScript:
	jumptextfaceplayer BattleClubGentlemanText
	
	
BattleClubLassScript:
	jumptextfaceplayer BattleClubLassText
	
BattleClubYoungster2Script:
	jumptextfaceplayer BattleClubYoungster2Text
	
BattleClubGrannyScript:
	jumptextfaceplayer BattleClubGrannyText
	
PlayerWalksToOtherSideLeft:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideRight:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideUp:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideDown:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PartyFullTogepiText:
	text "¡Espera!"

	para "¡Tienes que"
	line "hacerle un hueco!"
	done

NoTogepiText:
	text "¿Seguro?"

	para "Pensé que te"
	line "gustaría."
	done

GiveTogepiText:
	text "Estoy seguro que"
	line "eres quien mejor"
	cont "podría criarlo."
	done

IHaveAWeirdEggText:
	text "¡Guau! ¿Has"
	line "vencido a ese"
	para "ENTRENADOR GUAY"
	line "tan fuerte?"

	para "¡Es increíble!"

	para "Oye, escucha."
	line "Tengo un HUEVO"
	cont "#MON raro."

	para "Eclosionó el otro"
	line "día, ¡pero sigue"
	cont "pareciendo un"
	cont "HUEVO!"

	para "Es un #MON muy"
	line "raro."

	para "Creo que un"
	line "entrenador experto"
	para "como tú está más"
	line "capacitado para"
	cont "criarlo."

	para "¿Lo quieres?"
	done

PlayerGotTogepiText:
	text "<PLAYER> recibió a"
	line "TOGEPI."
	done

BattleClubYoungsterTextBeat:
	text "En serio, ¿cómo"
	line "has podido derro-"
	cont "tar a ese tipo?"

	para "¡Aún no me lo"
	line "creo!"
	done

BattleClubGrannyText:
	text "Hace tiempo,"
	line "fui una gran"
	cont "entrenadora."

	para "Ya no combato"
	line "apenas."

	para "Pero siempre paso"
	line "un buen rato"
	para "cuando vengo a ver"
	line "combatir a los"
	para "grandes entrenado-"
	line "res de hoy en día."
	done

BattleClubYoungster2Text:
	text "Estoy aquí para"
	line "apoyar a mi"
	cont "hermano pequeño."

	para "Acaba de empezar a"
	line "ser entrenador."

	para "Si tienes #MON"
	line "más débiles,"
	para "¿podrías combatir"
	line "contra él"
	cont "usándolos?"
	done

BattleClubLassText:
	text "Cada día, vienen"
	line "entrenadores"
	cont "distintos a este"
	cont "lugar."

	para "Los más fuertes"
	line "suelen venir los"
	cont "últimos días de la"
	cont "semana."
	done

BattleClubRockerText:
	text "Ya me estoy"
	line "cansando de tantos"
	cont "combates."

	para "Si quieres desafi-"
	line "ar a alguien, creo"
	para "que hay un"
	line "DEPORTISTA por"
	cont "allí."
	done

BattleClubGentlemanText:
	text "Este local es"
	line "perfecto para los"
	para "entrenadores que"
	line "no les gusta via-"
	cont "jar pero quieren"
	cont "nuevos desafíos."
	done

BattleClubYoungsterText:
	text "El otro día vino"
	line "un ENTRENADOR"
	cont "GUAY."

	para "Sus #MON eran"
	line "realmente"
	cont "formidables."

	para "No pude hacer"
	line "nada."

	para "Creo que viene los"
	line "sábados."

	para "¿Serías capaz de"
	line "derrotarlo?"

	para "¡Si lo logras,"
	line "dímelo!"
	done

BattleClubJanineText:
	text "¡Algunos entrena-"
	line "dores aquí son"
	cont "demasiado fuertes!"

	para "Tengo que seguir"
	line "entrenando."
	done

BattleClubPokefanMText:
	text "¡A todo el mundo"
	line "le encanta un buen"
	cont "combate!"

	para "¡A veces basta con"
	line "verlos para"
	cont "divertirse!"
	done

BattleClubReceptionistText:
	text "Bienvenido al CLUB"
	line "BATALLA de KANTO."

	para "Contamos con"
	line "entrenadores de"
	cont "toda clase y"
	cont "nivel."

	para "Suelen venir"
	line "algunos bastante"
	cont "fuertes."

	para "¡No dudes en"
	line "desafiarlos!"
	done

NoBattleNowSundayText:
	text "¡Oh, vaya!"

	para "Será para la"
	line "próxima."
	done

SundayAfterYourDefeatText:; backwards
	text "¡Aún no soy"
	line "fuerte, pero estoy"
	cont "en ello!"
	done

SundayAfterVictoriousText:; backwards
	text "¡Mis #MON son"
	line "cada día más"
	cont "fuertes!"
	done

SundayWinText:
	text "¡Vaya, eres"
	line "fuerte!"
	done

SundayLossText:
	text "¡Uau! ¡He ganado!"
	done

SundayTrainerGreeting:
	text "¡Hola! ¡Acabo de"
	line "empezar como"
	cont "entrenador"
	cont "#MON!"

	para "¡Pero mi sueño es"
	line "ser algún día un"
	cont "gran entrenador!"

	para "Uso #MON"
	line "alrededor del"
	cont "nivel 10."

	para "¿Quieres combatir?"
	done

NoBattleNowMondayText:
	text "¡Estaré aquí si"
	line "cambias de"
	cont "opinión!"
	done

MondayAfterYourDefeatText:; backwards
	text "¡Parece que debo"
	line "seguir entrenando!"
	done

MondayAfterVictoriousText:; backwards
	text "¡Mi entrenamiento"
	line "está dando"
	cont "resultado!"
	done

MondayWinText:
	text "¡Esto se te da muy"
	line "bien!"
	done

MondayLossText:
	text "¡Toma ya!"
	done

MondayTrainerGreeting:
	text "Hola, ¿quieres"
	line "combatir?"

	para "Creo que me estoy"
	line "volviendo bueno en"
	cont "esto."

	para "Uso #MON"
	line "alrededor del"
	cont "nivel 20."

	para "Entonces,"
	line "¿combatimos?"
	done

NoBattleNowTuesdayText:
	text "Supongo que soy"
	line "demasiado para ti,"
	cont "¿no?"
	done

TuesdayAfterYourDefeatText:; backwards
	text "¡Se nota que eres"
	line "el más fuerte"
	cont "aquí!"
	done

TuesdayAfterVictoriousText:; backwards
	text "¡Pues no se me da"
	line "nada mal!"
	done

TuesdayWinText:
	text "¡Pero bueno!"
	done

TuesdayLossText:
	text "¡Toma eso!"
	done

TuesdayTrainerGreeting:
	text "¡Hola!"

	para "¡Estoy buscando"
	line "con quién"
	cont "combatir!"

	para "Creo que soy"
	line "bastante fuerte."

	para "Uso #MON"
	line "alrededor del"
	cont "nivel 30."

	para "¿Crees que puedes"
	line "derrotarme?"
	done

NoBattleNowWednesdayText:
	text "¡No pasa nada!"

	para "Me quedaré por"
	line "aquí un rato."
	done

WednesdayAfterYourDefeatText:; backwards
	text "¡Esto también se"
	line "te da bien!"
	done

WednesdayAfterVictoriousText:; backwards
	text "¡Mis #MON"
	line "siempre están"
	cont "listos para"
	cont "combatir!"
	done

WednesdayWinText:
	text "¡Buen combate!"
	done

WednesdayLossText:
	text "¡Vaya despliegue!"
	done

WednesdayTrainerGreeting:
	text "¡Hola! ¡Vengo de"
	line "una maratón con"
	cont "mis #MON!"

	para "Soy bastante bueno"
	line "combatiendo."

	para "Uso #MON"
	line "alrededor del"
	cont "nivel 40."

	para "¿Quieres"
	line "desafiarme?"
	done

NoBattleNowThursdayText:
	text "Vale, está bien."
	done

ThursdayAfterYourDefeatText:; backwards
	text "Ha sido un buen"
	line "desafío."
	done

ThursdayAfterVictoriousText:; backwards
	text "Mis #MON han"
	line "demostrado su"
	cont "fuerza."
	done

ThursdayWinText:
	text "Muy bien."
	done

ThursdayLossText:
	text "Victoria."
	done

ThursdayTrainerGreeting:
	text "Buen día."

	para "Tengo mucha"
	line "experiencia en"
	cont "combate."

	para "Uso #MON"
	line "alrededor del"
	cont "nivel 50."

	para "¿Te animas a un"
	line "combate?"
	done

NoBattleNowFridayText:
	text "No pasa nada, la"
	line "mayoría no puede."
	done

FridayAfterYourDefeatText:; backwards
	text "¡Vaya, me has"
	line "derrotado!"
	done

FridayAfterVictoriousText:; backwards
	text "¡Una victoria más"
	line "para mi equipo!"
	done

FridayWinText:
	text "¡Estoy impactado!"
	done

FridayLossText:
	text "¡Qué bueno soy!"
	done

FridayTrainerGreeting:
	text "¡Anda, hola!"

	para "No quiero presu-"
	line "mir, pero soy muy"
	cont "fuerte."

	para "Uso #MON"
	line "alrededor del"
	cont "nivel 60."

	para "¿Crees que puedes"
	line "contra ellos?"
	done

NoBattleNowSaturdayText:
	text "Un día, quizá seas"
	line "lo bastante fuerte"
	cont "para aceptar mi"
	cont "desafío."
	done

SaturdayAfterYourDefeatText:; backwards
	text "Eres de los pocos"
	line "que ha conseguido"
	cont "derrotarme."

	para "Bien hecho."
	done

SaturdayAfterVictoriousText:; backwards
	text "Ya me lo esperaba."
	done

SaturdayWinText:
	text "¡Increíble!"
	done

SaturdayLossText:
	text "¡Una vez más, la"
	line "victoria es mía!"
	done

	
;SaturdayTrainerGreeting:
;	text "Hi I'm strong."
;	line "My #MON is at"
;	cont "level 70."
;	para "I am the bestest +"
;	para "Shall we battle?"
;	done

SaturdayTrainerGreeting:
	text "No suelo encontrar"
	line "entrenadores"
	para "capaces de"
	line "competir conmigo."

	para "Uso #MON"
	line "alrededor del"
	cont "nivel 70."

	para "Así que dime,"
	line "¿crees que puedes"
	cont "hacerme frente en"
	cont "combate?"
	done

TrainerAcceptsChallenge:
	text "¡De acuerdo!"

	para "¡Colócate en el"
	line "lado opuesto y"
	cont "podremos comenzar!"
	done

TrainerClubDone:
	text "¡Uf!"

	para "No estoy para más"
	line "combates por hoy."

	para "¡Vuelve mañana y"
	line "combate contra"
	cont "nuevos"
	cont "entrenadores!"
	done
	

KantoBattleClubB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, KANTO_BATTLE_CLUB_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSun, EVENT_SWITCH_1
	object_event 14, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleClubScriptMon, EVENT_SWITCH_2
	object_event 16,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubScriptTues, EVENT_SWITCH_3
	object_event 16,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BattleClubScriptWed, EVENT_SWITCH_4
	object_event  6, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptThurs, EVENT_SWITCH_5
	object_event 14, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubScriptFri, EVENT_SWITCH_6
	object_event  6, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSat, EVENT_SWITCH_7
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleClubReceptionistScript, -1
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, BattleClubPokefanMScript, -1
	object_event  3, 15, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubJanineScript, -1
	object_event  9,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleClubYoungsterScript, EVENT_SWITCH_2
	object_event 13, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleClubGentlemanScript, EVENT_SWITCH_3
	object_event 15,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubLassScript, EVENT_SWITCH_5
	object_event  3, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubYoungster2Script, EVENT_SWITCH_1
	object_event 13,  6, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleClubGrannyScript, EVENT_SWITCH_6
