	object_const_def ; object_event constants
	const IEJIMA_GRAMPS
	const IEJIMA_BIKER1
	const IEJIMA_BIKER2
	const IEJIMA_BIKER3
	const IEJIMA_YOUNGSTER
	const IEJIMA_BIKER4
	const IEJIMA_BIKER5
	const IEJIMA_BIKER6
	const IEJIMA_SWIMMERF
	const IEJIMA_SWIMMERM
	const IEJIMA_LASS
	const IEJIMA_TRIWING

IejimaTown_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .NoWater

.NoWater:
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iftrue .IejimaTownFixed
	changeblock  11,  7, $7A ; floor
	changeblock  13,  7, $7A ; floor
	changeblock  15,  7, $7A ; floor
	changeblock  17,  7, $7A ; floor
	changeblock  13,  9, $7A ; floor
	changeblock  15,  9, $7A ; floor
	changeblock  17,  9, $7A ; floor
	changeblock  11, 11, $7A ; floor
	changeblock  13, 11, $7A ; floor
	changeblock  15, 11, $7A ; floor
	changeblock  17, 11, $7A ; floor
	changeblock  15, 13, $7A ; floor
	changeblock  13, 13, $7A ; floor
	changeblock  11, 13, $7A ; floor
	changeblock  19, 11, $7A ; floor
	changeblock  19,  9, $7A ; floor
	changeblock  19,  7, $6B ; rock
	changeblock  17, 13, $6B ; rock
	changeblock  11,  9, $6B ; rock
	changeblock  13,  1, $60 ; dry
	changeblock  13,  3, $60 ; dry
	changeblock  13,  5, $60 ; dry
	changeblock  15,  1, $60 ; dry
	changeblock  15,  3, $60 ; dry
	changeblock  15,  5, $60 ; dry
	changeblock  17,  1, $60 ; dry
	changeblock  17,  3, $60 ; dry
	changeblock  17,  5, $60 ; dry
	changeblock   9,  7, $10 ; left edge
	changeblock   9,  9, $10 ; left edge
	changeblock   9, 11, $10 ; left edge
	changeblock   9, 13, $10 ; left edge
	changeblock  21,  7, $12 ; right edge
	changeblock  21,  9, $12 ; right edge
	changeblock  21, 11, $12 ; right edge
	return
	
.IejimaTownFixed
	return
	
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_IEJIMA
	return
	
IejimaTownPokecenterSign:
;	setevent EVENT_IEJIMA_TOWN_NOT_FIXED
;	clearevent EVENT_IEJIMA_TOWN_FIXED
;	clearevent EVENT_DAM_IS_OPEN
	jumpstd PokecenterSignScript
	
IejimaTownGrampsBefore:
	jumptextfaceplayer IejimaTownGrampsBeforeText
	
IejimaTownBiker1:
	jumptextfaceplayer IejimaTownBiker1Text
	
IejimaTownBiker2:
	jumptextfaceplayer IejimaTownBiker2Text
	
IejimaTownBiker3:
	jumptextfaceplayer IejimaTownBiker3Text	
	
	
IejimaTownBiker4:
	jumptextfaceplayer IejimaTownBiker4Text
	
	
IejimaTownBiker5:
	jumptextfaceplayer IejimaTownBiker5Text
	
	
IejimaTownBiker6:
	jumptextfaceplayer IejimaTownBiker6Text
	
IejimaTownTriWingItem:
	turnobject IEJIMA_YOUNGSTER, DOWN
	opentext
	writetext ItemWashedUpText
	waitbutton
	closetext
	disappear IEJIMA_TRIWING
	opentext
;	buttonsound
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
;	waitbutton
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
IejimaTownLass:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .LassNotFixedYet
	writetext IejimaTownLassText
	waitbutton
	closetext
	end
	
.LassNotFixedYet
	writetext IejimaTownLassText2
	waitbutton
	closetext
	end

IejimaTownYoungster:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .YoungsterNotFixedYet
	checkevent EVENT_IEJIMA_TOWN_TRI_WING
	iffalse .GetTriWing
	writetext IejimaTownYoungsterText
	waitbutton
	closetext
	end
	
.GetTriWing
;	opentext
	writetext ItemWashedUpText
	waitbutton
	closetext
	pause 15
	turnobject IEJIMA_YOUNGSTER, DOWN
	disappear IEJIMA_TRIWING
	pause 15
	faceplayer
	opentext
