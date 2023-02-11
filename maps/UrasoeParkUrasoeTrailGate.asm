	object_const_def ; object_event constants
	const URASOEPARKURASOETRAILGATE_OFFICER

UrasoeParkUrasoeTrailGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UrasoeParkUrasoeTrailGateOfficerScript:
	jumptextfaceplayer UrasoeParkUrasoeTrailGateOfficerText

UrasoeParkUrasoeTrailGateOfficerText:
	text "¿Has estado en"
	line "CIUDAD PONIENTE?"

	para "Hay una TORRE"
	line "RADIO muy alta."
	done

UrasoeParkUrasoeTrailGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, URASOE_PARK, 3
	warp_event  5,  0, URASOE_PARK, 4
	warp_event  4,  7, URASOE_TRAIL, 1
	warp_event  5,  7, URASOE_TRAIL, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UrasoeParkUrasoeTrailGateOfficerScript, -1
