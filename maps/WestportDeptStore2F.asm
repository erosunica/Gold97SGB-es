	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE2F_CLERK1
	const WESTPORTDEPTSTORE2F_CLERK2
	const WESTPORTDEPTSTORE2F_YOUNGSTER
	const WESTPORTDEPTSTORE2F_COOLTRAINER_F
	const WESTPORTDEPTSTORE2F_GENTLEMAN

WestportDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_2F_1
	closetext
	end

WestportDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_2F_2
	closetext
	end

WestportDeptStore2FYoungsterScript:
	jumptextfaceplayer WestportDeptStore2FYoungsterText

WestportDeptStore2FCooltrainerFScript:
	jumptextfaceplayer WestportDeptStore2FCooltrainerFText

WestportDeptStore2FGentlemanScript:
	jumptextfaceplayer WestportDeptStore2FGentlemanText

WestportDeptStore2FDirectory:
	jumptext WestportDeptStore2FDirectoryText

WestportDeptStore2FElevatorButton:
	jumpstd ElevatorButtonScript

WestportDeptStore2FUnusedText1:
; unused
	text "Vendemos objetos"
	line "para los #MON."

	para "Esto es un regalo."
	line "Dáselo a un"
	cont "#MON."
	done

WestportDeptStore2FUnusedText2:
; unused
	text "Si equipas a tus"
	line "#MON con"
	para "objetos, podrías"
	line "salir ganando en"
	cont "el combate."
	done

WestportDeptStore2FYoungsterText:
	text "El #GEAR puede"
	line "almacenar hasta"
	cont "diez números."

	para "Es difícil decidir"
	line "qué números debes"
	cont "guardar."
	done

WestportDeptStore2FCooltrainerFText:
	text "Un # MUÑECO es"
	line "muy útil si tienes"
	para "problemas para"
	line "huir de un #MON"
	cont "salvaje."
	done

WestportDeptStore2FGentlemanText:
	text "Este CENTRO"
	line "COMERCIAL indica"
	para "que CIUDAD"
	line "PONIENTE está"
	cont "creciendo"
	cont "rápidamente."

	para "Su gama de"
	line "productos no tiene"
	cont "rival."
	done

WestportDeptStore2FDirectoryText:
	text "Tu Compañero"
	line "de Viaje"

	para "P1 TIENDA DE"
	line "   ENTRENADORES"
	done

WestportDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, WESTPORT_DEPT_STORE_3F, 1
	warp_event 15,  0, WESTPORT_DEPT_STORE_1F, 3
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore2FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FClerk1Script, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FGentlemanScript, -1
