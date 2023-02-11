	object_const_def ; object_event constants
	const AQUA1F_RECEPTIONIST
	const AQUA1F_ROCKET2
	const AQUA1F_ROCKETF1
	const AQUA1F_YOUNGSTER
	const AQUA1F_LASS
	const AQUA1F_WHITNEYROCKET1
	const AQUA1F_WHITNEYROCKET2
	const AQUA1F_WHITNEYAQUA1
	const AQUA1F_WHITNEYAQUA2

TeknosAquarium1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end
	
AquaReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .ReceptionistNoRockets
	writetext AquaReceptionistRocketsText
	waitbutton
	closetext
	end

.ReceptionistNoRockets:
	writetext AquaReceptionistNoRocketsText
	waitbutton
	closetext
	end
	
AquaYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .YoungsterNoRockets
	writetext AquaYoungsterRocketsText
	waitbutton
	closetext
	end

.YoungsterNoRockets:
	writetext AquaYoungsterNoRocketsText
	waitbutton
	closetext
	end
	
AquaLassScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .LassNoRockets
	writetext AquaLassRocketsText
	waitbutton
	closetext
	end

.LassNoRockets:
	writetext AquaLassNoRocketsText
	waitbutton
	closetext
	end
	
Aqua1FExhibit1Script:
	jumptext Aqua1FExhibit1Text
	
Aqua1FExhibit2Script:
	jumptext Aqua1FExhibit2Text
	
Aqua1FExhibit3Script:
	jumptext Aqua1FExhibit3Text
	
Aqua1FExhibit4Script:
	jumptext Aqua1FExhibit4Text
	
WhitneyRocket1:
	faceplayer
	opentext
	writetext WhitneyRocket1Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET1, DOWN
	end
	
WhitneyRocket2:
	faceplayer
	opentext
	writetext WhitneyRocket2Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET2, RIGHT
	end
	
TeknosAquariumLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end

TeknosAquariumUpLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
TeknosAquariumUpRightScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 12, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets2
	applymovement PLAYER, PlayerWalksOverRightUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
	
WhitneyAquaScript:
	opentext
	writetext WhitneyInAquaText
	waitbutton
	closetext
	end
	
PlayerWalksOverRightUpScene:
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksOverLeftUpScene:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
WhitneyWalksToRockets2:
	step UP
	step UP
	step LEFT
	step LEFT
	step_end
		
WhitneyWalksToRockets:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerWalksOverLeftScene:
	step LEFT
	step UP
	step_end
	
WhitneyDummyMovement:
	step_end
	
WhitneyInAquaText:
	text "¡No creas que me"
	line "contendré!"
	done
	
WhitneyRocket1Text:
	text "Uf, es dura."
	done
	
WhitneyRocket2Text:
	text "Creo que nunca he"
	line "visto un MILTANK"
	cont "tan fuerte…"
	done
	
WhitneyWhatIsThisText:
	text "¿Qué está pasando"
	line "aquí?"
	para "¡Esto es inacep-"
	line "table!"

	para "¡Aquí sobra el"
	line "TEAM ROCKET!"
	done
	
WhitneyWhatIsThisText2:
	text "Eres <PLAYER>,"
	line "¿verdad?"
	para "¿No nos hemos"
	line "visto en la MINA?"
	para "¿Qué te parece si"
	line "yo me encargo de"
	para "los de abajo y tú"
	line "de los de arriba?"
	para "¡Vamos a enseñar-"
	line "les un par de"
	cont "cosas!"
	done
	
Aqua1FExhibit1Text:
	text "A los KRABBY les"
	line "gusta esconderse"
	cont "bajo la arena."

	para "Mira atentamente"
	line "para descubrir a"
	cont "los #MON"
	cont "enterrados."
	done
	
Aqua1FExhibit2Text:
	text "NUEVA EXHIBICIÓN"
	line "PRÓXIMAMENTE"
	done

