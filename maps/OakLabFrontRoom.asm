	object_const_def ; object_event constants
	const OAK2ENTRANCE_AIDE
	const OAK2ENTRANCE_SILVER
	const OAK2ENTRANCE_BLUE
	const OAK2ENTRANCE_DAISY
	const OAK2ENTRANCE_DEX1
	const OAK2ENTRANCE_DEX2
	const OAK2ENTRANCE_OAK
	const OAK2ENTRANCE_SILVER2
	const OAK2ENTRANCE_BLUE2

OakLabFrontRoom_MapScripts:
	db 8 ; scene scripts
	scene_script .SceneOak2DoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneOakLabFrontRoomNothing ;does this work?
	scene_script .SceneOakLabFrontRoomPokedex ;seems to!
	scene_script .SceneOakLabFrontRoomDaisy
	scene_script .SceneOakLabFrontGoSeeOak
	scene_script .SceneOakLabFrontRoomBattle
	scene_script .SceneOakLabFrontRoomAfterTalkingToClerk

	db 0 ; callbacks
	
.SceneOak2DoorLocked:
	end
	
.SceneOakLabFrontRoomAfterTalkingToClerk
	end
	
.SceneHeadToTheBack:
	priorityjump .SceneHeadToTheBack2
	end
	
.SceneHeadToTheBack2
	applymovement PLAYER, PlayerLabDummyMovement
	follow OAK2ENTRANCE_BLUE, PLAYER
	applymovement OAK2ENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	turnobject OAK2ENTRANCE_SILVER2, UP
	opentext
	writetext Text_InBack
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2ENTRANCE_OAK, 15
	opentext
	writetext Oak2Text_Intro
	waitbutton
	closetext
	turnobject OAK2ENTRANCE_SILVER2, RIGHT
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	turnobject OAK2ENTRANCE_SILVER2, UP
	pause 15
	opentext
	writetext Text_OakSpeech
	yesorno
	iffalse .No
.Yes
	writetext Text_OakSpeechYes
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2ENTRANCE_SILVER2, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeechComeToBack
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_OAK, OakGoesIntoBackMovement
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_OAK
	applymovement OAK2ENTRANCE_SILVER2, SilverGoesIntoBackMovement
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_SILVER2
	setscene SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK
	setevent EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	applymovement PLAYER, PlayerGoesIntoBackMovement
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	warpfacing UP, OAK_LAB_BACK_ROOM, 4, 7
	end

.No
	writetext Text_OakSpeechNo
	yesorno
	iffalse .No
	jump .Yes

.SceneOakLabFrontRoomNothing:
	end

.SceneOakLabFrontRoomPokedex
	end

.SceneOakLabFrontRoomDaisy:
	end
	
.SceneOakLabFrontGoSeeOak:
	end

.SceneOakLabFrontRoomBattle:
	end
	

GetDexScript:
	applymovement PLAYER, Movement_OverToBlue
	playsound SFX_EXIT_BUILDING
	moveobject OAK2ENTRANCE_SILVER, 4, 0
	appear OAK2ENTRANCE_SILVER
	applymovement OAK2ENTRANCE_SILVER, Movement_SilverToBlue
	turnobject OAK2ENTRANCE_BLUE2, RIGHT
	opentext
	writetext BlueWillGiveDexText
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex1Movement
	pause 10
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex2Movement
	disappear OAK2ENTRANCE_DEX1
	disappear OAK2ENTRANCE_DEX2
	pause 20
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex3Movement
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex4Movement
	pause 10
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex5Movement
	pause 10
	opentext
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex6Movement
	playsound SFX_EXIT_BUILDING
	moveobject OAK2ENTRANCE_OAK, 4, 0
	appear OAK2ENTRANCE_OAK
	applymovement OAK2ENTRANCE_OAK, OakWalksOverToGivePhoneNumber
	pause 5
	turnobject PLAYER, RIGHT
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	opentext
	writetext Oak2DirectionsText1
	waitbutton
	addcellnum PHONE_OAK2
	opentext
	writetext GotOak2sNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	pause 5
	opentext
	writetext Oak2DirectionsText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_OAK, OakWalksBackToBackRoom
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_OAK
	setscene SCENE_OAK_LAB_FRONT_ROOM_BATTLE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end
	
