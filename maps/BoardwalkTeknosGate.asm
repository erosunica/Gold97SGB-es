	object_const_def ; object_event constants
	const BOARDWALKTEKNOSGATE_OFFICER
	const BOARDWALKTEKNOSGATE_LASS

BoardwalkTeknosGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoardwalkTeknosGateOfficer:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RocketsCleared
	writetext BoardwalkTeknosGateOfficerText
	waitbutton
	closetext
	end

.RocketsCleared:
	writetext BoardwalkTeknosGateOfficerRocketsClearedText
	waitbutton
	closetext
	end

BoardwalkTeknosGateLass:
	jumptextfaceplayer BoardwalkTeknosGateLassText

BoardwalkTeknosGateOfficerText:
	text "He oído que el"
	line "CASINO está metido"
	para "en algunos"
	line "negocios sucios."
	done

BoardwalkTeknosGateOfficerRocketsClearedText:
	text "He oído que el"
	line "CASINO ahora lo"
	cont "llevan otras"
	cont "personas."
	done

BoardwalkTeknosGateLassText:
	text "Tengo un amigo que"
	line "vive en PUEBLO"
	cont "SÁNSCRITO."

	para "Esta nueva"
	line "PASARELA hace"
	para "mucho más fácil"
	line "que vaya a verlo."
	done

BoardwalkTeknosGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, BOARDWALK, 1
	warp_event  5,  0, BOARDWALK, 2
	warp_event  4,  7, TEKNOS_CITY, 11
	warp_event  5,  7, TEKNOS_CITY, 12

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkTeknosGateOfficer, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkTeknosGateLass, -1
