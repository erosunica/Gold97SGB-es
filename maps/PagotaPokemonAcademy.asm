		object_const_def ; object_event constants
	const PAGOTAPOKEMONACADEMY_TEACHER
	const PAGOTAPOKEMONACADEMY_YOUNGSTER
	const PAGOTAPOKEMONACADEMY_YOUNGSTER1
	const PAGOTAPOKEMONACADEMY_GAMEBOY_KID1
	const PAGOTAPOKEMONACADEMY_GAMEBOY_KID2
	const PAGOTAPOKEMONACADEMY_YOUNGSTER2
	const PAGOTAPOKEMONACADEMY_POKEDEX

PagotaPokemonAcademy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyTeacher:
	faceplayer
	opentext
	writetext AcademyTeacherIntroText
	yesorno
	iffalse .Part1
	writetext AcademyTeacherTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyTeacherTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyTeacherTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyTeacherNoMoreToTeachText
	waitbutton
	closetext
	end

PagotaPokemonAcademyYoungster1Script:
	jumptextfaceplayer PagotaPokemonAcademyYoungster1Text

PagotaPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext PagotaPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject PAGOTAPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

PagotaPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext PagotaPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject PAGOTAPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

PagotaPokemonAcademyYoungster2Script:
	jumptextfaceplayer PagotaPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	jump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	jump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 12, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "ENV@"
	db "PAR@"
	db "DOR@"
	db "QUE@"
	db "CON@"
	db "SALIR@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd DifficultBookshelfScript

AcademyTeacherSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
AcademyGBChecker:
	faceplayer
	opentext
	writetext GBText1
	waitbutton
	special GameboyCheck
	ifnotequal GBCHECK_CGB, .NotGBCCheck
	writetext GBText2
	waitbutton
	closetext
	end
	
.NotGBCCheck
	special GameboyCheck
	ifnotequal GBCHECK_SGB, .NotSGBCheck
	writetext GBText4
	waitbutton
	closetext
	end

.NotSGBCheck	
	writetext GBText3
	waitbutton
	closetext
	end

GBText1:
	text "Hoy leí que según"
	line "dónde juegues el"
	cont "mundo se ve"
	cont "distinto."
	done

GBText2:
	text "¡Veo que estás"
	line "jugando en una"
	cont "Game Boy Color!"

	para "¡A todo color!"

	para "…"
	
	para "No me hagas mucho"
	line "caso, solo soy un"
	cont "niño."
	done

GBText3:
	text "¡Veo que estás"
	line "jugando en una"
	cont "Game Boy!"

	para "¡Autonomía total!" 

	para "…"
	
	para "No me hagas mucho"
	line "caso, solo soy un"
	cont "niño."
	done	

GBText4:
	text "¡Veo que estás"
	line "jugando con el"
	cont "Super Game Boy!"

	para "¡Uau! ¡Estoy en"
	line "la tele!"

	para "…"
	
	para "No me hagas mucho"
	line "caso, solo soy un"
	cont "niño."
	done

AcademyTeacherIntroText:
	text "¡Hola!"

	para "Bienvenido a la"
	line "escuela de"
	para "entrenadores de"
	line "CIUDAD PAGOTA."
	
	para "¿Quieres aprender"
	line "cómo funcionan los"
	cont "combates?"
	done

AcademyTeacherTeachHowToWinText:
	text "¡En un combate, el"
	line "primer #MON de"
	para "tu equipo es el"
	line "que sale a luchar!"

	para "Pensar en qué"
	line "#MON mantienes"
	para "el primero es una"
	line "buena estrategia."

	para "¿Quieres saber"
	line "más?"
	done

AcademyTeacherTeachMoreText:
	text "¿Quieres aprender"
	line "cómo criar bien a"
	cont "tus #MON?"
	done

AcademyTeacherTeachHowToRaiseWellText:
	text "Si un #MON sale"
	line "a combatir, aunque"
	para "sea un solo turno,"
	line "recibirá Puntos"
	cont "EXP."

	para "Puedes sacar"
	line "primero a un"
	para "#MON débil y"
	line "luego cambiarlo"
	para "por un #MON más"
	line "fuerte."

	para "Así, podrá ganar"
	line "experiencia."
	done

AcademyTeacherNoMoreToTeachText:
	text "¡Ya debes ser un"
	line "experto en"
	cont "#MON!"
	done

