	object_const_def ; object_event constants
	const KOGASROOM_KOGA

KogasRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KogasRoomDoors

.LockDoor:
	priorityjump .KogasDoorLocksBehindYou
	end

.DummyScene:
	end

.KogasRoomDoors:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.KogasDoorLocksBehindYou:
	applymovement PLAYER, KogasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaScript_AfterBattle
	writetext KogaScript_KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_KogaBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue KogaRematchTeam
	loadtrainer KOGA, KOGA1
ReturnToMainKoga:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

KogaScript_AfterBattle:
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	end
	
KogaRematchTeam:
	loadtrainer KOGA, KOGA2
	jump ReturnToMainKoga
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaScript_KogaBeforeText:
	text "¡Jajaja!"

	para "Soy KOGA, del ALTO"
	line "MANDO. Vivo en las"
	para "sombras, como un"
	line "ninja."

	para "¡Te confundiré y"
	line "te destruiré con"
	cont "mi estilo!"

	para "Confusión, sueño,"
	line "veneno…"

	para "¡Prepárate para"
	line "ser víctima de"
	cont "mis técnicas!"

	para "¡Jajaja!"

	para "Los #MON no"
	line "utilizan sólo"
	para "la fuerza bruta."
	line "¡Ya lo verás!"
	done

KogaScript_KogaBeatenText:
	text "¡Ah! ¡Has demos-"
	line "trado tu valor!"
	done

KogaScript_KogaDefeatText:
	text "He probado contigo"
	line "todo lo que sé."

	para "Pero he fallado."

	para "Debería entrenarme"
	line "bastante más."

	para "¡Entra en la"
	line "siguiente sala"
	para "y demuestra tus"
	line "habilidades!"
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, AGATHAS_ROOM, 1
	warp_event  5,  2, AGATHAS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KogaScript_Battle, -1
