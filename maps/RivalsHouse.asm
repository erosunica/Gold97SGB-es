	object_const_def ; object constants
	const RIVALSHOUSE_RIVALS_MOM
	const RIVALSHOUSE_RIVALS_BROTHER

RivalsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalsMom:
	jumptextfaceplayer RivalsMomText

RivalsBrother:
	jumptextfaceplayer RivalsBrotherText


RivalsHouseBookshelf:
	jumpstd DifficultBookshelfScript

RivalsPCScript:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .RivalPCIsOff
	checkevent EVENT_READ_RIVAL_OAKS_EMAIL
	iftrue .RivalsPCJournal
	writetext AnEmailForRivalText
	yesorno
	iftrue .PlayerReadsRivalsMail
	writetext PlayerDoesntReadMailText
	waitbutton
	closetext
	end
	
.RivalPCIsOff
	writetext RivalPCIsOffText
	waitbutton
	closetext
	end

.RivalsPCJournal
	writetext RivalsPCJournalText
	waitbutton
	closetext
	end	

.PlayerReadsRivalsMail
	writetext RivalsEmailText
	waitbutton
	closetext
	setevent EVENT_READ_RIVAL_OAKS_EMAIL
	end
	
AnEmailForRivalText:
	text "¿Eh? ¡Parece que"
	line "hay un nuevo"
	para "correo dirigido a"
	line "<RIVAL>! ¿Leerlo?"
	done

PlayerDoesntReadMailText:
	text "No está bien leer"
	line "el correo de los"
	cont "demás…"
	done

RivalPCIsOffText:
	text "Parece que está"
	line "apagado…"
	done
	
RivalsEmailText:
	text "Espero que me"
	line "disculpes por"
	para "enviarte un correo"
	line "tan de repente,"
	para "pero hay algo que"
	line "me gustaría"
	cont "entregarte."
	
	para "¿Te importaría"
	line "venir a recogerlo?"
	
	para "OAK, investigador"
	line "#MON"
	done

RivalsPCJournalText:
	text "DIARIO #MON"
	line "PÁGINA DE INICIO"
	
	para "…"
	
	para "¡Se ha descubierto"
	line "un nuevo #MON!"
	
	para "Sus fuertes alas "
	line "son duras como el"
	para "acero. No sólo es"
	line "de tipo volador,"
	para "¡sino que también"
	line "forma parte del"
	cont "nuevo tipo acero!"
	
	para "Se están llevando"
	line "a cabo más"
	cont "investigaciones…"
	done

RivalsMomText:
	text "¡Hola, <PLAYER>!"

	para "Mi hijo no para"
	line "quieto."

	para "Cuando se le mete"
	line "algo en la cabeza,"
	para "va a por ello sin"
	line "que nada lo"
	cont "detenga."
	done

RivalsBrotherText:
	text "¡El otro día vi"
	line "un PIDGEY de un"
	cont "color raro!"
	done




RivalsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SILENT_TOWN, 4
	warp_event  5,  7, SILENT_TOWN, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  0, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  0,  1, BGEVENT_READ, RivalsPCScript

	db 2 ; object events
	object_event  5,  3, SPRITE_RIVALS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RivalsMom, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalsBrother, -1
