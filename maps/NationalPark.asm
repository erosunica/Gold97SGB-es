	object_const_def ; object_event constants
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_GAMEBOY_KID
	const NATIONALPARK_POKE_BALL2

NationalPark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NationalParkLassScript:
	jumptextfaceplayer NationalParkLassText

NationalParkPokefanFScript:
	jumptextfaceplayer NationalParkPokefanFText

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	buttonsound
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

NationalParkYoungster1Script:
	jumptextfaceplayer NationalParkYoungster1Text

NationalParkYoungster2Script:
	jumptextfaceplayer NationalParkYoungster2Text

NationalParkTeacher2Script:
	jumptextfaceplayer NationalParkTeacher2Text

NationalParkPersian:
	faceplayer
	opentext
	writetext NationalParkPersianText
	cry PERSIAN
	waitbutton
	closetext
	end

NationalParkGameboyKidScript:
	faceplayer
	opentext
	writetext NationalParkGameboyKidText
	waitbutton
	closetext
	turnobject NATIONALPARK_GAMEBOY_KID, DOWN
	end


TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end


TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkBattleNoticeSign:
	jumptext NationalParkBattleNoticeText

NationalParkTrainerTipsSign:
	jumptext NationalParkTrainerTipsText

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkLassText:
	text "¿Cuántos #MON"
	line "existen?"

	para "Tiene que haber"
	line "por lo menos 200."
	done

NationalParkPokefanFText:
	text "Mi hija me llama"
	line "desde su #GEAR."
	
	para "¡Me da ánimos!"
	done

NationalParkTeacher1Text:
	text "¡Presta atención,"
	line "por favor!"

	para "¡Ups! A ver si"
	line "dejo de hablar"
	para "como si fuera una"
	line "maestra."

	para "Parece que"
	line "entrenas #MON."

	para "Como estás"
	line "trabajando tanto,"
	cont "he pensado darte"
	cont "esto."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Dale a un #MON"
	line "esa GARRA RÁPIDA."

	para "A veces, atacará"
	line "el primero en"
	cont "combate."
	done

NationalParkYoungster1Text:
	text "¡Estoy jugando con"
	line "pegatinas de"
	cont "mis #MON!"
	done

NationalParkYoungster2Text:
	text "La pegatina de"
	line "GRENMAR del otro"
	para "chico será mía"
	line "si gano."
	done

NationalParkTeacher2Text:
	text "Doy paseos por el"
	line "PARQUE, pero nunca"
	para "entro en la"
	line "hierba."

	para "Los entrenadores"
	line "adoran luchar…"
	done

NationalParkPersianText:
	text "PERSIAN: ¡Persiia!"
	done

NationalParkGameboyKidText:
	text "¡Estoy jugando a"
	line "#MON ROJO!"
	
	para "¿Sabías que puedes"
	line "conectarte a"
	para "juegos anteriores"
	line "para intercambiar?"
	done

SchoolboyJack1SeenText:
	text "El mundo #MON"
	line "es muy amplio."

	para "Y sigue habiendo"
	line "muchas cosas que"
	cont "ignoramos."

	para "¡Pero yo sé más"
	line "que tú!"
	done

SchoolboyJack1BeatenText:
	text "¿Qué, qué, qué?"
	done

UnknownText_0x5c4f3:
	text "Hay muchas cosas"
	line "que aprender."

	para "Por ejemplo…"

	para "Hay 50 tipos de"
	line "MT."

	para "Los #MON"
	line "intercambiados"
	cont "suben antes de"
	cont "nivel."
	done

PokefanfBeverly1SeenText:
	text "Mis #MON son"
	line "encantadores."

	para "Déjame mostrarte"
	line "lo orgullosa que"
	cont "estoy de ellos."
	done

PokefanfBeverly1BeatenText:
	text "Puedo derrotarte,"
	line "pero…"
	done

UnknownText_0x5c5bd:
	text "Debo decirte que"
	line "tus #MON son"
	cont "bonitos también."
	done

PokefanmWilliamSeenText:
	text "Queremos a"
	line "nuestros #MON,"
	para "aunque ellos no"
	line "nos quieran."

	para "Eso significa ser"
	line "un FAN #MON."
	done

PokefanmWilliamBeatenText:
	text "Mi… ¡Mi #MON!"
	done

PokefanmWilliamAfterBattleText:
	text "Perdí el combate,"
	line "pero mis #MON"
	para "son más adorables"
	line "que los tuyos."
	done

UnknownText_0x5c68a:
	text "¡Mi amigo tiene un"
	line "MARILL!"

	para "Los encuentro muy"
	line "simpáticos."

	para "Oh, deseo tener un"
	line "MARILL propio…"
	done

LassKriseSeenText:
	text "¿Eh?"
	line "¿Y tú qué miras?"

	para "¿Quieres luchar?"
	done

LassKriseBeatenText:
	text "¡Mmmm…!"
	done

LassKriseAfterBattleText:
	text "¡Pensaba que me"
	line "estabas mirando"
	cont "porque soy bonita!"
	done

NationalParkRelaxationSquareText:
	text "PLAZA DEL DESCANSO"
	line "PARQUE NACIONAL"
	done

NationalParkBattleNoticeText:
	text "¿Qué dice este"
	line "cartel?"

	para "Por favor, lucha"
	line "sólo en la hierba."

	para "PUESTO DEL GUARDA"
	line "PARQUE NACIONAL"
	done

NationalParkTrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Diferentes #MON"
	line "aparecen a"
	para "distintas horas"
	line "del día."
	done

NationalPark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 32, 31, STAND_CITY_NATIONAL_PARK_GATE, 1
	warp_event 33, 31, STAND_CITY_NATIONAL_PARK_GATE, 2
	warp_event  6, 53, ROUTE_103_NATIONAL_PARK_GATE, 1
	warp_event  7, 53, ROUTE_103_NATIONAL_PARK_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8, 48, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event 12, 24, BGEVENT_READ, NationalParkBattleNoticeSign
	bg_event 21, 53, BGEVENT_ITEM, NationalParkHiddenFullHeal
	bg_event 34, 38, BGEVENT_READ, NationalParkTrainerTipsSign

	db 12 ; object events
	object_event 14, 33, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 16,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanFScript, -1
	object_event  5, 39, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event  7, 48, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster1Script, -1
	object_event  6, 48, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 17, 39, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event  4, 39, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event 15,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerLassKrise, -1
	object_event 36,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 30,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event 35, 47, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_DIG
