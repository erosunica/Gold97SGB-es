	object_const_def ; object_event constants
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	jump .NoScientist

.MaybeScientist:
	checkcode VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	jump .NoScientist

.YesScientist:
	checkevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	iftrue .ActuallyNoScientist
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	return
	
.ActuallyNoScientist
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	return

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	return

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	jump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene2:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	jump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, MovementData_0x580ba
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	buttonsound
.Next:
	writetext RuinsOfAlphOutsideFisherText2
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster1Text
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdStan:
	trainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdStanAfterBattleText
	waitbutton
	closetext
	end



RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

RuinsOfAlphResearchCenterSign:
	jumptext RuinsOfAlphResearchCenterSignText

MovementData_0x580ba:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x580c5:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "¿Eh? Es una"
	line "#DEX, ¿verdad?"
	cont "¿Puedo verla?"

	para "Hay muchos tipos"
	line "de #MON."

	para "¿Y esto qué es?"

	para "¿Cuál es este"
	line "#MON?"

	para "Se parece a las"
	line "raras escrituras"
	para "de las paredes"
	line "de las RUINAS."

	para "Si esos dibujos"
	line "son #MON,"
	para "debería haber"
	line "muchos más."

	para "¡Ya sé! Voy a"
	line "actualizar tu"
	cont "#DEX."
	
	para "Ven a visitarme en"
	line "el laboratorio que"
	cont "hay en PUEBLO"
	cont "SÁNSCRITO."
	done

SuperNerdStanSeenText:
	text "¿Qué quieres?"
	line "Estoy estudiando."
	cont "¡No me molestes!"
	done

SuperNerdStanBeatenText:
	text "Perdona…"
	line "Me deprime"
	para "nuestra falta de"
	line "conocimientos…"
	done

SuperNerdStanAfterBattleText:
	text "Las RUINAS datan"
	line "de hace unos"
	cont "1.500 años."

	para "Nadie sabe quién"
	line "las construyó."

	para "Y tampoco sabemos"
	line "si las estatuas"
	para "de los #MON"
	line "significan algo."

	para "Es un gran"
	line "misterio…"
	done

PsychicNathanSeenText:
	text "¡Mmm…! ¡Qué"
	line "lugar tan extraño!"
	done

PsychicNathanBeatenText:
	text "…"
	done

PsychicNathanAfterBattleText:
	text "Me gusta pensar"
	line "aquí."
	done

RuinsOfAlphSignText:
	text "RUINAS SÁNSCRITAS"
	
	para "CENTRO DE"
	line "OBSERVACIÓN"
	done

RuinsOfAlphResearchCenterSignText:
	text "RUINAS SÁNSCRITAS"
	
	para "CENTRO DE"
	line "INVESTIGACIÓN"
	done

RuinsOfAlphOutsideFisherText1:
	text "Mientras explorá-"
	line "bamos las RUINAS,"
	para "de repente notamos"
	line "una extraña"
	cont "presencia."

	para "Nos asustamos y"
	line "huimos."

	para "Tu también debes"
	line "tener cuidado."
	done

RuinsOfAlphOutsideFisherText2:
	text "¡Las RUINAS"
	line "esconden un gran"
	cont "secreto!"

	para "Creo…"
	done

RuinsOfAlphOutsideYoungster1Text:
	text "Hay muchas clases"
	line "de UNOWN, así que"
	para "los utilizamos"
	line "como nuestro"
	cont "código secreto."
	done

RuinsOfAlphOutsideYoungster2Text:
	text "A… D… E… L…"
	line "A… N… T… E…"
	cont "Mmmmmm…"

	para "¿Qué?"

	para "¡Estoy decodifi-"
	line "cando el mensaje!"
	done

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 15,  9, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event  5, 27, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  5,  5, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event  3, 17, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event  9, 19, RUINS_OF_ALPH_INNER_CHAMBER, 1
	warp_event  5, 22, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event 15,  3, ENDON_CAVE_RUINS_CONNECTION, 2

	db 2 ; coord events
	coord_event  9, 20, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1
	coord_event 11, 15, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene2

	db 2 ; bg events
	bg_event  8, 32, BGEVENT_READ, RuinsOfAlphSign
	bg_event  4, 22, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	db 5 ; object events
	object_event 14,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event  9, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 11, 26, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event  3, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event  8, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
