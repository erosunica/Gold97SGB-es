	object_const_def ; object_event constants
	const RYUKYU_ARBORETUM_BULBASAUR_LADY
	const RYUKYU_ARBORETUM_ODDISH
	const RYUKYU_ARBORETUM_BULBASAUR
	const RYUKYU_ARBORETUM_PARAS
	const RYUKYU_ARBORETUM_YOUNGSTER
RyukyuArboretum_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RyukyuArboretumHouseCooltrainer:
	faceplayer
	opentext
	checkevent EVENT_GOT_BULBASAUR_FROM_ARBORETUM
	iftrue .AlreadyGotBulbasaur
	writetext ILoveBulbasaurText
	yesorno
	iffalse .DontTakeBulbasaur
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullBulbasaur
	writetext UnknownText_0x7e355ab
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5
	writetext GiveBulbasaurText
	waitbutton
	closetext
	setevent EVENT_GOT_BULBASAUR_FROM_ARBORETUM
	end
	
.AlreadyGotBulbasaur
	writetext AlreadyGotBulbasaurText
	waitbutton
	closetext
	end
	
.DontTakeBulbasaur
	writetext NoBulbasaurText
	waitbutton
	closetext
	end
	
.PartyFullBulbasaur
	writetext PartyFullBulbasaurText
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainOddishScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainOddishText
	cry ODDISH
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainBulbasaurScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainBulbasaurText
	cry BULBASAUR
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainParasScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainParasText
	cry PARAS
	waitbutton
	closetext
	end
	
RyukyuArboretumHouseYoungsterScript:
	jumptextfaceplayer RyukyuArboretumHouseYoungsterText
	
RyukyuArboretumHouseYoungsterText:
	text "¡Este lugar es"
	line "genial!"

	para "¡Parece que a los"
	line "#MON planta les"
	cont "encanta estar"
	cont "aquí!"
	done

RyukyuMagnetTrainParasText:
	text "PARAS: Paraa…"
	done

RyukyuMagnetTrainBulbasaurText:
	text "BULBASAUR: ¡Bulba!"
	done

RyukyuMagnetTrainOddishText:
	text "ODDISH: ¿Oodd?"
	done

UnknownText_0x7e355ab:
	text "<PLAYER> recibió a"
	line "BULBASAUR."
	done

AlreadyGotBulbasaurText:
	text "¡Tengo muchas"
	line "especies arbóreas"
	cont "de todo NIHON!"
	done

PartyFullBulbasaurText:
	text "¡Ya llevas muchos"
	line "#MON en tu"
	cont "equipo!"
	done

NoBulbasaurText:
	text "Entiendo."

	para "¡Estaré por aquí"
	line "si cambias de"
	cont "idea!"
	done

ILoveBulbasaurText:
	text "¡Hola!"

	para "Estoy al cargo de"
	line "este arboreto."

	para "¡Lo que significa"
	line "que cuido árboles!"

	para "Este recinto está"
	line "lleno de ventanas"
	cont "por las que pasa"
	cont "la luz."

	para "¡Y también hay"
	line "muchos #MON"
	cont "planta que cuidan"
	cont "de ellos!"

	para "Aunque yo no puedo"
	line "cuidar de todos"
	cont "ellos."

	para "Tengo un BULBASAUR"
	line "que me gustaría"
	cont "dejar en mejores"
	cont "manos."

	para "¿Te gustaría"
	line "llevártelo?"
	done

GiveBulbasaurText:
	text "¡No dudo de que lo"
	line "cuidarás muy bien!"
	done


RyukyuArboretum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 8
	warp_event  9, 17, RYUKYU_CITY, 8
	
	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuArboretumHouseCooltrainer, -1
	object_event  5, 13, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainOddishScript, -1
	object_event 14,  8, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainBulbasaurScript, -1
	object_event  6,  7, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainParasScript, -1
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuArboretumHouseYoungsterScript, -1
