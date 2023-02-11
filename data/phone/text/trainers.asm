PhoneMaleAnswerMornText:
	text "Hola. Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Buenos días,"
	line "<PLAYER>!"
	done

PhoneMaleAnswerDayText:
	text "Hola. Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¿Qué tal vas,"
	line "<PLAYER>?"
	done

PhoneMaleAnswerNiteText:
	text "Hola. Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Buenas noches,"
	line "<PLAYER>!"
	done

PhoneFemaleAnswerMornText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Hola, <PLAYER>!"
	line "Buenos días."
	done

PhoneFemaleAnswerDayText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Hola, <PLAYER>!"
	line "¿Qué tal estás?"
	done

PhoneFemaleAnswerNiteText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Hola, <PLAYER>!"
	line "Buenas noches."
	done

PhoneMaleGreetMornText:
	text "¡<PLAYER>, buenos"
	line "días!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal vas?"
	done

PhoneMaleGreetDayText:
	text "¡Hola, <PLAYER>!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿A que hace un día"
	cont "estupendo?"
	done

PhoneMaleGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAYER>!"

	para "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	line "¿Estás libre?"
	done

PhoneFemaleGreetMornText:
	text "Buenos días,"
	line "<PLAYER>."

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Te he despertado?"
	done

PhoneFemaleGreetDayText:
	text "Hola, <PLAYER>."
	line "Soy @"
	text_ram wStringBuffer3
	text "."

	para "¿Qué tal te van"
	line "las cosas?"
	done

PhoneFemaleGreetNiteText:
	text "Buenas noches,"
	line "<PLAYER>."

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Estabas"
	cont "durmiendo?"
	done

PhoneMaleReallyEnergeticText:
	text "¿Qué tal están"
	line "tus #MON?"

	para "Mi @"
	text_ram wStringBuffer4
	text_start
	line "tiene mucha"
	cont "energía. ¡Genial!"
	done

PhoneFemaleTopShapeText:
	text "¿Qué tal están"
	line "tus #MON?"

	para "Mi @"
	text_ram wStringBuffer4
	text_start
	line "está en forma"
	
	para "porque lo llevo al"
	line "CENTRO #MON."
	done

PhoneMaleLookingAwesomeText:
	text "Mi @"
	text_ram wStringBuffer4
	text_start
	line "tiene un aspecto"
	
	para "increíble. Ojalá"
	line "pudieras verlo."
	done

PhoneFemaleDressedUpText:
	text "He vestido a mi"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Tiene mucho mejor"
	line "aspecto que antes."
	done

PhoneMaleManagedToBeatText:
	text "¡Sí! He ganado"
	line "a un fuerte"
	cont "@"
	text_ram wStringBuffer4
	text "."

	para "Debo fortalecer"
	line "a mi equipo."
	done

PhoneFemaleTypeAdvantageText:
	text "¡Tienes que oír"
	line "esto! El otro día"
	
	para "derroté a"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "¡Fue sencillo!"
	line "Tuve ventaja."
	done

PhoneMaleAlmostCaughtText:
	text "¡Eh, escucha!"
	line "Casi atrapo a"
	
	para "@"
	text_ram wStringBuffer4
	text " el"
	line "otro día."

	para "¡Oh, estuve"
	line "muy cerca!"
	done

PhoneFemaleMissedCatchingText:
	text "¿Sabes lo que me"
	line "pasó el otro día?"

	para "Se me volvió"
	line "a escapar"
	cont "@"
	text_ram wStringBuffer4
	text "."
	
	para "Quizá no sea tan"
	line "guay en esto…"
	done

PhoneMaleWantsToBattleText:
	text "¿Quieres luchar?"
	line "No volverá a"

	para "ocurrir lo de la"
	line "última vez."

	para "Estaré por"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

PhoneFemaleWantsToBattleText:
	text "¿Quieres luchar?"
	line "¡Esta vez ganaré!"

	para "Te estaré"
	line "esperando por"
	
	para "@"
	text_ram wStringBuffer5
	text "."
	line "Búscame, ¿vale?"
	done

PhoneWrongNumberKazText:
	text "¿Hola? Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Oh, oh…! ¡Tú no"
	line "eres MATEO! ¡Vaya,"
	cont "me he equivocado!"
	done

PhoneWrongNumberAudreyText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text ". ¿Cómo"
	cont "estás, ARIADNA?"

	para "¿Eh? ¿<PLAYER>?"
	line "¡Me he equivocado!"
	done

PhoneSeeYouLaterText:
	text "¡Hasta luego!"
	done

PhoneByeByeText:
	text "¡Adiós!"
	done

PhoneSwarmGrassText:
	text "¡Tienes que ver"
	line "esto! ¡Es salvaje!"

	para "¡Ha aparecido"
	line "un grupo de"
	
	para "@"
	text_ram wStringBuffer4
	text_start
	line "alrededor de"
	cont "@"
	text_ram wStringBuffer5
	text "!"
	done

PhoneSwarmFishText:
	text "¡Es increíble!"

	para "En @"
	text_ram wStringBuffer5
	text ","
	line "están picando"
	
	para "@"
	text_ram wStringBuffer4
	text " como si"
	line "no hubiera mañana."

	para "¡<PLAYER>, trae"
	line "tu CAÑA, tío!"
	done

PhoneSwarmCaveText:
	text "Un amigo me lo"
	line "acaba de decir."

	para "Ha visto muchos"
	line "@"
	text_ram wStringBuffer4
	text " en"
	cont "@"
	text_ram wStringBuffer5
	text "."

	para "<PLAYER>, deberías"
	line "ir a verlo."
	done

PhoneBugCatchingContestText:
	text "Hoy se celebra el"
	line "Concurso de"
          
	para "Captura de Bichos"
	line "en el PARQUE."
          
	para "¿Vas a ir,"
	line "<PLAYER>?"
	done

IrwinRocketTakeoverRumorText:
	text "¿Sabes qué,"
	line "<PLAYER>?"
          
	para "Dicen que el TEAM"
	line "ROCKET ha asaltado"
          
	para "la TORRE RADIO de"
	line "CIUDAD PONIENTE."
          
	para "¿Pero qué es el"
	line "TEAM ROCKET?"
	done

GinaRocketTakeoverRumorText:
	text "¿<PLAYER>, has"
	line "oído las noticias?"
          
	para "El TEAM ROCKET ha"
	line "asaltado la"
          
	para "TORRE RADIO de"
	line "CIUDAD PONIENTE."
          
	para "¿Estarán bien"
	line "los trabajadores?"
	done
