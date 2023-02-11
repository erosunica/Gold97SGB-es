	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE1F_RECEPTIONIST
	const WESTPORTDEPTSTORE1F_POKEFAN_F
	const WESTPORTDEPTSTORE1F_BUG_CATCHER
	const WESTPORTDEPTSTORE1F_GENTLEMAN

WestportDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore1FReceptionistScript:
	jumptextfaceplayer WestportDeptStore1FReceptionistText

WestportDeptStore1FGentlemanScript:
	jumptextfaceplayer WestportDeptStore1FGentlemanText

WestportDeptStore1FPokefanFScript:
	jumptextfaceplayer WestportDeptStore1FPokefanFText

WestportDeptStore1FBugCatcherScript:
	jumptextfaceplayer WestportDeptStore1FBugCatcherText

WestportDeptStore1FDirectory:
	jumptext WestportDeptStore1FDirectoryText

WestportDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

WestportDeptStore1FReceptionistText:
	text "Éste es el CENTRO"
	line "COMERCIAL de"
	cont "CIUDAD PONIENTE."
	done

WestportDeptStore1FGentlemanText:
	text "El CENTRO"
	line "COMERCIAL tiene"
	cont "buenos artículos."

	para "Pero algunos"
	line "objetos sólo están"
	para "disponibles en las"
	line "tiendas de los"
	
	para "vendedores del"
	line "sótano."
	done

WestportDeptStore1FPokefanFText:
	text "¡Me encanta ir de"
	line "compras!"
	done

WestportDeptStore1FBugCatcherText:
	text "Mamá es experta en"
	line "conseguir gangas."

	para "Siempre compra"
	line "cosas a precios"
	cont "más bajos."
	done

WestportDeptStore1FDirectoryText:
	text "PB INFORMACIÓN"

	para "P1 TIENDA DE"
	line "   ENTRENADORES"

	para "P2 ARTÍCULOS"
	line "   DE COMBATE"

	para "P3 BOTIQUÍN"

	para "P4 TIENDA DE MT"

	para "P5 PLAZA TRANQUILA"
	done

WestportDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  7, WESTPORT_CITY, 5
	warp_event 14,  7, WESTPORT_CITY, 9
	warp_event 15,  0, WESTPORT_DEPT_STORE_2F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore1FElevatorButton

	db 4 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FReceptionistScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FPokefanFScript, -1
	object_event  6,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FGentlemanScript, -1
