	object_const_def ; object_event constants
	const OAK2SLAB_OAK2
	const OAK2SLAB_POKE_BALL1
	const OAK2SLAB_POKE_BALL2
	const OAK2SLAB_POKE_BALL3
	const OAK2SLAB_BLUE
	const OAK2SLAB_SILVER

OakLabBackRoom_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetOak2 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_OAK2SLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_OAK2SLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_OAK2SLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_OAK2SLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_OAK2SLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveOak2Callback

.MeetOak2:
	priorityjump .WalkUpToOak2
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveOak2Callback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject OAK2SLAB_OAK2, 4, 2
.Skip:
	return

.WalkUpToOak2:
	applymovement PLAYER, OakLabBackRoom_WalkUpToOak2Movement
	pause 5

;	writetext Lab_GetDexText
;	playsound SFX_ITEM
;	waitsfx
;	setflag ENGINE_POKEDEX
;	pause 15
;	waitbutton
;	closetext

	opentext
	writetext Text_OakTakeAMon
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_SILVER, 15
	opentext
	writetext Text_SilverGetsOneToo
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_YesSilverGetsOneToo
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadRight
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadUp
	setscene SCENE_OAK2SLAB_CANT_LEAVE
	end

OakLabBackRoomSilverScript:
	jumptextfaceplayer Text_Best

OakLabBackRoomBlueScript:
	end

ProfOak2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue Oak2CheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2GiveTicketScript
Oak2CheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_OAK
	iftrue Oak2CheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue Oak2GiveMasterBallScript
Oak2CheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_OAK
	iftrue Oak2Script_CallYou
	checkevent EVENT_TOLD_OAK2_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse Oak2CheckTogepiEgg
	waitbutton
	closetext
	end

Oak2CheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2AfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue Oak2AfterRadioTowerInPerson
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue Oak2RocketsReturnedScript
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE ; why are we checking it again?
	iftrue OakHearsYouChallengeLeagueScript ; gonna make this about league challenge
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue Oak2DescribesMrPokemonScript
	writetext Oak2Text_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject OAK2SLAB_OAK2, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OakLabBackRoom_CantLeaveMovement
	end
	
OakHearsYouChallengeLeagueScript:
	writetext OakHearsYouChallengeLeagueText
	waitbutton
	closetext
	end
	
Oak2RocketsReturnedScript:
	writetext Oak2RocketsReturnedText
	waitbutton
	closetext
	end
	
Oak2AfterRadioTowerInPerson:
	writetext Oak2YoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
Oak2AfterLeagueInPerson:
	writetext Oak2AfterLeagueInPersonText
	waitbutton
	closetext
	end

CubburnPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
;	pokepic CUBBURN
;	cry CUBBURN
;	waitbutton
;	closepokepic
;;;
	setval CUBBURN
	special ShowPokedexEntry
;;;
	opentext
	writetext TakeCubburnText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL1
	setevent EVENT_GOT_CUBBURN_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CUBBURN, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CUBBURN, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
;	pokepic PALSSIO
;	cry PALSSIO
;	waitbutton
;	closepokepic
;;;
	setval PALSSIO
	special ShowPokedexEntry
;;;
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL2
	setevent EVENT_GOT_PALSSIO_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem PALSSIO, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke PALSSIO, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetChikoritaMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetChikorita
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
;	pokepic CHIKORITA
;	cry CHIKORITA
;	waitbutton
;	closepokepic
;;;
	setval CHIKORITA
	special ShowPokedexEntry
;;;
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetCubburnMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetCubburn
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

Oak2DirectionsScript:
	applymovement OAK2SLAB_OAK2, Oak2ToTable
	turnobject PLAYER, UP
	opentext
	
	
	writetext Oak2DirectionsTextNew
	waitbutton
	closetext
;	
;	opentext
;	writetext Oak2DirectionsText2
;	waitbutton
;	closetext
;	opentext
;	writetext Oak2DirectionsText3
;	waitbutton
;	closetext
	applymovement OAK2SLAB_OAK2, Oak2BackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CROWN_CITY
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	setscene SCENE_OAK2SLAB_NOTHING
	setmapscene SILENT_TOWN, SCENE_SILENT_NOTHING
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_POKEDEX
	setevent EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
	clearevent EVENT_DAISY_OAK_LAB_FRONT_ROOM
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	end

Oak2DescribesMrPokemonScript:
	writetext Oak2DescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtOak2PokeBallScript:
	opentext
	writetext Oak2PokeBallText
	waitbutton
	closetext
	end