BattleScript2:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse YouReloadedMapScriptRight
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouR1
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	turnobject PLAYER, LEFT
	jump BattleScriptMainBranch
	end

BattleScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse YouReloadedMapScriptLeft
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouL1
	turnobject OAK2ENTRANCE_SILVER, LEFT
	turnobject PLAYER, RIGHT
	jump BattleScriptMainBranch
	end
	
BattleScriptMainBranch:
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext TimeToBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Palssio
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_PALSSIO
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat


.Palssio:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Chikorita:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CUBBURN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement OAK2ENTRANCE_SILVER, SilverLeavesLab
	disappear OAK2ENTRANCE_SILVER
	setscene SCENE_OAK_LAB_FRONT_ROOM_DAISY
	special HealParty
	playmapmusic
	end
	
	
YouReloadedMapScriptRight:
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouR2
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	turnobject PLAYER, LEFT
	jump BattleScriptMainBranch
	end

	
YouReloadedMapScriptLeft:
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouL2
	turnobject OAK2ENTRANCE_SILVER, LEFT
	turnobject PLAYER, RIGHT
	jump BattleScriptMainBranch
	end


DoorLockedScript:
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DoorLockedScriptWeekends:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .DoorIsLockedWeekend
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .DoorIsLockedWeekend
	end

.DoorIsLockedWeekend
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DaisyStopsScript1:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp1
	jump .DaisySpeech

.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "TARJ. MAPA@"
	

DaisyStopsScript2:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp2
	jump .DaisySpeech
	
.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "TARJ. MAPA@"
	
DaisyScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end
	
DaisyScript_ReceiveThePotion:
	jumpstd ReceiveItemScript
	end
	
OakLabFrontRoomDexScript:
	opentext
	writetext WhatIsDexText
	waitbutton
	closetext
	end
	
OakLabFrontRoomBlueScript:
	checkevent EVENT_BLUE_ON_RAINBOW_ISLAND
	iftrue .BlueAfterBlueBattle
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted2
	waitbutton
	closetext
	end
	
.BlueAfterBlueBattle
	faceplayer
	opentext
	writetext Oak2Text_Accepted3
	waitbutton
	closetext
	end


	
OakLabFrontRoomDaisyScript:
	jumptextfaceplayer Text_RootingText

OakLabFrontRoomSilverScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .SilverLabScriptAfterMon
	writetext OakLabFrontRoomSilverText
	waitbutton
	closetext
	end
	
.SilverLabScriptAfterMon:
	writetext OakLabFrontRoomSilverText2
	waitbutton
	closetext
	end

OakLabFrontRoomAideScript:
	jumptextfaceplayer OakLabFrontRoomAideText
	
OakLabFrontRoomComputerScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .OakLabFrontRoomComputer2Script
	jumptext OakLabFrontRoomComputerText

.OakLabFrontRoomComputer2Script:
	jumptext OakLabFrontRoomComputer2Text
	
OakLabFrontRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
OakLabFrontRoomSign:
	jumptext OakLabFrontRoomSignText
	
GoSeeOakScript:
	turnobject OAK2ENTRANCE_BLUE, DOWN
	opentext
	writetext Text_GoSeeOak
	waitbutton
	closetext
	applymovement PLAYER, GoSeeOakOneUp
	end

OakWalksOverToGivePhoneNumber:
	step DOWN
	step DOWN
	step DOWN
	turn_head LEFT
	step_end
	
OakWalksBackToBackRoom:
	step UP
	step UP
	slow_step UP
	step_end

OakGoesIntoBackMovement:
	step UP
	slow_step UP
	step_end
	
SilverGoesIntoBackMovement:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end
	
PlayerGoesIntoBackMovement:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end
	
SilverConfrontsYouR1:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end

SilverConfrontsYouL1:
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
SilverConfrontsYouR2:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
SilverConfrontsYouL2:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
GoSeeOakOneUp:
	slow_step UP
	step_end
	
BlueGoesToGetDex1Movement:
	step LEFT
	step UP
	step_end
	
BlueGoesToGetDex2Movement:
	step RIGHT
	turn_head UP
	step_end
	
