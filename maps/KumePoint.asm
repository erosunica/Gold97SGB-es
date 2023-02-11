	object_const_def ; object_event constants
	const URASOETRAIL_FISHER1
	const URASOETRAIL_FISHER2

KumePoint_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end
	
	
FisherMartinSeenText:
	text "La paciencia es la"
	line "clave para pescar"
	cont "y criar #MON."
	done

FisherMartinBeatenText:
	text "¡Guaaa!"
	done

FisherMartinAfterBattleText:
	text "No tengo paciencia"
	line "para la pesca…"
	done

FisherKyleSeenText:
	text "¡Te juro que este"
	line "es el mejor sitio"
	cont "para pescar!"
	done

FisherKyleBeatenText:
	text "¿Has pescado aquí"
	line "alguna vez?"
	done

FisherKyleAfterBattleText:
	text "Hay PESCADORES al"
	line "otro lado del"
	para "ESTRECHO que"
	line "afirman que ese"
	para "lado es un mejor"
	line "punto de pesca."

	para "¡Pero se"
	line "equivocan!"

	para "Sé que este lado"
	line "es mejor."
	done

KumePoint_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 10, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherMartin, -1
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherKyle, -1
