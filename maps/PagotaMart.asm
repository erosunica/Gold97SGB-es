	object_const_def ; object_event constants
	const PAGOTAMART_CLERK
	const PAGOTAMART_GRANNY
	const PAGOTAMART_COOLTRAINER_M

PagotaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PAGOTA
	closetext
	end

PagotaMartGrannyScript:
	jumptextfaceplayer PagotaMartGrannyText

PagotaMartCooltrainerMScript:
	jumptextfaceplayer PagotaMartCooltrainerMText

PagotaMartGrannyText:
	text "Cuando atrapas un"
	line "#MON, puede"
	cont "estar débil."

	para "Pero éste crecerá"
	line "y se hará más"
	cont "fuerte."

	para "Es importante"
	line "tratar a todos los"

	para "#MON con mucho"
	line "cariño."
	done

PagotaMartCooltrainerMText:
	text "Los #MON pueden"
	line "ir equipados con"
	para "objetos como"
	line "POCIÓN y ANTÍDOTO."

	para "Pero parece que"
	line "no saben usar los"
	para "objetos hechos"
	line "por el hombre."
	done

PagotaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, PAGOTA_CITY, 1
	warp_event  5,  7, PAGOTA_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaMartClerkScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaMartGrannyScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PagotaMartCooltrainerMScript, -1
