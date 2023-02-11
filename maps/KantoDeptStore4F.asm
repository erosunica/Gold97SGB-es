	object_const_def ; object_event constants
	const KANTODEPTSTORE4F_CLERK
	const KANTODEPTSTORE4F_CLERK2
	const KANTODEPTSTORE4F_SUPER_NERD
	const KANTODEPTSTORE4F_YOUNGSTER

KantoDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_KANTO_3F_2; yes 3f, this is stone salesman
	closetext
	end
	
KantoDeptStore4FClerkScript2:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_NEW; yes 3f, this is stone salesman
	closetext
	end

KantoDeptStore4FSuperNerdScript:
	jumptextfaceplayer KantoDeptStore4FSuperNerdText

KantoDeptStore4FYoungsterScript:
	jumptextfaceplayer KantoDeptStore4FYoungsterText

KantoDeptStore4FDirectory:
	jumptext KantoDeptStore4FDirectoryText

KantoDeptStore4FElevatorButton:
	jumpstd ElevatorButtonScript

KantoDeptStore4FSuperNerdText:
	text "He venido a"
	line "comprar un regalo"
	cont "para mi novia."
	done

KantoDeptStore4FYoungsterText:
	text "Esta planta tiene"
	line "piedras evolutivas"
	para "que son difíciles"
	line "de encontrar en"
	cont "cualquier otra"
	cont "parte."
	done

KantoDeptStore4FDirectoryText:
	text "¡Dilo con un"
	line "regalo!"

	para "P3: REGALOS"
	done

KantoDeptStore4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, KANTO_DEPT_STORE_5F, 1
	warp_event 15,  0, KANTO_DEPT_STORE_3F, 2
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore4FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore4FElevatorButton

	db 4 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore4FClerkScript, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore4FClerkScript2, -1
	object_event  7,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore4FSuperNerdScript, -1
	object_event  8,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDeptStore4FYoungsterScript, -1
