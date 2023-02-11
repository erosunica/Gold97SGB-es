	object_const_def ; object_event constants
	const RYUKYU_GYM_LASS
	const RYUKYU_GYM_YOUNGSTER
	const RYUKYU_GYM_POKEFAN_M
	const RYUKYU_GYM_GYM_GUY


RyukyuGym_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RyukyuGymTypeChange
	
.RyukyuGymTypeChange:
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .GrassGym
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .FireGym
	jump .doneGym
.GrassGym:
	changeblock  3, 1, $3F ; grass
	changeblock  5, 1, $7D ; grass
	changeblock  3, 3, $3F ; grass
	changeblock  5, 3, $3F ; grass
	changeblock  3, 5, $3F ; grass
	changeblock  5, 5, $7D ; grass
	changeblock  3, 7, $3F ; grass
	changeblock  5, 7, $3F ; grass
	changeblock  3, 9, $3F ; grass
	changeblock  5, 9, $7D ; grass
	changeblock  3, 11, $3F ; grass
	changeblock  5, 11, $3F ; grass
	changeblock  3, 13, $3F ; grass
	changeblock  5, 13, $7D ; grass
	changeblock  3, 15, $3F ; grass
	changeblock  5, 15, $3F ; grass
	changeblock  3, 17, $3F ; grass
	changeblock  5, 17, $7D ; grass
	changeblock  13, 1, $7D ; grass
	changeblock  15, 1, $3F ; grass
	changeblock  13, 3, $3F ; grass
	changeblock  15, 3, $3F ; grass
	changeblock  13, 5, $7D ; grass
	changeblock  15, 5, $3F ; grass
	changeblock  13, 7, $3F ; grass
	changeblock  15, 7, $3F ; grass
	changeblock  13, 9, $7D ; grass
	changeblock  15, 9, $3F ; grass
	changeblock  13, 11, $3F ; grass
	changeblock  15, 11, $3F ; grass
	changeblock  13, 13, $7D ; grass
	changeblock  15, 13, $3F ; grass
	changeblock  13, 15, $3F ; grass
	changeblock  15, 15, $3F ; grass
	changeblock  13, 17, $7D ; grass
	changeblock  15, 17, $3F ; grass
	return
	
.FireGym:
	changeblock  3, 1, $3B ; fire
	changeblock  5, 1, $59 ; fire
	changeblock  3, 3, $3B ; fire
	changeblock  5, 3, $3B ; fire
	changeblock  3, 5, $3B ; fire
	changeblock  5, 5, $59 ; fire
	changeblock  3, 7, $3B ; fire
	changeblock  5, 7, $3B ; fire
	changeblock  3, 9, $3B ; fire
	changeblock  5, 9, $59 ; fire
	changeblock  3, 11, $3B ; fire
	changeblock  5, 11, $3B ; fire
	changeblock  3, 13, $3B ; fire
	changeblock  5, 13, $59 ; fire
	changeblock  3, 15, $3B ; fire
	changeblock  5, 15, $3B ; fire
	changeblock  3, 17, $3B ; fire
	changeblock  5, 17, $59 ; fire
	changeblock  13, 1, $59 ; fire
	changeblock  15, 1, $3B ; fire
	changeblock  13, 3, $3B ; fire
	changeblock  15, 3, $3B ; fire
	changeblock  13, 5, $59 ; fire
	changeblock  15, 5, $3B ; fire
	changeblock  13, 7, $3B ; fire
	changeblock  15, 7, $3B ; fire
	changeblock  13, 9, $59 ; fire
	changeblock  15, 9, $3B ; fire
	changeblock  13, 11, $3B ; fire
	changeblock  15, 11, $3B ; fire
	changeblock  13, 13, $59 ; fire
	changeblock  15, 13, $3B ; fire
	changeblock  13, 15, $3B ; fire
	changeblock  15, 15, $3B ; fire
	changeblock  13, 17, $59 ; fire
	changeblock  15, 17, $3B ; fire
	return
	
.doneGym
	return
	

	
RyukyuGymPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .GotChikoritaGiveCubburn
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .GotCruiseGiveChikorita
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .AfterBattleFakeGymWater
	writetext PokefanMBeforeTextWater
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, TREVOR
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_FAKE_GYM_LEADER
	opentext
