	object_const_def ; object_event constants
	const STANDCITY_ROCKER
	const STANDCITY_POKEFAN_M
	const STANDCITY_TWIN
	const STANDCITY_TEACHER
	const STANDCITY_FRUIT_TREE
	const STANDCITY_MONSTER1
	const STANDCITY_MONSTER2
	const STANDCITY_MONSTER3
	const STANDCITY_BIRD
	const STANDCITY_FAIRY
	const STANDCITY_BLOCKROCKET1
;	const STANDCITY_BLOCKROCKET2
;	const STANDCITY_BLOCKROCKET3
;	const STANDCITY_BLOCKROCKET4
	const STANDCITY_IMPOSTOR
	const STANDCITY_HQBLOCKROCKET
	const STANDCITY_NATIONALBLOCKROCKET

StandCity_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneStandCityNothing ; SCENE_DEFAULT
	scene_script .SceneStandCityImposter ;

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .StandCityBlockFence

.SceneStandCityNothing
	end

.SceneStandCityImposter
	end


.FlyPoint:
	setflag ENGINE_FLYPOINT_STAND
	return
	
.StandCityBlockFence:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .Done20
	changeblock  29, 35, $4C ; rock
	changeblock  31, 35, $39 ; rock
.Done20:
	return
	
ImposterIntro1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	jump ImposterSceneScript
	end
	
ImposterIntro2:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	applymovement PLAYER, ImposterSceneMove1
	jump ImposterSceneScript
	end
	
ImposterSceneScript:
	moveobject STANDCITY_TEACHER, 27, 23
	moveobject STANDCITY_TWIN, 29, 23
	moveobject STANDCITY_ROCKER, 28, 24
	moveobject STANDCITY_POKEFAN_M, 27, 25
	appear STANDCITY_POKEFAN_M
	appear STANDCITY_ROCKER
	appear STANDCITY_TWIN
	applymovement PLAYER, ImposterSceneMove2
	turnobject STANDCITY_POKEFAN_M, RIGHT
	applymovement PLAYER, ImposterSceneMove2_5
	turnobject STANDCITY_TEACHER, LEFT
	applymovement PLAYER, ImposterSceneMove2_7
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 25
	turnobject STANDCITY_TEACHER, UP
	pause 3
	turnobject STANDCITY_ROCKER, UP
	pause 3
	turnobject STANDCITY_POKEFAN_M, UP
	pause 30
	opentext
	writetext ImposterText1
	waitbutton
	closetext
	moveobject STANDCITY_IMPOSTOR, 29, 19
	appear STANDCITY_IMPOSTOR
	applymovement STANDCITY_IMPOSTOR, ImposterWalksDown
	pause 10
	opentext
	writetext ImposterText2
	waitbutton
	closetext
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_ROCKER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TEACHER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_POKEFAN_M, 5
	pause 15
	opentext
	writetext ImposterText3
	waitbutton
	closetext
	pause 10
	applymovement STANDCITY_IMPOSTOR, ImposterWalksUp
	disappear STANDCITY_IMPOSTOR
	setevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	setscene SCENE_DEFAULT
	playmusic MUSIC_KANTO_REGION
	end


StandCityRocker:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RockerRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .RockerAfterImposter
	writetext StandCityRockerText
	waitbutton
	closetext
	end
	
.RockerRocketsGone
	writetext StandCityRockerAllGoodText
	waitbutton
	closetext
	end
	
.RockerAfterImposter
	writetext StandCityRockerImposterText
	waitbutton
	closetext
	end

StandCityPokefanM:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .PokefanRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .PokefanAfterImposter
	writetext StandCityPokefanMText
	waitbutton
	closetext
	end
	
.PokefanRocketsGone
	writetext StandCityPokefanAllGoodText
	waitbutton
	closetext
	end
	
.PokefanAfterImposter
	writetext StandCityPokefanImposterText
	waitbutton
	closetext
	end


StandCityTwin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TwinRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .TwinAfterImposter
	writetext StandCityTwinText
	waitbutton
	closetext
	end
	
.TwinRocketsGone
	writetext StandCityTwinAllGoodText
	waitbutton
	closetext
	end
	
.TwinAfterImposter
	writetext StandCityTwinImposterText
	waitbutton
	closetext
	end
	
StandCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TeacherRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .TeacherAfterImposter
	writetext StandCityTeacherText
	waitbutton
	closetext
	end
	
.TeacherRocketsGone
	writetext StandCityTeacherAllGoodText
	waitbutton
	closetext
	end
	
.TeacherAfterImposter
	writetext StandCityTeacherImposterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket1:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket1AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket1AfterImposter
	writetext BlockRocket1BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket1AfterBase
	writetext BlockRocket1AfterBaseText
	waitbutton
	closetext
	end

.BlockRocket1AfterImposter
	writetext BlockRocket1AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket2:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket2AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket2AfterImposter
	writetext BlockRocket2BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket2AfterBase
	writetext BlockRocket2AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket2AfterImposter
	writetext BlockRocket2AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket3:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket3AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket3AfterImposter
	writetext BlockRocket3BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket3AfterBase
	writetext BlockRocket3AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket3AfterImposter
	writetext BlockRocket3AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket4:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket4AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket4AfterImposter
	writetext BlockRocket4BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket4AfterBase
	writetext BlockRocket4AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket4AfterImposter
	writetext BlockRocket4AfterText
	waitbutton
	closetext
	end
	

StandCitySign:
	jumptext StandCitySignText

StandCityGymSign:
	jumptext StandCityGymSignText

ZooMedicalSign:
	jumptext ZooMedicalSignText

StandZooKangaskhanSign:
	jumptext StandZooKangaskhanSignText

StandZooClefairySign:
	jumptext StandZooClefairySignText
	
StandZooAmpharosSign:
	jumptext StandZooAmpharosSignText
	
StandZooSkarmorySign:
	jumptext StandZooSkarmorySignText
	
StandZooGolduckSign:
	jumptext StandZooGolduckSignText

StandZooOfficeSign:
	jumptext StandZooOfficeSignText

StandCityPokecenterSign:
;	setevent EVENT_STAND_CITY_ZOO_MONS
;	clearevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
;	clearevent EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
	jumpstd PokecenterSignScript

StandCityMartSign:
	jumpstd MartSignScript

StandCityFruitTree:
	fruittree FRUITTREE_TREE_STAND_CITY
	
StandCityHQBlockRocket:
	jumptextfaceplayer StandCityHQBlockRocketText
	
StandCityNationalBlockRocket:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketText
	waitbutton
	closetext
	end

.NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketAfterBaseText
	waitbutton
	closetext
	end

ImposterSceneMove1:
	step LEFT
	step_end
	
ImposterSceneMove2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end
	
ImposterSceneMove2_5:
	step UP
	step UP
	step_end
	
ImposterSceneMove2_7:
	step UP
	step UP
	step UP
	step UP
	step_end
	
ImposterWalksDown:
	step DOWN
	step DOWN
	step_end
	
ImposterWalksUp:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
StandCityNationalBlockRocketAfterBaseText:
	text "Siempre me siento"
	line "fuera de lugar…"
	para "Nadie me dice lo"
	line "que está pasando"
	cont "aquí…"
	done

BlockRocket4AfterBaseText:
	text "¿Se ha ido todo el"
	line "mundo?"
	para "Tú no habrás"
	line "tenido nada que"
	cont "ver, ¿no?"
	done

BlockRocket3AfterBaseText:
	text "Dicen que han"
	line "acabado con nues-"
	cont "tra banda en"
	cont "CIUDAD PONIENTE."

	para "¿Pero eso qué"
	line "significa?"
	para "¿Qué ha pasado con"
	line "nuestra base?"
	done

BlockRocket2AfterBaseText:
	text "¿Es verdad?"
	para "He oído que la"
	line "base está vacía."

	para "¿Entonces por qué"
	line "seguimos aquí?"
	done

BlockRocket1AfterBaseText:
	text "¿La base está"
	line "vacía?"
	para "¿Dónde han ido"
	line "todos?"
	done

StandCityHQBlockRocketText:
	text "A ninguno nos"
	line "gusta proteger la"
	cont "entrada de este"
	cont "edificio."

	para "Yo casi he acabado"
	line "ya mi turno."

	para "Espero que mi"
	line "relevo se presente"
	cont "esta vez…"
	done

StandCityNationalBlockRocketText:
	text "¡Nadie tiene por"
	line "qué entrar al"
	cont "PARQUE NACIONAL"
	cont "ahora!"

	para "No mientras los"
	line "#MON estén"
	cont "enfermos."

	para "¿Ves? Me importa"
	line "su salud."
	done

BlockRocket1BeforeText:
	text "¡No hay nada al"
	line "sur de aquí!"

	para "¡Deberías quedarte"
	line "en el pueblo!"

	para "¡No te pierdas a"
	line "nuestro gran"
	cont "orador!"
	done

BlockRocket1AfterText:
	text "¡Eh, niño!"

	para "¿No te parece que"
	line "el verdadero y"
	para "único PROF. OAK ha"
	line "dado un gran"
	cont "discurso?"
	done

BlockRocket2BeforeText:
	text "No te marches del"
	line "pueblo."

	para "¡Pronto tendremos"
	line "a un invitado"
	cont "especial!"
	done

BlockRocket2AfterText:
	text "¡Nuestra investi-"
	line "gación mejorará el"
	cont "mundo!"
	done

BlockRocket3BeforeText:
	text "¡No hay nada al"
	line "sur de aquí!"

	para "¡Deberías quedarte"
	line "en el pueblo!"
	done

BlockRocket3AfterText:
	text "¡Esta gente adora"
	line "al PROF. OAK!"
	done

BlockRocket4BeforeText:
	text "¡Ya casi es hora"
	line "de que el mundo"
	cont "escuche nuestro"
	cont "plan!"
	done

BlockRocket4AfterText:
	text "Estamos preparando"
	line "algo grande, ¿no"
	cont "lo has oído?"
	done

ImposterText1:
	text "¡Habitantes de"
	line "CIUDAD ENHIESTA!"
	done

ImposterText2:
	text "¡Soy yo, el mun-"
	line "dialmente conocido"
	cont "PROF. OAK!"

	para "¡Os traigo grandes"
	line "noticias sobre un"
	para "descubrimiento en"
	line "la investigación"
	cont "#MON!"

	para "¡Me he unido al"
	line "TEAM ROCKET para"
	cont "traeros esta nueva"
	cont "tecnología!"
	done

ImposterText3:
	text "¡Que no cunda el"
	line "pánico!"

	para "¡El TEAM ROCKET ha"
	line "hecho un gran"
	para "trabajo desarro-"
	line "llando una potente"
	para "señal de radio que"
	line "es capaz de leer"
	para "los pensamientos"
	line "de los #MON!"

	para "¡Y está siendo"
	line "desarrollada aquí,"
	cont "en CIUDAD"
	cont "ENHIESTA!"

	para "Aunque la señal"
	line "puede tener el"
	para "efecto secundario"
	line "de hacer enfermar"
	para "a los #MON"
	line "expuestos…"
	para "…"
	para "¡Pero ignorad eso!"

	para "¡Estarán bien!"

	para "¡Los resultados de"
	line "esta investigación"
	para "nos permitirán"
	line "comprender a los"
	cont "#MON mejor que"
	cont "nunca!"

	para "Podéis creerme,"
	line "porque tal y como"
	cont "veis, soy el PROF."
	cont "OAK."

	para "¡Eso es todo!"
	done

StandCityRockerText:
	text "Los #MON que"
	line "suelen estar en el"
	cont "ZOO no se sienten"
	cont "bien."

	para "Los guardias del"
	line "parque de CIUDAD"
	para "ENHIESTA los están"
	line "manteniendo en su"
	cont "CENTRO #MON."
	done

StandCityRockerAllGoodText:
	text "¿No era el verda-"
	line "dero PROF. OAK?"
	para "¡Qué locura!"

	para "Me alegra que los"
	line "#MON se estén"
	cont "sintiendo mejor."
	done

StandCityRockerImposterText:
	text "¿El TEAM ROCKET"
	line "tiene la culpa de"
	para "que los #MON se"
	line "sientan mal?"
	para "Pero el PROF. OAK"
	line "me dijo que"
	para "estarían bien y"
	line "que era parte de"
	para "una importante"
	line "investigación…"
	para "Y yo confío en él."
	done

StandCityPokefanMText:
	text "Me decepciona que"
	line "los #MON no"
	cont "estén fuera."

	para "Pero es más"
	line "importante que se"
	cont "pongan bien."
	done

StandCityPokefanImposterText:
	text "¿El PROF. OAK"
	line "tiene la culpa de"
	para "que los #MON se"
	line "sientan mal?"
	para "Debe tener un buen"
	line "motivo…"
	done

StandCityPokefanAllGoodText:
	text "¡Me alegra que los"
	line "#MON ya se"
	cont "sientan bien!"
	done

StandCityTwinText:
	text "El ZOO de CIUDAD"
	line "ENHIESTA está"
	cont "cerrado…"
	para "Es una lástima,"
	line "porque es la"
	para "atracción princi-"
	line "pal de la ciudad."

	para "Espero que los"
	line "#MON estén"
	cont "bien."
	done

StandCityTwinImposterText:
	text "¿Ha vuelto el TEAM"
	line "ROCKET?"
	para "¿Y con el PROF."
	line "OAK?"
	para "Algo no me cuadra…"
	done

StandCityTwinAllGoodText:
	text "¡Bien! ¡Han vuelto"
	line "a abrir el ZOO!"
	done

StandCityTeacherText:
	text "¿Qué hacen todos"
	line "esos miembros del"
	cont "TEAM ROCKET aquí?"
	para "¡Me da mala"
	line "espina!"
	done

StandCityTeacherImposterText:
	text "El PROF. OAK"
	line "estaba raro…"
	done

