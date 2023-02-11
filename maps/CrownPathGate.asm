	object_const_def ; object_event constants
	const CROWNPATHGATE_OFFICER
	const CROWNPATHGATE_COOLTRAINERM
	const CROWNPATHGATE_COOLTRAINERF

CrownPathGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

CrownPathGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	jump CrownPathGateBadgeCheckScript

CrownPathGateOfficerScript:
	faceplayer
CrownPathGateBadgeCheckScript:
	opentext
	writetext CrownPathGateOfficerText
	buttonsound
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonEvenYet
	checkcode VAR_BADGES
	ifgreater NUM_NIHON_BADGES - 1, .AllEightBadges
	writetext CrownPathGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, CrownPathGateStepDownMovement
	end

.NoPokemonEvenYet
	writetext CrownPathGateNotEvenATrainer
	waitbutton
	closetext
	applymovement PLAYER, CrownPathGateStepDownMovement
	end

.AllEightBadges:
	writetext CrownPathGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

CrownPathGateStepDownMovement:
	step DOWN
	step_end
	
CrownPathGateCooltrainerMScript:
	jumptextfaceplayer CrownPathGateCooltrainerMText
	
CrownPathGateCooltrainerFScript:
	jumptextfaceplayer CrownPathGateCooltrainerFText
	
CrownPathGateCooltrainerMText:
	text "¡No puedo creerlo!"

	para "¡Ya casi es la"
	line "hora de que"
	cont "desafíe a la LIGA!"

	para "¡He esperado toda"
	line "mi vida para este"
	cont "momento!"
	done

CrownPathGateCooltrainerFText:
	text "SENDA CORONA puede"
	line "ser un camino de"
	para "rosas, pero el"
	line "verdadero desafío"
	para "es llegar a la"
	line "cima del MT. FUJI"
	cont "desde CIUDAD"
	cont "CORONA."
	done

CrownPathGateNotEvenATrainer:
	text "No pareces siquie-"
	line "ra un entrenador"
	cont "#MON."

	para "Lo siento, chico,"
	line "pero solo puedo"
	para "dejar pasar a"
	line "entrenadores"
	cont "cualificados."
	done

CrownPathGateOfficerText:
	text "Sólo pueden pasar"
	line "los entrenadores"
	cont "que demuestren su"
	cont "valía."
	done

CrownPathGateNotEnoughBadgesText:
	text "No tienes ocho"
	line "MEDALLAS."

	para "Lo siento, pero"
	line "solo los entrena-"
	para "dores que tengan"
	line "ocho MEDALLAS"
	para "pueden entrar a"
	line "CIUDAD CORONA y"
	cont "escalar el MT."
	cont "FUJI."
	done

CrownPathGateEightBadgesText:
	text "¡Oh! ¡Las ocho"
	line "MEDALLAS!"

	para "Has demostrado tu"
	line "valía."

	para "¡Por favor, pasa!"
	done

CrownPathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 17, SILENT_NORTH, 1
	warp_event 10, 17, SILENT_NORTH, 1
	warp_event  9,  0, CROWN_PATH, 1
	warp_event 10,  0, CROWN_PATH, 2

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, CrownPathGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CrownPathGateOfficerScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownPathGateCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CrownPathGateCooltrainerFScript, -1
