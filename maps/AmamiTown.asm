	object_const_def ; object_event constants
	const AMAMI_TOWN_BUG_CATCHER
	const AMAMI_TOWN_LASS
	const AMAMI_GRAMPS

AmamiTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_AMAMI
	return

AmamiTownPokecenterSign:
	jumpstd PokecenterSignScript

AmamiTownMartSign:
	jumpstd MartSignScript
	
AmamiPoolSign:
	jumptext AmamiPoolText
	
AmamiTownSign:
	jumptext AmamiTownSignText
	
AmamiTownBugCatcherScript:
	jumptextfaceplayer AmamiTownBugCatcherText
	
AmamiTownLassScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iffalse .FirstTimeLass
	writetext AmamiTownLassText2
	waitbutton
	closetext
	end
	
.FirstTimeLass
	writetext AmamiTownLassText1
	waitbutton
	closetext
	end
	
AmamiTownGrampsScript:
	jumptextfaceplayer AmamiTownGrampsText
	
AmamiTownGrampsText:
	text "He vivido toda mi"
	line "vida en esta isla."

	para "No lo hubiese"
	line "querido de otra"
	cont "manera."
	done

AmamiTownLassText1:
	text "Es la primera vez"
	line "que vienes a"
	cont "PUEBLO AMAMI,"
	cont "¿verdad?"

	para "¡Bienvenido!"
	done

AmamiTownLassText2:
	text "Viene mucha gente"
	line "de visita."

	para "El turismo es uno"
	line "de nuestros"
	cont "sectores más"
	cont "importantes."
	done

AmamiTownBugCatcherText:
	text "Nunca he ido al"
	line "continente."

	para "¡Un día, quiero"
	line "subir a un FERRY!"
	done

AmamiTownSignText:
	text "PUEBLO AMAMI"

	para "¡Un destino para"
	line "todo aventurero!"
	done

AmamiPoolText:
	text "PISCINA"
	line "COMUNITARIA DE"
	cont "PUEBLO AMAMI"
	done
	
AmamiTown_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  4,  2, AMAMI_PORT_PASSAGE, 1
	warp_event  4,  3, AMAMI_PORT_PASSAGE, 2
	warp_event 17,  4, AMAMI_POKECENTER_1F, 1
	warp_event 33,  9, AMAMI_TATSUGO_PATH_GATE, 1
	warp_event 24,  5, AMAMI_PUBLIC_POOL, 1
	warp_event 25,  5, AMAMI_PUBLIC_POOL, 2
	warp_event 23, 10, AMAMI_MART, 1
	warp_event 31,  1, AMAMI_TOWN_SUPER_ROD_HOUSE, 1
	warp_event 31, 13, AMAMI_TOWN_HOUSE_2, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 12,  4, BGEVENT_READ, AmamiTownSign
	bg_event 28,  5, BGEVENT_READ, AmamiPoolSign
	bg_event 18,  4, BGEVENT_READ, AmamiTownPokecenterSign
	bg_event 24, 10, BGEVENT_READ, AmamiTownMartSign

	db 3 ; object events
	object_event  8,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AmamiTownBugCatcherScript, -1
	object_event 15, 11, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiTownLassScript, -1
	object_event 27,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiTownGrampsScript, -1
