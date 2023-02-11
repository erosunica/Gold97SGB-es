	object_const_def ; object_event constants
	const SANSKRITRUINSOUTSIDE_YOUNGSTER1
	const SANSKRITRUINSOUTSIDE_SCIENTIST
	const SANSKRITRUINSOUTSIDE_FISHER
	const SANSKRITRUINSOUTSIDE_YOUNGSTER2
	const SANSKRITRUINSOUTSIDE_YOUNGSTER3

SanskritRuinsOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX

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
	appear SANSKRITRUINSOUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX
	return
	
.ActuallyNoScientist
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	return

.NoScientist:
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	return

SanskritRuinsOutsideScientistScene1:
	turnobject SANSKRITRUINSOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	jump SanskritRuinsOutsideScientistSceneContinue

SanskritRuinsOutsideScientistScene2:
	turnobject SANSKRITRUINSOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	jump SanskritRuinsOutsideScientistSceneContinue

SanskritRuinsOutsideScientistScript:
	faceplayer
SanskritRuinsOutsideScientistSceneContinue:
	opentext
	writetext SanskritRuinsOutsideScientistText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .scientist_walks_around_player
	applymovement SANSKRITRUINSOUTSIDE_SCIENTIST, ScientistWalksDownMovementData
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	setmapscene SANSKRIT_RUINS_RESEARCH_CENTER, SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

.scientist_walks_around_player
	applymovement SANSKRITRUINSOUTSIDE_SCIENTIST, ScientistWalksDownMovementData2
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	setmapscene SANSKRIT_RUINS_RESEARCH_CENTER, SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

SanskritRuinsOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext SanskritRuinsOutsideFisherText1
	buttonsound
.Next:
	writetext SanskritRuinsOutsideFisherText2
	waitbutton
	closetext
	end

SanskritRuinsOutsideYoungster1Script:
	faceplayer
	opentext
	writetext SanskritRuinsOutsideYoungster1Text
	waitbutton
	closetext
	end

SanskritRuinsOutsideYoungster2Script:
	faceplayer
	opentext
	writetext SanskritRuinsOutsideYoungster2Text
	waitbutton
	closetext
	turnobject SANSKRITRUINSOUTSIDE_YOUNGSTER3, UP
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



SanskritRuinsSign:
	jumptext SanskritRuinsSignText

SanskritRuinsResearchCenterSign:
	jumptext SanskritRuinsResearchCenterSignText

ScientistWalksDownMovementData:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ScientistWalksDownMovementData2:
	step RIGHT
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

SanskritRuinsOutsideScientistText:
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


SanskritRuinsSignText:
	text "RUINAS SÁNSCRITAS"
	
	para "CENTRO DE"
	line "OBSERVACIÓN"
	done

SanskritRuinsResearchCenterSignText:
	text "RUINAS SÁNSCRITAS"
	
	para "CENTRO DE"
	line "INVESTIGACIÓN"
	done

SanskritRuinsOutsideFisherText1:
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

SanskritRuinsOutsideFisherText2:
	text "¡Las RUINAS"
	line "esconden un gran"
	cont "secreto!"

	para "Creo…"
	done

SanskritRuinsOutsideYoungster1Text:
	text "Hay muchas clases"
	line "de UNOWN, así que"
	para "los utilizamos"
	line "como nuestro"
	cont "código secreto."
	done

SanskritRuinsOutsideYoungster2Text:
	text "A… D… E… L…"
	line "A… N… T… E…"
	cont "Mmmmmm…"

	para "¿Qué?"

	para "¡Estoy decodifi-"
	line "cando el mensaje!"
	done

SanskritRuinsOutside_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 15,  9, SANSKRIT_RUINS_HO_OH_CHAMBER, 1
	warp_event  5, 27, SANSKRIT_RUINS_KABUTO_CHAMBER, 1
	warp_event  5,  5, SANSKRIT_RUINS_OMANYTE_CHAMBER, 1
	warp_event  3, 17, SANSKRIT_RUINS_AERODACTYL_CHAMBER, 1
	warp_event  9, 19, SANSKRIT_RUINS_INNER_CHAMBER, 1
	warp_event  5, 22, SANSKRIT_RUINS_RESEARCH_CENTER, 1
	warp_event 15,  3, ENDON_CAVE_RUINS_CONNECTION, 2

	db 2 ; coord events
	coord_event  9, 20, SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX, SanskritRuinsOutsideScientistScene1
	coord_event 11, 15, SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX, SanskritRuinsOutsideScientistScene2

	db 2 ; bg events
	bg_event  8, 32, BGEVENT_READ, SanskritRuinsSign
	bg_event  4, 22, BGEVENT_READ, SanskritRuinsResearchCenterSign

	db 5 ; object events
	object_event 14,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event  9, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideScientistScript, EVENT_SANSKRIT_RUINS_OUTSIDE_SCIENTIST
	object_event 11, 26, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideFisherScript, EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_FISHER
	object_event  3, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideYoungster1Script, EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_YOUNGSTERS
	object_event  8, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideYoungster2Script, EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_YOUNGSTERS
