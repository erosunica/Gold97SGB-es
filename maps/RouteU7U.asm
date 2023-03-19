RouteU7U_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtFujiInteriorLowerEntranceSign:
	jumptext MtFujiInteriorLowerEntranceSignText

MtFujiInteriorLowerEntranceSignText:
	text "LIGA #MON"

	para "ENTRADA A LA"
	line "CALLE VICTORIA"
	done

RouteU7U_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  5, CROWN_PATH_GATE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 15,  7, BGEVENT_READ, MtFujiInteriorLowerEntranceSign

	db 0 ; object events
