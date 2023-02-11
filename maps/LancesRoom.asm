	object_const_def ; object_event constants
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_LANCESROOM_APPROACH_LANCE

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LancesRoomDoors

.LockDoor:
	priorityjump .LancesDoorLocksBehindYou
	end

.DummyScene:
	end

.LancesRoomDoors:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	return

.LancesDoorLocksBehindYou:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	jump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue LanceRematchTeam
	loadtrainer CHAMPION, LANCE
ReturnToMainLance:
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_POKEMON_TALK, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	turnobject LANCESROOM_OAK, UP
	opentext
	writetext UnknownText_0x18121b
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x18134b
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x18137b
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksToHoFDoor
	opentext
	writetext UnknownText_0x1813c5
	pause 30
	closetext
	special FadeBlackQuickly
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end
	
LanceRematchTeam:
	loadtrainer CHAMPION, LANCE2
	jump ReturnToMainLance
	end

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_OakWalksToHoFDoor:
	step UP
	step UP
	step_end


LanceBattleIntroText:
	text "LANCE: Te estaba"
	line "esperando."

	para "¡<PLAYER>!"

	para "He oído hablar de"
	line "ti y de todo lo"
	cont "que has logrado."

	para "Era inevitable que"
	line "alguien con tus"
	para "habilidades"
	line "llegase en algún"
	cont "momento hasta mí."

	para "No necesitamos"
	line "más palabras."

	para "Debemos luchar"
	line "para determinar"
	para "quién es más"
	line "fuerte de los dos."

	para "Como el entrenador"
	line "más poderoso y el"
	para "CAMPEÓN de la LIGA"
	line "#MON…"

	para "¡Yo, LANCE, el"
	line "maestro dragón,"
	cont "acepto tu desafío!"
	done

LanceBattleWinText:
	text "Se acabó…"

	para "Pero es extraño."

	para "No estoy enfadado"
	line "por perder."

	para "De hecho, estoy"
	line "contento."

	para "Estoy contento por"
	line "haber presenciado"
	para "tu triunfo."
	line "¡No tienes igual!"
	done

LanceBattleAfterText:
	text "Fiuuu…"

	para "Eres realmente"
	line "fuerte, <PLAYER>."

	para "Tus #MON han"
	line "respondido a tu"
	cont "fuerte naturaleza."

	para "Debes continuar"
	line "fortaleciéndote"
	cont "con tus #MON."
	done

UnknownText_0x1811dd:
	text "ROSA: ¡Oh, no!"
	line "¡Todo ha acabado!"

	para "PROF. OAK, si no"
	line "fuera tan lento…"
	done

UnknownText_0x18121b:
	text "PROF. OAK: ¡Ah,"
	line "<PLAYER>!"

	para "¡Enhorabuena!"

	para "¡Tu conquista de"
	line "la LIGA ha sido"
	cont "fantástica!"

	para "Tu dedicación,"
	line "confianza y amor"
	para "por tus #MON lo"
	line "han conseguido."

	para "Tus #MON"
	line "también han estado"
	cont "increíbles."

	para "Han perseverado"
	line "porque han creído"
	para "en ti y en tu"
	line "entrenamiento."
	
	para "¡Cuando te pedí si"
	line "podías ayudarme"
	para "con mi investiga-"
	line "ción, nunca creí"
	cont "que lo harías"
	cont "tanto!"

	para "Y lo que es más,"
	line "¡has ganado la"
	cont "LIGA!"

	para "¡Has sido capaz de"
	line "lograr mucho!"

	para "¡Felicidades,"
	line "<PLAYER>!"
	done

UnknownText_0x18134b:
	text "LANCE: Sí,"
	line "deberías estar"
	cont "muy orgulloso."

	para "No solo de ti,"
	line "sino también de"
	cont "tus #MON."
	done

UnknownText_0x18137b:
	text "LANCE: <PLAYER>,"
	line "¿podrías"
	cont "acompañarme?"

	para "Es el momento de"
	line "que tus logros y"
	para "los de tus #MON"
	line "sean reconocidos."
	done

UnknownText_0x1813c5:
	text "OAK: ¡Felicidades"
	line "de nuevo!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 23, MISTYS_ROOM, 3
	warp_event  5, 23, MISTYS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	db 2 ; coord events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  4,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_PROFESSOR_OAK
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_PROFESSOR_OAK