StandCityTeacherAllGoodText:
	text "Me alegra que todo"
	line "haya vuelto a la"
	cont "normalidad."
	done

StandCitySignText:
	text "CIUDAD ENHIESTA"

	para "Una utopía para"
	line "humanos y #MON"
	cont "por igual"
	done

StandCityGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "ENHIESTA: VELASCO"

	para "El chico que"
	line "brilla en la"
	cont "oscuridad"
	done

ZooMedicalSignText:
	text "ZOO DE CIUDAD"
	line "ENHIESTA"
	para "CENTRO MÉDICO"
	done

StandZooKangaskhanSignText:
	text "#MON:"
	line "KANGASKHAN"
	para "Tiene la costumbre"
	line "de dormir de pie"
	para "para no aplastar a"
	line "la cría que lleva"
	cont "acurrucada en la"
	cont "bolsa."
	done

StandZooClefairySignText:
	text "#MON:"
	line "CLEFAIRY"
	para "Aunque no es muy"
	line "común, se le puede"
	para "ver por la noche."
	line "Curiosamente,"
	para "ocurre en noches"
	line "de luna llena."
	done
	
StandZooAmpharosSignText:
	text "#MON:"
	line "AMPHAROS"
	para "Al anochecer, la"
	line "luz intensa que se"
	para "desprende del ex-"
	line "tremo de la cola"
	para "puede apreciarse"
	line "desde muy lejos."
	done
	
StandZooSkarmorySignText:
	text "#MON:"
	line "SKARMORY"
	para "Tiene unas plumas"
	line "en las alas muy"
	para "afiladas. Dicen"
	line "que, antiguamente,"
	para "se utilizaban a"
	line "modo de espadas."
	done
	
StandZooGolduckSignText:
	text "#MON:"
	line "GOLDUCK"
	para "Nada con elegancia"
	line "por las tranquilas"
	para "aguas de ríos y"
	line "lagos, donde se"
	cont "siente como pez en"
	cont "el agua."
	done

StandZooOfficeSignText:
	text "ZOO DE CIUDAD"
	line "ENHIESTA"
	para "Oficina principal"
	done

StandCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 35, 26, STAND_MART, 1
	warp_event 16, 21, STAND_CITY_ZOO_OFFICE, 1
	warp_event 34, 31, STAND_GYM, 1
	warp_event 26, 29, BILLS_BROTHERS_HOUSE, 1
	warp_event 33, 20, STAND_POKECENTER_1F, 1
	warp_event 17, 31, STAND_CITY_ROCKET_HOUSE, 1
	warp_event  1,  0, SAFARI_ZONE_STAND_GATE_BETA, 3 ; inaccessible
	warp_event 30, 13, ROUTE_112_STAND_GATE, 3
	warp_event 31, 13, ROUTE_112_STAND_GATE, 4
	warp_event  6, 17, STAND_CITY_NATIONAL_PARK_GATE, 4
	warp_event  0,  0, MERIDIAN_PATH_RYUKYU_GATE, 2
	warp_event 35, 31, STAND_GYM, 2
	warp_event 24, 17, STAND_POKE, 1


	db 2 ; coord events
	coord_event  34, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro1
	coord_event  35, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro2

	db 11 ; bg events
	bg_event 36, 20, BGEVENT_READ, StandCitySign
	bg_event 32, 35, BGEVENT_READ, StandCityGymSign
	bg_event 24, 20, BGEVENT_READ, ZooMedicalSign
	bg_event  8,  8, BGEVENT_READ, StandZooKangaskhanSign
	bg_event 18, 21, BGEVENT_READ, StandZooOfficeSign
	bg_event 34, 20, BGEVENT_READ, StandCityPokecenterSign
	bg_event 36, 26, BGEVENT_READ, StandCityMartSign
	bg_event 14,  8, BGEVENT_READ, StandZooClefairySign
	bg_event 20, 10, BGEVENT_READ, StandZooAmpharosSign
	bg_event 16, 16, BGEVENT_READ, StandZooSkarmorySign
	bg_event 10, 20, BGEVENT_READ, StandZooGolduckSign

	db 14 ; object events
	object_event 28, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityRocker, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityPokefanM, -1
	object_event 14, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, StandCityTwin, -1
	object_event 28, 30, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, StandCityTeacher, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, StandCityFruitTree, -1
	object_event 20,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 15, 14, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 12,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 28, 34, SPRITE_STAND_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket1, EVENT_CLEARED_RADIO_TOWER
	object_event -5, -5, SPRITE_STAND_CITY_IMPOSTOR, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17, 32, SPRITE_STAND_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandCityHQBlockRocket, EVENT_BEAT_OKERA
	object_event  6, 18, SPRITE_STAND_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandCityNationalBlockRocket, EVENT_CLEARED_RADIO_TOWER