BlueGoesToGetDex3Movement:
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
BlueGoesToGetDex4Movement:
	step DOWN
	step RIGHT
	step_end
	
BlueGoesToGetDex5Movement:
	step UP
	turn_head RIGHT
	step_end
	
BlueGoesToGetDex6Movement:
	step LEFT
	turn_head RIGHT
	step_end
	

Oak2Text_Accepted:
	text "¡Gracias, <PLAYER>!"

	para "Aprecio que estés"
	line "ayudando a mi"
	cont "abuelo."
	done

Oak2Text_Accepted2:
	text "¿Cómo va todo"
	line "ahora que has"
	cont "ganado la LIGA?"
	para "Espero que bien."

	para "¿Has visto"
	line "últimamente a"
	cont "<RIVAL>?"
	para "Sé que está en"
	line "alguna parte,"
	para "entrenando con"
	line "sus #MON."

	para "Creo que ha"
	line "aprendido cómo"
	para "trabajar en equipo"
	line "con ellos."
	done
	
Oak2Text_Accepted3:
	text "¡Hola, <PLAYER>!"

	para "¡Gracias por ese"
	line "increíble combate!"

	para "¡Mis #MON y yo"
	line "nos hemos sentido"
	para "más emocionados"
	line "que nunca!"
	done
	
OakLabFrontRoomSilverText2:
	text "¡Mi #MON va a"
	line "ser el mejor de"
	cont "todos!"
	done
	
Oak2DirectionsText3:
	text "<PLAYER>."

	para "<RIVAL>."

	para "¡Cuento con"
	line "vosotros!"
	done

Oak2DirectionsText1:
	text "OAK: Con esa"
	line "#DEX, ¡estás a"
	para "punto de empezar"
	line "la aventura de"
	cont "tu vida!"
	
	para "La RUTA 101 y las"
	line "COLINAS SILENTES"
	para "son buenos sitios"
	line "para empezar a"
	cont "capturar #MON."
	
	para "Si quieres"
	line "# BALLS,"
	para "deberías dirigirte"
	line "a CIUDAD PAGOTA y"
	para "comprar algunas"
	line "en su TIENDA."
	
	para "Si tu #MON"
	line "resulta herido,"
	para "puedes curarlo en"
	line "el CENTRO #MON"
	para "detrás del"
	line "laboratorio."

	para "Úsalo siempre que"
	line "lo necesites."
	
	para "¡Estoy seguro que"
	line "lo harás genial!"

	para "Pero por si acaso,"
	line "aquí tienes mi"
	para "número de"
	line "teléfono."

	para "¡Llámame si"
	line "ocurre algo!"
	done
	

GotOak2sNumberText:
	text "<PLAYER> registró"
	line "el número de OAK."
	done
	
	
Lab_GetDexText:
	text "¡<PLAYER> recibió"
	line "una #DEX!"
	done


BlueText_Pokedex:
	text "AZUL: Quería"
	line "ser el mejor"
	para "entrenador #MON"
	line "del mundo."

	para "Pero cuando me"
	line "pasé de arrogante…"
	para "Hubo alguien que"
	line "me enseñó"
	cont "humildad."

	para "Me recuerdas a él,"
	line "<PLAYER>."

	para "¡Y tú, <RIVAL>,"
	line "me recuerdas a mí!"

	para "¡En fin!"

	para "¡Aquí tenéis"
	line "vuestras #DEX!"

	para "¡Guarda"
	line "automáticamente"
	para "datos de los"
	line "#MON que hayáis"
	cont "visto o capturado!"
	done


	
BlueWillGiveDexText:
	text "AZUL: ¡Anda, veo"
	line "que los dos tenéis"
	cont "un #MON!"

	para "¡Pues tengo algo"
	line "más para vosotros!"
	done

Text_GoSeeOak:
	text "AZUL: ¡Mi abuelo"
	line "os está esperando"
	cont "en la sala de"
	cont "atrás!"
	done

Text_Interesting:
	text "<RIVAL>: ¡Eh,"
	line "<PLAYER>!"

	para "¡Esto se pone"
	line "interesante!"
	done

