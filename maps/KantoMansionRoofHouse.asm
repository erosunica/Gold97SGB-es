	object_const_def ; object_event constants
	const KANTOMANSIONROOFHOUSE_PHARMACIST

KantoMansionRoofHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext KantoMansionRoofHousePharmacistIntroText
	buttonsound
	checktime NITE
	iftrue .Night
	writetext KantoMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext KantoMansionRoofHousePharmacistStoryText
	buttonsound
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext KantoMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

KantoMansionRoofHousePharmacistIntroText:
	text "Te contaré una"
	line "historia de miedo."
	done

KantoMansionRoofHousePharmacistNotNightText:
	text "Pero no te dará"
	line "tanto miedo si aún"
	cont "es de día."

	para "Vuelve cuando"
	line "anochezca, ¿vale?"
	done

KantoMansionRoofHousePharmacistStoryText:
	text "Érase una vez un"
	line "niño pequeño al"
	para "que le regalaron"
	line "una BICICLETA…"

	para "Quería probarla"
	line "enseguida…"

	para "Se lo estaba"
	line "pasando tan bien"
	para "que olvidó que"
	line "anochecía…"

	para "De vuelta a casa,"
	line "en plena noche,"

	para "¡la bici empezó"
	line "a frenarse!"

	para "¡Cada vez era más"
	line "difícil pedalear!"

	para "Y cuando dejó de"
	line "pedalear, ¡la bici"
	para "empezó a moverse"
	line "hacia atrás!"

	para "Era como si la"
	line "bici tuviera vida"
	para "y quisiera llevár-"
	line "selo con ella."

	para "…"

	para "<……>"

	para "(¡CHILLIDO!)"

	para "¡Y el niño siguió"
	line "subiendo!"

	para "¡Ba-dum!"
	line "¡Ba-dum, ba-dum!"

	para "Por haberme"
	line "escuchado, ¡aquí"
	cont "tienes esta MT03!"
	done

KantoMansionRoofHousePharmacistCurseText:
	text "MT03 es MALDICIÓN."

	para "Es un movimiento"
	line "terrible que redu-"
	cont "ce poco a poco los"

	para "PS de la víctima."
	done

KantoMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_MANSION_ROOF, 3
	warp_event  4,  7, KANTO_MANSION_ROOF, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoMansionRoofHousePharmacistScript, -1
