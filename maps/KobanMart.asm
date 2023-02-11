	object_const_def ; object_event constants
	const KOBANMART_CLERK
	const KOBANMART_GRANNY
	const KOBANMART_COOLTRAINER_M

KobanMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_KOBAN
	closetext
	end

KobanMartGrannyScript:
	jumptextfaceplayer KobanMartGrannyText

KobanMartCooltrainerMScript:
	jumptextfaceplayer KobanMartCooltrainerMText

KobanMartGrannyText:
	text "Ojalá esta TIENDA"
	line "tuviera mejores"
	cont "artículos."

	para "Es difícil ir a"
	line "otra parte a"
	cont "comprar."
	done

KobanMartCooltrainerMText:
	text "Voy a comprar"
	line "algunas HÍPER-"
	para "POCIONES para"
	line "usarlas en mis"
	para "#MON cuando"
	line "esté entrenando"
	cont "en la MANDÍBULA"
	cont "DRAGÓN."
	done

KobanMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 2
	warp_event  5,  7, KOBAN_ISLAND, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanMartClerkScript, -1
	object_event  7,  6, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanMartGrannyScript, -1
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KobanMartCooltrainerMScript, -1