Text_OakSpeechComeToBack:
	text "OAK: ¿Podéis"
	line "seguirme a la"
	cont "sala de atrás?"
	done
	
Text_OakSpeech:
	text "OAK: ¡Vaya boquita"
	line "tienes!"
	para "¡En efecto, soy"
	line "el PROF. OAK!"

	para "¿Os importaría"
	line "escucharme un"
	cont "momento?"
	done

Text_OakSpeechNo:
	text "OAK: Vaya. Quizás"
	line "no tengo tan buen"
	cont "ojo como pensaba…"
	
	para "¡No puede ser!"
	line "¡Mis ojos no se"
	cont "equivocan!"
	
	para "Me vais a"
	line "escuchar, ¿no?"
	done

Text_OakSpeechYes:
	text "Hace un año, en"
	line "KANTO, le confié a"
	para "dos chicos un"
	line "#MON y una"
	para "#DEX para"
	line "ayudarme con"
	cont "mi investigación."

	para "¡Acabaron haciendo"
	line "un trabajo"
	cont "impresionante!"

	para "¡Consiguieron"
	line "registrar datos de"
	para "150 especies de"
	line "#MON!"

	para "Sin embargo, ¡se"
	line "están encontrando"
	para "aún más especies"
	line "por todo NIHON!"

	para "Así que trasladé"
	line "mi laboratorio de"
	para "KANTO aquí, a"
	line "PUEBLO SILENTE,"
	para "para continuar con"
	line "mi investigación."

	para "¡Aunque mi nieto"
	line "AZUL y mis"
	para "AYUDANTES me están"
	line "echando una mano,"
	cont "no es suficiente!"

	para "¡<PLAYER>!"

	para "¡<RIVAL>!"

	para "¡Os ruego que me"
	line "ayudéis a seguir"
	cont "investigando a los"
	cont "#MON!"
	done

Oak2Text_Intro:
	text "OAK: ¡Buen"
	line "trabajo!"
	done	

Text_OakIsOld:
	text "<RIVAL>: No me"
	line "puedo creer que"
	para "este vejestorio"
	line "sea el PROF. OAK…"
	done
	
WhatIsDexText:
	text "¿Qué es esto?"
	para "¿Algún tipo de"
	line "enciclopedia?"
	done
	
OakLabFrontRoomSignText:
	text "¡Pulsa START para"
	line "abrir el MENÚ!"
	done	
	
OakLabFrontRoomComputerText:
	text "¡Hay un correo a"
	line "la vista!"

	para "…"
	
	para "¡PROF. OAK! ¡Todo"
	line "el mundo está muy"
	para "preocupado por su"
	line "paradero!"
	
	para "En cuanto al"
	line "#MON que me"
	para "pidió que buscara,"
	line "todavía no he"
	para "encontrado ni una"
	line "sola pista… y"
	cont "mucho menos su"
	cont "escondite."
	
	para "Supongo que era"
	line "de esperar…"
	para "Al fin y al cabo,"
	line "está en lo alto"
	cont "del cielo."
	
	para "Atentamente,"
	line "Su AYUDANTE"
	done

OakLabFrontRoomComputer2Text:
	text "Es un informe"
	line "sobre los hábitats"
	cont "de los #MON."
	done

Text_RootingText:
	text "¡Estaré"
	line "animándote!"
	done
	
DaisySpeechText:
	text "El chico que te ha"
	line "traído hasta aquí"
	para "es mi hermano"
	line "pequeño."

	para "En otras palabras…"

	para "¡Soy la nieta del"
	line "PROF. OAK!"

	para "¡El abuelo es un"
	line "gran investigador!"

	para "Aunque… a veces"
	line "puede ser"
	cont "olvidadizo."

	para "¡Se suponía que"
	line "tenía que darte"
	cont "esto!"
	done

DaisySpeechText2:
	text "¡Una POCIÓN puede"
	line "restaurar la"
	para "salud de tu"
	line "#MON si no"
	para "estás en un CENTRO"
	line "#MON!"

	para "También te he"
	line "puesto unas"
	para "cuantas # BALLS"
	line "para ayudarte."
	done

