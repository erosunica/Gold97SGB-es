	object_const_def ; object_event constants
	const RADIOTOWER4F_ROCKER
	const RADIOTOWER4F_BURGLAR
	const RADIOTOWER4F_SUPER_NERD
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_SCIENTIST
	const RADIOTOWER4F_GRUNTM27
	const RADIOTOWER4F_GRUNTM28

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText


RadioTower4fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fRocker
	writetext RadioTower4fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover4fRocker
	writetext RadioTower4fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower4fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherTextTakeover
	waitbutton
	closetext
	end

RadioTower4fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fSuperNerd
	checkflag ENGINE_MAP_CARD
	iffalse .KenFinallyGivesMap
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .KenAfterRadioTower
	writetext RadioTower4fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover4fSuperNerd
	writetext RadioTower4fSuperNerdTextTakeover
	waitbutton
	closetext
	end
.KenAfterRadioTower
	writetext RadioTower4fSuperNerdTextAfter
	waitbutton
	closetext
	end
.KenFinallyGivesMap
	writetext KenGiveMapInTower
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGiveMapInTower2
	waitbutton
	closetext
	end
	

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "TARJ. MAPA@"
	

	
RadioTower4fBurglar:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarText
	waitbutton
	closetext
	end
.MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarTextTakeover
	waitbutton
	closetext
	end
	
TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM27:
	trainer GRUNTM, GRUNTM_27, EVENT_BEAT_ROCKET_GRUNTM_27, GruntM27SeenText, GruntM27BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM27AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM28:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	end
	

GruntM28SeenText:
	text "¡Sorpresa!"
	done
	
GruntM28BeatenText:
	text "Más bien me has"
	line "sorprendido a mí…"
	done
	
GruntM28AfterBattleText:
	text "Ya debes estar"
	line "acostumbrado a"
	para "toparte con"
	line "reclutas del TEAM"
	cont "ROCKET."
	done

KenGiveMapInTower:
	text "KEN: ¡Qué pasa,"
	line "hermano!"
	cont "¡Lo logré!"
	
	para "¡Ya soy un DJ!"
	
	para "¡Y la investiga-"
	line "ción que estás"
	para "haciendo con el"
	line "PROF. OAK me está"
	para "viniendo de"
	line "maravilla para mi"
	cont "programa de radio!"
	
	para "¡Te debo una!"
	
	para "…"
	
	para "¡Ah, espera!"
	line "¡Al final no pude"
	cont "darte esto!"
	done
	
KenGiveMapInTower2:
	text "¿Cómo has llegado"
	line "hasta aquí sin"
	cont "mapa y sin"
	cont "perderte?"
	done
	
GruntM27SeenText:
	text "¿Vas a la planta"
	line "más alta?"
	para "¡Lo dudo!"
	done
	
GruntM27BeatenText:
	text "Escuché que la"
	line "vista es preciosa"
	cont "desde allí."
	done
	
GruntM27AfterBattleText:
	text "¡Podrás vencerme a"
	line "mí, pero no a"
	cont "GIOVANNI!"
	done
	
ScientistMarcSeenText:
	text "¡Mi investigación"
	line "demuestra que hay"
	cont "un mocoso!"
	done
	
ScientistMarcBeatenText:
	text "Maldita sea."
	done
	
ScientistMarcAfterBattleText:
	text "¡Te estás interpo-"
	line "niendo en el"
	cont "camino de la"
	cont "ciencia!"
	done
	
RadioTower4fTeacherText:
	text "ROSA: ¡No olvides"
	line "sintonizar la HORA"
	cont "#MON de KEN,"
	para "cada día a partir"
	line "de las 10 de la"
	cont "mañana!"
	done
	
RadioTower4fTeacherTextTakeover:
	text "ROSA: ¡Debería"
	line "haberme quedado"
	cont "hoy en casa!"
	done
	
RadioTower4fBurglarText:
	text "¡Hola, chico!"

	para "¡Soy el gerente de"
	line "producción de la"
	cont "HORA #MON de"
	cont "KEN!"

	para "¡No olvides"
	line "sintonizarnos!"
	done
	
RadioTower4fBurglarTextTakeover:
	text "¡Esto no era parte"
	line "de la producción!"
	done

RadioTower4fRockerText:
	text "Estando en las"
	line "RUINAS SÁNSCRITAS,"
	cont "escuché la radio."

	para "Oí una sintonía"
	line "extraña."
	done
	
RadioTower4fRockerTextTakeover:
	text "¡Todos nuestros"
	line "programas están"
	para "ahora mismo fuera"
	line "de emisión!"
	done
	
RadioTower4fSuperNerdText:
	text "KEN: ¡Qué pasa,"
	line "hermano!"
	cont "¡Lo logré!"
	
	para "¡Ya soy un DJ!"
	
	para "¡Y la investiga-"
	line "ción que estás"
	para "haciendo con el"
	line "PROF. OAK me está"
	para "viniendo de"
	line "maravilla para mi"
	cont "programa de radio!"
	
	para "¡Te debo una!"
	done
	
RadioTower4fSuperNerdTextTakeover:
	text "KEN: ¡<PLAYER>!"
	line "¡¿Qué haces aquí?!"

	para "¡Ponte a salvo!"
	done
	
RadioTower4fSuperNerdTextAfter:
	text "KEN: ¿Te has"
	line "encargado tú de"
	cont "los ROCKET?"
	para "¡Hermano, tus"
	line "#MON y tú sois"
	cont "la mar de fuertes!"
	done
	
RadioTower4FStudio2SignText:
	text "P3 ESTUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  7,  0, RADIO_TOWER_3F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RadioTower4fRocker, -1
	object_event  7,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower4fBurglar, -1
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4fSuperNerd, -1
	object_event  0,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RadioTower4fTeacher, -1
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  1,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM27, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM28, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
