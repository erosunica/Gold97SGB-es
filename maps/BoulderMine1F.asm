	object_const_def ; object_event constants
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_MINE_1
	const UNIONCAVE1F_MINE_2
	const UNIONCAVE1F_MINE_3
	const UNIONCAVE1F_TWIN
	const UNIONCAVE1F_COOLTRAINERF
	const UNIONCAVE1F_POKEMANIAC

BoulderMine1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GirlInMineScript:
	faceplayer
	opentext
	writetext Text_FoundMe
	waitbutton
	closetext
	setevent EVENT_GRAMPS_AT_MINE
	setevent EVENT_GIRL_IS_IN_MINE
	clearevent EVENT_GRAMPS_IS_AT_GRAMPS_HOUSE
	clearevent EVENT_GIRL_IS_BACK_AT_HOUSE
	setevent EVENT_BOULDER_MINE_WHITNEY
	setevent EVENT_ROCKETS_BLOCKING_AQUARIUM
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .AlreadySavedAquarium
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	pause 10
	warpfacing UP, TEKNOS_ITEMFINDER_HOUSE, 4, 7
	end
	
.AlreadySavedAquarium:
	clearevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	pause 10
	warpfacing UP, TEKNOS_ITEMFINDER_HOUSE, 4, 7
	end

BoulderMine1FGreatBall:
	itemball GREAT_BALL

BoulderMine1FSharpHorns:
	itemball SHARP_HORNS

BoulderMine1FPotion:
	itemball POTION
	
TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerFEmmaSeenText, CooltrainerFEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFEmmaAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMine1FBoulder:
	jumpstd StrengthBoulderScript
	
CooltrainerFEmmaSeenText:
	text "En esta cueva"
	line "puedes perderte"
	cont "con facilidad."
	done

CooltrainerFEmmaBeatenText:
	text "¡No he podido"
	line "ganarte!"
	done
	
CooltrainerFEmmaAfterBattleText:
	text "Espero que nadie"
	line "se pierda por"
	cont "aquí."
	
	para "Sería algo"
	line "aterrador."
	done

PokemaniacLarrySeenText:
	text "Me pregunto qué se"
	line "mina en esta"
	cont "cueva…"
	done

PokemaniacLarryBeatenText:
	text "¿Cómo eres tan"
	line "fuerte?"
	done
	
PokemaniacLarryAfterBattleText:
	text "Me pregunto si hay"
	line "algo que valga la"
	cont "pena…"
	done

Text_FoundMe:
	text "¡Uy, hola!"
	
	para "Esto… ¿Sabes cómo"
	line "salir de aquí?"
	
	para "…"
	
	para "¡Oh! ¿El abuelo me"
	line "está buscando?"

	para "No quería"
	line "preocuparlo…"
	
	para "¡Vale! ¿Me ayudas"
	line "a salir de aquí?"
	
	para "¡Vamos!"
	done

BoulderMine1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  1, ROUTE_120, 1
	warp_event 17,  3, BOULDER_MINE_B1F, 3
	warp_event 29,  3, BOULDER_MINE_B1F, 4
	warp_event 39, 11, BOULDER_MINE_B1F, 7
	warp_event 37, 15, BOULDER_MINE_B1F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event 14,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMine1FGreatBall, EVENT_BOULDER_MINE_1F_GREAT_BALL
	object_event  1,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMine1FSharpHorns, EVENT_BOULDER_MINE_1F_X_ATTACK
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMine1FPotion, EVENT_BOULDER_MINE_1F_POTION
	object_event 23, 15, SPRITE_MINELR, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoulderMine1FBoulder, -1
	object_event 35,  9, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoulderMine1FBoulder, -1
	object_event  5, 10, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoulderMine1FBoulder, -1
	object_event  8, 14, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, GirlInMineScript, EVENT_GIRL_IS_IN_MINE
	object_event 10,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfEmma, -1
	object_event 19,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacLarry, -1


