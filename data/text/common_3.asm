_SlotsStartText::
	text "¡Adelante!"
	done

_SlotsNotEnoughCoinsText::
	text "No tienes"
	line "bastantes fichas."
	prompt

_SlotsRanOutOfCoinsText::
	text "¡Vaya…! No me"
	line "quedan fichas…"
	done

_SlotsPlayAgainText::
	text "¿Vuelves a"
	line "jugar?"
	done

_SlotsLinedUpText::
	text "¡Línea! ¡Has"
	line "ganado @"
	text_ram wStringBuffer2
	text " fichas!"
	done

_SlotsDarnText::
	text "¡Fallaste!"
	done

_GearTodayText::
	text_today
	text_end

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Estás fuera de"
	line "cobertura."
	prompt

_PokegearAskWhoCallText::
	text "¿A quién quieres"
	line "llamar?"
	done

_PokegearPressButtonText::
	text "Pulsa un botón"
	line "para salir."
	done

_PokegearAskDeleteText::
	text "¿Borras este"
	line "n.° de teléfono?"
	done

_PhoneWrongNumberText::
	text "¿Eh? Perdona,"
	line "n.° equivocado."
	done

_PhoneClickText::
	text "¡Clic!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Ese número no es"
	line "de esta zona."
	done

_PhoneJustTalkToThemText::
	text "¡No es necesario"
	line "llamar, está muy"
	cont "cerca!"
	done

_PhoneThankYouText::
	text "¡Gracias!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Elige CONTINUAR"
	line "y cambia las"
	cont "opciones."
	prompt

_PasswordWrongText::
	text "¡Contraseña"
	line "no válida!"
	prompt

_PasswordAskResetClockText::
	text "¿Cambias la hora?"
	done

_PasswordAskEnterText::
	text "Introduce la"
	line "contraseña."
	done

_ClearAllSaveDataText::
	text "¿Borras todos los"
	line "datos guardados?"
	done

_LearnedMoveText::
	text "¡@"
	text_ram wMonOrItemNameBuffer
	text_start
	line "ha aprendido"
	cont "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

_MoveAskForgetText::
	text "¿Qué movimiento"
	next "debería olvidar?"
	done

_StopLearningMoveText::
	text "¿Deja de aprender"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "no aprendió"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "intenta aprender"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Pero"
	line "@"
	text_ram wMonOrItemNameBuffer
	text_start

	para "no puede aprender"
	line "más de cuatro"
	cont "movimientos."

	para "¿Borras movimiento"
	line "anterior para"

	para "dejar sitio a"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 y…@"
	text_pause
	text_end

	text_end ; unused

_MoveForgotText::
	text " ¡Puf!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text_start
	line "olvidó"
	cont "@"
	text_ram wStringBuffer1
	text "."

	para "Y…"
	prompt

_MoveCantForgetHMText::
	text "Los movimientos MO"
	line "no se pueden"
	cont "olvidar ahora."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "¿Quieres apostar"
	line "tres?"
	done

_CardFlipNotEnoughCoinsText::
	text "Faltan fichas."
	prompt

_CardFlipChooseACardText::
	text "Elige una carta."
	done

_CardFlipPlaceYourBetText::
	text "Haz tu apuesta."
	done

_CardFlipPlayAgainText::
	text "¿Vuelves a"
	line "jugar?"
	done

_CardFlipShuffledText::
	text "Has barajado el"
	line "mazo."
	prompt

_CardFlipYeahText::
	text "¡Sí!"
	done

_CardFlipDarnText::
	text "¡Fallaste…!"
	done

_BallDodgedText::
	text "¡Esquivó la BALL!"

	para "¡Imposible atrapar"
	line "a este #MON!"
	prompt

_BallMissedText::
	text "¡Has perdido al"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "¡No! ¡El #MON"
	line "se ha escapado!"
	prompt

_BallAppearedCaughtText::
	text "¡Parecía que lo"
	line "habías atrapado!"
	prompt

_BallAlmostHadItText::
	text "¡Vaya!"
	line "¡Te faltó poco!"
	prompt

_BallSoCloseText::
	text "¡Caray! ¡Casi"
	line "lo consigues!"
	prompt

Text_BallCaught::
	text "¡Ya está!"
	line "¡@"
	text_ram wEnemyMonNick
	text_start
	cont "atrapado!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "fue enviado al PC"
	cont "de BILL."
	prompt

_NewDexDataText::
	text "Registrados en la"
	line "#DEX los datos"

	para "de @"
	text_ram wEnemyMonNick
	text "."
	line "@"
	sound_slot_machine_start
	text_waitbutton
	text_end

