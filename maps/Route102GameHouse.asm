	object_const_def ; object_event constants
	const N64_HOUSE_SCIENTIST
	const N64_HOUSE_YOUNGSTER
	const N64_HOUSE_ROCKER
	const N64_HOUSE_LASS
	const N64_HOUSE_COOLTRAINER_M

Route102GameHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

N64HouseScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GO_LOOK_FOR_PEOPLE_FOR_GAME_HOUSE
	iftrue .AlreadyAskedToSearchN64
	writetext N64HouseScientistText
	buttonsound
	writetext N64HouseScientistText2
	waitbutton
	closetext
	setevent EVENT_GO_LOOK_FOR_PEOPLE_FOR_GAME_HOUSE
	end

.AlreadyAskedToSearchN64
	checkevent EVENT_YOUNGSTER_FROM_BIRDON_IN_GAME_HOUSE
	iffalse .N64OnePersonSoFar
	writetext N64HouseScientistText2
	waitbutton
	closetext
	end
	
.N64OnePersonSoFar
	checkevent EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	iffalse .N64TwoPeopleNow
	writetext N64HouseScientistText3
	waitbutton
	closetext
	end
	
.N64TwoPeopleNow
	checkevent EVENT_LASS_FROM_KUME_AND_FRIENDS
	iffalse .N643PeopleTimeForStarter3
	writetext N64HouseScientistText4
	waitbutton
	closetext
	end
	
.N643PeopleTimeForStarter3
	checkevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	iftrue .AlreadyGotStarter3
	writetext N64HouseScientistText5
	waitbutton
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .HaveCruiseGiveCubburn
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .HaveChikoritaGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg CHIKORITA, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	end
	
.HaveChikoritaGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg PALSSIO, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	end
	
.HaveCruiseGiveCubburn
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg CUBBURN, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	end
	
.AlreadyGotStarter3
	writetext AlreadyGotStarter3Text
	waitbutton
	closetext
	end
	
.eggname3
	db "HUEVO@"
	
.GetStarter3Egg:
	jumpstd ReceiveTogepiEggScript
	end
	
.PartyFullStarter3
	writetext NoRoomForStarter3
	waitbutton
	closetext
	end
	
N64HouseRockerScript:
	faceplayer
	opentext
	writetext N64HouseRockerText
	waitbutton
	closetext
	turnobject N64_HOUSE_ROCKER, RIGHT
	end

N64HouseYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	iffalse .RockerTwoPeopleNow
	writetext RockerN64AloneText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
.RockerTwoPeopleNow
	writetext RockerN64TwoPeopleText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
N64HouseLassScript:
	faceplayer
	opentext
	writetext N64HouseLassText
	waitbutton
	closetext
	turnobject N64_HOUSE_LASS, UP
	end
	
N64HouseCooltrainerMScript:
	faceplayer
	opentext
	writetext N64HouseCooltrainerMText
	waitbutton
	closetext
	turnobject N64_HOUSE_COOLTRAINER_M, LEFT
	end
	
N64HouseFisherScript:
	jumptextfaceplayer N64HouseFisherText
	
N64HouseN64Script:
	jumptext N64HouseN64Text
	
N64HouseN64Text:
	text "<PLAYER> jugó a"
	line "la N64."

	para "Mejor irse. No hay"
	line "tiempo que perder."
	done
	
N64HouseFisherText:
	text "¿Debería jugar con"
	line "ellos a ese juego"
	cont "de carreras?"
	
	para "No creo que se me"
	line "dé bien."
	done
	
N64HouseCooltrainerMText:
	text "¡Este sitio tiene"
	line "una gran colección"
	cont "de juegos de"
	cont "deportes!"
	done
	
N64HouseLassText:
	text "No soy buena en"
	line "los juegos de"
	para "deportes, pero mi"
	line "amigo me ayuda a"
	cont "mejorar."
	done
	
TakeGoodCareOfStarter3:
	text "Sé que cuidarás"
	line "bien de este"
	cont "#MON."
	done
	
