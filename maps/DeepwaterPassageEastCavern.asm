	object_const_def ; object_event constants
	const DEEPWATERPASSAGEEASTCAVERN_PRYCE
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_1
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_2
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_3
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_4
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_5
 
DeepwaterPassageEastCavern_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
DeepwaterPassageEastCavernMaxRevive:
	itemball MAX_REVIVE

DeepwaterPassageEastCavernRareCandy:
	itemball RARE_CANDY

DeepwaterPassageEastCavernMaxEther:
	itemball MAX_ETHER
	
DeepwaterPassageEastCavernTMSwagger:
	itemball TM_SWAGGER
	
DeepwaterPassageEastCavernHpUp:
	itemball HP_UP

DeepwaterPassageEastCavernPryceScript:
	faceplayer
	opentext
	writetext PryceGreetingText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .PryceWalksAroundPlayer
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovement
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end
	
.PryceWalksAroundPlayer:
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovementAlt
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end

PryceGreetingText:
	text "Oh, hola."

	para "No suelo recibir"
	line "visitas aquí."

	para "Mi nombre es"
	line "FREDO."

	para "Soy el LÍDER de"
	line "GIMNASIO del"
	cont "BOSQUE AZUL."

	para "Pero me gusta"
	line "salir a menudo de"
	para "mi GIMNASIO para"
	line "venir a entrenar"
	para "en las profundida-"
	line "des de esta cueva."

	para "Vivo entre los"
	line "#MON de hielo"
	para "para entenderlos"
	line "por completo."

	para "…"
	para "Aunque también"
	line "entendería que"
	para "quisieras que re-"
	line "grese al GIMNASIO."

	para "Lo haré en su"
	line "debido momento."

	para "Mi familia vive en"
	line "PUEBLO ESCARCHA."

	para "Ya les he dicho"
	line "que iría de"
	cont "visita."

	para "No voy a romper"
	line "esa promesa."

	para "Espero que lo"
	line "comprendas."

	para "…"
	para "Percibo que"
	line "sientes un gran"
	cont "respeto por los"
	cont "#MON."

	para "Es admirable."

	para "Cuando tengas"
	line "oportunidad, ven a"
	para "vernos a mí y a mi"
	line "familia en PUEBLO"
	cont "ESCARCHA."

	para "Regresaré al"
	line "GIMNASIO cuando ya"
	cont "los haya visitado."
	done

PryceLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PryceLeavesMovementAlt:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

DeepwaterPassageEastCavern_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 33, DEEPWATER_PASSAGE_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 26, 31, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DeepwaterPassageEastCavernPryceScript, EVENT_PRYCE_IN_DEEPWATER
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernTMSwagger, EVENT_DEEPWATER_EAST_TM_SWAGGER
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxEther, EVENT_DEEPWATER_EAST_MAX_ETHER
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxRevive, EVENT_DEEPWATER_EAST_MAX_REVIVE
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernRareCandy, EVENT_DEEPWATER_EAST_RARE_CANDY
	object_event 10, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernHpUp, EVENT_DEEPWATER_EAST_HP_UP

