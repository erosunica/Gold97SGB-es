	object_const_def ; object_event constants
	const FROSTPOINTMART_CLERK
	const FROSTPOINTMART_POKEFAN_M
	const FROSTPOINTMART_ROCKER

FrostpointMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FrostpointMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ACTUAL_FROSTPOINT
	closetext
	end

FrostpointMartPokefanMScript:
	jumptextfaceplayer FrostpointMartPokefanMText

FrostpointMartRockerScript:
	jumptextfaceplayer FrostpointMartRockerText

FrostpointMartPokefanMText:
	text "Si vas a explorar"
	line "una cueva, debes"
	para "llevar siempre"
	line "REPELENTE."

	para "Aunque me gusta la"
	line "exploración, aún"
	para "no he recorrido"
	line "todas las cuevas."
	done

FrostpointMartRockerText:
	text "He oído hablar de"
	line "un artesano que"
	para "fabrica # BALLS"
	line "a medida en CIUDAD"
	cont "PAGOTA."

	para "Nunca he usado"
	line "ninguna."

	para "Seguro que funcio-"
	line "nan incluso mejor"
	para "que una ULTRA BALL"
	line "en algunas"
	cont "situaciones."
	done

FrostpointMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 3
	warp_event  5,  7, FROSTPOINT_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointMartClerkScript, -1
	object_event  8,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, FrostpointMartPokefanMScript, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointMartRockerScript, -1
