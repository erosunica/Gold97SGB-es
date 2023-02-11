BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "¡<PLAYER> recogió"
	line "@"
	text_decimal wPayDayMoney, 3, 6
	text "¥!"
	prompt

WildPokemonAppearedText:
	text "¡Un @"
	text_ram wEnemyMonNick
	text_start
	line "salvaje!"
	prompt

HookedPokemonAttackedText:
	text "¡Un @"
	text_ram wEnemyMonNick
	text_start
	line "salió del agua!"
	prompt

PokemonFellFromTreeText:
	text "¡Un @"
	text_ram wEnemyMonNick
	text_start
	line "cayó del árbol!"
	prompt

WantsToBattleText:
	text "<ENEMY>"
	line "quiere luchar."
	prompt

BattleText_WildFled:
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "salvaje ha huido!"
	prompt

BattleText_EnemyFled:
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "enemigo ha huido!"
	prompt

HurtByPoisonText:
	text "¡<USER>"
	line "envenenado!"
	prompt

HurtByBurnText:
	text "¡<USER>"
	line "quemado!"
	prompt

LeechSeedSapsText:
	text "¡Las DRENADORAS"
	line "agotan a"
	cont "<USER>!"
	prompt

HasANightmareText:
	text "¡<USER>"
	line "tiene una"
	cont "PESADILLA!"
	prompt

HurtByCurseText:
	text "¡<USER>"
	line "herido por"
	cont "MALDICIÓN!"
	prompt

SandstormHitsText:
	text "¡TORMENTA ARENA"
	line "hiere a"
	cont "<USER>!"
	prompt

PerishCountText:
	text "El CONTADOR DE"
	line "MUERTE de"

	para "<USER>"
	line "está en @"
	text_decimal wDeciramBuffer, 1, 1
	text "."
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "se recuperó con"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "recuperó PP usando"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "¡<TARGET>"
	line "herido por"
	cont "PREMONICIÓN!"
	prompt

BattleText_SafeguardFaded:
	text "¡VELO SAGRADO de"
	line "<USER>"
	cont "se desvaneció!"
	prompt

BattleText_MonsLightScreenFell:
	text "¡PANTALLA LUZ de"
	line "@"
	text_ram wStringBuffer1
	text " #MON"
	cont "ha caído!"
	prompt

BattleText_MonsReflectFaded:
	text "¡REFLEJO de"
	line "@"
	text_ram wStringBuffer1
	text " #MON"
	cont "ha terminado!"
	prompt

BattleText_RainContinuesToFall:
	text "Sigue lloviendo."
	prompt

BattleText_TheSunlightIsStrong:
	text "Hace mucho sol."
	prompt

BattleText_TheSandstormRages:
	text "La TORMENTA de"
	line "ARENA arrecia."
	prompt

BattleText_TheRainStopped:
	text "Dejó de llover."
	prompt

BattleText_TheSunlightFaded:
	text "Se ha ido el sol."
	prompt

BattleText_TheSandstormSubsided:
	text "La TORMENTA de"
	line "ARENA amainó."
	prompt

BattleText_EnemyMonFainted:
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "enemigo"
	cont "debilitado!"
	prompt

GotMoneyForWinningText:
	text "¡<PLAYER> ganó"
	line "@"
	text_decimal wBattleReward, 3, 6
	text "¥!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "ha perdido."
	prompt

TiedAgainstText:
	text "¡Has empatado con"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "¡<PLAYER> ganó"
	line "@"
	text_decimal wBattleReward, 3, 6
	text "¥!"
	cont "Envió algo a MAMÁ."
	prompt

SentHalfToMomText:
	text "Envió la mitad"
	line "a MAMÁ."
	prompt

SentAllToMomText:
	text "Envió todo a MAMÁ."
	prompt

BattleText_0x80a4f:
	text "<RIVAL>: ¡Debería"
	line "haber elegido a"
	cont "tu #MON!"
	prompt

BattleText_MonFainted:
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "se debilitó!"
	prompt

BattleText_UseNextMon:
	text "¿Usas el siguiente"
	line "#MON?"
	done

BattleText_0x80a93:
	text "<RIVAL>: ¡Sí!"
	line "¡Creo que he"

	para "elegido un buen"
	line "#MON!"
	prompt

LostAgainstText:
	text "¡Perdiste contra"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "va a utilizar a"
	cont "@"
	text_ram wEnemyMonNick
	text "."

	para "<PLAYER>,"
	line "¿quieres cambiar"
	cont "de #MON?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "envió a"
	cont "@"
	text_ram wEnemyMonNick
	text "."
	done

BattleText_TheresNoWillToBattle:
	text "¡No quiere luchar!"
	prompt

BattleText_AnEGGCantBattle:
	text "¡Los HUEVOS no"
	line "pueden luchar!"
	prompt

BattleText_CantEscape2:
	text "¡No puedes huir!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "¡No puedes huir de"
	line "un combate con"
	cont "un entrenador!"
	prompt

BattleText_GotAwaySafely:
	text "¡Escapaste sin"
	line "problemas!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "¡<USER>"
	line "escapó usando"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "¡No puedes huir!"
	prompt

BattleText_UserHurtBySpikes:
	text "¡<USER>"
	line "herido por PÚAS!"
	prompt

RecoveredUsingText:
	text "¡<TARGET>"
	line "se recuperó usando"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "¡@"
	text_ram wStringBuffer1
	text " de"
	line "<USER>"
	cont "activado!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Aquí no se pueden"
	line "usar objetos."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNick
	text_start
	line "ya está luchando."
	prompt

BattleText_MonCantBeRecalled:
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "no puede ser"
	cont "retirado!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "¡No quedan PP para"
	line "este movimiento!"
	prompt

BattleText_TheMoveIsDisabled:
	text "¡El movimiento"
	line "está desactivado!"
	prompt

BattleText_MonHasNoMovesLeft:
	text "¡A @"
	text_ram wBattleMonNick
	text_start
	line "no le quedan"
	cont "más movimientos!"
	done

BattleText_TargetsEncoreEnded:
	text "¡Finalizó"
	line "OTRA VEZ de"
	cont "<TARGET>!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text "¡@"
	text_ram wStringBuffer1
	text_start
	line "subió al nivel"
	cont "@"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	db "@"

BattleText_WildMonIsEating:
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "salvaje está"
	cont "comiendo!"
	prompt

BattleText_WildMonIsAngry:
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "salvaje está"
	cont "enfadado!"
	prompt

FastAsleepText:
	text "¡<USER>"
	line "está dormido!"
	prompt

WokeUpText:
	text "¡<USER>"
	line "se despertó!"
	prompt

FrozenSolidText:
	text "¡<USER>"
	line "está congelado!"
	prompt

FlinchedText:
	text "¡<USER>"
	line "retrocedió!"
	prompt

MustRechargeText:
	text "¡<USER>"
	line "debe recargarse!"
	prompt

DisabledNoMoreText:
	text "¡Ataque de"
	line "<USER>"
	cont "activado de nuevo!"
	prompt

IsConfusedText:
	text "¡<USER>"
	line "está confuso!"
	prompt

HurtItselfText:
	text "¡Tan confuso está"
	line "que se hiere a"
	cont "sí mismo!"
	prompt

ConfusedNoMoreText:
	text "¡<USER>"
	line "no está confuso!"
	prompt

BecameConfusedText:
	text "¡<TARGET>"
	line "está confuso!"
	prompt

BattleText_ItemHealedConfusion:
	text_ram wStringBuffer1
	text_start
	line "curó a"

	para "<TARGET>"
	line "de su confusión."
	prompt

AlreadyConfusedText:
	text "¡<TARGET>"
	line "ya está confuso!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "¡<USER>"
	line "herido por"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "¡<USER>"
	line "fue liberado de"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "¡<USER>"
	line "usó ATADURA con"
	cont "<TARGET>!"
	prompt

WasTrappedText:
	text "¡<TARGET>"
	line "fue atrapado!"
	prompt

WrappedByText:
	text "¡<TARGET>"
	line "fue atrapado!"
	prompt

ClampedByText:
	text "¡<TARGET>"
	line "fue ATRAPADO por"
	cont "<USER>!"
	prompt

StoringEnergyText:
	text "¡<USER>"
	line "está acumulando"
	cont "energía!"
	prompt

UnleashedEnergyText:
	text "¡<USER>"
	line "liberó energía!"
	prompt

HungOnText:
	text "¡<TARGET>"
	line "resistió con"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "¡<TARGET>"
	line "AGUANTÓ el golpe!"
	prompt

InLoveWithText:
	text "¡<USER>"
	line "está enamorado de"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "¡Enamoramiento de"
	line "<USER>"
	cont "le impidió atacar!"
	prompt

DisabledMoveText:
	text "¡@"
	text_ram wStringBuffer1
	text " de"
	line "<USER>"
	cont "está desactivado!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNick
	text_start
	line "está ocioso."
	prompt

BeganToNapText:
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "se echó a dormir!"
	prompt

WontObeyText:
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "no te obedeció!"
	prompt

TurnedAwayText:
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "ya no te obedece!"
	prompt

IgnoredOrdersText:
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "desobedeció!"
	prompt

IgnoredSleepingText:
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "desobedeció…!"
	cont "¡Está durmiendo!"
	prompt

NoPPLeftText:
	text "¡Pero no quedan PP"
	line "para el movim.!"
	prompt

HasNoPPLeftText:
	text "¡<USER>"
	line "carece de PP"
	cont "para @"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "¡<USER>"
	line "se fue a dormir!"
	done

RestedText:
	text "¡<USER>"
	line "se quedó dormido y"
	cont "recuperó la salud!"
	done

RegainedHealthText:
	text "¡<USER>"
	line "recuperó la salud!"
	prompt

AttackMissedText:
	text "¡Falló ataque de"
	line "<USER>!"
	prompt

AttackMissed2Text:
	text "¡Falló ataque de"
	line "<USER>!"
	prompt

CrashedText:
	text "¡<USER>"
	line "continuó y se"
	cont "estrelló!"
	prompt

UnaffectedText:
	text "¡No afectó a"
	line "<TARGET>!"
	prompt

DoesntAffectText:
	text "¡No afecta a"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "¡Un golpe crítico!"
	prompt

OneHitKOText:
	text "¡K.O. en 1 golpe!"
	prompt

SuperEffectiveText:
	text "¡Es muy efectivo!"
	prompt

NotVeryEffectiveText:
	text "No es muy"
	line "efectivo…"
	prompt

TookDownWithItText:
	text "¡<TARGET>"
	line "acabó con"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "¡La FURIA de"
	line "<USER>"
	cont "está creciendo!"
	prompt

GotAnEncoreText:
	text "¡<TARGET>"
	line "sufrió los efectos"
	cont "de OTRA VEZ!"
	prompt

SharedPainText:
	text "¡Los combatientes"
	line "comparten el daño!"
	prompt

TookAimText:
	text "¡<USER>"
	line "apuntó!"
	prompt

SketchedText:
	text "¡<USER>"
	line "usó ESQUEMA en"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "¡<USER>"
	line "intenta llevarse"
	cont "a su rival!"
	prompt

SpiteEffectText:
	text "¡@"
	text_ram wStringBuffer1
	text " de"
	line "<TARGET>"
	cont "reducido en @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BellChimedText:
	text "¡Ha repicado"
	line "una campana!"
	prompt

FellAsleepText:
	text "¡<TARGET>"
	line "se durmió!"
	prompt

AlreadyAsleepText:
	text "¡<TARGET>"
	line "ya está dormido!"
	prompt

WasPoisonedText:
	text "¡<TARGET>"
	line "fue envenenado!"
	prompt

BadlyPoisonedText:
	text "¡<TARGET>"
	line "fue gravemente"
	cont "envenenado!"
	prompt

AlreadyPoisonedText:
	text "¡<TARGET>"
	line "está envenenado!"
	prompt

SuckedHealthText:
	text "¡Absorbió salud de"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "¡Se comió el"
	line "sueño de"
	cont "<TARGET>!"
	prompt

WasBurnedText:
	text "¡<TARGET>"
	line "se quemó!"
	prompt

DefrostedOpponentText:
	text "¡<TARGET>"
	line "fue descongelado!"
	prompt

WasFrozenText:
	text "¡<TARGET>"
	line "fue congelado!"
	prompt

WontRiseAnymoreText:
	text "¡@"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "no subirá más!"
	prompt

WontDropAnymoreText:
	text "¡@"
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>"
	cont "no bajará más!"
	prompt

FledFromBattleText:
	text "¡<USER>"
	line "huyó del combate!"
	prompt

FledInFearText:
	text "¡<TARGET>"
	line "huyó aterrorizado!"
	prompt

BlownAwayText:
	text "¡<TARGET>"
	line "fue arrastrado!"
	prompt

PlayerHitTimesText:
	text "Dañado @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " veces."
	prompt

EnemyHitTimesText:
	text "Dañado @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " veces."
	prompt

MistText:
	text "¡<USER>"
	line "está cubierto"
	cont "por una NEBLINA!"
	prompt

ProtectedByMistText:
	text "<TARGET>"
	line "está protegido"
	cont "por la NEBLINA."
	prompt

GettingPumpedText:
	text_pause
	text "¡<USER>"
	line "se está inflando!"
	prompt

RecoilText:
	text "¡<USER>"
	line "es re-golpeado!"
	prompt

MadeSubstituteText:
	text "¡<USER>"
	line "creó un SUSTITUTO!"
	prompt

HasSubstituteText:
	text "¡<USER>"
	line "tiene SUSTITUTO!"
	prompt

TooWeakSubText:
	text "¡Demasiado débil"
	line "para crear un"
	cont "SUSTITUTO!"
	prompt

SubTookDamageText:
	text "¡El SUSTITUTO"
	line "recibe el daño en"

	para "lugar de"
	line "<TARGET>!"
	prompt

SubFadedText:
	text "¡Cayó el"
	line "SUSTITUTO de"
	cont "<TARGET>!"
	prompt

MimicLearnedMoveText:
	text "¡<USER>"
	line "ha aprendido"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "¡<TARGET>"
	line "fue infectado!"
	prompt

EvadedText:
	text "¡<TARGET>"
	line "esquivó el ataque!"
	prompt

WasDisabledText:
	text "¡@"
	text_ram wStringBuffer1
	text " de"
	line "<TARGET>"
	cont "fue desactivado!"
	prompt

CoinsScatteredText:
	text "¡Hay monedas por"
	line "todas partes!"
	prompt

TransformedTypeText:
	text "¡<USER>"
	line "se convirtió en el"
	cont "tipo @"
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText:
	text "¡Cambios en las"
	line "carac. eliminados!"
	prompt

TransformedText:
	text "¡<USER>"
	line "se TRANSFORMÓ en"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "¡Subió DEFENSA"
	line "ESPECIAL de"
	cont "<USER>!"
	prompt

ReflectEffectText:
	text "¡Subió DEFENSA de"
	line "<USER>!"
	prompt

NothingHappenedText:
	text "Pero no ha"
	line "pasado nada."
	prompt

ButItFailedText:
	text "¡Pero falló!"
	prompt

ItFailedText:
	text "¡Falló!"
	prompt

DidntAffect1Text:
	text "¡No afectó a"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "¡No afectó a"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "¡Los PS de"
	line "<USER>"
	cont "están al máximo!"
	prompt

DraggedOutText:
	text "¡<USER>"
	line "fue arrastrado!"
	prompt

ParalyzedText:
	text "¡<TARGET>"
	line "está paralizado!"
	cont "¡Quizá no ataque!"
	prompt

FullyParalyzedText:
	text "¡<USER>"
	line "está totalmente"
	cont "paralizado!"
	prompt

AlreadyParalyzedText:
	text "¡<TARGET>"
	line "ya está"
	cont "paralizado!"
	prompt

ProtectedByText:
	text "¡<TARGET>"
	line "está protegido por"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "¡ESPEJO falló!"
	prompt

StoleText:
	text "¡<USER>"
	line "robó @"
	text_ram wStringBuffer1
	text_start
	cont "a su rival!"
	prompt

CantEscapeNowText:
	text "¡<TARGET>"
	line "no puede escapar!"
	prompt

StartedNightmareText:
	text "¡<TARGET>"
	line "empezó a tener"
	cont "una PESADILLA!"
	prompt

WasDefrostedText:
	text "¡<USER>"
	line "fue descongelado!"
	prompt

PutACurseText:
	text "¡<USER>"
	line "reduce sus PS y"

	para "MALDICE a"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "¡<USER>"
	line "se ha PROTEGIDO!"
	prompt

ProtectingItselfText:
	text "¡<TARGET>"
	line "se está"
	cont "PROTEGIENDO!"
	done

SpikesText:
	text "¡<TARGET>"
	line "está rodeado"
	cont "de PÚAS!"
	prompt

IdentifiedText:
	text "¡<USER>"
	line "identificó a"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "¡Ambos #MON se"
	line "debilitarán en"
	cont "3 turnos!"
	prompt

SandstormBrewedText:
	text "¡Se acerca una"
	line "TORMENTA de ARENA!"
	prompt

BracedItselfText:
	text "¡<USER>"
	line "se ha fortalecido!"
	prompt

FellInLoveText:
	text "¡<TARGET>"
	line "se ha enamorado!"
	prompt

CoveredByVeilText:
	text "¡<USER>"
	line "se cubrió con"
	cont "un velo!"
	prompt

SafeguardProtectText:
	text "¡<TARGET>"
	line "está protegido por"
	cont "el VELO SAGRADO!"
	prompt

MagnitudeText:
	text "¡Magnitud @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "¡<USER>"
	line "fue liberado por"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "¡<USER>"
	line "rompió DRENADORAS!"
	prompt

BlewSpikesText:
	text "¡<USER>"
	line "rompió PÚAS!"
	prompt

DownpourText:
	text "¡Ha empezado a"
	line "caer un chaparrón!"
	prompt

SunGotBrightText:
	text "¡El sol está"
	line "brillando!"
	prompt

BellyDrumText:
	text "¡<USER>"
	line "redujo sus PS y"

	para "mejoró su ATAQUE!"
	prompt

CopiedStatsText:
	text "¡<USER>"
	line "copió los cambios"

	para "de carac. de"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "¡<USER>"
	line "previó un ataque!"
	prompt

BeatUpAttackText:
	text "¡Ataque de"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

CantReceiveGiftText:
	text "¡<TARGET>"
	line "no puede recibir"
	cont "el regalo!"
	prompt

IgnoredOrders2Text:
	text "¡<USER>"
	line "desobedeció!"
	prompt
