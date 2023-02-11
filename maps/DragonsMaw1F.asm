	object_const_def ; object_event constants
	const DRAGONSMAW1F_POKE_BALL1
	const DRAGONSMAW1F_COOLTRAINER_M
	const DRAGONSMAW1F_COOLTRAINER_F
	const DRAGONSMAW1F_TWIN1
	const DRAGONSMAW1F_TWIN2
	const DRAGONSMAW1F_POKE_BALL2
	const DRAGONSMAW1F_POKE_BALL3
	const DRAGONSMAW1F_GENTLEMAN

DragonsMaw1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DRAGONSMAW1F_NOTHING
	scene_script .DummyScene1 ; SCENE_DRAGONSMAW1F_CLAIR_GIVES_TM

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end


	;giveitem TM_DRAGONBREATH
	;setevent EVENT_GOT_TM24_DRAGONBREATH


TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .DarinCheck2
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end

.DarinCheck2
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .DarinCheck3
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.DarinCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .DarinOrbCheck
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.DarinOrbCheck
	checkevent EVENT_GOT_DRAGON_ORB_FROM_MAW
	iffalse .DarinGetDragonOrb
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

.DarinGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerInstructorRand:
	trainer INSTRUCTOR, RAND, EVENT_BEAT_INSTRUCTOR_RAND, InstructorRandSeenText, InstructorRandBeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .RandCheck2
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end

.RandCheck2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .RandCheck3
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.RandCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .RandOrbCheck
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.RandOrbCheck
	checkevent EVENT_GOT_DRAGON_ORB_FROM_MAW
	iffalse .RandGetDragonOrb
	opentext
	writetext InstructorRandAfterBattleText
	waitbutton
	closetext
	end

.RandGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script


.Script:
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .CaraCheck2
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end

.CaraCheck2
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .CaraCheck3
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.CaraCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .CaraOrbCheck
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.CaraOrbCheck
	checkevent EVENT_GOT_DRAGON_ORB_FROM_MAW
	iffalse .CaraGetDragonOrb
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end
	
.CaraGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .Twin1Check2
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end

.Twin1Check2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .Twin1Check3
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin1Check3
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .Twin1OrbCheck
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin1OrbCheck
	checkevent EVENT_GOT_DRAGON_ORB_FROM_MAW
	iffalse .Twin1GetDragonOrb
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

.Twin1GetDragonOrb
	jump DragonOrbGetScript
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .Twin2Check2
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end

.Twin2Check2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .Twin2Check3
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin2Check3
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .Twin2OrbCheck
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin2OrbCheck
	checkevent EVENT_GOT_DRAGON_ORB_FROM_MAW
	iffalse .Twin2GetDragonOrb
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end
	
.Twin2GetDragonOrb
	jump DragonOrbGetScript
	end

DragonsMaw1FDragonFangScript:
	itemball DRAGON_FANG



DragonsMaw1FDragonBreath:
	itemball TM_DRAGONBREATH

DragonsMaw1FMaxElixer:
	itemball MAX_ELIXER

DragonsMaw1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_MAW_1F_HIDDEN_REVIVE

DragonsMaw1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_MAW_1F_HIDDEN_MAX_POTION

DragonsMaw1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_MAW_1F_HIDDEN_MAX_ELIXER

DragonOrbGetScript:
	opentext
	writetext HeresTheOrb
	waitbutton
	verbosegiveitem MACHINE_PART
	setevent EVENT_GOT_DRAGON_ORB_FROM_MAW
;	writetext HeresTheOrb2
;	waitbutton
	closetext
	end
	
HeresTheOrb:
	text "Al fin has"
	line "descubierto quién"
	para "tiene la"
	line "DRAGOESFERA."
	
	para "Toma, llévasela a"
	line "DÉBORA."
	done
	
HeresTheOrb2:
	text "recibió orbe"
	done