Oak2GiveEverstoneScript:
	writetext Oak2GiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse Oak2Script_NoRoomForEverstone
	writetext Oak2GiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_OAK
	end

Oak2Script_CallYou:
	writetext Oak2Text_CallYou
	waitbutton
Oak2Script_NoRoomForEverstone:
	closetext
	end

Oak2GiveMasterBallScript:
	writetext Oak2GiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_OAK
	writetext Oak2GiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

Oak2GiveTicketScript:
	writetext Oak2GiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_OAK
	writetext Oak2GiveTicketText2
	waitbutton
	closetext
	end

Oak2JumpBackScript1:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpDownScript
	ifequal UP, Oak2JumpUpScript
	ifequal LEFT, Oak2JumpLeftScript
	ifequal RIGHT, Oak2JumpRightScript
	end

Oak2JumpBackScript2:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpUpScript
	ifequal UP, Oak2JumpDownScript
	ifequal LEFT, Oak2JumpRightScript
	ifequal RIGHT, Oak2JumpLeftScript
	end

Oak2JumpUpScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpUpMovement
	opentext
	end

Oak2JumpDownScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpDownMovement
	opentext
	end

Oak2JumpLeftScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpLeftMovement
	opentext
	end

Oak2JumpRightScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpRightMovement
	opentext
	end



OakLabBackRoomTrashcan:
	jumptext OakLabBackRoomTrashcanText


OakLabBackRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
Oak2BackFromTable:
	step LEFT
	step LEFT
	step DOWN
;	turn_head DOWN
	step_end

MoveHeadRight:
	turn_head RIGHT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
Oak2ToTable:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
SilverGetCruiseMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverGetCubburnMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverGetChikoritaMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

OakLabBackRoom_WalkUpToOak2Movement:
	step UP
	step UP
	slow_step UP
	step_end

OakLabBackRoom_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksRight2:
	step DOWN
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksLeft1:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

Oak2JumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

Oak2JumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

Oak2JumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

Oak2JumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement1:
	step UP
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCubburnMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterCruiseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
BlueGivesDex1:
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
BlueGivesDex2:
	step LEFT
	turn_head DOWN
	step_end
	
BlueGivesDex3:
	step UP
	step LEFT
	turn_head DOWN
	step_end
	
Text_YesSilverGetsOneToo:
	text "OAK: Por supuesto."

	para "¡Venga, escoged!"
	done
	
Text_SilverGetsOneToo:
	text "<RIVAL>: ¿Los dos"
	line "tendremos uno?"
	para "¡¿Yo también?!"
	done
	
Text_SilverTakeThisOne:
	text "¿Seguro que"
	line "quieres este,"
	cont "<PLAYER>?"
	para "¡Este #MON"
	line "parece mucho más"
	cont "fuerte!"
	done
	
Text_SilverGetCruise:
	text "¡<RIVAL> recibió"
	line "a PALSSIO!"
	done
	
Text_SilverGetCubburn:
	text "¡<RIVAL> recibió"
	line "a CUBBURN!"
	done
	
Text_SilverGetChikorita:
	text "¡<RIVAL> recibió"
	line "a CHIKORITA!"
	done
		
Text_Best:
	text "¡Mi #MON va a"
	line "ser el mejor!"
	done

Text_OakTakeAMon:
	text "OAK: ¡Prestad"
	line "atención!"

	para "Sobre la mesa hay"
	line "tres # BALLS."

	para "¡Elegid cada"
	line "uno al que será"
	cont "vuestro compañero"
	cont "#MON!"
	done
	
Text_RivalGenerous:
	text "<RIVAL>: <PLAYER>,"
	line "como soy muy majo,"
	para "¡te dejaré escoger"
	line "a ti primero!"
	done

Oak2Text_LetYourMonBattleIt:
	text "Si aparece un"
	line "#MON salvaje,"
	para "¡dejad que vuestro"
	line "#MON luche!"
	done

LabWhereGoingText:
	text "OAK: ¡Espera!"
	line "¿Dónde vas?"
	done

TakeCubburnText:
	text "OAK: ¿Quieres a"
	line "CUBBURN, el"
	cont "#MON de fuego?"
	done

TakeCruiseText:
	text "OAK: ¿Quieres a"
	line "PALSSIO, el"
	cont "#MON de agua?"
	done

TakeChikoritaText:
	text "OAK: ¿Quieres a"
	line "CHIKORITA, el"
	cont "#MON de planta?"
	done