.AfterBattleFakeGymWater
	checkevent EVENT_GOT_EGG_FROM_FAKE_GYM
	iftrue .AlreadyGotEgg2Water
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg PALSSIO, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_GOT_EGG_FROM_FAKE_GYM
.AlreadyGotEgg2Water
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotChikoritaGiveCubburn
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .AfterBattleFakeGymFire
	writetext PokefanMBeforeTextFire
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer HIKER, BAILEY
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_FAKE_GYM_LEADER
	opentext
.AfterBattleFakeGymFire
	checkevent EVENT_GOT_EGG_FROM_FAKE_GYM
	iftrue .AlreadyGotEgg2Fire
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CUBBURN, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_GOT_EGG_FROM_FAKE_GYM
.AlreadyGotEgg2Fire
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotCruiseGiveChikorita
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .AfterBattleFakeGymGrass
	writetext PokefanMBeforeTextGrass
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, CARTER
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_FAKE_GYM_LEADER
	opentext
.AfterBattleFakeGymGrass
	checkevent EVENT_GOT_EGG_FROM_FAKE_GYM
	iftrue .AlreadyGotEgg2Grass
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CHIKORITA, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_GOT_EGG_FROM_FAKE_GYM
.AlreadyGotEgg2Grass
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.PartyFullStarter2
	writetext NoRoomForStarter2
	waitbutton
	closetext
	end
	
.GetStarter2Egg:
	jumpstd ReceiveTogepiEggScript
	end
	
.eggname2
	db "HUEVO@"
	
Trainer1Scene:
	playmusic MUSIC_BEAUTY_ENCOUNTER
	showemote EMOTE_SHOCK, RYUKYU_GYM_LASS, 30
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Trainer1GotChikoritaUseFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Trainer1GotCruiseUseGrass
	writetext LassTextBeforeWater
	waitbutton
	closetext
	winlosstext LassWinTextWater, LassLossTextWater
	loadtrainer LASS, LINDA
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
.Trainer1GotChikoritaUseFire
	writetext LassTextBeforeFire
	waitbutton
	closetext
	winlosstext LassWinTextFire, LassLossTextFire
	loadtrainer LASS, ALICE
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
.Trainer1GotCruiseUseGrass
	writetext LassTextBeforeGrass
	waitbutton
	closetext
	winlosstext LassWinTextGrass, LassLossTextGrass
	loadtrainer PICNICKER, TANYA
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
Trainer2Scene:
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	showemote EMOTE_SHOCK, RYUKYU_GYM_YOUNGSTER, 30
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Trainer2GotChikoritaUseFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeWater
	waitbutton
	closetext
	winlosstext YoungsterWinTextWater, YoungsterLossTextWater
	loadtrainer SCHOOLBOY, KIPP
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end

.Trainer2GotChikoritaUseFire
	writetext YoungsterTextBeforeFire
	waitbutton
	closetext
	winlosstext YoungsterWinTextFire, YoungsterLossTextFire
	loadtrainer YOUNGSTER, JASON
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end

.Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeGrass
	waitbutton
	closetext
	winlosstext YoungsterWinTextGrass, YoungsterLossTextGrass
	loadtrainer YOUNGSTER, OWEN
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end
	
RyukyuGymYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Trainer2AfterFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Trainer2AfterGrass
	writetext Trainer2AfterWaterText
	waitbutton
	closetext
	end
.Trainer2AfterFire
	writetext Trainer2AfterFireText
	waitbutton
	closetext
	end
.Trainer2AfterGrass
	writetext Trainer2AfterGrassText
	waitbutton
	closetext
	end
	
RyukyuGymLassScript:
	jumptextfaceplayer RyukyuGymLassText
	
RyukyuGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .GymGuyFakeGymAfter
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .GymGuyFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .GymGuyGrass
	writetext GymGuyWaterText
	waitbutton
	closetext
	end
.GymGuyFire
	writetext GymGuyFireText
	waitbutton
	closetext
	end
.GymGuyGrass
	writetext GymGuyGrassText
	waitbutton
	closetext
	end