;	buttonsound
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
;	waitbutton
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
.YoungsterNotFixedYet
	writetext IejimaTownYoungsterText2
	waitbutton
	closetext
	end
	
IejimaTownSwimmerGirl:
	jumptextfaceplayer IejimaTownSwimmerGirlText
	
IejimaTownSwimmerGuy:
	jumptextfaceplayer IejimaTownSwimmerGuyText
	
ItemWashedUpText:
	text "¡Anda, mira esto!"

	para "Llegó a la orilla"
	line "cuando el agua"
	cont "empezó a fluir de"
	cont "nuevo."

	para "Parece una especie"
	line "de pluma."

	para "No sé qué hacer"
	line "con ella, puedes"
	cont "quedártela."
	done

GotTriWingText:
	text "¡<PLAYER> recibió"
	line "PLUMA IRIS!"
	done

IejimaTownLassText:
	text "Me alegra que todo"
	line "vaya bien ahora en"
	cont "la PLANTA"
	cont "HIDRÁULICA."
	done

IejimaTownLassText2:
	text "La cascada y el"
	line "estanque al que"
	para "alimenta son el"
	line "orgullo de este"
	cont "pueblo."

	para "Es terrible que el"
	line "agua no esté"
	cont "fluyendo."
	done

IejimaTownSwimmerGirlText:
	text "Este estanque es"
	line "de lo más"
	cont "tranquilo."
	done

IejimaTownSwimmerGuyText:
	text "¡Me gusta hacer"
	line "largos aquí para"
	cont "ejercitarme!"
	done

IejimaTownBiker4Text:
	text "Los polis nos han"
	line "echado de la zona."

	para "Menos mal, ¡porque"
	line "el agua ya vuelve"
	cont "a fluir!"
	done

IejimaTownBiker5Text:
	text "A la gente no le"
	line "gustó nada que"
	cont "secásemos la"
	cont "cascada."

	para "No deberíamos"
	line "volver a hacerlo"
	cont "si no queremos más"
	cont "problemas."
	done

IejimaTownBiker6Text:
	text "Iré a montar en"
	line "moto a otra parte."
	done

IejimaTownBiker1Text:
	text "¡Jeje!"

	para "¡Este sitio es"
	line "estupendo para ir"
	cont "en moto!"
	done

IejimaTownBiker2Text:
	text "¡Escuchadnos,"
	line "PUEBLO IEJIMA!"

	para "¡Hemos venido para"
	line "quedarnos!"
	done

IejimaTownBiker3Text:
	text "¡Ahora que hemos"
	line "cerrado la presa"
	para "de la PLANTA"
	line "HIDRÁULICA, este"
	cont "sitio se ha"
	cont "secado!"

	para "¡Podremos conducir"
	line "a gusto!"
	done

IejimaTownYoungsterText:
	text "Da gusto estar"
	line "aquí, junto al"
	cont "agua."
	done

IejimaTownYoungsterText2:
	text "¡Esto es terrible!"

	para "¡El agua debería"
	line "estar mojándome"
	cont "los pies!"

	para "¿Qué estará"
	line "ocurriendo en la"
	cont "PLANTA HIDRÁULICA?"
	done

IejimaTownGrampsBeforeText:
	text "¡Cielos!"

	para "¿Qué le ha pasado"
	line "a nuestra querida"
	cont "cascada?"

	para "¡Debe tener algo"
	line "que ver con esos"
	para "MOTORISTAS que han"
	line "pasado por aquí!"
	done

IejimaTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 23,  7, MOTOBU_PATH_IEJIMA_GATE, 1
	warp_event  1,  6, IEJIMA_POKECENTER_1F, 1
	warp_event  7, 15, IEJIMA_HOUSE_1, 1
	warp_event 19, 14, IEJIMA_HOUSE_2, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  6, BGEVENT_READ, IejimaTownPokecenterSign

	db 12 ; object events
	object_event 13,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IejimaTownGrampsBefore, EVENT_IEJIMA_TOWN_FIXED
	object_event 11, 11, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker1, EVENT_IEJIMA_TOWN_FIXED
	object_event 15, 12, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker2, EVENT_IEJIMA_TOWN_FIXED
	object_event 16,  8, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker3, EVENT_IEJIMA_TOWN_FIXED
	object_event  7, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownYoungster, -1
	object_event 14, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker4, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 13, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker5, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker6, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGirl, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 17, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGuy, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 24, 11, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IejimaTownLass, -1
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownTriWingItem, EVENT_IEJIMA_TOWN_TRI_WING
