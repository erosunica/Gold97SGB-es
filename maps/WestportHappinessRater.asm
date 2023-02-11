	object_const_def ; object_event constants
	const WESTPORTHAPPINESSRATER_TEACHER
	const WESTPORTHAPPINESSRATER_POKEFAN_M
	const WESTPORTHAPPINESSRATER_TWIN
	

WestportHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext WestportHappinessRaterTeacherText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext WestportHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext WestportHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext WestportHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext WestportHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext WestportHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext WestportHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

WestportHappinessRaterPokefanMScript:
	jumptextfaceplayer WestportHappinessRaterPokefanMText

WestportHappinessRaterTwinScript:
	jumptextfaceplayer WestportHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd DifficultBookshelfScript

HappinessRatersHouseRadio:
	jumpstd Radio2Script

WestportHappinessRaterTeacherText:
	text "Si tratas bien a"
	line "tus #MON,"
	cont "ellos te querrán."

	para "¿Eh? Déjame ver tu"
	line "@"
	text_ram wStringBuffer3
	text "…"
	done

WestportHappinessRatingText_LovesYouALot:
	text "¡Parece muy feliz!"
	line "Te debe de querer"
	cont "mucho."
	done

WestportHappinessRatingText_ReallyTrustsYou:
	text "Me parece que"
	line "confía mucho"
	cont "en ti."
	done

WestportHappinessRatingText_SortOfHappy:
	text "Es cariñoso"
	line "contigo. Parece"
	cont "feliz."
	done

WestportHappinessRatingText_QuiteCute:
	text "Es bastante mono."
	done

WestportHappinessRatingText_NotUsedToYou:
	text "Deberías tratarlo"
	line "mejor. No está"
	cont "acostumbrado a ti."
	done

WestportHappinessRatingText_LooksMean:
	text "Da la impresión de"
	line "que no le gustas."
	cont "Parece malvado."
	done

WestportHappinessRaterPokefanMText:
	text "No dejo de perder"
	line "en los combates y"
	para "mis #MON acaban"
	line "desmayándose…"

	para "Quizá sea ésa la"
	line "razón por la que"
	cont "no les gusto…"
	done

WestportHappinessRaterTwinText:
	text "¡Si uso un objeto"
	line "con mi #MON,"
	cont "se pone contento!"
	done

WestportHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, WESTPORT_CITY, 2
	warp_event  5,  7, WESTPORT_CITY, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, HappinessRatersHouseRadio

	db 3 ; object events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterTeacherScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterPokefanMScript, -1
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterTwinScript, -1