DidntChooseStarterText:
	text "OAK: Piénsalo"
	line "con cuidado."

	para "Tu compañero es"
	line "importante."
	done

ChoseStarterText:
	text "OAK: ¡Yo también"
	line "creo que es un"
	cont "#MON genial!"
	done

ReceivedStarterText:
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done
	
Oak2DirectionsTextNew:
	text "OAK: Tu compañero"
	line "#MON será un"
	para "gran aliado"
	line "y amigo."
	
	para "Asegúrate de"
	line "tratarlo bien."
	
	para "Ahora, deberíais"
	line "ir a ver a AZUL."
	
	para "Tiene algo"
	line "importante que"
	cont "daros."
	done

Oak2DirectionsText2:
	text "notused"
	done

Oak2DescribesMrPokemonText:
	text "¡Es una"
	line "oportunidad única!"
	done

Oak2PokeBallText:
	text "Contiene un"
	line "#MON atrapado"
	cont "por el PROF. OAK."
	done

OakLabBackRoomHealingMachineText1:
	text "Me pregunto para"
	line "qué servirá…"
	done

OakLabBackRoomHealingMachineText2:
	text "¿Quieres curar"
	line "a tus #MON?"
	done

Oak2AfterTheftText1:
	text "OAK: <PLAYER>,"
	line "es terrible…"

	para "Oh, sí, ¿cuál"
	line "era el gran"
	para "descubrimiento"
	line "del SR.#MON?"
	done

Oak2AfterTheftText2:
	text "<PLAYER> le dio el"
	line "HUEVO MIST al"
	cont "PROF. OAK."
	done

Oak2AfterTheftText3:
	text "OAK: ¿Esto?"
	done

Oak2AfterTheftText4:
	text "Pero… ¿Es un HUEVO"
	line "de #MON?"

	para "Si lo es, ¡vaya"
	line "descubrimiento!"
	done

Oak2AfterTheftText5:
	text "OAK: ¿¡Qué!?"

	para "¿El PROF. OAK te"
	line "dio una #DEX?"

	para "<PLAYER>, ¿es"
	line "cierto? Es…"
	cont "¡Es increíble!"

	para "Él es capaz de ver"
	line "el potencial de un"
	cont "entrenador sólo"
	cont "con mirarle."

	para "Uau, <PLAYER>."
	line "Parece que tienes"
	para "lo necesario para"
	line "ser CAMPEÓN."

	para "Además, pareces"
	line "llevarte bien con"
	cont "los #MON."

	para "Deberías aceptar"
	line "el desafío de los"
	cont "GIMNASIOS #MON."

	para "El GIMNASIO más"
	line "cercano es el de"
	cont "CIUDAD PAGOTA."
	done

Oak2AfterTheftText6:
	text "<PLAYER>. El camino"
	line "hacia la gloria"
	cont "será largo."

	para "Antes de irte, no"
	line "olvides hablar con"
	cont "tu madre."
	done

Oak2StudyingEggText:
	text "OAK: ¡No te"
	line "rindas! Si sé algo"
	para "sobre ese HUEVO,"
	line "¡te llamaré!"
	done

Oak2AideHasEggText:
	text "OAK: Hola."
	line "¿<PLAYER>? ¿Has"
	para "visto a mi"
	line "ayudante?"

	para "Debería haberse"
	line "encontrado contigo"
	para "junto al HUEVO en"
	line "el CENTRO #MON"
	cont "de CIUDAD PAGOTA."

	para "Será que no lo has"
	line "visto. A ver si lo"
	cont "encuentras allí."
	done

OakHearsYouChallengeLeagueText:
	text "He oído que"
	line "afrontarás el"
	para "desafío de la LIGA"
	line "#MON de NIHON."

	para "¡Estupendo!"
	line "¡Estoy seguro que"
	cont "lograrás grandes"
	cont "cosas!"
	done

Oak2GiveEverstoneText1:
	text "¡Gracias, <PLAYER>,"
	line "por ayudarnos a"
	para "desenmarañar los"
	line "misterios #MON!"

	para "Quiero que lleves"
	line "esto como muestra"
	cont "de agradecimiento."
	done

AideText_AfterTheft:
	text "¡Gracias por"
	line "tu ayuda!"
	done

Oak2GiveMasterBallText1:
	text "¡Hola, <PLAYER>!"
	line "¡Gracias a ti, mi"
	para "investigación va"
	line "como la seda!"

	para "Toma esto como"
	line "muestra de mi"
	cont "agradecimiento."
	done

