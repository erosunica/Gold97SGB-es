	object_const_def ; object_event constants
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "Aquí hay algo"
	line "escrito."

	para "¿Quieres leerlo?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "A mis hermanos y"
	line "hermanas:"

	para "Nos enorgullece"
	line "ayudar a los"
	para "entrenadores"
	line "#MON."

	para "Cuando habléis con"
	line "los entrenadores,"
	cont "dadles algo útil."

	para "Besos,"
	line "LUNA"

	para "¿Sigues leyendo?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Lunes, LUNA"
	line "RUTA 110"

	para "Martes, MARTA"
	line "RUTA 29"

	para "Miércoles, MIGUEL"
	line "LAGO DE LA FURIA"

	para "Jueves, JOSUÉ"
	line "RUTA 36"

	para "Viernes, VICKI"
	line "RUTA 32"

	para "Sábado, SABINO"
	line "BOSQUE AZUL"

	para "Domingo, DOMINGO"
	line "RUTA 37"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
