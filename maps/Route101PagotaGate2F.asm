	object_const_def ; object_event constants
	const ROUTE106PAGOTAGATE2F_LASS
	const ROUTE106PAGOTAGATE2F_TWIN

Route101PagotaGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route101PagotaGate2FLassScript:
	jumptextfaceplayer Route101PagotaGate2FLassText

Route101PagotaGate2FLassText:
	text "¿Has oído hablar"
	line "de un hombre"
	cont "llamado CÉSAR?"
	para "Si CÉSAR muestra"
	line "interés en ti, es"
	cont "muy buena señal."
	done
	
Route101PagotaGate2FTwinScript:
	jumptextfaceplayer Route101PagotaGate2FTwinText

Route101PagotaGate2FTwinText:
	text "¿Eres un turista?"
	para "Qué pena si lo"
	line "eres… No puede"
	para "entrar cualquiera"
	line "en la TORRE GODAI."
	done
	
Route101PagotaGate2FSign:
	jumptext Route101PagotaGate2FSignText
	
Route101PagotaGate2FSignText:
	text "¡<PLAYER> miró por"
	line "los prismáticos!"

	para "¡Hala! ¡Se ve una"
	line "torre muy alta!"
	done

Route101PagotaGate2FSign2:
	jumptext Route101PagotaGate2FSign2Text
	
Route101PagotaGate2FSign2Text:
	text "¡<PLAYER> miró por"
	line "los prismáticos!"

	para "Un río se extiende"
	line "en el horizonte."
	done
	
Route101PagotaGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_101_PAGOTA_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route101PagotaGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route101PagotaGate2FSign2

	db 2 ; object events
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101PagotaGate2FLassScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101PagotaGate2FTwinScript, -1
	