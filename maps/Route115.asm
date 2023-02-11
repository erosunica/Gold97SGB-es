	object_const_def ; object_event constants
	const ROUTE115_COOLTRAINER_M1
	const ROUTE115_COOLTRAINER_M2
	const ROUTE115_COOLTRAINER_F1
	const ROUTE115_COOLTRAINER_F2
	const ROUTE115_YOUNGSTER1
	const ROUTE115_YOUNGSTER2
	const ROUTE115_POKE_BALL1
	const ROUTE115_POKE_BALL2
	const ROUTE115_FISHER
	const ROUTE115_POKE_BALL3


Route115_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks27

.ClearRocks27:
	checkevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	iftrue .R27RocksDone
	changeblock   5,  7, $6B ; rock
	changeblock   7,  5, $6B ; rock
	changeblock   5,  9, $6B ; rock
	return

.R27RocksDone
	return

TrainerPsychicGilbert:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end


TrainerBirdKeeperJose2:
	trainer BIRD_KEEPER, JOSE2, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJose2SeenText, BirdKeeperJose2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_JOSE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_BIRDKEEPER_JOSE
	iftrue .NumberAccepted
	checkevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BirdKeeperJose2AfterBattleText
	promptbutton
	setevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext BirdKeeperJose2BeatenText, 0
	checkflag ENGINE_FLYPOINT_KUME
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOSE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOSE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOSE_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end


TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_REENA_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftrue .NumberAccepted
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfReenaAfterBattleText
	promptbutton
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfReenaBeatenText, 0
	checkflag ENGINE_FLYPOINT_KUME
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REENA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REENA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REENA_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

TrainerCooltrainermBlake:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBrianAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainerfMegan:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end


Route115TMSolarbeam:
	itemball TM_SOLARBEAM

Route115RareCandy:
	itemball RARE_CANDY

Route115FisherScript:
	faceplayer
	opentext
	writetext Route115FisherReadyToBlowText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .WalkUpBehindTrees
	follow ROUTE115_FISHER, PLAYER
	applymovement ROUTE115_FISHER, TakeCoverMovement
	stopfollow
	turnobject ROUTE115_FISHER, DOWN
	applymovement PLAYER, PlayerTakeCoverMovement
	turnobject PLAYER, DOWN
	special FadeOutMusic
	pause 30
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EMBER
	earthquake 160
	pause 16	
	changeblock   5,  7, $01 ; clear
	changeblock   7,  5, $01 ; clear
	changeblock   5,  9, $01 ; clear
	moveobject ROUTE115_POKE_BALL3, 5, 7
	special RestartMapMusic
	follow ROUTE115_FISHER, PLAYER
	applymovement ROUTE115_FISHER, ReturnMovement
	stopfollow
	applymovement PLAYER, PlayerReturnMovement
	opentext
	writetext Route115FisherLoveThisJobText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE115_FISHER, 15
	opentext
	writetext Route115LookieText
	waitbutton
	closetext
	applymovement PLAYER, PickUpMovement
	disappear ROUTE115_POKE_BALL3
	opentext
	verbosegiveitem HM_WATERFALL
	setevent EVENT_GOT_HM07_WATERFALL
	turnobject PLAYER, RIGHT
	opentext
	writetext Route115ThatWasGreatText
	waitbutton
	closetext
	applymovement ROUTE115_FISHER, LeaveMovement
	disappear ROUTE115_FISHER
	setevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	end
	
	
.WalkUpBehindTrees
	follow ROUTE115_FISHER, PLAYER
	applymovement ROUTE115_FISHER, TakeCoverMovement2
	stopfollow
	turnobject ROUTE115_FISHER, DOWN
	applymovement PLAYER, PlayerTakeCoverMovement
	turnobject PLAYER, DOWN
	special FadeOutMusic
	pause 30
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EMBER
	earthquake 160
	pause 16	
	changeblock   5,  7, $01 ; clear
	changeblock   7,  5, $01 ; clear
	changeblock   5,  9, $01 ; clear
	moveobject ROUTE115_POKE_BALL3, 5, 7
	special RestartMapMusic
	follow ROUTE115_FISHER, PLAYER
	applymovement ROUTE115_FISHER, ReturnMovement
	stopfollow
	applymovement PLAYER, PlayerReturnMovement
	opentext
	writetext Route115FisherLoveThisJobText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE115_FISHER, 15
	opentext
	writetext Route115LookieText
	waitbutton
	closetext
	applymovement PLAYER, PickUpMovement
	disappear ROUTE115_POKE_BALL3
	opentext
	verbosegiveitem HM_WATERFALL
	setevent EVENT_GOT_HM07_WATERFALL
	turnobject PLAYER, RIGHT
	opentext
	writetext Route115ThatWasGreatText
	waitbutton
	closetext
	applymovement ROUTE115_FISHER, LeaveMovement
	disappear ROUTE115_FISHER
	setevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	end

.RocksStillThere
	writetext Route115FisherSettingUpText
	waitbutton
	closetext
	turnobject ROUTE115_FISHER, LEFT
	end
	
TakeCoverMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

TakeCoverMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
PlayerTakeCoverMovement:
	step RIGHT	
	step UP
	step_end
	
ReturnMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerReturnMovement:
	step DOWN
	step LEFT
	step_end
	