CooltrainermDarinSeenText:
	text "¡Tú! ¿Tienes lo"
	line "que hace falta"
	para "para entrenar a"
	line "los poderosos"
	cont "#MON dragón?"
	done

CooltrainermDarinBeatenText:
	text "¡Cuánta fuerza!"
	done

CooltrainermDarinAfterBattleText:
	text "Seguro que este te"
	line "parecerá un gran"
	cont "lugar para"
	cont "entrenar."
	done

CooltrainermDarinAfterBattleTextNotDone:
	text "¿La DRAGOESFERA?"
	para "Yo no soy quien la"
	line "tiene."
	done

CooltrainerfCaraSeenText:
	text "¿DÉBORA te ha dado"
	line "permiso para estar"
	cont "aquí?"
	done

CooltrainerfCaraBeatenText:
	text "¡Ay, perdí!"
	done

CooltrainerfCaraAfterBattleTextNotDone:
	text "No, no soy quien"
	line "tiene la"
	cont "DRAGOESFERA."
	
	para "¡Sigue"
	line "intentándolo!"
	done

CooltrainerfCaraAfterBattleText:
	text "Creo que entrenar"
	line "a dragones acaba"
	para "compensando más"
	line "que el resto de"
	cont "tipos."
	done


InstructorRandSeenText:
	text "¿Has aprendido lo"
	line "suficiente sobre"
	para "los místicos"
	line "#MON dragón"
	para "para respetarlos"
	line "como es debido?"
	done

InstructorRandBeatenText:
	text "¡Vaya, he"
	line "perdido!"
	done

InstructorRandAfterBattleText:
	text "La historia de las"
	line "personas que"
	para "entrenan #MON"
	line "dragón es tan"
	para "larga como"
	line "conocida."
	
	para "Hay quien cree que"
	line "dio comienzo aquí."
	done

InstructorRandAfterBattleTextNotDone:
	text "¿La DRAGOESFERA?"
	line "No la tengo."
	
	para "Prueba con alguien"
	line "más."
	done

TwinsLeaandpia1SeenText:
	text "Es un desconocido."
	done

TwinsLeaandpia1BeatenText:
	text "Mecachis."
	done

TwinsLeaandpia1AfterBattleText:
	text "¿Has combatido"
	line "contra LANCE?"
	
	para "Es el único"
	line "entrenador dragón"
	cont "por encima de"
	cont "DÉBORA."
	done
	
TwinsLeaandpia1AfterBattleTextNotDone:
	text "¿Una DRAGOESFERA?"
	line "¡Aquí no está!"
	done

TwinsLeaandpia2SeenText:
	text "¿Quién eres?"
	done

TwinsLeaandpia2BeatenText:
	text "Eres malo."
	done

TwinsLeaandpia2AfterBattleTextNotDone:
	text "¿La DRAGOESFERA?"
	line "¡Yo no la tengo!"
	done

TwinsLeaandpia2AfterBattleText:
	text "¡Algún día mi"
	line "hermana y yo vamos"
	para "a ser tan fuertes"
	line "como DÉBORA y"
	cont "LANCE!"
	done

DragonsMaw1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 31, KOBAN_ISLAND, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event 33, 29, BGEVENT_ITEM, DragonsMaw1FHiddenRevive
	bg_event  6,  4, BGEVENT_ITEM, DragonsMaw1FHiddenMaxPotion
	bg_event 28, 16, BGEVENT_ITEM, DragonsMaw1FHiddenMaxElixer

	db 8 ; object events
	object_event 33, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsMaw1FDragonFangScript, EVENT_DRAGONS_MAW_1F_DRAGON_FANG
	object_event 23,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event 16,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  2, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  2, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 19, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsMaw1FDragonBreath, EVENT_DRAGONS_MAW_TM_24_DRAGONBREATH
	object_event 26, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsMaw1FMaxElixer, EVENT_DRAGONS_MAW_1F_MAX_ELIXER
	object_event 24, 25, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerInstructorRand, -1
