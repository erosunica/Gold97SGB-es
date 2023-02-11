	object_const_def ; object_event constants
	const KANTODEPTSTORE5F_CLERK1
	const KANTODEPTSTORE5F_CLERK2
	const KANTODEPTSTORE5F_GENTLEMAN
	const KANTODEPTSTORE5F_SAILOR
	const KANTODEPTSTORE5F_TEACHER

KantoDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore5FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_KANTO_5F_1
	closetext
	end

KantoDeptStore5FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_KANTO_5F_2
	closetext
	end

KantoDeptStore5FGentlemanScript:
	jumptextfaceplayer KantoDeptStore5FGentlemanText

KantoDeptStore5FSailorScript:
	jumptextfaceplayer KantoDeptStore5FSailorText

KantoDeptStore5FTeacherScript:
	faceplayer
	opentext
	writetext KantoDeptStore5FTeacherText
	cry SPEAROW
	waitbutton
	closetext
	end

KantoDeptStore5FDirectory:
	jumptext KantoDeptStore5FDirectoryText

KantoDeptStore5FElevatorButton:
	jumpstd ElevatorButtonScript

KantoDeptStore5FGentlemanText:
	text "Quiero comprar"
	line "objetos que"
	para "aumenten las"
	line "habilidades de"
	para "mis #MON. ¡Pero"
	line "no tengo dinero!"
	done

KantoDeptStore5FSailorText:
	text "Quiero MÁS PP,"
	line "para aumentar los"

	para "PP de los movi-"
	line "mientos. ¡Pero no"
	cont "se vende!"
	done

KantoDeptStore5FTeacherText:
	text "SPEAROW: ¡Speaar!"
	done

KantoDeptStore5FDirectoryText:
	text "P4: FARMACIA"
	done

KantoDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, KANTO_DEPT_STORE_4F, 1
	warp_event 15,  0, KANTO_DEPT_STORE_6F, 1
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore5FElevatorButton

	db 5 ; object events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FClerk1Script, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FClerk2Script, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FGentlemanScript, -1
	object_event  3,  4, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FSailorScript, -1
	object_event  2,  5, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FTeacherScript, -1
