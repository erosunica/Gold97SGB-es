	object_const_def ; object_event constants
	const KOBANISLAND_GRANNY
	const KOBANISLAND_TWIN
	const KOBANISLAND_GRAMPS
	const KOBANISLAND_CLAIR

KobanIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KOBAN
	return

KobanIslandTeacherScript:
	jumptextfaceplayer KobanIslandTeacherText

KobanIslandGrampsScript:
	jumptextfaceplayer KobanIslandGrampsText

KobanIslandFisherScript:
	jumptextfaceplayer KobanIslandFisherText

KobanIslandSign:
	jumpstd PokecenterSignScript

RedsHouseSign:
	jumpstd MartSignScript

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText
	
KobanIslandClairScript:
	faceplayer
	opentext
	writetext ClairGreetingsText
	waitbutton
	closetext
	pause 2
	checkcode VAR_FACING
	ifequal RIGHT, .ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement
	disappear KOBANISLAND_CLAIR
	setevent EVENT_CLAIR_IN_FRONT_OF_DRAGONS_MAW
	clearevent EVENT_CLAIR_INSIDE_HOUSE
	end

.ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement2
	disappear KOBANISLAND_CLAIR
	setevent EVENT_CLAIR_IN_FRONT_OF_DRAGONS_MAW
	clearevent EVENT_CLAIR_INSIDE_HOUSE
	end

KobanIslandTeacherText:
	text "Las corrientes de"
	line "agua mantienen"
	para "esta isla algo más"
	line "cálida que el"
	para "BOSQUE AZUL, al"
	line "este de aquí."
	done

KobanIslandGrampsText:
	text "Es una vieja"
	line "tradición en este"
	para "pueblo que los"
	line "entrenadores críen"
	cont "dragones."
	done

KobanIslandFisherText:
	text "¡Un día quiero"
	line "criar un dragón!"
	done

OaksLabSignText:
	text "ISLA KOBAN"
	
	para "Una pequeña isla"
	line "con una gran"
	cont "historia"
	done

BluesHouseSignText:
	text "MANDÍBULA DRAGÓN"
	done

ClairGreetingsText:
	text "Hola."

	para "¿Quién eres tú?"
	para "…"
	para "Vale, <PLAYER>, mi"
	line "nombre es DÉBORA."

	para "Soy la mejor"
	line "maestra dragón de"
	cont "NIHON."

	para "Bueno… la segunda"
	line "mejor."

	para "Pero a lo que voy"
	line "es que detrás de"
	para "mí se encuentra la"
	line "MANDÍBULA DRAGÓN."

	para "Es un lugar"
	line "místico, y se dice"
	para "que es donde"
	line "vivieron los"
	cont "primeros #MON"
	cont "dragón."
	
	para "¿Tienes algún"
	line "#MON dragón?"
	para "Si quieres ser"
	line "respetado entre"
	para "los entrenadores"
	line "dragón, deberías"
	cont "entrenar en esta"
	cont "cueva."
	
	para "Dentro hay muchos"
	line "de ellos."
	
	para "Uno de ellos tiene"
	line "la DRAGOESFERA."
	
	para "Encuentra al"
	line "entrenador que la"
	cont "tiene, y tráemela."
	
	para "Este es tu primer"
	line "paso para conver-"
	cont "tirte en un digno"
	cont "entrenador dragón."

	para "Te estaré esperan-"
	line "do en mi casa."
	done

ClairLeavesMovement:
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
ClairLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

KobanIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5,  5, KOBAN_HOUSE_1, 1
	warp_event  5, 10, KOBAN_MART, 1
	warp_event  9, 10, KOBAN_POKECENTER_1F, 1
	warp_event 15,  9, KOBAN_HOUSE_2, 1
	warp_event 13,  5, DRAGONS_MAW_1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 10, 10, BGEVENT_READ, KobanIslandSign
	bg_event  6, 10, BGEVENT_READ, RedsHouseSign
	bg_event 10, 14, BGEVENT_READ, OaksLabSign
	bg_event 14,  6, BGEVENT_READ, BluesHouseSign

	db 4 ; object events
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KobanIslandTeacherScript, -1
	object_event  8, 12, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanIslandFisherScript, -1
	object_event 13, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KobanIslandGrampsScript, -1
	object_event 13,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0 , -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanIslandClairScript, EVENT_CLAIR_IN_FRONT_OF_DRAGONS_MAW
