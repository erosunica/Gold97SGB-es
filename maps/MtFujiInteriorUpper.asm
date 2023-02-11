	object_const_def ; object_event constants
	const MTFUJIINTERIORUPPER_COOLTRAINER_F
	const MTFUJIINTERIORUPPER_BIRDKEEPER
	const MTFUJIINTERIORUPPER_SWIMMER_M
	const MTFUJIINTERIORUPPER_SOLDIER
	const MTFUJIINTERIORUPPER_COOLTRAINER_M
	const MTFUJIINTERIORUPPER_PSYCHIC
	const MTFUJIINTERIORUPPER_FIREBREATHER
	const MTFUJIINTERIORUPPER_HIKER
	const MTFUJIINTERIORUPPER_HIKER2
	const MTFUJIINTERIORUPPER_COOLTRAINER_M2
	const MTFUJIINTERIORUPPER_COOLTRAINER_F2
	const MTFUJIINTERIORUPPER_ITEM_1
	const MTFUJIINTERIORUPPER_ITEM_2
	const MTFUJIINTERIORUPPER_ITEM_3

MtFujiInteriorUpper_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

MtFujiInteriorUpperHelixFossil:
	itemball HELIX_FOSSIL

	
MtFujiInteriorUpperNugget:
	itemball NUGGET
	
MtFujiInteriorUpperToxic:
	itemball TM_TOXIC

MtFujiInteriorUpperHiddenPpUp:
	hiddenitem PP_UP, EVENT_MT_FUJI_INTERIOR_UPPER_HIDDEN_PP_UP

	
TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJennAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBirdkeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdkeeperRoySeenText, BirdkeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperRoyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierAntonio:
	trainer SOLDIER, ANTONIO, EVENT_BEAT_SOLDIER_ANTONIO, SoldierAntonioSeenText, SoldierAntonioBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierAntonioAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainermAndy:
	trainer COOLTRAINERM, ANDY, EVENT_BEAT_COOLTRAINERM_ANDY, CooltrainermAndySeenText, CooltrainermAndyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAndyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermTyler:
	trainer COOLTRAINERM, TYLER, EVENT_BEAT_COOLTRAINERM_TYLER, CooltrainermTylerSeenText, CooltrainermTylerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermTylerAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

BirdkeeperRoySeenText:
	text "Mis pájaros no"
	line "tienen mucho"
	para "espacio para volar"
	line "en esta cueva."
	done

BirdkeeperRoyBeatenText:
	text "¡Me quedo en"
	line "tierra!"
	done

BirdkeeperRoyAfterBattleText:
	text "Mis pájaros"
	line "siempre dan lo"
	cont "mejor de sí."
	done

CooltrainerfJennSeenText:
	text "Déjame comprobar"
	line "si tienes lo que"
	para "hace falta para"
	line "desafiar a la"
	cont "LIGA."
	done

CooltrainerfJennBeatenText:
	text "Diría que lo"
	line "tienes…"
	done

CooltrainerfJennAfterBattleText:
	text "Para ganar la"
	line "LIGA, tendrás que"
	para "enfrentarte al"
	line "ALTO MANDO, uno"
	cont "tras otro."

	para "Y después, al"
	line "CAMPEÓN."

	para "Requiere mucho"
	line "esfuerzo."

	para "¡Mejor que estés"
	line "preparado!"
	done

SwimmermKirkSeenText:
	text "El agua aquí es"
	line "muy tranquila."

	para "Es un tanto"
	line "inquietante."
	done

SwimmermKirkBeatenText:
	text "¡Hundido!"
	done

SwimmermKirkAfterBattleText:
	text "Debe ser agradable"
	line "montar sobre un"
	cont "#MON."
	done

SoldierAntonioSeenText:
	text "¡Un auténtico"
	line "soldado es capaz"
	cont "de atravesar esta"
	cont "cueva!"
	done

SoldierAntonioBeatenText:
	text "¡Sigue así!"
	done

SoldierAntonioAfterBattleText:
	text "¡Es hora de que"
	line "avances!"
	done

CooltrainermAndySeenText:
	text "¿Qué camino es el"
	line "correcto?"
	done

CooltrainermAndyBeatenText:
	text "Supongo que este"
	line "no."
	done

