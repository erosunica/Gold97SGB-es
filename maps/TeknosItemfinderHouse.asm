	object_const_def ; object_event constants
	const TEKNOSITEMFINDERHOUSE_COOLTRAINER_M
	const TEKNOSITEMFINDERHOUSE_POKEDEX

TeknosItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext TeknosItemfinderAdventureText
	yesorno
	iffalse .no
	writetext TeknosItemfinderTrueSpiritText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext TeknosItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

TeknosHistoryBook:
	faceplayer
	opentext
	writetext TeknosHistoryBookText
	waitbutton
	closetext
	end


ItemFinderHouseRadio:
	jumpstd Radio2Script

TeknosItemfinderAdventureText:
	text "¡No puedo agrade-"
	line "certe lo suficien-"
	cont "te que hayas"
	cont "encontrado a mi"
	cont "nieta!"
	
	para "Tiene que ser más"
	line "consciente de aquí"
	para "a la próxima,"
	line "¡pero ahora mismo"
	para "me alegro de que"
	line "esté bien!"
	
	para "Te las has"
	line "ingeniado muy bien"
	cont "en la MINA."
	
	para "Si sabes dónde"
	line "mirar, podrás"
	para "encontrar muchos"
	line "objetos interesan-"
	cont "tes ocultos en"
	cont "cuevas como esa."
	
	para "Puedo darte algo"
	line "que te ayudará a"
	cont "encontrar más"
	cont "objetos."
	
	para "¿Lo quieres?"
	done

TeknosItemfinderTrueSpiritText:
	text "¡Toma! Lleva esto"
	line "contigo."
	done

ItemfinderExplanationText:
	text "Por aquí hay"
	line "muchos objetos que"
	para "no se ven tan"
	line "fácilmente."

	para "Utiliza el"
	line "BUSCAOBJETOS para"
	para "saber si hay algún"
	line "objeto cerca."

	para "Éste no indica el"
	line "lugar exacto, así"
	para "que tú tendrás que"
	line "encontrarlo."
	done

TeknosItemfinderToEachHisOwnText:
	text "¿Seguro? Yo creo"
	line "que te será muy"
	cont "útil."
	done

TeknosHistoryBookText:
	text "El abuelo no"
	line "quiere que juegue"
	cont "en la MINA."
	
	para "Supongo que tiene"
	line "sentido. Quiere"
	cont "que esté a salvo."
	done


TeknosItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 8
	warp_event  5,  7, TEKNOS_CITY, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosItemfinderGuy, EVENT_GRAMPS_IS_AT_GRAMPS_HOUSE
	object_event  2,  6, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TeknosHistoryBook, EVENT_GIRL_IS_BACK_AT_HOUSE
