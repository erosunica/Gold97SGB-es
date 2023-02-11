	object_const_def ; object_event constants
	const KUMECITY_FRUIT_TREE1
	const KUMECITY_FRUIT_TREE2
	const KUMECITY_FISHER
	const KUMECITY_LASS
	const KUMECITY_TEACHER
	const KUMECITY_ROCKER

KumeCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KUME
	return

KumeCityPokecenterSign:
	jumpstd PokecenterSignScript

KumeCityMartSign:
	jumpstd MartSignScript

KumeCitySign:
	jumptext KumeCitySignText
	
UrumaCavernSign:
	jumptext UrumaCavernSignText

KumeCityFruitTree1:
	fruittree FRUITTREE_TREE_KUME_CITY

KumeCityFruitTree2:
	fruittree FRUITTREE_TREE_KUME_CITY_2
	
KumeCityFisherScript:
	jumptextfaceplayer KumeCityFisherText	

KumeCityLassScript:
	jumptextfaceplayer KumeCityLassText
	
KumeCityTeacherScript:
	jumptextfaceplayer KumeCityTeacherText

KumeCityRockerScript:
	jumptextfaceplayer KumeCityRockerText
	
KumeCityFisherText:
	text "Hace mucho frío en"
	line "la GRUTA HELADA."

	para "Prepárate si"
	line "vas a explorarla."
	done

KumeCityLassText:
	text "¿Has estado en"
	line "PUEBLO ESCARCHA?"

	para "Guau, eso está muy"
	line "lejos de aquí."
	done

KumeCityTeacherText:
	text "Parece que estás"
	line "preparado para ir"
	para "a cualquier lugar"
	line "con tus #MON."
	done

KumeCityRockerText:
	text "Aquí el clima no"
	line "es tan tropical"
	para "como en CIUDAD"
	line "RYUKYU, por lo que"
	para "no recibimos"
	line "tantos turistas."

	para "Pero he oído que"
	line "las ISLAS DEL SUR"
	cont "son cálidas y"
	cont "tropicales."

	para "Aunque nunca las"
	line "he visto, la"
	cont "verdad."

	para "Toda la zona es"
	line "de acceso"
	cont "restringido."
	done

KumeCitySignText:
	text "CIUDAD KUME"

	para "La ciudad de"
	line "montañas rocosas"
	done

UrumaCavernSignText:
	text "Entrada a la"
	line "GRUTA HELADA"
	done

KumeCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7,  6, KUME_MART, 1
	warp_event 25, 18, KUME_POKECENTER_1F, 1
	warp_event  7, 25, KUME_SHIP_PARTS_HOUSE, 1
	warp_event 21, 13, KUME_ISLAND_LEGEND_SPEECH_HOUSE, 1
	warp_event 17, 23, KUME_SOCIAL_HOUSE, 1
	warp_event 15,  5, ICED_CAVERN_1F, 8

	db 0 ; coord events

	db 4 ; bg events
	bg_event 26, 18, BGEVENT_READ, KumeCityPokecenterSign
	bg_event  8,  6, BGEVENT_READ, KumeCityMartSign
	bg_event 28, 18, BGEVENT_READ, KumeCitySign
	bg_event 18,  7, BGEVENT_READ, UrumaCavernSign

	db 6 ; object events
	object_event 18, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, KumeCityFruitTree1, -1
	object_event 16, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, KumeCityFruitTree2, -1
	object_event 12, 19, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityFisherScript, -1
	object_event 25, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityLassScript, -1
	object_event 12,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityTeacherScript, -1
	object_event 14, 27, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityRockerScript, -1
