

	object_const_def ; object_event constants
	const BOARDWALKGATE_OFFICER

BoardwalkGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks


.DummyScene:
	end



OfficerScript_GuardWithSnore:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue .GotSnore
	writetext OfficerText_FoundTM
	buttonsound
	verbosegiveitem TM_SLEEP_TALK
	iffalse .NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	closetext
	end

.GotSnore:
	writetext OfficerText_AvoidGrass
	waitbutton
.NoRoomForSnore:
	closetext
	end


OfficerText_FoundTM:
	text "(Ronquido…)"

	para "¿Eh?"

	para "Ah, sí, puedo"
	line "seguir atento"
	cont "mientras duermo,"
	cont "en serio."

	para "Con esto, tus"
	line "#MON podrán"
	cont "atacar mientras"
	cont "duermen."
	done

Text_ReceivedTM30:
	text "¡<PLAYER> recibió"
	line "MT35!"
	done

OfficerText_AvoidGrass:
	text "(Ronquido…)"

	para "Ten cuidado ahí"
	line "fuera…"
	done

BoardwalkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SANSKRIT_TOWN, 6
	warp_event  5,  0, SANSKRIT_TOWN, 7
	warp_event  4,  7, BOARDWALK, 3
	warp_event  5,  7, BOARDWALK, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, OfficerScript_GuardWithSnore, -1