.GymGuyFakeGymAfter
	writetext GymGuyFakeGymAfterText
	waitbutton
	closetext
	end

GymGuyFakeGymAfterText:
	text "Desafiar un"
	line "GIMNASIO siempre"
	para "resulta divertido,"
	line "consigas una"
	cont "MEDALLA o no."
	done

GymGuyFireText:
	text "¿Qué es esto?"

	para "¿Un GIMNASIO"
	line "#MON?"

	para "Bueno, no del"
	line "todo."

	para "SERGI siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."

	para "Aunque serlo de"
	line "manera oficial es"
	cont "un proceso largo y"
	cont "tedioso."

	para "¡Pero aquí"
	line "estamos, haciendo"
	para "lo que nos toca"
	line "hasta que pueda"
	cont "serlo de verdad!"

	para "Ah, sí. Usa"
	line "#MON de tipo"
	cont "fuego."

	para "Seguro que ya"
	line "sabes qué necesi-"
	cont "tas para ganar."
	done

GymGuyWaterText:
	text "¿Qué es esto?"

	para "¿Un GIMNASIO"
	line "#MON?"

	para "Bueno, no del"
	line "todo."

	para "TIMOTEO siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."

	para "Aunque serlo de"
	line "manera oficial es"
	cont "un proceso largo y"
	cont "tedioso."

	para "¡Pero aquí"
	line "estamos, haciendo"
	para "lo que nos toca"
	line "hasta que pueda"
	cont "serlo de verdad!"

	para "Ah, sí. Usa"
	line "#MON de tipo"
	cont "agua."

	para "Seguro que ya"
	line "sabes qué necesi-"
	cont "tas para ganar."
	done

GymGuyGrassText:
	text "¿Qué es esto?"

	para "¿Un GIMNASIO"
	line "#MON?"

	para "Bueno, no del"
	line "todo."

	para "MAGNO siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."

	para "Aunque serlo de"
	line "manera oficial es"
	cont "un proceso largo y"
	cont "tedioso."

	para "¡Pero aquí"
	line "estamos, haciendo"
	para "lo que nos toca"
	line "hasta que pueda"
	cont "serlo de verdad!"

	para "Ah, sí. Usa"
	line "#MON de tipo"
	cont "planta."

	para "Seguro que ya"
	line "sabes qué necesi-"
	cont "tas para ganar."
	done

RyukyuGymLassText:
	text "¿A que mola?"

	para "¡Es como un"
	line "GIMNASIO de"
	cont "verdad!"
	done

Trainer2AfterFireText:
	text "SERGI siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."

	para "Pero es complicado"
	line "conseguir la"
	cont "acreditación."
	done

Trainer2AfterGrassText:
	text "MAGNO siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."

	para "Pero es complicado"
	line "conseguir la"
	cont "acreditación."
	done

Trainer2AfterWaterText:
	text "TIMOTEO siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."

	para "Pero es complicado"
	line "conseguir la"
	cont "acreditación."
	done

TakeGoodCareOfStarter2:
	text "¡Cuida bien de ese"
	line "#MON!"

	para "¡Es uno de mis"
	line "favoritos!"
	done

HaveStarter2Egg:
	text "¡Guau! ¡Menudo"
	line "combate!"

	para "Me siento como"
	line "todo un LÍDER de"
	para "GIMNASIO, incluso"
	line "aunque haya"
	cont "perdido."

	para "¡Como no puedo"
	line "darte una MEDALLA,"
	para "te daré un HUEVO"
	line "de un #MON"
	cont "raro de mi tipo"
	cont "favorito!"

	para "¡Esto es para ti!"
	done

NoRoomForStarter2:
	text "¡Espera!"
	line "¡Necesitas hacerle"
	cont "un hueco!"
	done

PokefanMBeforeTextWater:
	text "¡Hola!"

	para "¡Bienvenido a mi"
	line "GIMNASIO!"

	para "Aunque no es uno"
	line "oficial…"

	para "¡Pero ya verás!"

	para "¡Un día seré LÍDER"
	line "de GIMNASIO!"

	para "Por ahora, solo"
	line "puedo actuar como"
	cont "tal."

	para "¡Y no hay nada que"
	line "me guste más que"
	cont "un buen combate!"

	para "¡Los #MON de"
	line "tipo agua son mis"
	cont "favoritos!"

	para "¡Te dejarán"
	line "empapado si los"
	cont "enfrentas!"

	para "¿Estás listo?"
	done

