	object_const_def ; object_event constants
	const SANSKRITMART_CLERK
	const SANSKRITMART_LASS
	const SANSKRITMART_COOLTRAINER_M

SanskritMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ACTUAL_SANSKRIT
	closetext
	end

SanskritMartLassScript:
	jumptextfaceplayer SanskritMartLassText

SanskritMartCooltrainerMScript:
	jumptextfaceplayer SanskritMartCooltrainerMText

SanskritMartLassText:
	text "No tengo mucho"
	line "interés en las"
	cont "RUINAS."

	para "Nunca he tenido"
	line "mucho que hacer"
	cont "por aquí."

	para "¡Hasta que inaugu-"
	line "raron la nueva"
	para "PASARELA y el"
	line "CASINO MARÍTIMO"
	cont "al sur del pueblo!"

	para "Deberías pasarte"
	line "por ahí si aún no"
	cont "lo has hecho."
	done

SanskritMartCooltrainerMText:
	text "¿Has estado en"
	line "CIUDAD CALORINA?"
	
	para "Es un importante"
	line "punto de envío de"
	para "artículos que"
	line "vienen de países"
	cont "al norte de NIHON."
	done

SanskritMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 1
	warp_event  5,  7, SANSKRIT_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartClerkScript, -1
	object_event  9,  5, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartLassScript, -1
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartCooltrainerMScript, -1
