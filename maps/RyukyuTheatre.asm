	object_const_def ; object_event constants
	const RYUKYUTHEATRE_KIMONO_GIRL1
	const RYUKYUTHEATRE_KIMONO_GIRL2
	const RYUKYUTHEATRE_KIMONO_GIRL3
	const RYUKYUTHEATRE_KIMONO_GIRL4
	const RYUKYUTHEATRE_KIMONO_GIRL5
	const RYUKYUTHEATRE_KIMONO_GIRL6
	const RYUKYUTHEATRE_GENTLEMAN
	const RYUKYUTHEATRE_RHYDON
	const RYUKYUTHEATRE_COOLTRAINER_M
	const RYUKYUTHEATRE_GRANNY
	const RYUKYUTHEATRE_JANINE
	const RYUKYUTHEATRE_POKEFAN_M
	const RYUKYUTHEATRE_POKEFAN_F
	const RYUKYUTHEATRE_SUPER_NERD

RyukyuTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKyoko:
	trainer KIMONO_GIRL, KYOKO, EVENT_BEAT_KIMONO_GIRL_KYOKO, KimonoGirlKyokoSeenText, KimonoGirlKyokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKyokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

RyukyuTheaterCoinsGuy:
	faceplayer
	opentext
	writetext CoinsGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_COINS_FROM_GENTLEMAN
	iftrue CoinsGuyAlreadyGaveCoins
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KYOKO
	iffalse .KimonoGirlsUndefeated
	sjump .GetCoins

.KimonoGirlsUndefeated:
	writetext CoinsGuyLadGiftText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_COINS_GUY
	end

.GetCoins:
	checkevent EVENT_TALKED_TO_COINS_GUY
	iftrue .ContinueGetCoins
	writetext CoinsGuyLadGiftText
	waitbutton
.ContinueGetCoins
	writetext CoinsGuyLikeADanceText
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	stringtotext .coinname, MEM_BUFFER_1
	scall .GiveCoins
	givecoins 10000
	setevent EVENT_GOT_COINS_FROM_GENTLEMAN
	writetext CoinsGuyGotCoins
	waitbutton
	closetext
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "FICHAS@"

.NoCoinCase:
	writetext CoinsGuyNoCoinCaseText
	waitbutton
	closetext
	end

.FullCoinCase:
	writetext CoinsGuyFullCoinCaseText
	waitbutton
	closetext
	end


CoinsGuyAlreadyGaveCoins:
	writetext CoinsGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

RyukyuTheaterRhydon:
	faceplayer
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end
	
RyukyuTheatreJanineScript:
	jumptextfaceplayer RyukyuTheatreJanineText

RyukyuTheatreCooltrainerMScript:
	jumptextfaceplayer RyukyuTheatreCooltrainerMText

RyukyuTheatreGrannyScript:
	jumptextfaceplayer RyukyuTheatreGrannyText

RyukyuTheatreFancyPanel:
	jumptext RyukyuTheatreFancyPanelText
	
RyukyuTheatrePokefanMScript:
	jumptextfaceplayer RyukyuTheatrePokefanMText
	
RyukyuTheatrePokefanFScript:
	jumptextfaceplayer RyukyuTheatrePokefanFText
	
RyukyuTheatreSuperNerdScript:
	jumptextfaceplayer RyukyuTheatreSuperNerdText
	
RyukyuTheatreSuperNerdText:
	text "¡Qué buen"
	line "espectáculo!"
	done

RyukyuTheatrePokefanMText:
	text "¡A mi mujer le"
	line "encanta estar en"
	cont "el HOTEL RYUKYU!"
	done

RyukyuTheatrePokefanFText:
	text "¡Han sido unas"
	line "vacaciones"
	cont "espléndidas!"
	done

RyukyuTheatreJanineText:
	text "¡Nada mejor que"
	line "una buena cena y"
	para "venir al teatro"
	line "cuando visito el"
	cont "HOTEL RYUKYU!"
	done

CoinsGuyNoCoinCaseText:
	text "Oh, ¿qué es esto?"

	para "¡No tienes"
	line "MONEDERO!"
	done

CoinsGuyFullCoinCaseText:
	text "Vaya, muchacho."
	line "¡Parece que tu"
	cont "MONEDERO está"
	cont "lleno!"
	done

CoinsGuyGotCoins:
	text "¡Ve a por algún"
	line "premio en"
	para "cualquiera de los"
	line "CASINOS que hay"
	cont "por todo NIHON!"
	done

KimonoGirlNaokoSeenText:
	text "Tus #MON son"
	line "encantadores."
	cont "¿Cómo luchan?"
	done

KimonoGirlNaokoBeatenText:
	text "¡Oh! ¡Eres muy"
	line "fuerte!"
	done

KimonoGirlNaokoAfterBattleText:
	text "Me ha gustado el"
	line "combate. Espero"
	cont "volver a verte."
	done

KimonoGirlSayoSeenText:
	text "Yo siempre bailo"
	line "con mis #MON."

	para "Y también los"
	line "entreno, claro."
	done

KimonoGirlSayoBeatenText:
	text "¡Estuve cerca!"
	line "Por poco te venzo."
	done

KimonoGirlSayoAfterBattleText:
	text "El ritmo es muy"
	line "importante para la"
	cont "danza y para los"
	cont "#MON."
	done

KimonoGirlKyokoSeenText:
	text "Bailar ayuda a"
	line "liberar estrés."
	done

KimonoGirlKyokoBeatenText:
	text "Me temo que he"
	line "sido derrotada."
	done

KimonoGirlKyokoAfterBattleText:
	text "Cada mes aprende-"
	line "mos una nueva"
	cont "danza."
	done

KimonoGirlZukiSeenText:
	text "¿Te gusta mi"
	line "pasador?"

	para "¡Ah! ¿Un combate"
	line "#MON?"
	done

KimonoGirlZukiBeatenText:
	text "No me queda"
	line "ningún #MON…"
	done

KimonoGirlZukiAfterBattleText:
	text "Cada mes pongo una"
	line "flor nueva en mi"
	cont "pasador."
	done

KimonoGirlKuniSeenText:
	text "¡Oh! ¡Eres tan"
	line "guay!"
	cont "¿Quieres luchar?"
	done

KimonoGirlKuniBeatenText:
	text "Eres más fuerte de"
	line "lo que pareces."
	done

KimonoGirlKuniAfterBattleText:
	text "He entrenado mucho"
	line "y creía que tenía"
	para "posibilidades,"
	line "pero no."
	done

KimonoGirlMikiSeenText:
	text "¿Te gusta cómo"
	line "bailo? También"
	cont "soy hábil con los"
	cont "#MON."
	done

KimonoGirlMikiBeatenText:
	text "¡Oh! ¡Tú también"
	line "eres genial!"
	done

KimonoGirlMikiAfterBattleText:
	text "Sigo bailando"
	line "porque hay gente a"
	para "la que le gusta lo"
	line "que hago."

	para "Mis #MON me"
	line "animan."
	done

CoinsGuyNeverLeftAScratchText:
	text "Las CHICAS KIMONO"
	line "no sólo bailan."

	para "También son"
	line "extraordinarias"
	cont "con los #MON."

	para "Yo siempre las"
	line "desafío pero nunca"
	cont "les he hecho ni un"
	cont "rasguño…"
	done

CoinsGuyLadGiftText:
	text "¡Muchacho!"

	para "¡He tenido una"
	line "racha de buena"
	para "suerte en los"
	line "juegos de azar de"
	cont "la planta de"
	cont "arriba!"

	para "¡Si eres capaz de"
	line "derrotar a todas"
	para "las CHICAS KIMONO,"
	line "llenaré tu"
	cont "MONEDERO hasta los"
	cont "topes!"
	done

CoinsGuyLikeADanceText:
	text "Verte luchar ha"
	line "sido como ver una"
	cont "danza."

	para "¡Ha sido un"
	line "combate extraño!"

	para "¡Toma muchacho,"
	line "tal y como te"
	cont "prometí!"
	done

CoinsGuyElegantKimonoGirlsText:
	text "Ojalá mis #MON"
	line "fueran tan"
	para "elegantes como las"
	line "CHICAS KIMONO…"
	done

RhydonText:
	text "RHYDON: ¡Rhydo,"
	line "rhydo!"
	done

RyukyuTheatreCooltrainerMText:
	text "Las danzas de las"
	line "CHICAS KIMONO son"
	cont "tan hipnóticas…"
	done

RyukyuTheatreGrannyText:
	text "Las CHICAS KIMONO"
	line "son tan guapas…"

	para "Pero tienen que"
	line "entrenarse mucho."

	para "Y deben aprender"
	line "los distintos"
	para "bailes antes de"
	line "actuar."

	para "Pero si te gusta"
	line "algo, todo es"
	cont "posible."
	done

RyukyuTheatreFancyPanelText:
	text "Es un elegante"
	line "panel decorado con"
	cont "flores."
	done

RyukyuTheatre_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19,  7, RYUKYU_RESTAURANT, 5


	db 0 ; coord events

	db 2 ; bg events
	bg_event 19,  2, BGEVENT_UP, RyukyuTheatreFancyPanel
	bg_event 19,  3, BGEVENT_UP, RyukyuTheatreFancyPanel

	db 14 ; object events
	object_event  1,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  4,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  7,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event 10,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 13,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event 16,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKyoko, -1
	object_event  3,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheaterCoinsGuy, -1
	object_event  2,  9, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuTheaterRhydon, -1
	object_event 11, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreCooltrainerMScript, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreGrannyScript, -1
	object_event 14,  9, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreJanineScript, -1
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuTheatrePokefanMScript, -1
	object_event  7, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuTheatrePokefanFScript, -1
	object_event 12, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreSuperNerdScript, -1


