	object_const_def ; object_event constants
	const RADIOTOWER3F_ROCKER
	const RADIOTOWER3F_TEACHER
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_JANINE
	const RADIOTOWER3F_GRUNTF5
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonelSignText

RadioTower3fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fRocker
	writetext RadioTower3fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover3fRocker
	writetext RadioTower3fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower3fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherTextTakeover
	waitbutton
	closetext
	end


RadioTower3fJanine:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fJanine
	writetext RadioTower3fJanineText
	waitbutton
	closetext
	end
.MidRocketTakeover3fJanine
	writetext RadioTower3fJanineTextTakeover
	waitbutton
	closetext
	end


RadioTower3fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdTextTakeover
	waitbutton
	closetext
	end
	

TrainerGruntF5:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistJed:
	trainer SCIENTIST, JED, EVENT_BEAT_SCIENTIST_JED, ScientistJedSeenText, ScientistJedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistJedAfterBattleText
	waitbutton
	closetext
	end
	

ScientistJedSeenText:
	text "¡No debería ser"
	line "complicado sinto-"
	cont "nizar aquí nuestra"
	cont "señal de control"
	cont "mental!"
	done
	
ScientistJedBeatenText:
	text "Los combates"
	line "#MON son más"
	cont "difíciles que la"
	cont "ciencia…"
	done
	
ScientistJedAfterBattleText:
	text "¿Qué tal si dejas"
	line "de meterte en"
	cont "nuestros planes?"
	done
	
GruntF5SeenText:
	text "¡Esos empleados no"
	line "sabían lo que les"
	cont "esperaba!"
	done
	
GruntF5BeatenText:
	text "¡Uf! ¡Sí que sé lo"
	line "que me esperaba a"
	cont "mí!"
	done
	
GruntF5AfterBattleText:
	text "¡Esta gente se va"
	line "a quedar pronto"
	cont "sin trabajo!"
	done
	
RadioTower3fRockerText:
	text "Hemos grabado los"
	line "gritos de todos"
	para "los #MON"
	line "descubiertos."

	para "Debemos de tener"
	line "más de 200 tipos."
	done
	
RadioTower3fRockerTextTakeover:
	text "¡¿Qué está pasando"
	line "aquí?! ¡No puedo"
	para "trabajar con todos"
	line "estos criminales"
	cont "en mi oficina!"
	done
	
RadioTower3fJanineText:
	text "Diría que KEN es"
	line "el DJ más popular"
	cont "aquí."
	done
	
RadioTower3fJanineTextTakeover:
	text "¡Ayuda! ¿Qué"
	line "piensa hacer el"
	para "TEAM ROCKET con"
	line "nuestra antena de"
	cont "radio?"
	done
	
RadioTower3fSuperNerdText:
	text "Emitimos programas"
	line "de entretenimiento"
	para "las 24 horas del"
	line "día."

	para "¡Intentaremos"
	line "hacerlo lo mejor"
	cont "posible!"
	done
	
RadioTower3fSuperNerdTextTakeover:
	text "¡Esto no tiene"
	line "buena pinta!"

	para "¡El TEAM ROCKET"
	line "hará daño a los"
	para "#MON si se"
	line "apoderan de esta"
	cont "torre!"
	done
	
RadioTower3fTeacherText:
	text "Las nanas de la"
	line "radio pueden hacer"
	para "que los #MON"
	line "se duerman."
	done
	
RadioTower3fTeacherTextTakeover:
	text "¿Qué podemos"
	line "hacer?"
	done
	
RadioTower3FPersonelSignText:
	text "P2 PERSONAL"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower3FPersonnelSign

	db 6 ; object events
	object_event  1,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fRocker, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RadioTower3fTeacher, -1
	object_event  4,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RadioTower3fSuperNerd, -1
	object_event  6,  5, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RadioTower3fJanine, -1
	object_event  1,  3, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerGruntF5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerScientistJed, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

