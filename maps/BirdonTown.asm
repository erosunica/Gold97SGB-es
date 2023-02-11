	object_const_def ; object_event constants
	const BIRDONTOWN_GRAMPS
	const BIRDONTOWN_TEACHER
	const BIRDONTOWN_YOUNGSTER

BirdonTown_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_BIRDONTOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_BIRDONTOWN_RIVAL_BATTLE
	scene_script .DummyScene2 ; SCENE_BIRDONTOWN_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_BIRDON
	return

BirdonTownGrampsScript:
	jumptextfaceplayer BirdonTownGrampsTextBefore

BirdonTownTeacherScript:
	jumptextfaceplayer BirdonTownTeacherText

BirdonTownYoungsterScript:
	jumptextfaceplayer BirdonTownYoungsterText


BirdonTownSign:
	jumptext BirdonTownSignText


WestportGymSign:
	jumptext WestportGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText


BirdonTownJadetForestSign:
	jumptext BirdonTownJadeForestSignText

BirdonTownPokecenterSign:
	jumpstd PokecenterSignScript

BirdonTownMartSign:
	jumpstd MartSignScript

FruitTreeBirdonTown:
	fruittree FRUITTREE_TREE_BIRDON_TOWN

BirdonTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_BIRDON_TOWN_HIDDEN_FULL_HEAL


BirdonTownGrampsTextBefore:
	text "Nuestro LÍDER de"
	line "GIMNASIO, ORFEO,"
	para "es un hombre"
	line "envuelto en"
	cont "misterio."

	para "No se sabe mucho"
	line "sobre él."

	para "Aunque estamos al"
	line "tanto de que"
	para "estudia los mitos"
	line "y leyendas de"
	cont "NIHON."

	para "Y, por supuesto,"
	line "es un excelente"
	cont "entrenador."
	done

BirdonTownTeacherText:
	text "Apenas llueve"
	line "aquí."

	para "El POZO SLOWPOKE"
	line "es una parte esen-"
	cont "cial de nuestro"
	cont "ecosistema."
	done

BirdonTownYoungsterText:
	text "Lejos de aquí,"
	line "hacia el este, se"
	cont "llega al BOSQUE"
	cont "JADE."

	para "Y al cruzarlo, se"
	line "llega a CIUDAD"
	cont "ALEAR."
	
	para "Es un viaje largo."
	
	para "Descansa aquí si"
	line "piensas ir hacia"
	cont "allí."
	done

BirdonTownSlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

BirdonTownSlowpokeText2:
	text "(Bostezo)<……>"
	done


BirdonTownSignText:
	text "PUEBLO BIRDON"
	
	para "De suelo árido,"
	line "pero amistad"
	cont "fértil"
	done

WestportGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE PUEBLO"
	cont "BIRDON: ANTÓN"

	para "La enciclopedia"
	line "andante de los"
	cont "#MON bicho"
	done

SlowpokeWellSignText:
	text "POZO SLOWPOKE"

	para "El oasis de los"
	line "SLOWPOKE"
	done


BirdonTownJadeForestSignText:
	text "Acceso hacia el"
	line "BOSQUE JADE"
	done

BirdonTown_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 15,  4, BIRDON_POKECENTER_1F, 1
	warp_event  3, 13, BIRDON_MILK_BAR, 1
	warp_event  3,  4, BIRDON_MART, 1
	warp_event  4,  9, BIRDON_ELDER_HOUSE, 1
	warp_event 14, 15, BIRDON_GYM, 1
	warp_event  9,  9, SLOWPOKE_WELL_B1F, 1
;	warp_event  9,  9, STAND_CITY_ROCKET_HOUSE, 1
	warp_event  8,  5, ROUTE_116_BIRDON_GATE, 3
	warp_event  9,  5, ROUTE_116_BIRDON_GATE, 4
	warp_event 15, 15, BIRDON_GYM, 2
	warp_event  9, 13, CROWN_EVOLUTION_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6, 14, BGEVENT_READ, BirdonTownSign
	bg_event 13, 14, BGEVENT_READ, WestportGymSign
	bg_event 11, 10, BGEVENT_READ, SlowpokeWellSign
	bg_event 16,  4, BGEVENT_READ, BirdonTownPokecenterSign
	bg_event  4,  4, BGEVENT_READ, BirdonTownMartSign
	bg_event  0,  0, BGEVENT_READ, BirdonTownJadetForestSign
	bg_event  2,  7, BGEVENT_ITEM, BirdonTownHiddenFullHeal

	db 4 ; object events
	object_event 14, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonTownGrampsScript, -1
	object_event 10,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, 1, 1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonTownTeacherScript, -1
	object_event  3, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BirdonTownYoungsterScript, -1
	object_event 14,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, FruitTreeBirdonTown, -1
