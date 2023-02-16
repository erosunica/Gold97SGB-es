	object_const_def ; object_event constants
	const KANTO_FISHER
	const KANTO_COOLTRAINER_M
	const KANTO_TEACHER
	const KANTO_POKEFAN_M
	const KANTO_LASS
	const KANTO_SUPER_NERD
	const KANTO_YOUNGSTER
	const KANTO_FISHER_2
	const KANTO_LASS_2
	const KANTO_ITEMBALL
	const KANTO_FISHER_3

KantoRegion_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .RedsHouseLocked

.RedsHouseLocked:
	checkevent EVENT_BEAT_ACTUALLY_RED
	iftrue .RedsHouseUnlocked
	changeblock  5, 39, $30 ; locked door
	return
	
.RedsHouseUnlocked
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_KANTO
	return
	
KantoRegionTMDetect:
	itemball TM_DETECT

KantoFisherScript:
	jumptextfaceplayer KantoFisherText
	
KantoFisher3Script:
	jumptextfaceplayer KantoFisher3Text

KantoSign:
	jumptext KantoSignText
	
KantoPokecenterSign:
	jumpstd PokecenterSignScript
	
KantoGymSign:
	jumptext KantoGymSignText
	
KobanIslandSign2:
	jumptext KobanIslandSignText2
	
RedsHouseSign2:
	jumptext RedsHouseSignText2
	
BluesHouseSign2:
	jumptext BluesHouseSignText2
	
OaksLabSign2:
	jumptext OaksLabSign2Text
	
KantoMartSign:
	jumpstd MartSignScript
	
KantoDeptSign:
	jumptext KantoDeptSignText
	
KantoMansionSign:
	jumptext KantoMansionSignText
	
KantoBattleClubSign:
	jumptext KantoBattleClubSignText
	
PokemonTowerSign:
	jumptext PokemonTowerSignText
	
RedsHouseLockedSign:
	opentext
	checkevent EVENT_BEAT_ACTUALLY_RED
	iftrue .RedsDoorUnlocked
	writetext Text_Reds_Door_Locked
	waitbutton
	closetext
	end
	
.RedsDoorUnlocked
	writetext Text_Reds_Door_Unocked
	waitbutton
	closetext
	end
	
KantoCooltrainerMScript:
	jumptextfaceplayer KantoCooltrainerMText
	
KantoTeacherScript:
	jumptextfaceplayer KantoTeacherText
	
KantoPokefanMScript:
	jumptextfaceplayer KantoPokefanMText

KantoLassScript:
	jumptextfaceplayer KantoLassText
	
KantoSuperNerdScript:
	jumptextfaceplayer KantoSuperNerdText
	
KantoYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ACTUALLY_RED
	iftrue .YoungsterAfterScript
	writetext KantoYoungsterText
	waitbutton
	closetext
	end
	
.YoungsterAfterScript
	writetext KantoYoungsterTextAfter
	waitbutton
	closetext
	end	
	
KantoFisher2Script:
	jumptextfaceplayer KantoFisher2Text
	
KantoLass2Script:
	jumptextfaceplayer KantoLass2Text

Text_Reds_Door_Locked:
	text "La puerta está"
	line "cerrada…"
	done
	
Text_Reds_Door_Unocked:
	text "Está abierto."
	done
	
KantoFisher3Text:
	text "¿Volver a un lugar"
	line "conocido no te"
	para "hace sentir cali-"
	line "dez y nostalgia?"
	done

KantoLass2Text:
	text "¡Los CIENTÍFICOS"
	line "de este labora-"
	cont "torio son"
	cont "asombrosos!"

	para "¡Han revivido mi"
	line "fósil y ahora es"
	cont "un #MON!"
	done

KantoFisher2Text:
	text "¡Chico, me encanta"
	line "pescar!"

	para "¡Y esta zona es"
	line "estupenda para"
	cont "hacerlo!"
	done

KantoYoungsterText:
	text "Un día, quiero"
	line "poder ganar en"
	cont "este GIMNASIO."

	para "Aunque no creo que"
	line "lo consiga."

	para "Muy pocos logran"
	line "ser tan buenos"
	cont "como el LÍDER de"
	cont "GIMNASIO."
	done

KantoYoungsterTextAfter:
	text "¿Has vencido a"
	line "ROJO?"

	para "¡Impresionante!"
	
	para "¡Debes de ser muy"
	line "fuerte!"
	done

KantoSuperNerdText:
	text "El dueño de este"
	line "CASINO adquirió"
	para "hace poco la"
	line "propiedad del"
	para "nuevo que abrieron"
	line "en la PASARELA."
	done

KantoLassText:
	text "¿Conoces SILPH"
	line "S.A.?"

	para "Si no la conoces,"
	line "deberías."

	para "¡Seguramente las"
	line "# BALLS en las"
	para "que están tus"
	line "#MON las"
	cont "hicieron ellos!"
	done

KantoPokefanMText:
	text "Nunca he sido un"
	line "gran entrenador."

	para "Sí, entreno"
	line "#MON y combato"
	cont "con ellos."

	para "Pero es más bien"
	line "un pasatiempo."

	para "El tipo del CLUB"
	line "BATALLA de KANTO"
	cont "no me dejó pasar…"
	done

KantoFisherText:
	text "¡La tecnología es"
	line "increíble!"

	para "¡Ahora puedes"
	line "intercambiar"
	para "#MON a través"
	line "del tiempo!"
	done

KantoSignText:
	text "KANTO"

	para "La joya de la"
	line "corona del sur de"
	cont "NIHON"
	done

KantoGymSignText:
	text "GIMNASIO #MON"
	line "DE KANTO"
	done

KobanIslandSignText2:
	text "PUEBLO PALETA"

	para "Un tranquilo lugar"
	line "de paz y pureza"
	done

RedsHouseSignText2:
	text "CASA DE ROJO"
	done

BluesHouseSignText2:
	text "CASA DE AZUL"
	done

OaksLabSign2Text:
	text "LABORATORIO DE"
	line "INVESTIGACIÓN"
	cont "#MON del PROF."
	cont "OAK"

	para "AVISO: El PROF."
	line "OAK se encuentra"
	para "investigando en"
	line "PUEBLO SILENTE."
	done

KantoDeptSignText:
	text "CENTRO COMERCIAL"
	line "DE KANTO"

	para "¡Una gran gama de"
	line "artículos #MON!"
	done
	
KantoMansionSignText:
	text "EDIFICIO KANTO"
	done
	
KantoBattleClubSignText:
	text "CLUB BATALLA DE"
	line "KANTO"

	para "Un club de grandes"
	line "entrenadores. Solo"
	cont "para miembros."
	done

PokemonTowerSignText:
	text "TORRE #MON"

	para "Un monumento a los"
	line "#MON que han"
	cont "partido."
	done

KantoCooltrainerMText:
	text "Hay un concurso de"
	line "comida en el"
	cont "restaurante."

	para "Solo verlos comer"
	line "me hace sentir"
	cont "lleno…"
	done

KantoTeacherText:
	text "El CENTRO"
	line "COMERCIAL de KANTO"
	para "tiene la mejor"
	line "selección de"
	cont "artículos."

	para "¡Si no los"
	line "consigues allí, no"
	para "los conseguirás en"
	line "ninguna parte!"

	para "Sueno como una"
	line "vendedora…"
	done

KantoRegion_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event 14, 17, KANTO_DEPT_STORE_1F, 1
	warp_event 22, 19, KANTO_MANSION_1F, 1
	warp_event 22, 13, KANTO_MANSION_1F, 3
	warp_event 23, 13, KANTO_MANSION_1F, 3
	warp_event 49, 30, KANTO_POKECENTER_1F, 1
	warp_event 28, 25, KANTO_GAME_CORNER, 1
	warp_event 33, 25, KANTO_GAME_CORNER_PRIZE_ROOM, 1
	warp_event  4,  5, KANTO_GYM, 1
	warp_event 40, 23, KANTO_CAFE, 1
	warp_event  6, 27, ROUTE_115_KANTO_GATE, 4
	warp_event 30, 19, SILPH_CO_1F, 1
	warp_event 31, 19, SILPH_CO_1F, 2
	warp_event 15, 17, KANTO_DEPT_STORE_1F, 2
	warp_event 23, 19, KANTO_MANSION_1F, 2
	warp_event  5,  5, KANTO_GYM, 2
	warp_event 36, 31, KANTO_HOTEL, 1
	warp_event 12, 43, OAKS_LAB, 1
	warp_event 13, 43, OAKS_LAB, 2
	warp_event 13, 38, BLUES_HOUSE, 1
	warp_event  5, 38, REDS_HOUSE_1F,1
	warp_event 13,  4, KANTO_2_POKECENTER_1F,1
	warp_event  5, 18, KANTO_MART,1
	warp_event 46,  3, KANTO_BATTLE_CLUB_1F, 1
	warp_event 16, 23, KANTO_HOUSE_1, 1
	warp_event 51, 11, KANTO_HOUSE_2, 1
	warp_event 39, 38, KANTO_HOUSE_3, 1
	warp_event 45, 44, KANTO_HOUSE_4, 1
	warp_event 52, 45, KANTO_LABORATORY, 1
	warp_event 53, 45, KANTO_LABORATORY, 2
	warp_event 52, 23, KANTO_RESTAURANT, 1
	warp_event 53, 23, KANTO_RESTAURANT, 2
	warp_event 29, 25, KANTO_GAME_CORNER, 2
	warp_event 37, 31, KANTO_HOTEL, 2



	db 0 ; coord events

	db 14 ; bg events
	bg_event 46, 18, BGEVENT_READ, KantoSign
	bg_event 14,  4, BGEVENT_READ, KantoPokecenterSign
	bg_event 50, 30, BGEVENT_READ, KantoPokecenterSign
	bg_event  8,  8, BGEVENT_READ, KantoGymSign
	bg_event  6, 41, BGEVENT_READ, KobanIslandSign2
	bg_event  8, 38, BGEVENT_READ, RedsHouseSign2
	bg_event 16, 38, BGEVENT_READ, BluesHouseSign2
	bg_event 12, 45, BGEVENT_READ, OaksLabSign2
	bg_event  6, 18, BGEVENT_READ, KantoMartSign
	bg_event 18, 18, BGEVENT_READ, KantoDeptSign
	bg_event 26, 19, BGEVENT_READ, KantoMansionSign
	bg_event 42,  4, BGEVENT_READ, KantoBattleClubSign
	bg_event 54,  8, BGEVENT_READ, PokemonTowerSign
	bg_event  5, 38, BGEVENT_READ, RedsHouseLockedSign

	db 11 ; object events
	object_event 14, 46, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoFisherScript, -1
	object_event 50, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoCooltrainerMScript, -1
	object_event 11, 19, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KantoTeacherScript, -1
	object_event 38,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoPokefanMScript, -1
	object_event 34, 21, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoLassScript, -1
	object_event 31, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoSuperNerdScript, -1
	object_event  5,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoYoungsterScript, -1
	object_event 40, 43, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoFisher2Script, -1
	object_event 51, 48, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoLass2Script, -1
	object_event 21, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoRegionTMDetect, EVENT_KIKAI_VILLAGE_TM_DETECT
	object_event  3, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoFisher3Script, -1
