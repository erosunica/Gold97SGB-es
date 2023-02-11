NurseMornText:
	text "¡Bienvenidos a"
	line "nuestro CENTRO"
	cont "#MON!"
	done

NurseDayText:
	text "¡Bienvenidos a"
	line "nuestro CENTRO"
	cont "#MON!"
	done

NurseNiteText:
	text "¡Buenas noches!"
	line "Bienvenidos a"

	para "nuestro CENTRO"
	line "#MON."
	done

NurseAskHealText:
	text "Nosotros curamos"
	line "a tus #MON."

	para "¿Quieres curar a"
	line "tus #MON?"
	done

NurseTakePokemonText:
	text "Muy bien, déjame"
	line "tus #MON."
	done

NurseReturnPokemonText:
	text "¡Gracias por"
	line "esperar!"

	para "Tus #MON están"
	line "en plena forma."
	done

NurseGoodbyeText:
	text "¡Vuelve siempre"
	line "que quieras!"
	done

; not used
	text "¡Vuelve siempre"
	line "que quieras!"
	done

NursePokerusText:
	text "Tus #MON"
	line "tienen minúsculas"

	para "formas de vida"
	line "unidas a ellos."

	para "Tus #MON están"
	line "sanos y parecen"
	cont "contentos."

	para "Pero no podemos"
	line "darte más"

	para "información en un"
	line "CENTRO #MON."
	done

DifficultBookshelfText:
	text "Está llena de"
	line "libros complejos."
	done

PictureBookshelfText:
	text "¡Una colección de"
	line "libros ilustrados"
	cont "de #MON!"
	done

MagazineBookshelfText:
	text "Revistas #MON…"
	line "TELEVISOR #MON,"

	para "MANUAL #MON,"
	line "GRÁFICA #MON…"
	done

TeamRocketOathText:
	text "VOTOS TEAM ROCKET"

	para "Robar #MON para"
	line "enriquecernos."

	para "Explotarlos para"
	line "enriquecernos."

	para "¡Todo #MON"
	line "existe para gloria"
	cont "del TEAM ROCKET!"
	done

IncenseBurnerText:
	text "Es un altar"
	line "budista."
	
	para "Mmm… huele a"
	line "incienso."
	done

MerchandiseShelfText:
	text "¡Cantidad de"
	line "artículos #MON!"
	done

LookTownMapText:
	text "MAPA del PUEBLO."
	done

WindowText:
	text "¿Parece que está"
	line "sucia?"
	done

TVText:
	text "Es una TV."
	done

HomepageText:
	text "PÁGINA DE INICIO"
	line "REVISTA #MON."

	para "No ha sido"
	line "actualizada…"
	done

; not used
	text "¡RADIO #MON!"

	para "¡Llámanos con"
	line "tus peticiones!"
	done

TrashCanText:
	text "Aquí dentro no"
	line "hay nada…"
	done

; not used
	text "Un #MON"
	line "podría moverla."
	done

; not used
	text "Un #MON"
	line "podría romperla."
	done

PokecenterSignText:
	text "Cura a tus #MON"
	line "CENTRO #MON"
	done

MartSignText:
	text "Todo lo necesario"
	line "para tus #MON"

	para "TIENDA #MON"
	done

ContestResults_ReadyToJudgeText:
	text "Vamos a evaluar"
	line "a tus #MON."

	para "<……>"
	line "<……>"

	para "¡Hemos elegido a"
	line "los ganadores!"

	para "Aquí van…"
	done

AskNumber1MText:
	text "¡Uauu! ¡Eres"
	line "bastante fuerte!"

	para "¿Me das tu número"
	line "de teléfono?"

	para "Te llamaré para"
	line "volver a pelear."
	done

AskNumber2MText:
	text "¿Grabar el número"
	line "de teléfono?"
	done

RegisteredNumberMText: ;revisar
	text "<PLAYER> grabó el"
	line "N° de @"
	text_ram wStringBuffer3
	text "."
	done

NumberAcceptedMText:
	text "Te llamaré si"
	line "surge algo."
	done

