	object_const_def ; object_event constants
	const ROUTE102WESTGATE2F_FISHER

Route102WestGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route102WestGate2FFisherScript:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .DocksOpen
	writetext DocksClosedText
	waitbutton
	closetext
	end
	
.DocksOpen
	writetext Route102WestGate2FFisherText
	waitbutton
	closetext
	end

Route102WestGate2FFisherText:
	text "El MUELLE PONIENTE"
	line "vuelve a tener"
	para "barcos que llevan"
	line "hasta CIUDAD"
	cont "TEKNOS."
	
	para "Deberías ir si"
	line "tienes la"
	cont "oportunidad."
	done
	
DocksClosedText:
	text "CIUDAD PONIENTE"
	line "tiene un MUELLE en"
	para "el que hay barcos"
	line "que van hasta"
	para "CIUDAD TEKNOS,"
	line "pero ahora mismo"
	cont "está cerrado."
	done
	
Route102WestGate2FSign:
	jumptext Route102WestGate2FSignText
	
Route102WestGate2FSignText:
	text "¡<PLAYER> miró por"
	line "los prismáticos!"
	
	para "¡Veo un pequeño"
	line "pueblo desierto al"
	cont "norte de aquí!"
	done

Route102WestGate2FSign2:
	jumptext Route102WestGate2FSign2Text
	
Route102WestGate2FSign2Text:
	text "¡<PLAYER> miró por"
	line "los prismáticos!"
	
	para "¿Esa es la TORRE"
	line "RADIO de CIUDAD"
	cont "PONIENTE?"
	done
	
Route102WestGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_102_WEST_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route102WestGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route102WestGate2FSign2

	db 1 ; object events
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102WestGate2FFisherScript, -1
	