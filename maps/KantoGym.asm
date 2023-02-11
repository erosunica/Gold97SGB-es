	object_const_def ; object_event constants
	const KANTOGYM_RED
	const KANTOGYM_COOLTRAINERM1
	const KANTOGYM_COOLTRAINERM2
	const KANTOGYM_COOLTRAINERF1
	const KANTOGYM_COOLTRAINERF2
	const KANTOGYM_RED_DUMMY
	const KANTOGYM_GYM_GUY

KantoGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGymRedScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_RED
	iftrue RematchScriptRed
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptRed
	
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .FightDone
	writetext RedBeforeBattleText
	waitbutton
	closetext
	winlosstext RedBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ACTUALLY_RED
	opentext
	writetext PlayerReceivedTheRisingBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RISINGBADGE
.FightDone:
	writetext RedAfterBattleText
	waitbutton
	closetext
	end
	
RematchScriptRed:
	opentext
	writetext RedRematchText
	waitbutton
	closetext
	winlosstext RedRematchWinText, 0
	loadtrainer RED, RED1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_RED
	opentext
	writetext RedAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptRed:
	opentext
	writetext RedAfterRematchText
	waitbutton
	closetext
	end

KantoGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext ERIKA, ERIKA1, MEM_BUFFER_1
	jumpstd GymStatue2Script


TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfFran:
	trainer COOLTRAINERF, FRAN, EVENT_BEAT_COOLTRAINERF_FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfFranAfterBattleText
	waitbutton
	closetext
	end
	
RedEntersGymScene:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer2
	end
	
.CheckGymTrainer2
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer3
	end
	
.CheckGymTrainer3
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer4
	end
	
.CheckGymTrainer4
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime
	end
	
.ItsRedTime
	playsound SFX_EXIT_BUILDING
	moveobject KANTOGYM_RED_DUMMY, 4, 17
	appear KANTOGYM_RED_DUMMY
	applymovement KANTOGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement KANTOGYM_RED_DUMMY, RedDummyWalksToSpotRight
	disappear KANTOGYM_RED_DUMMY
	appear KANTOGYM_RED
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_RED_IN_KANTO_GYM
	end
	
	
RedEntersGymScene2:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer22
	end
	
.CheckGymTrainer22
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer32
	end
	
.CheckGymTrainer32
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer42
	end
	
.CheckGymTrainer42
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime2
	end
	
.ItsRedTime2
	playsound SFX_EXIT_BUILDING
	moveobject KANTOGYM_RED_DUMMY, 5, 17
	appear KANTOGYM_RED_DUMMY
	applymovement KANTOGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement KANTOGYM_RED_DUMMY, RedDummyWalksToSpotLeft
	disappear KANTOGYM_RED_DUMMY
	appear KANTOGYM_RED
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_RED_IN_KANTO_GYM
	end
	

KantoGymGuyScript2:
	faceplayer
	checkevent EVENT_RED_IN_KANTO_GYM
	iftrue .KantoGymGuyRedNotHereScript2
	checkevent EVENT_BEAT_ACTUALLY_RED
	iftrue .KantoGymGuyWinScript2
	opentext
	writetext KantoGymGuyText2
	waitbutton
	closetext
	end
	
.KantoGymGuyRedNotHereScript2
	opentext
	writetext KantoGymGuyRedNotHereText2
	waitbutton
	closetext
	end

.KantoGymGuyWinScript2:
	opentext
	writetext KantoGymGuyWinText2
	waitbutton
	closetext
	end
	
RedDummyDummyMovement:
	step_end
	
RedDummyWalksToSpotRight:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
RedDummyWalksToSpotLeft:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step UP
	step_end
	
KantoGymGuyWinText2:
	text "¡Menudo combate!"
	
	para "¿Cuántas MEDALLAS"
	line "has conseguido?"
	
	para "Quizá estés listo"
	line "para la LIGA."
	done
	
KantoGymGuyText2:
	text "¡A por él, joven"
	line "promesa!"
	done

KantoGymGuyRedNotHereText2:
	text "¡Hola, joven"
	line "promesa!"

	para "Sabes quién es"
	line "ROJO, ¿verdad?"

	para "No solo es LÍDER"
	line "de GIMNASIO, sino"
	para "que además fue"
	line "CAMPEÓN de la"
	cont "LIGA."

	para "Es bastante"
	line "fuerte, pero es"
	cont "poco hablador."

	para "Y ahora mismo no"
	line "está aquí."

	para "Seguro que regresa"
	line "pronto. ¿Por qué"
	para "no combates contra"
	line "el resto de"
	para "entrenadores"
	line "mientras esperamos"
	cont "a que vuelva?"
	done

CooltrainerfFranSeenText:
	text "¡No dejaré que un"
	line "entrenador anónimo"
	cont "me derrote!"
	done

CooltrainerfFranBeatenText:
	text "Auuuu… Perdí…"
	done

CooltrainerfFranAfterBattleText:
	text "Quizá tengas lo"
	line "que hace falta"
	cont "para derrotar a"
	cont "ROJO."
	done

CooltrainerfLolaSeenText:
	text "¿Que qué tipo de"
	line "#MON usamos?"

	para "Pues todos, como"
	line "todo buen entrena-"
	cont "dor debería."
	done

CooltrainerfLolaBeatenText:
	text "¡Adelante!"
	done

CooltrainerfLolaAfterBattleText:
	text "Un equipo"
	line "equilibrado es la"
	cont "clave para ganar."
	done


CooltrainermMikeSeenText:
	text "¿Mis posibilidades"
	line "de perder? ¡Ni el"
	cont "uno por ciento!"
	done

CooltrainermMikeBeatenText:
	text "Es extraño."
	done

CooltrainermMikeAfterBattleText:
	text "Ahora sé cuál es"
	line "mi punto débil."

	para "¡Gracias por"
	line "enseñármelo!"
	done

CooltrainermPaulSeenText:
	text "Enfrentar a ROJO"
	line "será seguramente"
	cont "tu combate más"
	cont "duro."

	para "¡Pero yo no me"
	line "quedo atrás!"
	done

CooltrainermPaulBeatenText:
	text "¿Mis #MON han"
	line "perdido?"
	done

CooltrainermPaulAfterBattleText:
	text "¿Ya casi estás"
	line "listo para desafi-"
	cont "ar a la LIGA?"
	done

RedBeforeBattleText:
	text "…"
	done

RedBeatenText:
	text "…"
	done
	
RedRematchText:
	text "¿…?"
	done

RedRematchWinText:
	text "¡…!"
	done

RedAfterRematchText:
	text "…"
	done

PlayerReceivedTheRisingBadgeText:
	text "<PLAYER> recibió la"
	line "MEDALLA CRECIENTE."
	done

ErikaExplainTMText:
	text "…"
	done

RedAfterBattleText:
	text "…"
	done


KantoGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, KANTO_REGION, 8
	warp_event  5, 17, KANTO_REGION, 15

	db 2 ; coord events
	coord_event  5, 13, SCENE_DEFAULT, RedEntersGymScene
	coord_event  4, 13, SCENE_DEFAULT, RedEntersGymScene2

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, KantoGymStatue
	bg_event  6, 15, BGEVENT_READ, KantoGymStatue

	db 7 ; object events
	object_event  4,  7, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymRedScript, EVENT_RED_IN_KANTO_GYM
	object_event  4,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermPaul, -1
	object_event  9,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermMike, -1
	object_event  5,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfLola, -1
	object_event  0,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfFran, -1
	object_event -5, -5, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymRedScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoGymGuyScript2, -1
