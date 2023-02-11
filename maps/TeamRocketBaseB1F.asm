	object_const_def ; object_event constants
	const TEAMROCKETBASEB1F_POKE_BALL
	const TEAMROCKETBASEB1F_GRUNTM8
	const TEAMROCKETBASEB1F_GRUNTM9
	const TEAMROCKETBASEB1F_GRUNTM10
	const TEAMROCKETBASEB1F_GRUNTM14
	const TEAMROCKETBASEB1F_GRUNTM15
	const TEAMROCKETBASEB1F_GRUNTM16
	const TEAMROCKETBASEB1F_SCIENTISTROSS
	const TEAMROCKETBASEB1F_SCIENTISTMITCH
	const TEAMROCKETBASEB1F_SILVER
	const TEAMROCKETBASEB1F_IMPOSTOR
	const TEAMROCKETBASEB1F_STRAIGAR

TeamRocketBaseB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .DamagedSystem
	
.DamagedSystem:
	checkevent EVENT_ROCKET_MACHINE_DAMAGED
	iffalse .Done
	changeblock 11, 13, $4D ; damage
	changeblock 19, 13, $4F ; damage
	changeblock 11, 15, $4C ; damage
	changeblock 19, 15, $4E ; damage
	changeblock 11, 19, $48 ; damage
	changeblock 19, 19, $4A ; damage
	changeblock 13, 19, $4B ; damage
	changeblock 15, 19, $49 ; damage
	changeblock 17, 19, $4B ; damage
.Done:
	return

ImposterCompEncounter:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_SILVER, 20
	applymovement TEAMROCKETBASEB1F_SILVER, SilverWalksToImposterComputer
	opentext
	writetext YoureNotOakCompScene
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTOR, 20
	turnobject TEAMROCKETBASEB1F_IMPOSTOR, LEFT
	applymovement TEAMROCKETBASEB1F_IMPOSTOR, ImposterJumpsBack
	pause 5
	opentext
	writetext HowDidYouKidsGetDownHereText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_IMPOSTOR, ImposterRunsOff
	opentext
	writetext SilverHeyWaitWhatsGoingOnText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_SILVER, SilverRunsOffFast
	disappear TEAMROCKETBASEB1F_SILVER
	disappear TEAMROCKETBASEB1F_IMPOSTOR
	setscene SCENE_TEAMROCKETBASEB1F_NOTHING
	setevent EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
	end


TeamRocketBaseB1FTMPsychUp:
	itemball TM_PSYCH_UP

TeamRocketBaseB1FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_FULL_HEAL


TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end


TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM16:
	trainer GRUNTM, GRUNTM_16, EVENT_BEAT_ROCKET_GRUNTM_16, GruntM16SeenText, GruntM16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM16AfterBattleText
	waitbutton
	closetext
	end
	
TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end
	
TeamRocketBaseB1FComputerConsole:
	checkevent EVENT_ROCKET_COMPUTER_IS_OFF
	iftrue .SystemIsOff
	opentext
	playsound SFX_BOOT_PC
	pause 50
	writetext TeamRocketBaseB1FComputerConsoleIntroText
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.SystemIsOff
	opentext
	writetext SystemAlreadyOff
	waitbutton
	closetext
	end

TeamRocketBaseB1FComputerConsole_loop:
	writetext ConsoleWhatDo
	loadmenu TeamRocketBaseB1FComputerConsoleMenu
	verticalmenu
	closewindow
	ifequal 1, .consolemenu1
	ifequal 2, .consolemenu2
	ifequal 3, .consolemenu3
	jump TeamRocketBaseB1FComputerConsole_cancel

	
.consolemenu1
	writetext ConsoleMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu2
	writetext ConsoleMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu3
	writetext ConsoleMenu3Text
	waitbutton
	playsound SFX_CHOOSE_PC_OPTION
TeamRocketBaseB1FComputerPower_loop:
	writetext ConsoleWhatDoPower
	loadmenu TeamRocketBaseB1FComputerConsolePowerMenu
	verticalmenu
	closewindow
	ifequal 1, .consolepowermenu1
	ifequal 2, .consolepowermenu2
	ifequal 3, .consolepowermenu3
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolepowermenu1
	writetext ConsolePowerMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu2
	writetext ConsolePowerMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu3
	writetext ConsolePowerMenu3Text
	waitbutton
	checkevent EVENT_ROUTE_105_BATTLE
	iftrue .KnowsPasswordShutDown
	jump TeamRocketBaseB1FComputerPower_loop
	