PokefanMLossTextFake:
	text "¡Esto se me da"
	line "bien!"
	done

PokefanMWinTextFake:
	text "¡Jaja! ¡Qué buena"
	line "experiencia!"
	done

PokefanMBeforeTextGrass:
	text "¡Hola!"

	para "¡Bienvenido a mi"
	line "GIMNASIO!"

	para "Aunque no es uno"
	line "oficial…"

	para "¡Pero ya verás!"

	para "¡Un día seré LÍDER"
	line "de GIMNASIO!"

	para "Por ahora, solo"
	line "puedo actuar como"
	cont "tal."

	para "¡Y no hay nada que"
	line "me guste más que"
	cont "un buen combate!"

	para "¡Los #MON de"
	line "tipo planta son"
	cont "mis favoritos!"

	para "¡Sus hojas y sus"
	line "cepas acabarán"
	cont "contigo!"

	para "¿Estás listo?"
	done

PokefanMBeforeTextFire:
	text "¡Hola!"

	para "¡Bienvenido a mi"
	line "GIMNASIO!"

	para "Aunque no es uno"
	line "oficial…"

	para "¡Pero ya verás!"

	para "¡Un día seré LÍDER"
	line "de GIMNASIO!"

	para "Por ahora, solo"
	line "puedo actuar como"
	cont "tal."

	para "¡Y no hay nada que"
	line "me guste más que"
	cont "un buen combate!"

	para "¡Los #MON de"
	line "tipo fuego son mis"
	cont "favoritos!"

	para "¡Acabarás chamus-"
	line "cado si los"
	cont "enfrentas!"

	para "¿Estás listo?"
	done

YoungsterTextBeforeWater:
	text "¿Has nadado alguna"
	line "vez?"

	para "Mis #MON sí."
	done

YoungsterLossTextWater:
	text "¡Uau!"
	done

YoungsterWinTextWater:
	text "¡Sí que sabes"
	line "moverte por el"
	cont "agua!"
	done

YoungsterTextBeforeFire:
	text "¿Puedes soportar"
	line "el calor de este"
	cont "lugar?"
	done

YoungsterLossTextFire:
	text "¡Uau!"
	done

YoungsterWinTextFire:
	text "¡Me has"
	line "chamuscado!"
	done

YoungsterTextBeforeGrass:
	text "¡Cuidado con las"
	line "cepas de mis"
	cont "#MON!"
	done

YoungsterLossTextGrass:
	text "¡Uau!"
	done

YoungsterWinTextGrass:
	text "¡He tropezado!"
	done

LassTextBeforeGrass:
	text "¿No es un sitio"
	line "encantador?"

	para "¡He traído comida"
	line "para un picnic!"
	done

LassLossTextGrass:
	text "¡Uau!"
	done

LassWinTextGrass:
	text "Al menos sigue"
	line "corriendo la"
	cont "brisa."
	done

LassTextBeforeWater:
	text "¡Cuidado, podrías"
	line "resbalarte con el"
	cont "suelo!"
	done

LassLossTextWater:
	text "¡Uau!"
	done

LassWinTextWater:
	text "¡Me he resbalado!"
	done

LassTextBeforeFire:
	text "¡Nada mejor que un"
	line "combate ardiente"
	cont "en un lugar"
	cont "ardiente!"
	done

LassLossTextFire:
	text "¡Uau!"
	done

LassWinTextFire:
	text "¡Demasiado"
	line "ardiente!"
	done
	
RyukyuGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 9
	warp_event  9, 17, RYUKYU_CITY, 10


	db 2 ; coord events
	coord_event  8, 11, SCENE_DEFAULT, Trainer1Scene
	coord_event  7,  7, SCENE_RYUKYU_GYM_TRAINER_2, Trainer2Scene

	db 0 ; bg events

	db 4 ; object events
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuGymLassScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuGymYoungsterScript, -1
	object_event  9,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuGymPokefanMScript, -1
	object_event 10, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuGymGuyScript, -1
