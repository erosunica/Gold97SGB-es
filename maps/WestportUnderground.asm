	object_const_def ; object_event constants
	const WESTPORTUNDERGROUND_SUPER_NERD1
	const WESTPORTUNDERGROUND_SUPER_NERD2
	const WESTPORTUNDERGROUND_SUPER_NERD3
	const WESTPORTUNDERGROUND_SUPER_NERD4
	;const WESTPORTUNDERGROUND_POKE_BALL
	const WESTPORTUNDERGROUND_GRAMPS
	const WESTPORTUNDERGROUND_SUPER_NERD5
	const WESTPORTUNDERGROUND_SUPER_NERD6
	const WESTPORTUNDERGROUND_GRANNY
	const WESTPORTUNDERGROUND_JANINE
	const WESTPORTUNDERGROUND_CLERK

WestportUnderground_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeek

.ResetSwitches:
	return





.CheckDayOfWeek:
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

.Sunday:
	disappear WESTPORTUNDERGROUND_GRAMPS
	disappear WESTPORTUNDERGROUND_SUPER_NERD5
	appear WESTPORTUNDERGROUND_SUPER_NERD6
	appear WESTPORTUNDERGROUND_GRANNY
	return

.Monday:
	disappear WESTPORTUNDERGROUND_GRAMPS
	checktime MORN
	iffalse .NotMondayMorning
	appear WESTPORTUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear WESTPORTUNDERGROUND_SUPER_NERD5
	disappear WESTPORTUNDERGROUND_SUPER_NERD6
	disappear WESTPORTUNDERGROUND_GRANNY
	return

.Tuesday:
	disappear WESTPORTUNDERGROUND_GRAMPS
	appear WESTPORTUNDERGROUND_SUPER_NERD5
	disappear WESTPORTUNDERGROUND_SUPER_NERD6
	disappear WESTPORTUNDERGROUND_GRANNY
	return

.Wednesday:
	appear WESTPORTUNDERGROUND_GRAMPS
	disappear WESTPORTUNDERGROUND_SUPER_NERD5
	appear WESTPORTUNDERGROUND_SUPER_NERD6
	disappear WESTPORTUNDERGROUND_GRANNY
	return

.Thursday:
	disappear WESTPORTUNDERGROUND_GRAMPS
	appear WESTPORTUNDERGROUND_SUPER_NERD5
	disappear WESTPORTUNDERGROUND_SUPER_NERD6
	disappear WESTPORTUNDERGROUND_GRANNY
	return

.Friday:
	disappear WESTPORTUNDERGROUND_GRAMPS
	disappear WESTPORTUNDERGROUND_SUPER_NERD5
	appear WESTPORTUNDERGROUND_SUPER_NERD6
	disappear WESTPORTUNDERGROUND_GRANNY
	return

.Saturday:
	disappear WESTPORTUNDERGROUND_GRAMPS
	appear WESTPORTUNDERGROUND_SUPER_NERD5
	disappear WESTPORTUNDERGROUND_SUPER_NERD6
	appear WESTPORTUNDERGROUND_GRANNY
	return

TrainerSupernerdEric:
	trainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdEricAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTeru:
	trainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTeruAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacIsaac:
	trainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacIssacAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacDonald:
	trainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDonaldAfterBattleText
	waitbutton
	closetext
	end

BitterMerchantScript:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .Open
	ifequal SATURDAY, .Open
	jump WestportUndergroundScript_ShopClosed

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND
	closetext
	end

BargainMerchantScript:
	faceplayer
	opentext
	checkflag ENGINE_WESTPORT_UNDERGROUND_MERCHANT_CLOSED
	iftrue WestportUndergroundScript_ShopClosed
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .CheckMorn
	ifequal WEDNESDAY, .BargainOpen
	jump WestportUndergroundScript_ShopClosed

.CheckMorn:
	checktime MORN
	iffalse WestportUndergroundScript_ShopClosed
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end
	
.BargainOpen
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

OlderHaircutBrotherScript:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .DoHaircut
	ifequal THURSDAY, .DoHaircut
	ifequal SATURDAY, .DoHaircut
	jump WestportUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_WESTPORT_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c5f9
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x7c69a
	buttonsound
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_WESTPORT_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	jump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.then
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c6b8
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x7c6d8
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	jump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext UnknownText_0x7c6ea
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c709
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext UnknownText_0x7c72b
	waitbutton
	closetext
	end

YoungerHaircutBrotherScript:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .DoHaircut
	ifequal WEDNESDAY, .DoHaircut
	ifequal FRIDAY, .DoHaircut
	jump WestportUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_WESTPORT_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c75c
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x7c7f1
	buttonsound
	special OlderHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_WESTPORT_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	jump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.then
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c80e
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x7c82a
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	jump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext UnknownText_0x7c842
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c85b
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext UnknownText_0x7c87b
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

BasementDoorScriptelev::
	opentext
	writetext UnknownText_0x7c5b01
	waitbutton
	closetext
	end


WestportUndergroundScript_ShopClosed:
	writetext UnknownText_0x7c904
	waitbutton
	closetext
	end
	
WestportUndergroundJanineScript:
	jumptextfaceplayer WestportUndergroundJanineText

WestportUndergroundCoinCase:
	itemball COIN_CASE

WestportUndergroundNoEntrySign:
	jumptext WestportUndergroundNoEntryText
	
WestportUndergroundSalonSign:
	jumptext WestportUndergroundSalonText
	
WestportUndergroundBitterSign:
	jumptext WestportUndergroundBitterText
	
WestportUndergroundGrampsSign:
	jumptext WestportUndergroundGrampsText

WestportUndergroundHiddenParlyzHeal:
	hiddenitem PARLYZ_HEAL, EVENT_WESTPORT_UNDERGROUND_HIDDEN_PARLYZ_HEAL

WestportUndergroundHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_WESTPORT_UNDERGROUND_HIDDEN_SUPER_POTION

WestportUndergroundHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_WESTPORT_UNDERGROUND_HIDDEN_ANTIDOTE
	
WestportUndergroundClerkScript:
	jumptextfaceplayer WestportUndergroundClerkText
	
WestportUndergroundClerkText:
	text "Bienvenido."
	
	para "Aquí puedes"
	line "encontrar tiendas"
	para "únicas llevadas"
	line "por autónomos."
	
	para "Estas tiendas solo"
	line "abren cada tanto"
	para "tiempo, así que"
	line "deberías pasarte"
	para "de vez en cuando"
	line "si quieres"
	cont "comprarle algo a"
	cont "alguien."
	done
	
WestportUndergroundJanineText:
	text "Este sitio tiene"
	line "tiendas interesan-"
	cont "tes."
	
	para "¡Pero los pasillos"
	line "poco iluminados"
	para "atraen a entrena-"
	line "dores indecentes"
	cont "que buscan"
	cont "combates!"
	done

SupernerdEricSeenText:
	text "Los empleados del"
	line "CENTRO COMERCIAL"
	para "no quieren que"
	line "siga merodeando"
	cont "aquí abajo."
	
	para "¡Más te vale no"
	line "decirles que me"
	cont "has visto aquí!"
	done

SupernerdEricBeatenText:
	text "¡Caray…!"
	done

SupernerdEricAfterBattleText:
	text "Supongo que"
	line "debería"
	cont "comportarme mejor…"
	done

SupernerdTeruSeenText:
	text "¿Tienes en cuenta"
	line "los tipos durante"
	cont "el combate?"

	para "Si conoces bien"
	line "los distintos"
	para "tipos, rendirás"
	line "más en combate."
	done

SupernerdTeruBeatenText:
	text "¡Oh, oh, oh!"
	done

SupernerdTeruAfterBattleText:
	text "Conozco mis tipos"
	line "de #MON."

	para "Pero sólo uso un"
	line "tipo de #MON."
	done

PokemaniacIssacSeenText:
	text "¡Les corté el pelo"
	line "a mis #MON!"

	para "¡Ahora verás lo"
	line "fuertes que son!"
	done

PokemaniacIssacBeatenText:
	text "¡Ayyyy!"
	done

PokemaniacIssacAfterBattleText:
	text "Los #MON serán"
	line "más amigos tuyos"
	para "si los llevas a"
	line "cortarse el pelo."
	done

PokemaniacDonaldSeenText:
	text "Creo que tienes"
	line "algunos #MON"
	cont "muy raros."

	para "¡Déjame verlos!"
	done

PokemaniacDonaldBeatenText:
	text "¡Bah! ¡He perdido!"
	line "¡Qué rabia me da!"
	done

PokemaniacDonaldAfterBattleText:
	text "¿Tienes una"
	line "#DEX? Pues te"
	cont "daré una pista."

	para "Algunos entrenado-"
	line "res te llamarán si"
	para "ven algún #MON"
	line "raro."
	
	para "Tendrás que"
	line "descubrir quiénes"
	cont "son."
	done


UnknownText_0x7c5b01:
	text "CENTRO COMERCIAL"
	line "ASCENSOR"
	done


UnknownText_0x7c5f9:
	text "¡Hola! ¡Yo dirijo"
	line "la PELUQUERÍA"
	cont "#MON!"

	para "Soy el mayor y"
	line "el mejor de los"
	para "dos HERMANOS"
	line "PELUQUEROS."

	para "Puedo poner guapos"
	line "a tus #MON por"
	cont "sólo 500¥."

	para "¿Quieres que les"
	line "corte el pelo?"
	done

UnknownText_0x7c69a:
	text "¿A qué #MON"
	line "le corto el pelo?"
	done

UnknownText_0x7c6b8:
	text "¡Vale! ¡Verás lo"
	line "bien que queda!"
	done

UnknownText_0x7c6d8:
	text "¡Bien! ¡Ya está!"
	done

UnknownText_0x7c6ea:
	text "¿De verdad?"
	line "¡Qué pena!"
	done

UnknownText_0x7c709:
	text "Necesitarás más"
	line "dinero."
	done

UnknownText_0x7c72b:
	text "Sólo corto el pelo"
	line "una vez al día."
	cont "Ya vale por hoy."
	done

UnknownText_0x7c75c:
	text "¡Bienvenido a la"
	line "PELUQUERÍA!"

	para "Soy el más joven y"
	line "el más novato de"
	para "los dos HERMANOS"
	line "PELUQUEROS."

	para "Pondré guapos a"
	line "tus #MON por"
	cont "sólo 300¥."

	para "¿Qué dices?"
	done

UnknownText_0x7c7f1:
	text "¿A qué #MON"
	line "le corto el pelo?"
	done

UnknownText_0x7c80e:
	text "¡Vale! Ya verás lo"
	line "bien que queda."
	done

UnknownText_0x7c82a:
	text "¡Muy bien!"
	line "¡Ya está!"
	done

UnknownText_0x7c842:
	text "¿No?"
	line "¡Qué lástima!"
	done

UnknownText_0x7c85b:
	text "No te queda mucho"
	line "dinero."
	done

UnknownText_0x7c87b:
	text "Sólo corto el pelo"
	line "una vez al día."

	para "Perdona, pero hoy"
	line "no trabajo más."
	done

HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3
	text_start
	line "parece un poco"
	cont "más feliz."
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3
	text_start
	line "parece feliz."
	done

HaircutBrosText_MuchHappier:
	text "¡@"
	text_ram wStringBuffer3
	text_start
	line "está encantado!"
	done

UnknownText_0x7c904:
	text "Lo siento,"
	line "hemos cerrado."
	done

WestportUndergroundNoEntryText:
	text "¡El mundo es un"
	line "camino de bicis!"
	cont "TIENDA DE BICIS"
	done
	
WestportUndergroundSalonText:
	text "HERMANOS"
	line "PELUQUEROS"
	para "PELUQUERÍA #MON"
	line "CERRADO LOS LUNES"
	done
	
WestportUndergroundBitterText:
	text "REMEDIOS NATURALES"
	para "ABIERTO LOS FINES"
	line "DE SEMANA TODO EL"
	cont "DÍA"
	done
	
WestportUndergroundGrampsText:
	text "GANGAS DEL ABUELO"
	para "ABIERTO LUNES POR"
	line "LA MAÑANA Y MIÉRC."
	cont "TODO EL DÍA"
	done

WestportUnderground_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  6,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1
	warp_event 18,  2, WESTPORT_BIKE_SHOP, 1
	warp_event 12,  6, WESTPORT_UNDERGROUND, 4
	warp_event  0, 35, WESTPORT_UNDERGROUND, 3
	warp_event  1, 35, WESTPORT_UNDERGROUND, 3
	warp_event 12, 14, WESTPORT_UNDERGROUND, 7
	warp_event 14, 35, WESTPORT_UNDERGROUND, 6
	warp_event 15, 35, WESTPORT_UNDERGROUND, 6
	warp_event  2, 20, WESTPORT_UNDERGROUND, 10
	warp_event 28, 35, WESTPORT_UNDERGROUND, 9
	warp_event 29, 35, WESTPORT_UNDERGROUND, 9

	db 0 ; coord events

	db 8 ; bg events
	bg_event  7,  0, BGEVENT_READ, BasementDoorScriptelev
	bg_event 19,  2, BGEVENT_READ, WestportUndergroundNoEntrySign
	bg_event 13, 14, BGEVENT_READ, WestportUndergroundSalonSign
	bg_event  3, 20, BGEVENT_READ, WestportUndergroundBitterSign
	bg_event 13,  6, BGEVENT_READ, WestportUndergroundGrampsSign
	bg_event 21,  7, BGEVENT_ITEM, WestportUndergroundHiddenParlyzHeal
	bg_event  0,  1, BGEVENT_ITEM, WestportUndergroundHiddenSuperPotion
	bg_event  0,  9, BGEVENT_ITEM, WestportUndergroundHiddenAntidote

	db 10 ; object events
	object_event  0, 22, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdEric, -1
	object_event 10, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdTeru, -1
	object_event 19,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacIsaac, -1
	object_event  5, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDonald, -1
	;object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WestportUndergroundCoinCase, EVENT_GOT_COIN_CASE_FROM_GAMBLER
	object_event  5, 33, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_WESTPORT_UNDERGROUND_GRAMPS
	object_event 17, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_WESTPORT_UNDERGROUND_OLDER_HAIRCUT_BROTHER
	object_event 18, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_WESTPORT_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event 26, 35, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_WESTPORT_UNDERGROUND_GRANNY
	object_event  3,  4, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportUndergroundJanineScript, -1
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WestportUndergroundClerkScript, -1