.KnowsPasswordShutDown
	writetext PasswordEntered
.PowerYesOrNo1:
	yesorno
	iftrue .PowerYesOrNo2
	writetext ReturningToPowerMenu
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.PowerYesOrNo2
	writetext AreYouSurePowerText
	pause 30
	yesorno
	iftrue .ShutdownTime
	writetext ReturningToPowerMenu
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.ShutdownTime
	writetext SystemShuttingDown
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	setevent EVENT_ROCKET_COMPUTER_IS_OFF
	pause 15
	moveobject TEAMROCKETBASEB1F_SILVER, 13, 25
	appear TEAMROCKETBASEB1F_SILVER
	applymovement TEAMROCKETBASEB1F_SILVER, SilverWalksLeftToMachine
	opentext
	writetext WowItsShuttingDown
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	pause 15
	moveobject TEAMROCKETBASEB1F_STRAIGAR, 14, 20
	appear TEAMROCKETBASEB1F_STRAIGAR
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	playsound SFX_BALL_POOF
	waitsfx
	cry STRAIGAR
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	pause 15
	opentext
	writetext StraigarDestroyThisThing
	waitbutton
	closetext
;	pause 15
;	pause 5
	opentext
	writetext StraigarDestroyThisThing2
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_SILVER, UP
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB1F_STRAIGAR, StraigarJumpsUp
	pause 15
	opentext
	writetext StraigarDestroysTheThing
	waitbutton
	closetext
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	reloadmappart	
	waitsfx
	pause 15
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB1F_STRAIGAR, StraigarJumpsDown
	playsound SFX_MEGA_PUNCH
	earthquake 80
;	special FadeOutPalettes
	changeblock 13, 19, $4B ; damage
	changeblock 11, 13, $4D ; damage
	changeblock 19, 13, $4F ; damage
;	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
;	special FadeOutPalettes
	changeblock 11, 15, $4C ; damage
	changeblock 19, 15, $4E ; damage
	changeblock 15, 19, $49 ; damage
;	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
;	special FadeOutPalettes
	changeblock 17, 19, $4B ; damage
	changeblock 11, 19, $48 ; damage
	changeblock 19, 19, $4A ; damage
;	special FadeInPalettes
	reloadmappart
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	opentext
	writetext StraigarDestroyedTheThing
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	disappear TEAMROCKETBASEB1F_STRAIGAR
	pause 10
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	turnobject TEAMROCKETBASEB1F_SILVER, UP
	opentext
	writetext StraigarDestroyedTheThing2
	waitbutton
	closetext
	moveobject TEAMROCKETBASEB1F_GRUNTM8, 13, 25
	appear TEAMROCKETBASEB1F_GRUNTM8
	applymovement TEAMROCKETBASEB1F_GRUNTM8, TeamRocketGuyWalksUp
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_GRUNTM8, 20
	opentext
	writetext WhatHaveYouDoneText
	waitbutton
	closetext
	pause 15
	turnobject TEAMROCKETBASEB1F_GRUNTM8, DOWN
	opentext
	writetext WhatHaveYouDoneText2
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_GRUNTM8, TeamRocketGuyLeaves
	turnobject TEAMROCKETBASEB1F_SILVER, DOWN
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_SILVER, 20
	opentext
	writetext WaitGottaFindOut
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_SILVER, TeamRocketGuyLeaves
	disappear TEAMROCKETBASEB1F_GRUNTM8
	disappear TEAMROCKETBASEB1F_GRUNTM9
	disappear TEAMROCKETBASEB1F_GRUNTM10
	disappear TEAMROCKETBASEB1F_GRUNTM14
	disappear TEAMROCKETBASEB1F_GRUNTM15
	disappear TEAMROCKETBASEB1F_GRUNTM16
	disappear TEAMROCKETBASEB1F_SCIENTISTROSS
	disappear TEAMROCKETBASEB1F_SCIENTISTMITCH
	disappear TEAMROCKETBASEB1F_SILVER
	setevent EVENT_ROCKETS_IN_ROCKET_BASE
	setevent EVENT_ROCKET_MACHINE_DAMAGED
	jumpstd RadioTowerRocketsScript
	end

	
