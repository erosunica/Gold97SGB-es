	object_const_def ; object_event constants
	const ISENSTRAIT_SWIMMER_GIRL1
	const ISENSTRAIT_SWIMMER_GIRL2
	const ISENSTRAIT_SWIMMER_GUY

IsenStrait_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .IsenStraitClearRocks
	
.IsenStraitClearRocks:
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .Done20
	changeblock  51, 5, $63 ; rock
.Done20:
	return


TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

FrostpointGymSign:
	jumptext FrostpointGymSignText

SwimmerfNicoleSeenText:
	text "Me siento más"
	line "ligera en el agua."
	done

SwimmerfNicoleBeatenText:
	text "¡Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "La natación forta-"
	line "lece todo tu cuer-"
	cont "po. ¡Es muy sana!"
	done

SwimmerfLoriSeenText:
	text "¡Vaya colección de"
	line "MEDALLAS de"
	para "GIMNASIO!"
	line "¡Luchemos!"
	done

SwimmerfLoriBeatenText:
	text "¡No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF ya no es el"
	line "único movimiento"
	para "que se utiliza en"
	line "el agua."
	done

SwimmermCameronSeenText:
	text "Supongo que es"
	line "imposible ir"
	para "nadando hasta"
	line "tierra firme."
	done

SwimmermCameronBeatenText:
	text "¡Aiyaa!"
	done

SwimmermCameronAfterBattleText:
	text "Además de nadar"
	line "en el mar, puedo"
	para "nadar en estanques"
	line "y ríos."
	done

FrostpointGymSignText:
	text "CENTRO DE"
	line "INVESTIGACIÓN"
	cont "#MON"

	para "Eso pone en el"
	line "cartel…"
	para "Con la palabra"
	line "“CONDENADO”"
	cont "escrita por"
	cont "encima…"
	done

IsenStrait_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 53, 11, SEASIDE_PATH_ISEN_STRAIT_GATE, 1
	warp_event 18,  3, ISEN_LAB_FRONT, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, FrostpointGymSign

	db 3 ; object events
	object_event 14, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 24, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 36, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
