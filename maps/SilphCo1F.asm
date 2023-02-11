	object_const_def ; object_event constants
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER

SilphCo1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	buttonsound
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoReceptionistText:
	text "Ésta es la"
	line "OFICINA CENTRAL"
	cont "de SILPH S.A."
	done

SilphCoOfficerText:
	text "Al piso de arriba"
	line "sólo pueden subir"
	cont "los empleados."

	para "Pero como has"
	line "venido desde tan"
	para "lejos, toma este"
	line "pequeño recuerdo."
	done

SilphCoOfficerText_GotUpGrade:
	text "Es lo último de"
	line "SILPH S.A. Aún"
	para "no se encuentra"
	line "a la venta."
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 15, KANTO_REGION, 11
	warp_event  7, 15, KANTO_REGION, 12

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 22,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
