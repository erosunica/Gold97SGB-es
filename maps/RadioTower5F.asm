	object_const_def ; object_event constants
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_COOLTRAINER
	const RADIOTOWER5F_SCIENTIST
	const RADIOTOWER5F_GRUNTM30

RadioTower5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

RadioTower5fCooltrainer:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerTextTakeover
	waitbutton
	closetext
	end

RadioTower5fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fRocker
	writetext RadioTower5fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fRocker
	writetext RadioTower5fRockerTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM30:
	trainer GRUNTM, GRUNTM_30, EVENT_BEAT_ROCKET_GRUNTM_30, GruntM30SeenText, GruntM30BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM30AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

	
RadioTower5FStudiosSign:
	jumptext RadioTower5FStudiosSignText
	
GruntM30SeenText:
	text "¿No es nuestra"
	line "emisión de radio"
	para "mucho mejor que"
	line "la habitual?"
	done
	
GruntM30BeatenText:
	text "En realidad me"
	line "gusta la música"
	cont "#MON…"
	done
	
GruntM30AfterBattleText:
	text "¡Muy pronto esta"
	line "torre emitirá"
	para "nuestra señal de"
	line "control mental!"
	done
	
ScientistRichSeenText:
	text "¿Que qué pasó con"
	line "el OAK IMPOSTOR?"
	para "¡Pues que ya no"
	line "era necesario"
	para "seguir contando"
	line "con él! ¡Ya no nos"
	cont "interesa engañar a"
	cont "nadie!"

	para "¡Así que nos"
	line "deshicimos de él!"
	done
	
ScientistRichBeatenText:
	text "¡Demasiado"
	line "fuerte!"
	done
	
ScientistRichAfterBattleText:
	text "Nunca me cayó bien"
	line "ese tío, de todos"
	cont "modos."
	done
	
	
RadioTower5FStudiosSignText:
	text "P4 ESTUDIO 3"
	done

RadioTower5fRockerText:
	text "NARDO: ¿Te gusta"
	line "la música hecha"
	cont "para los #MON?"
	para "¡Sintoniza mi"
	line "programa!"
	done
	
RadioTower5fRockerTextTakeover:
	text "NARDO: ¡No creo"
	line "que el TEAM ROCKET"
	para "quiera poner"
	line "música que le"
	cont "guste a los"
	cont "#MON!"
	done
	
RadioTower5fCooltrainerText:
	text "SALVA: ¡Si quieres"
	line "probar tu suerte,"
	cont "sintoniza mi"
	cont "programa!"
	done
	
RadioTower5fCooltrainerTextTakeover:
	text "SALVA: ¡Creo que"
	line "hoy tenemos mala"
	cont "suerte!"
	done
	

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event  7,  0, RADIO_TOWER_6F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FStudiosSign

	db 4 ; object events
	object_event  4,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower5fRocker, -1
	object_event  0,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower5fCooltrainer, -1
	object_event  6,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM30, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