TeamRocketBaseB1FComputerConsoleMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataConsole
	db 1 ; default option

.MenuDataConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SOBRE EL SISTEMA@"
	db "ESTADO ACTUAL@"
	db "AJUSTAR ENERGÍA@"
	db "SALIR@"
	
TeamRocketBaseB1FComputerConsolePowerMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataPowerConsole
	db 1 ; default option

.MenuDataPowerConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MÁS ENERGÍA@"
	db "MENOS ENERGÍA@"
	db "APAGAR SISTEMA@"
	db "MENÚ ANTERIOR@"
	
TeamRocketBaseB1FComputerConsole_cancel:
	writetext TeamRocketBaseB1FComputerConsoleCancelText
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	end
	
TeamRocketGuyLeaves:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
SilverRunsOffFast:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
ImposterRunsOff:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
ImposterJumpsBack:
	turn_head LEFT
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end
	
SilverWalksToImposterComputer:
	step RIGHT
	step UP
	turn_head RIGHT
	step_end
	
SilverWalksLeftToMachine:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end
	
TeamRocketGuyWalksUp:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end
	
StraigarJumpsUp:
	jump_step UP
	step_end

StraigarJumpsDown:
	jump_step DOWN
	step_end
	
WaitGottaFindOut:
	text "<RIVAL>: ¡Espera!"
	line "¡¿Aún hay más?!"

	para "¡Vamos, <PLAYER>!"

	para "¡Voy a averiguar"
	line "qué significa"
	cont "esto!"

	para "¡Deberías venir tú"
	line "también!"

	para "¡Tenemos que en-"
	line "cargarnos de estos"
	para "tipos de una vez"
	line "por todas!"
	done

WhatHaveYouDoneText:
	text "EJECUTIVO: ¡No!"

	para "¡¿Qué has hecho?!"

	para "¡Has destruido"
	line "todo nuestro duro"
	cont "trabajo!"

	para "¡GIOVANNI se"
	line "enfurecerá cuando"
	cont "lo sepa!"

	para "¡Y sobre todo con"
	line "vosotros si llega"
	cont "a encontraros!"
	done

WhatHaveYouDoneText2:
	text "…"
	para "No creí que llega-"
	line "ríamos a esto."

	para "¡Pero el TEAM"
	line "ROCKET no se"
	cont "rendirá!"

	para "Tenemos un último"
	line "plan."

	para "¡Y lo llevaremos a"
	line "cabo!"
	done

StraigarDestroyedTheThing:
	text "<RIVAL>: ¡Buen"
	line "trabajo, STRAIGAR!"

	para "¡Así se hace!"
	done

StraigarDestroyedTheThing2:
	text "¡Ahora esta cosa"
	line "nunca volverá a"
	cont "dañar a los"
	cont "#MON!"
	done

StraigarDestroysTheThing:
	text "STRAIGAR:"
	line "¡Straiiii!"
	done

StraigarDestroyThisThing:
	text "¡Adelante,"
	line "STRAIGAR!"
	done

StraigarDestroyThisThing2:
	text "¡Ve y destruye"
	line "esta cosa con tu"
	cont "mejor ataque RAYO!"
	done

WowItsShuttingDown:
	text "<RIVAL>: ¡Uau,"
	line "<PLAYER>!"

	para "¡Has conseguido"
	line "apagarlo!"

	para "¿Sabes lo que he"
	line "averiguado?"
	para "¡Esta máquina iba"
	line "a controlar la"
	cont "mente de los"
	cont "#MON!"

	para "¡Eso es lo que el"
	line "TEAM ROCKET ha"
	para "estado tramando"
	line "todo este tiempo!"

	para "¡No puedo creer"
	line "que fueran a hacer"
	cont "eso!"

	para "¡Es terrible!"

	para "¡No creo que sea"
	line "suficiente con"
	cont "apagar esta cosa!"

	para "¡Hay que"
	line "destruirla!"
	done