PickUpMovement:
	step LEFT
	step_end
	
LeaveMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
Route115FisherLoveThisJobText:
	text "¡Jajaja!"
	
	para "¡Me encanta este"
	line "trabajo!"
	done
	
Route115LookieText:
	text "¡Anda, mira!"
	
	para "Parece que había"
	line "algo dentro de esa"
	cont "roca."

	para "¿Por qué no te lo"
	line "quedas?"
	done
	
Route115ThatWasGreatText:
	text "¡Genial!"
	
	para "Por fin está"
	line "despejado el"
	para "camino a PUEBLO"
	line "SILENTE."

	para "¡Cuídate mucho,"
	line "chico!"
	done

	
Route115FisherSettingUpText:
	text "¡Esas rocas han"
	line "estado bloqueando"
	para "el camino a PUEBLO"
	line "SILENTE durante"
	cont "meses!"
	
	para "¡No te preocupes,"
	line "pienso quitarlas"
	cont "de en medio!"
	
	para "Sólo necesito un"
	line "poco de tiempo"
	para "para preparar los"
	line "explosivos."
	
	para "¿Por qué no"
	line "desafías el"
	para "GIMNASIO de KANTO"
	line "mientras tanto?"
	done
	
Route115FisherReadyToBlowText:
	text "¡Justo a tiempo!"
	
	para "¡Esas rocas están"
	line "a punto de"
	cont "explotar!"
	
	para "¡Pongámonos a"
	line "cubierto!"
	done
	
Route115FisherRocksGoneText:
	text "¡Qué bien sienta"
	line "ver el camino"
	cont "despejado!"
	done
	
IFoundThisInTheRubble2:
	text "Me alegra que ya"
	line "podamos pasar."

	para "¡A veces, si"
	line "quieres algo bien"
	para "hecho, tienes que"
	line "hacerlo tú mismo!"
	done

CooltrainermBlakeSeenText:
	text "Pareces muy"
	line "fuerte. ¡Déjame"
	cont "combatir contigo!"
	done

CooltrainermBlakeBeatenText:
	text "¡Auch!"
	done

CooltrainermBlakeAfterBattleText:
	text "¿Te diriges al"
	line "MT. FUJI?"
	done

CooltrainermBrianSeenText:
	text "¿Cómo se te da"
	line "esto?"
	done

CooltrainermBrianBeatenText:
	text "¡Justo como"
	line "pensaba!"
	done

CooltrainermBrianAfterBattleText:
	text "Un buen entrenador"
	line "puede reconocer a"
	para "otros buenos"
	line "entrenadores."
	done

CooltrainerfReenaSeenText:
	text "No deberías"
	line "subestimar a los"
	para "#MON salvajes"
	line "que hay por aquí."
	done

CooltrainerfReenaBeatenText:
	text "¡Oh! ¡Qué fuerte"
	line "eres!"
	done

CooltrainerfReenaAfterBattleText:
	text "Eres solo un niño,"
	line "pero nadie debería"
	cont "subestimarte."
	done

CooltrainerfMeganSeenText:
	text "¿Qué te trae por"
	line "aquí?"
	para "¿Estás entrenando"
	line "por tu cuenta?"
	done

CooltrainerfMeganBeatenText:
	text "¡Sí que eres"
	line "fuerte!"
	done

CooltrainerfMeganAfterBattleText:
	text "Me estoy"
	line "informando sobre"
	para "los #MON antes"
	line "y después de"
	cont "evolucionar."

	para "Los #MON"
	line "evolucionados son"
	cont "más fuertes."

	para "Pero tardan más"
	line "en aprender"
	cont "movimientos."
	done

PsychicGilbertSeenText:
	text "¡No digas nada!"

	para "Déjame adivinar en"
	line "qué estás"
	cont "pensando."

	para "Mmm…"

	para "¡Lo tengo! ¡Estás"
	line "afrontando el"
	cont "desafío de la LIGA"
	cont "#MON!"
	done

PsychicGilbertBeatenText:
	text "¡Eres demasiado!"
	done

PsychicGilbertAfterBattleText:
	text "Con tus"
	line "habilidades, lo"
	para "harás bien en la"
	line "LIGA."

	para "Eso es lo que"
	line "presiento."
	done

BirdKeeperJose2SeenText:
	text "¡Pío! ¡Pío!"
	line "¡Pío, pío!"
	done

BirdKeeperJose2BeatenText:
	text "¡Pío!"
	done

BirdKeeperJose2AfterBattleText:
	text "Los ORNITÓLOGOS"
	line "como yo imitamos"
	para "el canto de los"
	line "pájaros para"
	para "entrenar a"
	line "nuestros #MON."
	done


Route115_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 53,  9, ROUTE_115_KANTO_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event 39,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 48,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermBrian, -1
	object_event 27,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 18,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfMegan, -1
	object_event 33, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event  9, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJose2, -1
	object_event 31, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route115TMSolarbeam, EVENT_ROUTE_115_TM_SOLARBEAM
	object_event 15,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route115RareCandy, EVENT_ROUTE_115_RARE_CANDY
	object_event  6,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 1,  0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route115FisherScript, EVENT_ROUTE_115_ROCKS_DEMOLISHED
	object_event  9,  -8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1