_AskGiveNicknameText::
	text "¿Quieres darle"
	line "un mote a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer2
	text " de"
	line "@"
	text_ram wStringBuffer1
	text " creció."
	prompt

_ItemCantUseOnMonText::
	text "Eso no se puede"
	line "usar con este"
	cont "#MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "Todavía funciona"
	line "el REPELENTE que"
	cont "usaste antes."
	prompt

_PlayedFluteText::
	text "Escuchaste la"
	line "# FLAUTA."

	para "¡Es una canción"
	line "muy pegadiza!"
	prompt

_FluteWakeUpText::
	text "Se han despertado"
	line "todos los #MON."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> sintonizó"
	line "el canal FLAUTA"
	cont "#MON.@"
	text_waitbutton
	text_end

	text_end ; unreferenced

; BUG: "done" is not a valid terminator here, needs to change to "text_end"
_CoinCaseCountText::
	text "Fichas:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

_RaiseThePPOfWhichMoveText::
	text "¿A qué movimiento"
	line "quieres añadir PP?"
	done

_RestoreThePPOfWhichMoveText::
	text "¿Restaurar los PP"
	line "de qué movimiento?"
	done

_PPIsMaxedOutText::
	text "Los PP de"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "están al máximo."
	prompt

_PPsIncreasedText::
	text "Los PP de"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "han aumentado."
	prompt

_PPRestoredText::
	text "PP restaurados."
	prompt

_SentTrophyHomeText::
	text "¡Había un trofeo"
	line "dentro!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " envió"
	line "el trofeo a casa."
	prompt

_ItemLooksBitterText::
	text "Parece amarga…"
	prompt

_ItemCantUseOnEggText::
	text "Eso no se puede"
	line "usar con un HUEVO."
	prompt

_ItemOakWarningText::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "¡Eso pertenece"
	line "a alguien!"
	prompt

_ItemWontHaveEffectText::
	text "No tendrá"
	line "ningún efecto."
	prompt

_BallBlockedText::
	text "¡El entrenador"
	line "bloqueó la BALL!"
	prompt

_BallDontBeAThiefText::
	text "¡No robes #MON!"
	prompt

_NoCyclingText::
	text "Aquí no se permite"
	line "ir en bici."
	prompt

_ItemCantGetOnText::
	text "No puedes subir a"
	line "tu @"
	text_ram wStringBuffer1
	text "."
	prompt

_BallBoxFullText::
	text "La CAJA de #MON"
	line "está llena. Ahora"
	cont "no puedes usarla."
	prompt

_ItemUsedText::
	text "<PLAYER> usó"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> se montó@"
	text_low
	text "en la @"
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> se bajó de@"
	text_low
	text "la @"
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text_start
	line "ya conoce"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Ese #MON"
	line "sólo conoce un"
	cont "movimiento."
	done

_AskDeleteMoveText::
	text "¿Le haces olvidar"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "¡Hecho! Tu #MON"
	line "olvidó el movi-"
	cont "miento."
	done

_DeleterEggText::
	text "¡Los HUEVOS no"
	line "saben movimientos!"
	done

_DeleterNoComeAgainText::
	text "¿No? Vuelve"
	line "cuando quieras."
	done

_DeleterAskWhichMoveText::
	text "¿Qué movimiento"
	line "debería olvidar?"
	prompt

_DeleterIntroText::
	text "Soy el QUITA-"
	line "MOVIMIENTOS. Hago"

	para "olvidar movimien-"
	line "tos a los #MON."

	para "¿Quieres que"
	line "olviden algún"
	cont "movimiento?"
	done

_DeleterAskWhichMonText::
	text "¿Qué #MON?"
	prompt

_TimesetAskDSTText::
	text "¿Quieres cambiar"
	line "el reloj al"
	cont "horario de verano?"
	done

_TimesetDSTText::
	text "He adelantado el"
	line "reloj una hora."
	prompt

_TimesetAskNotDSTText::
	text "¿Terminó el"
	line "horario de verano?"
	done

_TimesetNotDSTText::
	text "He atrasado el"
	line "reloj una hora."
	prompt

_TimesetAskAdjustDSTText::
	text "¿Quieres cambiar"
	line "el reloj al"
	cont "horario de verano?"
	done

_MomLostGearBookletText::
	text "He perdido las"
	line "instrucciones del"

	para "#GEAR."
	line "Vuelve dentro de"
	cont "un rato."
	prompt
