	object_const_def ; object_event constants
	const POKEMONFANCLUB_CHAIRMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_CLEFAIRY_GUY
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeechButBagFull:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext PokemonFanClubChairmanItsARareCandyText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue .MetCopycat
	waitbutton
	closetext
	end

.MetCopycat:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	giveitem LOST_ITEM
	iffalse .NoRoom
	disappear POKEMONFANCLUB_FAIRY
	writetext PokemonFanClubPlayerReceivedDollText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

.GotLostItem:
	writetext PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PokemonFanClubClefairyGuyPackIsJammedFullText
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext PokemonFanClubClefairyDollText

PokemonFanClubBlossomoleScript:
	opentext
	writetext PokemonFanClubBlossomoleText
	cry BLOSSOMOLE
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Soy el PRESIDENTE"
	line "del CLUB de FANS"
	cont "de #MON."

	para "He curado a más de"
	line "150 #MON."

	para "Soy muy exigente"
	line "cuando se trata de"
	cont "#MON."

	para "¿Has venido para"
	line "saber de mis"
	cont "#MON?"
	done

PokemonFanClubChairmanRapidashText:
	text "¡Muy bien!"
	line "¡Pues escucha!"

	para "Mi… preferido"
	line "es RAPIDASH…"

	para "Es… gracioso…"
	line "cariñoso… veloz"
	cont "e increíble…"
	cont "¿No crees…? Es"
	cont "sorprendente…"
	cont "simpático…"
	cont "¡Y lo quiero!"

	para "Si lo abrazas…"
	line "cuando duerme…"
	cont "es tan cálido…"
	cont "y mimoso… Es"
	cont "espectacular…"
	cont "encantador…"
	cont "¡Uuups! ¡Mira qué"
	cont "hora es! ¡Hablo"
	cont "demasiado!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "¡Gracias por"
	line "escucharme!"
	cont "¡Toma esto!"
	done

PokemonFanClubChairmanItsARareCandyText:
	text "Es un CARAMELORARO"
	line "que fortalece a"
	cont "los #MON."

	para "Prefiero que mis"
	line "#MON luchen"
	para "para fortalecerse."
	line "¡Así que toma!"
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "¡Hola, <PLAYER>!"

	para "¿Viniste a verme"
	line "de nuevo por mis"
	cont "#MON?"

	para "¿No? Oh… Tengo"
	line "más historias que"
	cont "contar…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "¡Qué pena…!"

	para "¡Vuelve cuando"
	line "quieras!"
	done

PokemonFanClubReceptionistText:
	text "Al PRESIDENTE le"
	line "encanta hablar"
	cont "cuando se trata de"
	cont "#MON…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "Me encanta el modo"
	line "en que CLEFAIRY"
	para "mueve el dedo para"
	line "usar METRÓNOMO."

	para "¡Es tan adorable!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Me gusta CLEFAIRY,"
	line "pero jamás podría"
	para "atrapar uno."
	line "Por eso me"
	para "conformo con este"
	line "# MUÑECO que he"
	cont "encontrado."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "¡Ah, entiendo! La"
	line "niña que perdió el"
	para "# MUÑECO está"
	line "triste…"

	para "Vale. ¿Podrías"
	line "devolverle este"
	para "# MUÑECO a"
	line "esa pobre niña?"

	para "Un día me haré"
	line "amigo de un"
	para "CLEFAIRY real."
	line "¡No te preocupes!"
	done

PokemonFanClubPlayerReceivedDollText:
	text "<PLAYER> recibió"
	line "el # MUÑECO."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "¡Ya verás! Voy a"
	line "hacerme amigo de"
	cont "un auténtico"
	cont "CLEFAIRY."
	done

PokemonFanClubClefairyGuyPackIsJammedFullText:
	text "Tu MOCHILA está"
	line "repleta."
	done

PokemonFanClubTeacherText:
	text "¡Mira mi precioso"
	line "BLOSSOMOLE!"

	para "¡Lleva una hoja"
	line "tan mona!"
	done

PokemonFanClubClefairyDollText:
	text "¡Es un CLEFAIRY!"
	line "¿Verdad?"

	para "¡No! Es un #"
	line "MUÑECO CLEFAIRY."
	done

PokemonFanClubBlossomoleText:
	text "BLOSSOMOLE: ¡Blos!"
	done

PokemonFanClubListenSignText:
	text "Escuchemos"
	line "atentamente a"
	cont "los entrenadores."
	done

PokemonFanClubBraggingSignText:
	text "Si alguno alardea,"
	line "hazlo tú también."
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AMAMI_TOWN, 3
	warp_event  3,  7, AMAMI_TOWN, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	db 6 ; object events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_AMAMI_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBlossomoleScript, -1