NoRoomForStarter3:
	text "¡Espera! ¡No"
	line "tienes sitio para"
	cont "esto!"
	done
	
AlreadyGotStarter3Text:
	text "¡Este sitio es el"
	line "mejor punto de"
	para "encuentro para los"
	line "entrenadores que"
	para "quieren charlar y"
	line "jugar videojuegos!"
	
	para "¡Y todo gracias"
	line "a ti!"
	done
	
N64HouseScientistText5:
	text "Guau, mira todos"
	line "esos entrenadores."
	
	para "¡Es increíble!"
	line "¡Te debo mucho!"
	
	para "Ten, toma este"
	line "HUEVO #MON."
	
	para "Es un #MON"
	line "raro, estoy seguro"
	cont "que te gustará."
	done
	
N64HouseRockerText:
	text "¡Voy a ganar!"
	done

RockerN64AloneText:
	text "Este juego de"
	line "carreras mola,"
	para "¡pero no hay"
	line "nadie con quien"
	cont "competir!"
	
	para "Vine para conocer"
	line "a otros entrenado-"
	cont "res, pero estoy"
	cont "solo."
	done
	
RockerN64TwoPeopleText:
	text "¡Eh, es mucho más"
	line "divertido con otra"
	cont "persona!"
	done

N64HouseScientistText4:
	text "¡Guau, dos"
	line "personas!"
	
	para "¡Puede que mi"
	line "sueño de tener un"
	para "buen sitio de"
	line "encuentro para"
	para "entrenadores"
	line "#MON se haga"
	cont "realidad!"
	
	para "¡A ver si puedes"
	line "encontrar a otro"
	cont "más!"
	
	para "A lo mejor en"
	line "algún sitio donde"
	para "se reúna gente,"
	line "pero no tengan"
	cont "videojuegos que"
	cont "jugar…"
	done
	
N64HouseScientistText3:
	text "¡Anda, ha venido"
	line "alguien!"
	
	para "¡Qué bien!"
	
	para "¿Le has hablado de"
	line "este sitio?"
	
	para "Te lo agradezco"
	line "mucho."
	
	para "¡A ver si puedes"
	line "encontrar a otro"
	cont "más!"
	
	para "A lo mejor en"
	line "algún sitio donde"
	para "la gente pruebe"
	line "otra clase de"
	cont "juegos…"
	done
	
N64HouseScientistText2:
	text "¿Qué te parece?"
	
	para "Si conoces"
	line "entrenadores a los"
	para "que pudiera"
	line "interesarles venir"
	cont "aquí, díselo."
	
	para "A lo mejor en"
	line "algún pueblo donde"
	cont "no haya mucho que"
	cont "hacer…"
	done

N64HouseScientistText:
	text "Mmm."
	
	para "Abrí este salón"
	line "recreativo para"
	para "que los entrenado-"
	line "res tuvieran"
	para "donde reunirse y"
	line "charlar entre sus"
	cont "combates."
	
	para "Pero no parece que"
	line "atraiga a nadie…"
	
	para "Oye, si conoces"
	line "algún entrenador"
	para "al que pudiera"
	line "interesarle un"
	para "sitio como este,"
	line "¿se lo dirías?"
	done
	
Route102GameHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_102, 2
	warp_event  5,  7, ROUTE_102, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  3, BGEVENT_READ, N64HouseN64Script
	bg_event  0,  3, BGEVENT_READ, N64HouseN64Script


	db 6 ; object events
	object_event 6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, N64HouseScientistScript, -1
	object_event 4,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, N64HouseYoungsterScript, EVENT_YOUNGSTER_FROM_BIRDON_IN_GAME_HOUSE
	object_event 3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, N64HouseRockerScript, EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	object_event 0,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, N64HouseLassScript, EVENT_LASS_FROM_KUME_AND_FRIENDS
	object_event 1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, N64HouseCooltrainerMScript, EVENT_LASS_FROM_KUME_AND_FRIENDS
	object_event 7,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, N64HouseFisherScript, EVENT_LASS_FROM_KUME_AND_FRIENDS