NumberDeclinedMText:
	text "Bueno, no dudes"
	line "en pedirme mi nú-"
	cont "mero de teléfono."
	done

PhoneFullMText:
	text "En tu teléfono"
	line "no tienes espacio"
	cont "para más números."
	done

RematchMText:
	text "Te esperaba."
	line "¡Luchemos!"
	done

AskNumber1FText:
	text "¡Uauu! Peleas"
	line "muy bien."

	para "¿Me das tu número"
	line "de teléfono?"

	para "Te llamaré para"
	line "volver a pelear."
	done

AskNumber2FText:
	text "¿Grabar el número"
	line "de teléfono?"
	done

RegisteredNumberFText: ;revisar
	text "<PLAYER> grabó el"
	line "N° de @"
	text_ram wStringBuffer3
	text "."
	done

NumberAcceptedFText:
	text "Te llamaré si"
	line "surge algo."
	done

NumberDeclinedFText:
	text "Vale, si quieres"
	line "mi número,"
	cont "sólo dímelo."
	done

PhoneFullFText:
	text "En tu teléfono"
	line "no tienes espacio"
	cont "para más números."
	done

RematchFText:
	text "Estaba esperando."
	line "¡Luchemos!"
	done

ContestResults_PlayerWonAPrizeText: ;revisar
	text "<PLAYER> gana el"
	line "premio N° @"
	text_ram wStringBuffer3
	text ":"
	cont "¡una @"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "¡Participa en el"
	line "próximo concurso!"
	done

ContestResults_ConsolationPrizeText:
	text "¡Todos los demás"
	line "reciben una BAYA"
	cont "como consolación!"
	done

ContestResults_DidNotWinText:
	text "A ver si mejoras"
	line "la próxima vez."
	done

ContestResults_ReturnPartyText:
	text "Aquí tienes los"
	line "#MON que"

	para "te estábamos"
	line "cuidando."
	done

ContestResults_PartyFullText:
	text "¡Equipo completo!"
	line "El #MON fue"

	para "enviado a tu CAJA"
	line "en el PC de BILL."
	done

GymStatue_CityGymText:
	text "GIMNASIO #MON"
	line "DE @"
	text_ram wStringBuffer3
	text_end

	text_end ; unused

GymStatue_WinningTrainersText:
	text "LÍDER: @"
	text_ram wStringBuffer4
	text_start

	para "GANADORES:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Bienvenidos al"
	line "CASINO."
	done

CoinVendor_NoCoinCaseText:
	text "¿Necesitas fichas"
	line "de juego?"

	para "¡Oh! No tienes"
	line "un MONEDERO"
	cont "para tus fichas."
	done

CoinVendor_IntroText:
	text "¿Necesitas fichas"
	line "de juego?"

	para "50 fichas por"
	line "1000¥. ¿Quieres"
	cont "comprar?"
	done

CoinVendor_Buy50CoinsText:
	text "¡Gracias! Aquí"
	line "tienes 50 fichas."
	done

CoinVendor_Buy500CoinsText:
	text "¡Gracias! Aquí"
	line "tienes 500 fichas."
	done

CoinVendor_NotEnoughMoneyText:
	text "No tienes"
	line "bastante dinero."
	done

CoinVendor_CoinCaseFullText:
	text "¡Uups! Tu MONEDERO"
	line "está lleno."
	done

CoinVendor_CancelText:
	text "¿No quieres"
	line "fichas? Vuelve"
	cont "cuando quieras."
	done

BugContestPrizeNoRoomText:
	text "¡Oh! Tu MOCHILA"
	line "está llena."

	para "Te guardaremos"
	line "esto. Vuelve"

	para "cuando tengas"
	line "sitio."
	done

HappinessText3:
	text "¡Uauu! ¡Tú y tus"
	line "#MON estáis"
	cont "muy unidos!"
	done

HappinessText2:
	text "Cuanto más tiempo"
	line "pases con los"

	para "#MON, más"
	line "te querrán."
	done

HappinessText1:
	text "No has domesticado"
	line "a tu #MON."

	para "Si no eres amable,"
	line "éste se enfadará."
	done