Oak2GiveMasterBallText2:
	text "¡La MASTER BALL"
	line "es la mejor!"

	para "¡Es la BALL"
	line "definitiva!"

	para "Captura cualquier"
	line "#MON sin"
	cont "fallar."

	para "Se le entrega a"
	line "los grandes"
	para "investigadores"
	line "#MON."

	para "¡Creo que tú harás"
	line "un mejor uso de"
	cont "ella que yo,"
	cont "<PLAYER>!"
	done

Oak2GiveTicketText1:
	text "OAK: ¡<PLAYER>,"
	line "aquí estás!"

	para "Te llamé porque"
	line "tengo algo"
	cont "para ti."

	para "¿Ves? Es un"
	line "TICKET BARCO."
	done

Oak2GiveTicketText2:
	text "Si te diriges al"
	line "MUELLE de CIUDAD"
	para "PONIENTE, puedes"
	line "coger un barco"
	cont "a las ISLAS"
	cont "PONIENTES."
	
	para "Hay un montón de"
	line "#MON raros que"
	para "no se encuentran"
	line "en tierra firme."
	
	para "Deberías dirigirte"
	line "allí cuando tengas"
	cont "oportunidad."
	done

AideText_GiveYouPotion:
	text "<PLAYER>, quiero"
	line "darte algo que"
	para "quizá te será"
	line "de ayuda."
	done

AideText_AlwaysBusy:
	text "¡Gracias por"
	line "tu ayuda!"
	done

AideText_TheftTestimony:
	text "¡Gracias por"
	line "tu ayuda!"
	done

OakLabBackRoomTravelTip1Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Primer consejo"
	line "para viajeros:"

	para "Pulsa START para"
	line "abrir el MENÚ."
	done

OakLabBackRoomTravelTip2Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Segundo consejo"
	line "para viajeros:"

	para "¡Registra tu"
	line "progreso con"
	cont "GUARDAR!"
	done

OakLabBackRoomTravelTip3Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Tercer consejo"
	line "para viajeros:"

	para "Abre tu MOCHILA y"
	line "pulsa SELECT para"
	cont "ordenar objetos."
	done

OakLabBackRoomTravelTip4Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Cuarto consejo"
	line "para viajeros:"

	para "Comprueba los"
	line "movimientos de tu"
	para "#MON. Pulsa el"
	line "botón A para"
	cont "cambiarlos de"
	cont "orden."
	done

OakLabBackRoomTrashcanText:
	text "El PROF. OAK tiró"
	line "aquí el envoltorio"
	cont "de su bocadillo…"
	done

Oak2GiveEverstoneText2:
	text "Eso es una"
	line "PIEDRAETERNA."

	para "Algunos #MON"
	line "evolucionan al"
	para "alcanzar ciertos"
	line "niveles."

	para "Si un #MON va"
	line "equipado con la"
	para "PIEDRAETERNA, no"
	line "evolucionará."

	para "Dásela al #MON"
	line "que no quieras"
	cont "que evolucione."
	done

Oak2Text_CallYou:
	text "OAK: <PLAYER>, te"
	line "llamaré si surge"
	cont "algo."
	done
	
Oak2RocketsReturnedText:
	text "Me temo que el"
	line "TEAM ROCKET trama"
	para "algo realmente"
	line "terrible…"
	done
	
Oak2YoureBasicallyAHeroText:
	text "¡Es increíble que"
	line "<RIVAL> y tú"
	para "hayáis vencido al"
	line "TEAM ROCKET!"

	para "¡Sois unos héroes"
	line "para los #MON!"

	para "¡Seguid así, e id"
	line "hacia el MT. FUJI!"
	done
	
Oak2AfterLeagueInPersonText:
	text "¡Enhorabuena por"
	line "superar la LIGA!"

	para "¡Es todo un logro!"

	para "Una vez más,"
	line "gracias por"
	para "ayudarme con mi"
	line "investigación."

	para "Si has llegado tan"
	line "lejos en tan poco"
	para "tiempo, ¡te espera"
	line "un gran futuro!"
	done

OakLabBackRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OAK_LAB_FRONT_ROOM, 3
	warp_event  4,  7, OAK_LAB_FRONT_ROOM, 3


	db 2 ; coord events
	coord_event  3,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
;	coord_event  3,  7, SCENE_OAK2SLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
;	coord_event  4,  7, SCENE_OAK2SLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  2,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  3,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  0,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  9,  3, BGEVENT_READ, OakLabBackRoomTrashcan

	db 6 ; object events
	object_event  4,  2, SPRITE_OAK2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ProfOak2Script, -1
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CubburnPokeBallScript, EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomBlueScript, EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomSilverScript, EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
