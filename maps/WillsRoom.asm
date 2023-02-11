	object_const_def ; object_event constants
	const WILLSROOM_WILL

WillsRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .WillsRoomDoors

.LockDoor:
	priorityjump .WillsDoorLocksBehindYou
	end

.DummyScene:
	end

.WillsRoomDoors:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.WillsDoorLocksBehindYou:
	applymovement PLAYER, WillsRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue WillScript_AfterBattle
	writetext WillScript_WillBeforeText
	waitbutton
	closetext
	winlosstext WillScript_WillBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue WillRematchTeam
	loadtrainer WILL, WILL1
ReturnToMainWill:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opentext
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	end


WillScript_AfterBattle:
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	end
	
WillRematchTeam:
	loadtrainer WILL, WILL2
	jump ReturnToMainWill
	end

WillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

WillScript_WillBeforeText:
	text "Bienvenido a la"
	line "LIGA de NIHON,"
	cont "<PLAYER>."

	para "Permíteme que me"
	line "presente. Me llamo"
	cont "MENTO."

	para "Me he entrenado"
	line "por todo el mundo"
	para "para mejorar a mis"
	line "#MON psíquicos."

	para "Y, por fin, me han"
	line "aceptado en el"
	cont "ALTO MANDO."

	para "¡Sólo puedo seguir"
	line "mejorando!"

	para "¡Es imposible que"
	line "pierda!"
	done

WillScript_WillBeatenText:
	text "No… Esto es…"
	line "increíble…"
	done

WillScript_WillDefeatText:
	text "Aunque haya perdi-"
	line "do, no cambiaré"
	cont "mis planes."

	para "¡Seguiré luchando"
	line "hasta ser el mejor"
	para "de todos los"
	line "entrenadores!"

	para "Y ahora <PLAYER>,"
	line "experimenta toda"
	para "la fuerza del"
	line "ALTO MANDO."
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, MOUNT_FUJI_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2
	warp_event  5, 17, MOUNT_FUJI_POKECENTER_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WillScript_Battle, -1
