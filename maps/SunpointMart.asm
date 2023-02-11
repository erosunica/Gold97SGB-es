	object_const_def ; object_event constants
	const SUNPOINTMART_CLERK
	const SUNPOINTMART_YOUNGSTER
	const SUNPOINTMART_SUPER_NERD

SunpointMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ACTUAL_SUNPOINT
	closetext
	end

SunpointMartYoungsterScript:
	jumptextfaceplayer SunpointMartYoungsterText

SunpointMartSuperNerdScript:
	jumptextfaceplayer SunpointMartSuperNerdText

SunpointMartYoungsterText:
	text "¡Hola! ¡Mira mi"
	line "GYARADOS!"

	para "Procede de un"
	line "MAGIKARP. No me"
	para "puedo creer lo"
	line "fuerte que es."
	done

SunpointMartSuperNerdText:
	text "¡Fiu!"

	para "¡Menudo calor hace"
	line "hoy!"

	para "He venido a la"
	line "TIENDA solo para"
	cont "estar más"
	cont "fresquito."
	done

SunpointMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 4
	warp_event  5,  7, SUNPOINT_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointMartClerkScript, -1
	object_event  4,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointMartYoungsterScript, -1
	object_event  9,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SunpointMartSuperNerdScript, -1
