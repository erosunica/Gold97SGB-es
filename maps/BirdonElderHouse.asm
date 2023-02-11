	object_const_def ; object_event constants
	const BIRDONELDERHOUSE_POKEFAN_M

BirdonElderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BirdonElderHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue .GiveSurf
	writetext ElderSlowpokeProblem
	waitbutton
	closetext
	end
	

.GiveSurf
	checkevent EVENT_GOT_HM03_SURF
	iftrue .GotSurf
	writetext ElderTakeThisSurfText
	yesorno
	iffalse .Refused
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext ElderSurfDescriptionText
	waitbutton
	closetext
	end

.NoRoom:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.Refused:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.GotSurf:
	writetext ElderStandardText
	waitbutton
	closetext
	end

BirdonElderHouseBookshelf:
	jumpstd PictureBookshelfScript

ElderSlowpokeProblem:
	text "Estos viejos"
	line "huesos sienten que"
	para "hay problemas en"
	line "el POZO bajo el"
	cont "pueblo."
	
	para "Mi trabajo siempre"
	line "ha consistido en"
	para "mantener a los"
	line "SLOWPOKE a salvo."
	
	para "No sé si sigo"
	line "teniendo la fuerza"
	cont "para protegerlos."
	
	para "Espero que estén"
	line "bien…"
	done

ElderTakeThisSurfText:
	text "¡Ah!"

	para "¡Gracias por tu"
	line "ayuda!"

	para "Te estoy muy"
	line "agradecido."

	para "¡Y no dudo de que"
	line "los SLOWPOKE"
	cont "también!"

	para "¿Aceptarías que te"
	line "diese algo como"
	cont "compensación?"
	done
	
ElderNoSurf:
	text "¿Estás seguro?"
	line "Podría serte útil."
	done
	
ElderSurfDescriptionText:
	text "Esta MO le enseña"
	line "a tus #MON un"
	para "movimiento con el"
	line "que te podrán"
	para "llevar a través"
	line "del agua."
	
	para "No es que haya"
	line "mucha agua en este"
	para "pueblo, pero te"
	line "será de ayuda en"
	cont "otros lugares."
	done
	
ElderStandardText:
	text "Los SLOWPOKE del"
	line "POZO merecen ser"
	cont "protegidos."
	done


BirdonElderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BIRDON_TOWN, 4
	warp_event  4,  7, BIRDON_TOWN, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, BirdonElderHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonElderHousePokefanMScript, -1
