	object_const_def ; object_event constants
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_RED_IN_KANTO_GYM
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterMoibelle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveMoibelle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfMoibelle
	promptbutton
	waitsfx
	writetext ManiaText_GotMoibelle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_RED_IN_KANTO_GYM
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfMoibelle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnMoibelle
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_MoibelleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_MoibelleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft
	writetext ManiaText_MoibelleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf:
; unused
	jumpstd PictureBookshelfScript

ManiaText_AskLookAfterMoibelle:
	text "¡Estoy alucinado!"

	para "Vino un chico de"
	line "tu edad, de pelo"
	para "largo y mirada"
	line "penetrante."

	para "¡Y me obligó a"
	line "darle mis"
	cont "queridos #MON!"

	para "Todavía me queda"
	line "uno, ¿pero qué"
	cont "hago si vuelve?"

	para "Pareces fuerte."
	line "¿Podrías cuidar de"
	para "mi #MON durante"
	line "un rato?"
	done

ManiaText_TakeCareOfMoibelle:
	text "¡Oh, gracias!"

	para "¡Cuídale bien,"
	line "por favor!"
	done

ManiaText_GotMoibelle:
	text "<PLAYER> recibió"
	line "un #MON."
	done

ManiaText_PartyFull:
	text "No puedes llevar"
	line "más #MON."
	done

ManiaText_IfHeComesBack:
	text "¡Oh, no…!"
	line "¿Y qué hago si"
	cont "vuelve?"
	done

ManiaText_CanIHaveMyMonBack:
	text "¡Hola! ¿Cómo está"
	line "mi #MON?"

	para "Creo que ya pasó"
	line "el peligro."
	cont "¿Me lo devuelves?"
	done

ManiaText_ThankYou:
	text "¡Gracias!"
	done

ManiaText_MoibelleNotThere:
	text "¡Oye! ¡No llevas"
	line "a mi #MON"
	cont "contigo!"
	done

ManiaText_MoibelleLikesYou:
	text "Mi #MON te"
	line "ha tomado cariño."

	para "¡Vale! ¡Quédatelo,"
	line "pero prométeme que"
	cont "serás amable con"
	cont "él!"
	done

ManiaText_SameAsBeingRobbed:
	text "¡Oh, no, no…!"
	line "Es como si me"
	cont "hubieran robado."
	done

ManiaText_HappinessSpeech:
	text "Para los #MON,"
	line "la felicidad es"
	para "estar con quien"
	line "los quiere."
	done

ManiaText_MoibelleIsYourLastMon:
	text "Si me llevo a mi"
	line "#MON, ¿cómo"
	cont "lucharás?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SUNPOINT_CITY, 1
	warp_event  3,  7, SUNPOINT_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