HowDidYouKidsGetDownHereText:
	text "OAK IMPOSTOR:"
	line "¡Pero bueno, cómo"
	para "habéis llegado"
	line "hasta aquí!"

	para "¡Nadie sin autori-"
	line "zación debería"
	para "estar cerca de"
	line "esta máquina!"

	para "¡Es una antena muy"
	line "potente, y necesi-"
	cont "ta mucho tiempo"
	cont "para cargarse al"
	cont "máximo!"

	para "Supongo que no"
	line "importa, ¡porque"
	para "no podéis apagarla"
	line "si no sabéis la"
	cont "contraseña!"

	para "¡Y no tenéis mane-"
	line "ra de averiguar"
	cont "cuál es!"

	para "¡Le diré al jefe"
	line "que tenemos"
	cont "intrusos!"
	done

SilverHeyWaitWhatsGoingOnText:
	text "¡Oye, espera!"

	para "¡¿De qué va todo"
	line "esto?!"

	para "¡Exijo una"
	line "respuesta!"
	done

YoureNotOakCompScene:
	text "<RIVAL>: ¡Espera!"

	para "¡¿Qué está pasando"
	line "aquí?!"

	para "¡Tú no eres el"
	line "PROF. OAK!"
	done

SystemAlreadyOff:
	text "El sistema no hace"
	line "ruido y parece"
	cont "inoperativo…"
	done

SystemShuttingDown:
	text "SOLICITUD"
	line "CONFIRMADA"
	para "APAGANDO SISTEMA"
	para "---------"
	para "--------"
	para "-------"
	para "------"
	para "-----"
	para "----"
	para "---"
	para "--"
	para "-"
	done

AreYouSurePowerText:
	text "¿ESTÁ TOTALMENTE"
	line "SEGURO?"
	done

ReturningToPowerMenu:
	text "VOLVIENDO AL MENÚ"
	line "ANTERIOR…"
	done

PasswordEntered:
	text "<PLAYER> introdujo"
	line "la contraseña…"
	para "“VIVA GIOVANNI”"
	para "…"
	para "¡ADVERTENCIA! ¡EL"
	line "COMANDO QUE VA A"
	cont "EJECUTAR NO PUEDE"
	cont "DESHACERSE!"

	para "POR FAVOR,"
	line "CONFIRME DE NUEVO"
	cont "SU INTENCIÓN."

	para "¿QUIERE APAGAR"
	line "TODO EL SISTEMA?"
	done

ConsoleWhatDoPower:
	text "SELECCIONE LOS"
	line "AJUSTES DE LA"
	cont "ENERGÍA"
	done

ConsolePowerMenu1Text:
	text "¡LA ENERGÍA ESTÁ"
	line "AUMENTANDO!"
	done

ConsolePowerMenu2Text:
	text "ESTA FUNCIÓN NO"
	line "ESTÁ DISPONIBLE"
	done

ConsolePowerMenu3Text:
	text "SE REQUIERE UNA"
	line "CONTRASEÑA PARA"
	cont "ESTA FUNCIÓN"
	done

ConsoleWhatDo:
	text "MENÚ PRINCIPAL -"
	line "SELECCIONAR"
	cont "COMANDO"
	done

ConsoleMenu1Text:
	text "SISTEMA DE"
	line "CONTROL MENTAL"
	cont "VERSIÓN 1.03"
	done

ConsoleMenu2Text:
	text "CAPACIDAD ACTUAL:"
	line "74 POR CIENTO…"
	done

ConsoleMenu3Text:
	text "ACCEDIENDO AL MENÚ"
	line "DE AJUSTAR ENERGÍA"
	done

TeamRocketBaseB1FComputerConsoleCancelText:
	text "SALIENDO DE LA"
	line "CONSOLA…"
	done

TeamRocketBaseB1FComputerConsoleIntroText:
	text "ENCENDIENDO"
	line "CONSOLA DE CONTROL"
	cont "#MON DEL TEAM"
	cont "ROCKET"
	done

ScientistMitchSeenText:
	text "¡Nuestra señal de"
	line "control mental nos"
	para "permitirá dominar"
	line "el mundo!"
	done

ScientistMitchBeatenText:
	text "Tan pronto como"
	line "funcione por"
	cont "completo."
	done