DaisySpeechText3:
	text "Pero como dijo mi"
	line "abuelo, si"
	para "necesitas más"
	line "# BALLS puedes"
	para "comprarlas en"
	line "cualquier TIENDA."

	para "Además, no puedes"
	line "dejar a tu familia"
	para "preocupada, ¡así"
	line "que antes de"
	para "partir, no olvides"
	line "despedirte de tu"
	cont "MAMÁ y de KEN!"

	para "¡Estaré"
	line "animándote!"
	done

SilverEntranceWinText:
	text "¡Uau! ¡Creí que mi"
	line "#MON sería el"
	cont "mejor!"
	done

EntranceRivalText_YouLost:
	text "¡<PLAYER>! ¡No"
	line "puedo esperar a"
	para "enseñarle al mundo"
	line "lo genial que es"
	cont "mi #MON!"

	para "¡Ya nos veremos!"
	done

SilverEntranceLossText:
	text "¡Sí! ¡Cómo mola"
	line "mi #MON!"
	done

EntranceRivalText_YouWon:
	text "¡<PLAYER>! ¡No"
	line "puedo esperar a"
	para "enseñarle al mundo"
	line "lo genial que es"
	cont "mi #MON!"

	para "¡Ya nos veremos!"
	done
	
TimeToBattle:
	text "¡<PLAYER>!"

	para "¿A dónde vas tan"
	line "deprisa?"
	para "¡OAK nos ha dado"
	line "estos #MON, así"
	para "que vamos a"
	line "combatir!"

	para "¡No me voy a"
	line "contener!"
	done
	
Text_InBack:
	text "¡Abuelo! ¡Mira a"
	line "quién te traigo!"
	done

OakLabFrontRoomAideText:
	text "Soy uno de los"
	line "AYUDANTES del"
	cont "PROF. OAK."

	para "Nos tenemos gran"
	line "respeto el uno"
	cont "al otro."
	done
	
DoorLockedText:
	text "La puerta parece"
	line "estar cerrada…"
	done
	
OakLabFrontRoomSilverText:
	text "¡Hola, <PLAYER>!"
	
	para "¡Parece que el"
	line "PROF. OAK no está!"
	
	para "¡A saber cuándo"
	line "pensaba que"
	cont "llegaríamos!"	
	done
	
DaisyLeftMovement:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DaisyWalksUp1:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
DaisyWalksUp2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverLeavesLab:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_SilverToBlue:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	slow_step LEFT
	step_end
	
Movement_OverToBlue:
	step DOWN
	step DOWN
	step LEFT
	slow_step LEFT
	step_end	
	
PlayerLabDummyMovement:
	step_end

DoorLocked_Movement:
	turn_head DOWN
	slow_step DOWN
	step_end

Movement_BlueToBack:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	slow_step UP
	slow_step RIGHT
	turn_head UP
	step_end

Movement_BlueThroughDoor:
	step UP
	step_end
	
Movement_PlayerThroughDoor:
	step UP
	step UP
	step_end

OakLabFrontRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, OAK_LAB_BACK_ROOM, 1


	db 9 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  3,  7, SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK, GoSeeOakScript
	coord_event  4,  7, SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK, GoSeeOakScript
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_POKEDEX, GetDexScript
	coord_event  3, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript2
	coord_event  3,  8, SCENE_OAK_LAB_FRONT_ROOM_BATTLE, BattleScript
	coord_event  4,  8, SCENE_OAK_LAB_FRONT_ROOM_BATTLE, BattleScript2
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK, DoorLockedScriptWeekends

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, OakLabFrontRoomComputerScript
	bg_event  0,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  0, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  0, BGEVENT_READ, OakLabFrontRoomSign


	db 9 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomAideScript, EVENT_OAK2S_AIDE_IN_LAB
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomSilverScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	object_event  4, 14, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomBlueScript, EVENT_BLUE_OAK_LAB_FRONT_ROOM
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDaisyScript, EVENT_DAISY_OAK_LAB_FRONT_ROOM
	object_event  1,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_LAB_DEX_TABLE
	object_event  0,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_LAB_DEX_TABLE
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_OAK_LAB_FRONT_ROOM
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomSilverScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM_2
	object_event  1,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomBlueScript, EVENT_BLUE_OAK_LAB_FRONT_ROOM_2

	
