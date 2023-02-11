	object_const_def ; object_event constants
	const DAITO_APPLEFARMER


DaitoRanchOrchardHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AppleFarmerScript:
	jumptextfaceplayer AppleFarmerText
	
AppleFarmerText:
	text "¡Vaya, qué tenemos"
	line "aquí!"

	para "¡Un entrenador que"
	line "ha venido hasta"
	cont "mi HUERTO!"

	para "Me vendría bien tu"
	line "ayuda, chico."

	para "Mis MANZANAS se"
	line "venden como pan"
	para "caliente en el"
	line "continente por su"
	para "textura y sabor"
	line "refrescante."

	para "Pero venderlas"
	line "allí es más"
	para "complicado de lo"
	line "que parece."

	para "Si quieres"
	line "ayudarme, ¡podrías"
	para "llevarte unas"
	line "cuantas y"
	cont "venderlas por mí!"

	para "Puedes quedarte"
	line "con parte de los"
	cont "beneficios."

	para "No te preocupes,"
	line "¡yo ya obtengo mi"
	para "parte de la venta"
	line "en TIENDAS!"
	done


DaitoRanchOrchardHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 4
	warp_event  5,  7, DAITO_RANCH, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 7, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AppleFarmerScript, -1