ScientistMitchAfterBattleText:
	text "¡Los logros"
	line "científicos del"
	cont "TEAM ROCKET son"
	cont "increíbles!"
	done

ScientistRossSeenText:
	text "Te preguntarás"
	line "qué hacemos aquí."
	para "Nada en especial."

	para "¡Solo estamos a"
	line "punto de controlar"
	para "a todos los"
	line "#MON del mundo!"
	done

ScientistRossBeatenText:
	text "Los tuyos"
	line "claramente no"
	cont "están bajo nuestro"
	cont "control…"
	done

ScientistRossAfterBattleText:
	text "La antena aún no"
	line "está totalmente"
	cont "cargada."

	para "Necesita mucho"
	line "tiempo para car-"
	cont "garse al máximo."
	done

GruntM16SeenText:
	text "¿Tú otra vez?"
	para "Ya me estoy"
	line "cansando de veros."
	done

GruntM16BeatenText:
	text "También me estoy"
	line "cansando de"
	cont "perder."
	done

GruntM16AfterBattleText:
	text "Sobre todo, me"
	line "estoy cansando de"
	para "trabajar para el"
	line "TEAM ROCKET."
	done

GruntM15SeenText:
	text "Eres todo un"
	line "incordio, ¿lo"
	cont "sabías?"
	done

GruntM15BeatenText:
	text "¡Lo que digo, un"
	line "incordio!"
	done

GruntM15AfterBattleText:
	text "Estamos todos en"
	line "problemas desde"
	para "que habéis venido"
	line "y arrasado con"
	cont "nosotros."
	done

GruntM14SeenText:
	text "¡Estamos emociona-"
	line "dos con lo que"
	cont "está a punto de"
	cont "suceder!"

	para "¡No te metas en"
	line "medio, mocoso!"
	done

GruntM14BeatenText:
	text "¡Cómo te atreves!"
	done

GruntM14AfterBattleText:
	text "¡A ver si puedes"
	line "detenernos!"
	done

GruntM10SeenText:
	text "¡Te enseñaré lo"
	line "que pasa cuando te"
	cont "metes en mi"
	cont "camino!"
	done

GruntM10BeatenText:
	text "He perdido…"
	done

GruntM10AfterBattleText:
	text "Parece que pierdo"
	line "cuando te metes en"
	cont "mi camino…"
	done

GruntM9SeenText:
	text "¡Yo voy a ser"
	line "quien te detenga!"
	done

GruntM9BeatenText:
	text "¿Para qué digo"
	line "nada?"
	done

GruntM9AfterBattleText:
	text "Los SOLDADOS no"
	line "tenemos mucho"
	para "tiempo para criar"
	line "a nuestros"
	cont "#MON."
	done

GruntM8SeenText:
	text "¡No deberías estar"
	line "aquí!"

	para "¡Aquí solo entran"
	line "miembros del TEAM"
	cont "ROCKET!"
	done

GruntM8BeatenText:
	text "Aún así no"
	line "deberías estar…"
	done

GruntM8AfterBattleText:
	text "Sigue adelante,"
	line "supongo."

	para "No puedo hacer más"
	line "para detenerte."
	done

TeamRocketBaseB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2, 10, STAND_CITY_ROCKET_HOUSE, 3
	warp_event 15,  3, TEAM_ROCKET_BASE_B2F, 1
	warp_event 23, 15, TEAM_ROCKET_BASE_B2F, 2
	warp_event 26, 26, TEAM_ROCKET_BASE_B2F, 3


	db 3 ; coord events
	coord_event 10, 20, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 21, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 22, SCENE_DEFAULT, ImposterCompEncounter


	db 5 ; bg events
	bg_event 25, 16, BGEVENT_ITEM, TeamRocketBaseB1FHiddenFullHeal
	bg_event 12, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 13, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 16, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 17, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole

	db 12 ; object events
	object_event  7, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FTMPsychUp, EVENT_TEAM_ROCKET_BASE_B1F_TM_PSYCH_UP
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM8, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 19,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 2, TrainerGruntM9, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 25,  4, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 27, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 2, TrainerGruntM14, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event  2,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM15, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 25, 25, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM16, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event  6, 26, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerScientistRoss, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 26, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerScientistMitch, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 11, 21, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
	object_event 13, 20, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
	object_event -5, -5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
