	object_const_def ; object_event constants
	const KANTODEPTSTORE1F_RECEPTIONIST
	const KANTODEPTSTORE1F_GENTLEMAN
	const KANTODEPTSTORE1F_TEACHER

KantoDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore1FReceptionistScript:
	jumptextfaceplayer KantoDeptStore1FReceptionistText

KantoDeptStore1FGentlemanScript:
	jumptextfaceplayer KantoDeptStore1FGentlemanText

KantoDeptStore1FTeacherScript:
	jumptextfaceplayer KantoDeptStore1FTeacherText

KantoDeptStore1FDirectory:
	jumptext KantoDeptStore1FDirectoryText

KantoDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

KantoDeptStore1FReceptionistText:
	text "¡Hola! ¡Éste es el"
	line "CENTRO COMERCIAL"
	cont "de KANTO!"

	para "El directorio está"
	line "en la pared."
	done

KantoDeptStore1FGentlemanText:
	text "Este C. COMERCIAL"
	line "pertenece a la"
	para "misma cadena que"
	line "el de CIUDAD"
	cont "PONIENTE."

	para "Los dos fueron"
	line "renovados al"
	cont "mismo tiempo."
	done

KantoDeptStore1FTeacherText:
	text "Es la primera vez"
	line "que vengo."

	para "Es muy grande…"

	para "Me da miedo"
	line "perderme."
	done

KantoDeptStore1FDirectoryText:
	text "PB: INFORMACIÓN"

	para "P1: TIENDA DE"
	line "    ENTRENADORES"

	para "P2: TIENDA DE MT"

	para "P3: REGALOS"

	para "P4: FARMACIA"

	para "P5: AZOTEA"
	done

KantoDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  7, KANTO_REGION, 1
	warp_event 14,  7, KANTO_REGION, 13
	warp_event 15,  0, KANTO_DEPT_STORE_2F, 2
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore1FElevatorButton

	db 3 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FGentlemanScript, -1
	object_event  5,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FTeacherScript, -1
