	object_const_def ; object_event constants
	const KOBANHOUSE_1_CLAIR

KobanHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanHouse1ClairScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_14
	iftrue .AfterDratiniGift
	checkitem MACHINE_PART
	iffalse .NoOrbYet
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratiniClair
.AfterDratiniGift
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end
	
.NoOrbYet
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end
	
.GiveDratiniClair
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_SWITCH_14
	takeitem MACHINE_PART
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end	
	
.PartyFullClair:
	writetext KantoRestaurantPartyFullTextClair
	waitbutton
	closetext
	end
	
ClairPlayerReceivedDratiniText:
	text "¡<PLAYER> recibió"
	line "a DRATINI!"
	done

ClairSymbolicDragonText:
	text "Los #MON dragón"
	line "son difíciles de"
	para "criar, pero su"
	line "majestuosidad y su"
	cont "fuerza los hace"
	cont "dignos."

	para "Confío en que"
	line "criarás este"
	cont "DRATINI como se"
	cont "merece."
	done
	
KantoRestaurantPartyFullTextClair:
	text "¡No tienes sitio"
	line "en tu equipo!"
	done
	
ClairTakeThisDratiniText:
	text "¡Ah, la"
	line "DRAGOESFERA!"

	para "¡Veo que has"
	line "comprendido el"
	para "poder de los"
	line "#MON dragón!"

	para "¡Me gustaría"
	line "recompensarte con"
	para "un #MON espe-"
	line "cial que merece"
	para "ser criado por un"
	line "entrenador digno!"
	done

GoGetTheOrbText:
	text "Recupera la"
	line "DRAGOESFERA de un"
	para "entrenador en la"
	line "cueva, y tráemela."
	done

DragonsAreGreatText:
	text "Ser un entrenador"
	line "del tipo dragón"
	para "requiere más"
	line "dedicación que"
	cont "otros tipos."

	para "Es un estilo de"
	line "vida."
	done

KobanHouse1ClairText:
	text "ey cómo va"
	done

KobanHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 1
	warp_event  5,  7, KOBAN_ISLAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanHouse1ClairScript, EVENT_CLAIR_INSIDE_HOUSE
