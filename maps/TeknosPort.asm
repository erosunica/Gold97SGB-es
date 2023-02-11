	object_const_def ; object_event constants
	const TEKNOSPORT_SAILOR1
	const TEKNOSPORT_SAILOR2

TeknosPort_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene0
	end

TeknosPortWalkUpToShipScript:
	turnobject TEKNOSPORT_SAILOR1, RIGHT
	turnobject PLAYER, LEFT
	faceplayer
	opentext
	writetext TeknosPortToWestText
	yesorno
	iffalse .NotGoing
	writetext TeknosPortToWestText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a371
	jump TeknosPortSailorAtGangwayScript
	end
	
.NotGoing
	writetext NotGoingToWestText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a341
	end
	
TeknosPortSailorScript:
	end
	
TeknosPortSailorAtGangwayScript:
	faceplayer
	opentext
	writetext UnknownText_0x74a551
	waitbutton
	closetext
	turnobject TEKNOSPORT_SAILOR2, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear TEKNOSPORT_SAILOR2
	waitsfx
	applymovement PLAYER, MovementData_0x74a301
	clearevent EVENT_WESTPORT_PORT_SAILOR_AT_GANGWAY
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	warpfacing UP, WESTPORT_PORT, 8, 15
	end
	
TeknosPortToWestText:
	text "Bienvenido al"
	line "MUELLE TEKNOS."

	para "¿Te gustaría ir en"
	line "barco hasta CIUDAD"
	cont "PONIENTE?"
	done
	
TeknosPortToWestText2:
	text "¡Muy bien!"

	para "Zarpamos a CIUDAD"
	line "PONIENTE."
	done
	
NotGoingToWestText:
	text "¡Esperamos volver"
	line "a verte!"
	done
	
UnknownText_0x74a551:
	text "El barco va a"
	line "zarpar. Por favor,"
	cont "sube a bordo."
	done
	
MovementData_0x74a371:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
MovementData_0x74a301:
	step DOWN
	step_end
	
MovementData_0x74a341:
	step RIGHT
	turn_head LEFT
	step_end
	
TeknosPort_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  5, TEKNOS_PORT_PASSAGE, 5; 

	db 1 ; coord events
	coord_event  3, 9, SCENE_DEFAULT, TeknosPortWalkUpToShipScript

	db 0 ; bg events

	db 2 ; object events	
	object_event  2,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPortSailorScript, -1
	object_event  3, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPortSailorAtGangwayScript, -1
