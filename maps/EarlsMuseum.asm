	object_const_def ; object_event constants
	const EARLMUSEUM_EARL
	const EARLMUSEUM_BIRD
	const EARLMUSEUM_DRAGON
	const EARLMUSEUM_LASS
	const EARLMUSEUM_POKEFAN_M

EarlsMuseum_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ArtHousePagotaTreeGone
	
.ArtHousePagotaTreeGone
	setevent EVENT_PAGOTA_TREE_CUT
	return

BirdScript:
	opentext
	writetext BirdText
	waitbutton
	closetext
	end

DragonScript:
	opentext
	writetext DragonText
	waitbutton
	closetext
	end

ArtistEarl:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext ArtistEarlIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext ArtistEarlLickitungText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LUXWAN, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump .ShowedLickitung

.GotEverstone:
	writetext ArtistEarlOddishText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon; edit here, change back to dratini
	scall .CorrectPokemon
	clearevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump .ShowedOddish


.ShowedOddish:
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	clearevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ExcitedToSee:
	writetext ArtistEarlExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext ArtistEarlYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext ArtistEarlShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext ArtistEarlTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext ArtistEarlComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext ArtistEarlShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext ArtistEarlWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end
	
EggStatue:
	jumptext EggStatueText

ArtSign:
	jumptext ArtSignText
	
ArtHouseLassScript:
	jumptextfaceplayer ArtHouseLassText
	
ArtHousePokefanMScript:
	jumptextfaceplayer ArtHousePokefanMText
	
ArtHousePokefanMText:
	text "¡Las obras de este"
	line "artista son"
	cont "impresionantes!"
	done
	
ArtHouseLassText:
	text "Para serte"
	line "sincera, el HUEVO"
	cont "es mi estatua"
	cont "favorita."
	done

EggStatueText:
	text "ESTATUA DE"
	line "HUEVO #MON,"
	cont "hecha por GABRIEL"
	done
	
ArtSignText:
	text "GALERÍA DE ARTE"
	line "DE GABRIEL"
	para "No tocar, por"
	line "favor."
	done

ArtistEarlIntroText:
	text "Oh, soy un"
	line "fracasado."

	para "¡No preguntes"
	line "por qué!"

	para "Vale, te lo diré."

	para "Soy GABRIEL, y soy"
	line "un artista."

	para "O al menos,"
	line "desearía que me"
	cont "vieran como uno."

	para "Nunca me siento"
	line "inspirado."

	para "Abrí esta GALERÍA"
	line "de ARTE para"
	para "mostrar mis obras,"
	line "pero la única"
	para "escultura que he"
	line "logrado terminar"
	para "es una de un HUEVO"
	line "#MON."

	para "¡Tengo que hacer"
	line "algo que"
	cont "impresione!"

	para "He estado"
	line "trabajando en una"
	para "estatua del"
	line "#MON LUXWAN,"
	para "pero aún no la he"
	line "terminado."
	done

ArtistEarlAskToSeeMonText:
	text "Si tienes ese"
	line "#MON, ¿me"
	cont "dejas verlo?"
	done

ArtistEarlExcitedToSeeText:
	text "¿Me lo dejas ver?"
	line "¡Qué amable eres!"
	done

ArtistEarlYouDontHaveItTextText:
	text "¿No lo tienes?"
	line "¡Qué pena…!"
	done

ArtistEarlShownPokemonText:
	text "¡Ah, sí! ¡Es un"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "¡Muchas gracias!"

	para "¡Me siento"
	line "inspirado!"
	done

ArtistEarlTokenOfAppreciationText:
	text "Toma esto como"
	line "agradecimiento."
	done

ArtistEarlComeAgainText:
	text "Vuelve cuando"
	line "quieras."
	done

ArtistEarlShownAllThePokemonText:
	text "Gracias por"
	line "enseñarme ese"
	cont "#MON."

	para "¡Con tu ayuda,"
	line "ahora estoy mucho"
	para "más cerca de"
	line "cumplir mi sueño!"
	done

ArtistEarlWrongPokemonText:
	text "¿Eh?"

	para "Ese no es el"
	line "#MON en que"
	cont "estaba pensando."
	done

ArtistEarlLickitungText:
	text "Si pudiera ver un"
	line "LUXWAN en persona,"
	para "me sentiría"
	line "inspirado para"
	cont "terminar mi"
	cont "estatua."
	done
	

ArtistEarlOddishText:
	text "¡He terminado mi"
	line "estatua de LUXWAN!"

	para "Ahora, me gustaría"
	line "terminar mi"
	cont "estatua de"
	cont "DRATINI."

	para "Si pudiera ver un"
	line "DRATINI en"
	para "persona, me"
	line "sentiría inspirado"
	cont "para terminar mi"
	cont "estatua."
	done

BirdText:
	text "ESTATUA DE"
	line "LUXWAN,"
	cont "hecha por GABRIEL"
	done
	
DragonText:
	text "ESTATUA DE"
	line "DRATINI,"
	cont "hecha por GABRIEL"
	done

EarlsMuseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAGOTA_CITY, 13
	warp_event  3,  7, PAGOTA_CITY, 14

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 4, BGEVENT_READ, EggStatue
	bg_event 2, 3, BGEVENT_READ, ArtSign

	db 5 ; object events
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtistEarl, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
