	object_const_def ; object_event constants
	const SAFARIOFFICE_SUPERNERD
	const SAFARIOFFICE_ROCKER
	const SAFARIOFFICE_POKEFAN_M

StandCityZooOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

SafariOfficeSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText
	waitbutton
	closetext
	end
	
.SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText2
	waitbutton
	closetext
	end
	
SafariOfficeRockerScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText
	waitbutton
	closetext
	end
	
.SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText2
	waitbutton
	closetext
	end
	
SafariOfficePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText
	waitbutton
	closetext
	end
	
.SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText2
	waitbutton
	closetext
	end

SafariOfficeSuperNerdText:
	text "Hola. Esta es la"
	line "oficina del ZOO de"
	cont "CIUDAD ENHIESTA."

	para "Estamos muy ocupa-"
	line "dos investigando"
	para "por qué nuestros"
	line "#MON están"
	cont "enfermos."

	para "Hasta nuevo aviso,"
	line "el ZOO permanecerá"
	cont "cerrado."
	done

SafariOfficeSuperNerdText2:
	text "¡Bienvenido a la"
	line "oficina del ZOO de"
	cont "CIUDAD ENHIESTA!"

	para "Trabajamos duro"
	line "analizando los da-"
	para "tos que recogemos"
	line "de nuestros"
	para "#MON para"
	line "aprender más sobre"
	cont "ellos."
	done

SafariOfficeRockerText:
	text "Parece que los"
	line "#MON están su-"
	cont "friendo jaquecas…"
	para "Es el primer"
	line "síntoma."
	done

SafariOfficeRockerText2:
	text "Solemos llevar a"
	line "los #MON al"
	para "PARQUE NACIONAL"
	line "para que se"
	para "tomen un respiro"
	line "fuera de las"
	cont "exhibiciones."
	done

SafariOfficePokefanMText:
	text "Nunca he visto"
	line "nada igual…"
	done

SafariOfficePokefanMText2:
	text "La investigación"
	line "de este ZOO ha"
	para "permitido realizar"
	line "muchos avances en"
	para "la nutrición"
	line "adecuada de los"
	cont "#MON."
	done

StandCityZooOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, STAND_CITY, 2
	warp_event  3,  7, STAND_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeSuperNerdScript, -1
	object_event 14,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeRockerScript, -1
	object_event 10,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficePokefanMScript, -1