PagotaPokemonAcademyYoungster1Text:
	text "Estoy tomando"
	line "apuntes de lo que"
	cont "dice el profesor."

	para "Y debería copiar"
	line "también lo escrito"
	cont "en la pizarra."
	done

PagotaPokemonAcademyGameboyKid1Text:
	text "He cambiado a mis"
	line "mejores #MON"
	cont "con mi compañero."
	done

PagotaPokemonAcademyGameboyKid2Text:
	text "Los #MON que"
	line "se intercambian"
	cont "crecen rápido."

	para "Pero, si no tienes"
	line "la MEDALLA"
	para "adecuada, podrían"
	line "desobedecerte."
	done

PagotaPokemonAcademyYoungster2Text:
	text "Si un #MON va"
	line "equipado con una"

	para "BAYA, se curará él"
	line "solo en combate."

	para "Los #MON pueden"
	line "ir equipados con"
	cont "muchos objetos…"

	para "Es muy duro tomar"
	line "apuntes…"
	done

AcademyBlackboardText:
	text "La pizarra indica"
	line "cómo cambian de"
	para "estado los #MON"
	line "en combate."
	done

AcademyBlackboardText2:
; unused
	text "¿Qué tema quieres"
	line "leer?"
	done

AcademyPoisonText:
	text "Si un #MON es"
	line "envenenado,"
	cont "perderá PS."

	para "El envenenamiento"
	line "continúa tras el"
	para "combate y al"
	line "caminar seguirá"
	cont "perdiendo PS."

	para "Para curarlo, usa"
	line "ANTÍDOTO."
	done

AcademyParalysisText:
	text "La parálisis baja"
	line "la VELOCIDAD y"
	para "puede impedir el"
	line "movimiento."

	para "Permanece tras el"
	line "combate, así que"
	cont "usa ANTIPARALIZ."
	done

AcademySleepText:
	text "Si tu #MON"
	line "se queda dormido"
	para "no podrá realizar"
	line "ningún movimiento."

	para "Un #MON dormido"
	line "no se despierta"
	cont "tras el combate."

	para "Despiértalo con"
	line "DESPERTAR."
	done

AcademyBurnText:
	text "Las quemaduras"
	line "consumen PS,"
	para "reducen el poder"
	line "del ataque y"
	para "permanecen tras"
	line "el combate."

	para "Usa ANTIQUEMAR"
	line "como cura."
	done

AcademyFreezeText:
	text "Si tu #MON está"
	line "congelado, no"
	cont "podrá hacer nada."

	para "Seguirá congelado"
	line "tras el combate."

	para "Descongélalo con"
	line "ANTIHIELO."
	done

AcademyNotebookText:
	text "Es el cuaderno de"
	line "este niño…"

	para "Captura #MON"
	line "usando # BALL."

	para "Tu equipo puede"
	line "tener hasta seis."

	para "¿Sigues leyendo?"
	done

AcademyNotebookText1:
	text "Antes de lanzar la"
	line "# BALL, debes"
	cont "debilitarlo."

	para "Atrapar un #MON"
	line "quemado o envene-"
	cont "nado es mucho más"
	cont "fácil."

	para "¿Sigues leyendo?"
	done

AcademyNotebookText2:
	text "Algunos ataques"
	line "causan confusión."

	para "Un #MON confuso"
	line "puede atacarse a"
	cont "sí mismo."

	para "Retirarlo del"
	line "combate, eliminará"
	cont "su confusión."

	para "¿Sigues leyendo?"
	done

AcademyNotebookText3:
	text "Quienes atrapan"
	line "#MON y los usan"
	para "para luchar son"
	line "entrenadores."

	para "Su misión es ir"
	line "a los GIMNASIOS"
	para "y vencer a otros"
	line "entrenadores."

	para "La hoja siguiente"
	line "está… ¡vacía!"

	para "Niña: Eh, eh…"
	
	para "¡Eso es todo lo"
	line "que escribí!"
	done

AcademyStickerMachineText:
	text "¡Esta supermáquina"
	line "imprime los datos"
	cont "como pegatinas!"
	done

PagotaPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 6
	warp_event  4, 15, PAGOTA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 7 ; object events
	object_event  4,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AcademyTeacher, -1
	object_event  0,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AcademyGBChecker, -1
	object_event  2,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
