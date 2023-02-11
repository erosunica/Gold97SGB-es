	object_const_def ; object_event constants
	const TEKNOSMART_CLERK
	const TEKNOSMART_SUPER_NERD
	const TEKNOSMART_GRANNY

TeknosMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TEKNOS
	closetext
	end

TeknosMartSuperNerdScript:
	jumptextfaceplayer TeknosMartSuperNerdText

TeknosMartGrannyScript:
	jumptextfaceplayer TeknosMartGrannyText

TeknosMartSuperNerdText:
	text "Mi EEVEE evolu-"
	line "cionó en FLAREON."

	para "Pero el EEVEE de"
	line "mi amigo evolu-"
	cont "cionó en UMBREON."
	
	para "EEVEE puede"
	line "convertirse en"
	para "distintos tipos"
	line "de #MON."
	done

TeknosMartGrannyText:
	text "Si usas REVIVIR,"
	line "el #MON"
	para "debilitado se"
	line "reanimará."
	done

TeknosMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 6
	warp_event  5,  7, TEKNOS_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosMartGrannyScript, -1
