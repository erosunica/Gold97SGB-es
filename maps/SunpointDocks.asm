	object_const_def ; object_event constants
	const DOCK_ROCKET_1
	const DOCK_ROCKET_2
	const DOCK_ROCKET_3
	const DOCK_ROCKET_4
	const DOCK_ROCKET_5
	const DOCK_ROCKET_6
	const DOCK_ROCKET_7
	const DOCK_GURU_1
	const DOCK_SAILOR
	const DOCK_FISHER
	const DOCK_GURU_2

SunpointDocks_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearPortBoat

.ClearPortBoat:
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iffalse .Done
	changeblock 11, 7, $0A ; water
	changeblock 13, 7, $0A ; water
	changeblock 15, 7, $0A ; water
	changeblock 17, 7, $0A ; water
	changeblock 11, 9, $0A ; water
	changeblock 13, 9, $0A ; water
	changeblock 15, 9, $0A ; water
	changeblock 17, 9, $0A ; water
	changeblock 13, 5, $08 ; dock
.Done:
	return


TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	turnobject DOCK_ROCKET_7, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear DOCK_ROCKET_7
	pause 15
	setevent EVENT_ROCKET_OUTSIDE_OF_SHIP
	end

DocksRocket1Script:
	jumptextfaceplayer DocksRocket1Text
	
DocksRocket2Script:
	jumptextfaceplayer DocksRocket2Text
	
DocksRocket3Script:
	jumptextfaceplayer DocksRocket3Text
	
DocksRocket4Script:
	jumptextfaceplayer DocksRocket4Text
	
DocksRocket5Script:
	jumptextfaceplayer DocksRocket5Text
	
DocksRocket6Script:
	jumptextfaceplayer DocksRocket6Text
	
DocksGuruScript:
	jumptextfaceplayer DocksGuruText
	
DocksGuru2Script:
	jumptextfaceplayer DocksGuruText2
	
DocksFisherScript:
	jumptextfaceplayer DocksFisherText
	
DocksSailorScript:
	jumptextfaceplayer DocksSailorText
	
DocksRocket1Text:
	text "¡Solo soy un"
	line "inocente trabaja-"
	cont "dor del MUELLE"
	cont "trayendo un poco"
	cont "de carga!"

	para "¡Todo bien por"
	line "aquí!"
	done
	
DocksRocket2Text:
	text "El CAPITÁN está a"
	line "bordo trabajando"
	para "en la logística"
	line "del último envío"
	cont "aquí en el"
	cont "MUELLE."

	para "¡Ya casi estamos"
	line "listos para"
	cont "largarnos de aquí!"
	done
	
DocksRocket3Text:
	text "¡Por fin! ¡Estamos"
	line "a punto de termi-"
	cont "nar nuestras"
	cont "operaciones aquí!"

	para "¡Qué ganas tengo"
	line "de volver al este"
	para "de NIHON, donde"
	line "hace mucho menos"
	cont "calor!"
	done
	
DocksRocket4Text:
	text "¡No me molestes!"
	line "¡Estoy trabajando!"
	done
	
DocksRocket5Text:
	text "Soy mineroo…"
	para "…"
	para "Mmm… no, no era"
	line "esa canción."
	done
	
DocksRocket6Text:
	text "¡Es duro trabajar"
	line "en el MUELLE!"
	done
	
GruntM29SeenText:
	text "¿Qué quieres,"
	line "niño?"
	para "¡Aquí solo se"
	line "permite personal"
	cont "autorizado!"

	para "¡Piérdete o"
	line "enfrentarás mi"
	cont "ira!"
	done
	
GruntM29BeatenText:
	text "¡Ayy!"
	done
	
GruntM29AfterBattleText:
	text "Podrías ser un"
	line "problema."

	para "¡Y no quiero ser"
	line "yo quien lo"
	cont "arregle!"
	done
	
DocksGuruText:
	text "Hoy no hay ningún"
	line "barco en el"
	cont "MUELLE."

	para "Es un día"
	line "tranquilo."
	done
	
DocksGuruText2:
	text "¡Hay una cafetería"
	line "en CIUDAD ALEAR"
	para "que tiene una"
	line "comida exquisita!"

	para "Ojalá no trabajase"
	line "tan lejos de allí…"
	done
	
DocksFisherText:
	text "No trabajo aquí."
	line "Solo me gusta ver"
	cont "ir y venir los"
	cont "barcos."
	done
	
DocksSailorText:
	text "Zarpo en unas"
	line "pocas semanas."

	para "¡Ha pasado tiempo"
	line "desde que estuve"
	cont "en el mar!"
	done

SunpointDocks_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1, 27, SUNPOINT_DOCKS_CROWN_PATH_ENTRANCE, 1
	warp_event  6, 31, SUNPOINT_DOCKS_GATE, 1
	warp_event  7, 31, SUNPOINT_DOCKS_GATE, 2
	warp_event 13,  5, TEAM_ROCKET_SHIP_BASE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 11 ; object events
	object_event  8,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, DocksRocket1Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  5, 15, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, DocksRocket2Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 14, 13, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, DocksRocket3Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  4,  8, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, DocksRocket4Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  5, 24, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, DocksRocket5Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 12, 19, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, DocksRocket6Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 0, TrainerGruntM29, EVENT_ROCKET_OUTSIDE_OF_SHIP
	object_event  5, 22, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksGuruScript, EVENT_SUNPOINT_DOCKS_NPCS
	object_event 14, 19, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DocksSailorScript, EVENT_SUNPOINT_DOCKS_NPCS
	object_event  8, 13, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, DocksFisherScript, EVENT_SUNPOINT_DOCKS_NPCS
	object_event  7,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksGuru2Script, EVENT_SUNPOINT_DOCKS_NPCS

