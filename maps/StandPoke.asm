	object_const_def ; object_event constants
	const STANDPOKE_NURSE1
	const STANDPOKE_FAIRY
	const STANDPOKE_NURSE2

StandPoke_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandPokeNurse1Script:
	faceplayer
	opentext
	writetext StandPokeNurse1Text
	waitbutton
	closetext
	turnobject STANDPOKE_NURSE1, RIGHT
	end
	

StandPokeClefairyScript:
	opentext
	writetext ClefairyWeakText
	setval CLEFAIRY
	special PlaySlowCry
	promptbutton
	writetext StandPokeItsCryIsWeakText
	waitbutton
	closetext
	end
	
StandPokeNurse2Script:
	jumptextfaceplayer StandPokeNurse2Text
	
StandPokeNurse2Text:
	text "Este es el centro"
	line "médico del ZOO de"
	cont "CIUDAD ENHIESTA."

	para "¡Por suerte, todos"
	line "nuestros #MON"
	cont "están sanos!"
	done	
	
ClefairyWeakText:
	text "CLEFAIRY: Fairy…"
	done
	
StandPokeItsCryIsWeakText:
	text "Está débil…"
	done

StandPokeNurse1Text:
	text "Este CLEFAIRY está"
	line "enfermo."

	para "Tenemos a los"
	line "otros #MON del"
	cont "ZOO en la parte de"
	cont "atrás."

	para "Ojalá se sientan"
	line "mejor pronto."
	done

StandPoke_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, STAND_CITY, 13
	warp_event  4,  7, STAND_CITY, 13

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeNurse1Script, EVENT_CLEARED_RADIO_TOWER
	object_event 3,  3, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeClefairyScript, EVENT_CLEARED_RADIO_TOWER
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeNurse2Script, EVENT_STAND_CITY_ZOO_MONS

