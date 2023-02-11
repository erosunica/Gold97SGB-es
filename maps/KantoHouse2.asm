	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY
	const KANTOHOUSE_2_POKEFANM

KantoHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	checkcode VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end
	
KantoHouse2PokefanMScript:
	jumptextfaceplayer KantoHouse2PokefanMText

KantoHouse2PokefanMText:
	text "¡Anda, hola!"

	para "Nos encanta"
	line "recibir visitas."

	para "A mi esposa le"
	line "encanta charlar"
	cont "tomando el té."
	done

DaisyHelloText:
	text "Oh, hola, querido."

	para "Adoro conocer"
	line "gente nueva."

	para "Podrías pasar por"
	line "aquí alguna tarde"
	para "para que podamos"
	line "tomar el té."
	done

DaisyOfferGroomingText:
	text "¡Llegas a tiempo!"
	line "Iba a tomar un té."

	para "¿Quieres"
	line "tomarte uno?"

	para "Tus #MON están"
	line "un poco sucios."

	para "¿Quieres que"
	line "limpie a uno?"
	done

DaisyWhichMonText:
	text "¿Qué #MON"
	line "limpio?"
	done

DaisyAlrightText:
	text "Vale, haré que"
	line "mejore su aspecto"
	cont "enseguida."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text_start
	line "parece contento."
	done

DaisyAllDoneText:
	text "¡Ya está! ¡Listo!"

	para "¿Qué? ¿Tiene buen"
	line "aspecto o no?"

	para "¡Qué #MON"
	line "más mono!"
	done

DaisyAlreadyGroomedText:
	text "Siempre tomo té a"
	line "esta hora. Ven"
	cont "cuando quieras."
	done

DaisyRefusedText:
	text "¿No quieres que"
	line "limpie a un"

	para "#MON? Vale, tan"
	line "sólo tomaremos té."
	done

DaisyCantGroomEggText:
	text "Lo siento. No"
	line "puedo limpiar un"
	cont "HUEVO."
	done

KantoHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 25
	warp_event  5,  7, KANTO_REGION, 25

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse2PokefanMScript, -1
