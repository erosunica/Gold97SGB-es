	object_const_def ; object_event constants
	const KANTOHOUSE_4_FISHING_GURU

KantoHouse4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
KantoHouse4FishingGuru:
	faceplayer
	opentext
	checkevent EVENT_KANTO_REGION_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_KANTO_REGION_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRocketHideout
	checkevent EVENT_KANTO_REGION_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_KikaiVillageHistory
	waitbutton
	closetext
	setevent EVENT_KANTO_REGION_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_KANTO_REGION_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	writebyte MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	jump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_KANTO_REGION_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_KANTO_REGION_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

KikaiVillageMagikarpHouseUnusedRecordSign:
; unused
	jumptext KikaiVillageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_KikaiVillageHistory:
	text "Nunca deberías"
	line "poder leer este"
	cont "diálogo."

	para "Si lo estás"
	line "leyendo, debe ser"
	para "un error, o estás"
	line "manipulando el"
	cont "juego."

	para "Este texto solo"
	line "aparece si hablas"
	para "con este tipo"
	line "antes de derrotar"
	para "al TEAM ROCKET en"
	line "la TORRE RADIO."

	para "Y no deberías"
	line "estar aquí si no"
	cont "lo has hecho."

	para "Al desarrollador"
	line "no le importó"
	para "cambiar el evento"
	line "de este tipo"
	para "porque no es que"
	line "fuese necesario."

	para "¿Qué te trae por"
	line "aquí?"

	para "Deberías dar"
	line "marcha atrás y"
	para "hacer lo que"
	line "tengas que hacer."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Vete de aquí,"
	line "niño."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Desde que era"
	line "pequeño, he"
	cont "adorado a los"
	cont "MAGIKARP."

	para "Quizá se cumpla mi"
	line "sueño de ver al"

	para "MAGIKARP más"
	line "grande del mundo."

	para "¿Tienes una CAÑA?"
	line "Si tienes una,"
	cont "ayúdame por favor."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "¡Ah, tienes un"
	line "MAGIKARP! A ver lo"
	cont "grande que es ese"
	cont "bebé."
	done

MagikarpLengthRaterText_Memento:
	text "¡Uau! ¡Éste es"
	line "impresionante!"

	para "¡Me quito el"
	line "sombrero ante ti!"

	para "¡Toma esto como"
	line "recuerdo!"
	done

MagikarpLengthRaterText_Bonus:
	text "Lo importante es"
	line "el récord. ¡Piensa"
	para "en él como una"
	line "bonificación!"
	done

MagikarpLengthRaterText_TooShort:
	text "¡Uau! ¡Éste es"
	line "impresionante!"

	para "Ojalá no tuviera"
	line "que decirlo, pero"
	para "he visto uno más"
	line "grande antes."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "¿Qué? ¡Eso no es"
	line "un MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "¿No tienes ninguno"
	line "bueno que"
	para "enseñarme? Quizá"
	line "la próxima vez."
	done

KikaiVillageMagikarpHouseUnusedRecordText:
	text "RÉCORD ACTUAL"

	para "@"
	text_ram wStringBuffer3
	text " cm, atrapado"
	line "por @"
	text_ram wStringBuffer4
	text ".@"
	text_end

	text_end ; unused


KantoHouse4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 27
	warp_event  5,  7, KANTO_REGION, 27

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse4FishingGuru, -1