Aqua1FExhibit3Text:
	text "Los MOLAMBINO y"
	line "los MAGIKARP"
	para "pueden compartir"
	line "sin problemas el"
	cont "mismo espacio."

	para "Estos #MON"
	line "suelen vivir en"
	cont "las mismas aguas."
	done
	
GruntM2SeenText:
	text "¡Vamos a entrar,"
	line "robar lo que que-"
	cont "ramos y venderlo!"

	para "¡Necesitamos"
	line "dinero porque"
	para "tenemos grandes"
	line "planes, chaval!"
	done
	
Aqua1FExhibit4Text:
	text "ESTATUA DE LAPRAS"
	para "Se ha informado en"
	line "varias ocasiones"
	para "de que se pueden"
	line "encontrar LAPRAS"
	para "en las profundida-"
	line "des de la MINA"
	cont "al oeste de la"
	cont "ciudad."
	done

GruntM2BeatenText:
	text "Simplemente…"
	line "Muy fuerte…"
	done

GruntM2AfterBattleText:
	text "¡Pronto sabrás más"
	line "de nosotros!"
	done
	
AquaReceptionistRocketsText:
	text "¡Cuidado! No"
	line "debería haber"
	cont "niños aquí ahora."
	
	para "Estamos teniendo"
	line "problemas con una"
	para "peligrosa activi-"
	line "dad criminal."
	done

AquaReceptionistNoRocketsText:
	text "¡Bienvenido al"
	line "ACUARIO DE CIUDAD"
	cont "TEKNOS!"

	para "No dudes en echar"
	line "un vistazo."
	done

GruntF1SeenText:
	text "¡Este sitio tiene"
	line "#MON raros que"
	para "podemos robar para"
	line "venderlos!"

	para "¡Aparta de nuestro"
	line "camino, niñato!"
	done

GruntF1BeatenText:
	text "¡Maldición!"
	done

GruntF1AfterBattleText:
	text "¡El TEAM ROCKET"
	line "recordará esto!"
	done
	
AquaYoungsterRocketsText:
	text "Mmm… Creo que esos"
	line "tipos de negro no"
	cont "deberían estar"
	cont "aquí…"
	done

AquaYoungsterNoRocketsText:
	text "Esperaba ver un"
	line "ANGORE en persona,"
	cont "pero aquí no hay"
	cont "ninguno."
	done
	
AquaLassRocketsText:
	text "¡Auxilio!"

	para "Ah, no vas con"
	line "ellos."

	para "Esa gente me"
	line "asusta."

	para "Creo que debería"
	line "irme."
	done

AquaLassNoRocketsText:
	text "El ACUARIO es"
	line "nuevo."

	para "Todavía no tienen"
	line "mucho que mostrar."
	done

TeknosAquarium1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  7, TEKNOS_CITY, 9
	warp_event 13,  7, TEKNOS_CITY, 5
	warp_event  0,  7, TEKNOS_AQUARIUM_2F, 1

	db 3 ; coord events
	coord_event 11,  7, SCENE_DEFAULT, TeknosAquariumLeftScene
	coord_event 12,  6, SCENE_DEFAULT, TeknosAquariumUpLeftScene
	coord_event 13,  6, SCENE_DEFAULT, TeknosAquariumUpRightScene

	db 4 ; bg events
	bg_event  1,  3, BGEVENT_READ, Aqua1FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua1FExhibit2Script
	bg_event 10,  3, BGEVENT_READ, Aqua1FExhibit3Script
	bg_event  4,  1, BGEVENT_READ, Aqua1FExhibit4Script


	db 9 ; object events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AquaReceptionistScript, -1
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  5,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerGruntF1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event 13,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AquaYoungsterScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaLassScript, -1
	object_event 10,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WhitneyRocket1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  9,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WhitneyRocket2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7,  6, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_2_AQUARIUM
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_1_AQUARIUM