CooltrainermAndyAfterBattleText:
	text "Lo preguntaba en"
	line "serio."

	para "No quiero perderme"
	line "aquí."
	done

PsychicRichardSeenText:
	text "¡Conozco tus"
	line "deseos más"
	cont "ocultos!"
	done

PsychicRichardBeatenText:
	text "¡Buena batalla!"
	done

PsychicRichardAfterBattleText:
	text "¡Tu deseo es salir"
	line "de esta cueva!"

	para "Supongo que eso"
	line "era obvio…"
	done

FirebreatherWaltSeenText:
	text "Me gusta que las"
	line "cuevas sean cáli-"
	cont "das y agradables."

	para "Esta no lo es."
	done

FirebreatherWaltBeatenText:
	text "¡Ay, qué calor!"
	done

FirebreatherWaltAfterBattleText:
	text "Hace bastante frío"
	line "aquí."

	para "¿Has estado en el"
	line "EJE MAGMA?"

	para "¡Allí sí que se"
	line "pasa calor!"
	done

HikerMichaelSeenText:
	text "¡Eres valiente!"
	line "Pero…"

	para "¿Sabes qué?"
	line "Para valiente,"
	cont "¡yo!"
	done

HikerMichaelBeatenText:
	text "¡A mis #MON les"
	line "faltaron agallas!"
	done

HikerMichaelAfterBattleText:
	text "¡Cómo me gusta"
	line "MÁS PS! ¡Mmmm!"

	para "¡Me bebo la de mis"
	line "#MON!"

	para "No puedo evitarlo."
	done

HikerKennySeenText:
	text "Debería capturar"
	line "un ONIX."
	done

HikerKennyBeatenText:
	text "He perdido…"
	done

HikerKennyAfterBattleText:
	text "Parece que las"
	line "formas geológicas"
	cont "no cambian."

	para "Pero sí que"
	line "cambian, aunque"
	cont "poco a poco."
	
	para "El MT. FUJI"
	line "tendría menos"
	para "altitud hace"
	line "varios milenios."
	done
	
CooltrainermTylerSeenText:
	text "¡Este es el último"
	line "tramo antes de la"
	cont "cima!"

	para "¿Podrás lograrlo?"
	done

CooltrainermTylerBeatenText:
	text "Creo que podrás"
	line "hacerlo."
	done

CooltrainermTylerAfterBattleText:
	text "Ya casi has"
	line "llegado a la LIGA."

	para "¿Cómo te hace"
	line "sentir eso?"
	done

CooltrainerfCybilSeenText:
	text "Pareces fuerte."

	para "Los buenos"
	line "entrenadores"
	para "siempre buscan"
	line "buenos rivales."
	done

CooltrainerfCybilBeatenText:
	text "¡No! Esto no"
	line "servirá para nada."
	done

CooltrainerfCybilAfterBattleText:
	text "Todos mejoramos"
	line "luchando muchas"
	cont "veces."

	para "He luchado mucho"
	line "para llegar a ser"
	para "lo que soy hoy:"
	line "una campeona."
	done

MtFujiInteriorUpper_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 25, 51, MOUNT_FUJI_OUTSIDE, 6
	warp_event 15, 41, MOUNT_FUJI_OUTSIDE, 7
	warp_event  9, 33, MOUNT_FUJI_OUTSIDE, 8
	warp_event 19,  1, FUJI_SUMMIT, 3
	warp_event 28, 41, MT_FUJI_INTERIOR_LOWER, 9

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3, 20, BGEVENT_ITEM, MtFujiInteriorUpperHiddenPpUp

	db 14 ; object events
	object_event 26, 45, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event 15, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdkeeperRoy, -1
	object_event  7, 47, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 13, 31, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierAntonio, -1
	object_event 18, 29, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAndy, -1
	object_event 21, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerPsychicRichard, -1
	object_event 14, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherWalt, -1
	object_event 26, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event 15,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerHikerKenny, -1
	object_event 36, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermTyler, -1
	object_event  8, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfCybil, -1
	object_event 37, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperNugget, EVENT_MT_FUJI_INTERIOR_UPPER_NUGGET
	object_event 37,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperToxic, EVENT_MT_FUJI_INTERIOR_UPPER_TOXIC
	object_event  2,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperHelixFossil, EVENT_MT_FUJI_INTERIOR_UPPER_HELIX_FOSSIL
