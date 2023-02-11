	object_const_def ; object_event constants
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	db 2 ; scene scripts
	scene_script .EnterHallOfFame ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.EnterHallOfFame:
	priorityjump .EnterHallOfFameScript
	end

.DummyScene:
	end

.EnterHallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_FINISHED
	pause 15
	writebyte HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_REMATCH_AVAILABLE_FALKNER
	setevent EVENT_REMATCH_AVAILABLE_BUGSY
	setevent EVENT_REMATCH_AVAILABLE_WHITNEY
	setevent EVENT_REMATCH_AVAILABLE_MORTY
	setevent EVENT_REMATCH_AVAILABLE_JASMINE
	setevent EVENT_REMATCH_AVAILABLE_PRYCE
	setevent EVENT_REMATCH_AVAILABLE_OKERA
	setevent EVENT_REMATCH_AVAILABLE_RED
	setevent EVENT_DECO_GOLD_TROPHY
	setevent EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "LANCE: Ha pasado"
	line "mucho tiempo desde"
	para "la última vez que"
	line "vine aquí."

	para "Aquí es donde"
	line "honramos a los"

	para "CAMPEONES de la"
	line "LIGA por toda la"
	cont "eternidad."

	para "Y a sus valerosos"
	line "#MON también."

	para "Hoy, hemos sido"
	line "testigos de la"
	para "aparición de un"
	line "nuevo CAMPEÓN de"
	para "la LIGA, alguien"
	line "que ha creído y"
	para "ha sabido confiar"
	line "en sus #MON."

	para "Alguien que ha"
	line "logrado el éxito"
	para "gracias a la"
	line "perseverancia y la"
	cont "determinación."

	para "¡Un nuevo triunfo"
	line "en la LIGA,"
	para "conseguido con"
	line "grandeza!"

	para "¡<PLAYER>, permite"
	line "que te registre"
	para "a ti y a tus"
	line "compañeros como"
	cont "CAMPEONES!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
