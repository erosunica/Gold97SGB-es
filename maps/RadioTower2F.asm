	object_const_def ; object_event constants
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_ROCKER
	const RADIOTOWER2F_GRUNTM24
	const RADIOTOWER2F_GRUNTM26
	const RADIOTOWER2F_BUENA

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end


RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end




RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText
	
RadioTower2fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fRocker
	writetext RadioTower2fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover2fRocker
	writetext RadioTower2fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower2fBuena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaText
	waitbutton
	closetext
	end
.MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntM26:
	trainer GRUNTM, GRUNTM_26, EVENT_BEAT_ROCKET_GRUNTM_26, GruntM26SeenText, GruntM26BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM26AfterBattleText
	waitbutton
	closetext
	end
	
RadioTower2fBuenaText:
	text "¡Hola! ¡Soy BUENA!"

	para "¡Me acaban de"
	line "contratar para"
	para "presentar un nuevo"
	line "programa de radio!"

	para "¡No puedo esperar"
	line "a que empiece su"
	cont "emisión!"
	done

RadioTower2fBuenaTextTakeover:
	text "¡Ay!"

	para "¡Esto no es lo que"
	line "esperaba al traba-"
	cont "jar en la radio!"
	done
	
	
GruntM24SeenText:
	text "El TEAM ROCKET"
	line "puede operar en"
	cont "bases secretas."

	para "¡Pero no tenemos"
	line "inconveniente en"
	para "irrumpir y llevar-"
	line "nos lo que haga"
	cont "falta si es"
	cont "necesario!"
	done
	
GruntM24BeatenText:
	text "¡Tú no has tenido"
	line "inconveniente en"
	cont "derrotarme!"
	done
	
GruntM24AfterBattleText:
	text "¿Conoces a nuestro"
	line "líder?"
	para "Me da a mí que no"
	line "os llevaríais"
	cont "bien."
	done

GruntM26SeenText:
	text "¿Que por qué"
	line "estamos aquí?"
	para "¡Porque tu amigo y"
	line "tú destruisteis"
	cont "nuestra antena!"

	para "¿Por qué crear"
	line "otra cuando pode-"
	cont "mos robar esta?"
	done
	
GruntM26BeatenText:
	text "¡Auch!"
	done
	
GruntM26AfterBattleText:
	text "¡Hemos tenido"
	line "muchos problemas"
	cont "por vuestra culpa!"
	done

	
RadioTower2fRockerTextTakeover:
	text "¡Todas las"
	line "estaciones de"
	para "radio están"
	line "hablando sobre el"
	cont "TEAM ROCKET!"
	done

RadioTower2fRockerText:
	text "¿Has escuchado la"
	line "Marcha #MON?"
	para "Hace que aparezcan"
	line "más #MON"
	cont "salvajes."
	done

MovementData_0x5d921:
;	slow_step DOWN
;	slow_step RIGHT
	step_end


RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

RadioTower2FSalesSignText:
	text "P1 ESTUDIO 1"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "La HORA #MON"
	line "de KEN"

	para "¡El mejor programa"
	line "de la radio!"
	done

RadioTower2FPokemonRadioSignText:
	text "RADIO #MON"
	
	para "A cualquier hora"
	line "y en todas partes."
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event  7,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  6, -1, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  3,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 5 ; object events
	object_event  4,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event  6,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fRocker, -1
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM26, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fBuena, -1
