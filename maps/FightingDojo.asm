	object_const_def ; object_event constants
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL
	const FIGHTINGDOJO_BLACK_BELT2
	const FIGHTINGDOJO_BLACK_BELT3
	const FIGHTINGDOJO_BLACK_BELT4
	const FIGHTINGDOJO_BLACK_BELT5

FightingDojo_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

;FightingDojoBlackBelt:
;	jumptextfaceplayer FightingDojoBlackBeltText

FightingDojoBlackBelt:
	faceplayer
	checkevent EVENT_BEAT_BLACKBELT_YOSHI
	iftrue .CheckNext1
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext1
	checkevent EVENT_BEAT_BLACKBELT_LAO
	iftrue .CheckNext2
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext2
	checkevent EVENT_BEAT_BLACKBELT_NOB
	iftrue .CheckNext3
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext3
	checkevent EVENT_BEAT_BLACKBELT_LUNG
	iftrue .BeatAllBlackbelts
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.BeatAllBlackbelts
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue .GotTyrogueDojo
	opentext
	writetext Text_BeatEm
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoomTyrogue
	writetext UnknownText_0x7e3551
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYROGUE, 10
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	writetext Text_FocusBandDescription
	waitbutton
	closetext
	end

.GotTyrogueDojo:
	opentext
	writetext Text_GoodJob
	waitbutton
	closetext
	end
.NoRoomTyrogue:
	writetext UnknownText_0x7e3df1
	waitbutton
	closetext
	end


FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND
TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end
	
UnknownText_0x7e3551:
	text "<PLAYER> recibió"
	line "a TYROGUE."
	done
	
UnknownText_0x7e3df1:
	text "¡No tienes sitio"
	line "en tu equipo!"
	done
	
Text_FocusBandDescription:
	text "¡TYROGUE puede"
	line "evolucionar en"
	para "tres #MON"
	line "distintos del tipo"
	cont "lucha!"

	para "¡Un entrenador"
	line "como tú no debería"
	cont "tener problemas"
	cont "criándolo!"
	done

Text_GoodJob:
	text "¡Uau! ¡Deberías"
	line "entrenar en nues-"
	cont "tro DOJO, chico!"
	done

Text_BeatEm:
	text "¡Uau, chico!"

	para "¡Has estado"
	line "impresionante!"

	para "¡Te has ganado"
	line "esto!"
	done

Text_GoBeatBlackbelts:
	text "¡Eh, niño!"

	para "¡Si puedes vencer"
	line "a mis estudiantes,"
	cont "te daré un premio!"
	done

FightingDojoBlackBeltText:
	text "¡Hola!"

	para "El REY del KARATE,"
	line "el maestro del"

	para "DOJO-KARATE, está"
	line "entrenando en una"
	cont "cueva de NIHON."
	done

FightingDojoSign1Text:
	text "¡Lo que tenga que"
	line "ser… será!"
	done

FightingDojoSign2Text:
	text "¡Enemigos por"
	line "todas partes!"
	done

BlackbeltYoshiSeenText:
	text "A mis #MON y"
	line "a mí nos une una"
	cont "gran amistad."

	para "¡Nuestro vínculo"
	line "nunca se romperá!"
	done

BlackbeltYoshiBeatenText:
	text "¡No puede ser!"
	done

BlackbeltYoshiAfterText:
	text "¡Parece que tú y"
	line "tus #MON estáis"
	cont "muy unidos!"
	done

BlackbeltLaoSeenText:
	text "¡Los expertos en"
	line "artes marciales no"
	cont "tememos a nada!"
	done

BlackbeltLaoBeatenText:
	text "¡Es increíble!"
	done

BlackbeltLaoAfterText:
	text "Los #MON de"
	line "lucha temen a los"
	cont "psíquicos…"
	done

BlackbeltNobSeenText:
	text "Las palabras no"
	line "sirven. ¡Deja que"
	cont "hablen tus puños!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "¡He perdido!"
	line "¡No sé qué decir!"
	done

BlackbeltLungSeenText:
	text "¡Mis furiosos"
	line "puños destrozarán"
	cont "a tus #MON!"
	done

BlackbeltLungBeatenText:
	text "¡Me has"
	line "aplastado!"
	done

BlackbeltLungAfterText:
	text "¡Mis #MON han"
	line "perdido! Has"
	cont "herido mi orgullo."
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, ALLOY_CITY, 11
	warp_event  6, 11, ALLOY_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  6,  0, BGEVENT_READ, FightingDojoSign2

	db 6 ; object events
	object_event  5,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
	object_event  4,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltYoshi, -1
	object_event  7,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltLao, -1
	object_event  7,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltNob, -1
	object_event  4,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltLung, -1
