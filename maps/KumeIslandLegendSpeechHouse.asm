	object_const_def ; object_event constants
	const KUMEISLANDLEGENDSPEECHHOUSE_LADY

KumeIslandLegendSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeIslandLegendSpeechHouseLadyScript:
	faceplayer
	opentext
	writetext KumeIslandLegendSpeechHouseLadyText1
	yesorno
	iffalse .TellLegend
	writetext KumeIslandLegendSpeechHouseLadyText2
	waitbutton
	closetext
	end
	
.TellLegend
	writetext KumeIslandLegendSpeechHouseLadyText3
	waitbutton
	closetext
	end
	
KumeIslandLegendSpeechHouseLadyText1:
	text "¿Has oído hablar"
	line "de nuestras"
	cont "leyendas locales?"
	done

KumeIslandLegendSpeechHouseLadyText2:
	text "Ah, entonces no me"
	line "molestaré en con-"
	cont "tarlas de nuevo."
	done

KumeIslandLegendSpeechHouseLadyText3:
	text "Permíteme"
	line "iluminarte"
	cont "entonces…"

	para "De acuerdo a las"
	line "historias contadas"
	para "durante generacio-"
	line "nes, tres míticas"
	para "aves #MON que"
	line "encarnan el rayo,"
	para "el fuego y el"
	line "hielo velan por"
	cont "nuestras ISLAS."

	para "Las tres trabajan"
	line "juntas en armonía"
	para "para mantener"
	line "intacto el delica-"
	cont "do equilibrio de"
	cont "la naturaleza."

	para "Se dice que anidan"
	line "en la CUEVA JULIO,"
	para "en la cima de la"
	line "CUMBRE CALCINADA y"
	para "justo detrás de"
	line "nosotros, en la"
	cont "GRUTA HELADA."

	para "Nadie que conozca"
	line "las ha visto"
	cont "alguna vez."

	para "La leyenda cuenta"
	line "que solo se"
	para "revelarán frente a"
	line "quien tenga algo"
	para "con la esencia de"
	line "las tres…"

	para "Me pregunto qué"
	line "podría ser…"
	done
	
	

KumeIslandLegendSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KUME_CITY, 4
	warp_event  5,  7, KUME_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumeIslandLegendSpeechHouseLadyScript, -1
