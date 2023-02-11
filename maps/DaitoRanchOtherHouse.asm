	object_const_def ; object_event constants
	const DAITORANCHOTHERHOUSE_RANCHER

DaitoRanchOtherHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaitoRanchOtherHouseFarmhandScript:
	jumptextfaceplayer DaitoRanchOtherHouseFarmhandText
	
DaitoRanchOtherHouseFarmhandText:
	text "¡Hola!"

	para "¡Soy el encargado"
	line "de cuidar estos"
	cont "MILTANK!"

	para "¡Ser criador"
	line "#MON es de lo"
	para "mejor cuando"
	line "trabajas en un"
	para "lugar tan especta-"
	line "cular como este!"
	done

DaitoRanchOtherHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 6
	warp_event  5,  7, DAITO_RANCH, 6

	db 0 ; coord events

	db 0 ; bg events


	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DaitoRanchOtherHouseFarmhandScript, -1
