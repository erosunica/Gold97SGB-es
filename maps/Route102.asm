	object_const_def ; object_event constants
	const ROUTE102_YOUNGSTER1
	const ROUTE102_YOUNGSTER2
	const ROUTE102_LASS1
	const ROUTE102_FRUIT_TREE
	const ROUTE102_ARTHUR
	const ROUTE102_SILVER
	const ROUTE102_YOUNGSTER3
	const ROUTE102_YOUNGSTER4


Route102_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE102_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE102_SILVER

	db 3 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback
	callback MAPCALLBACK_NEWMAP, .CheckMomCall
	callback MAPCALLBACK_TILES, .Route102TreeCut

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE102_ARTHUR
	return

.ArthurAppears:
	appear ROUTE102_ARTHUR
	return


.Route102TreeCut:
	checkevent EVENT_ROUTE_102_TREE_CUT
	iffalse .R102TreeThere
	changeblock  33, 13, $6D ; notree
	return
	
.R102TreeThere
	return



TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	checkflag ENGINE_FLYPOINT_AMAMI
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
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

TrainerYoungsterSamuel:
	trainer YOUNGSTER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end


Route102LassScript:
	faceplayer
	opentext
	writetext Route102LassText
	waitbutton
	closetext
	end



TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route102SilverScript:
	applymovement PLAYER, Movement_36DownOne
	playsound SFX_EXIT_BUILDING
	moveobject ROUTE102_SILVER, 6, 11
	appear ROUTE102_SILVER
	applymovement ROUTE102_SILVER, Movement_36SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route102RivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Cruise:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route102RivalAfterText
	waitbutton
	closetext
	applymovement ROUTE102_SILVER, Route102RivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE102_SILVER
	setscene SCENE_ROUTE102_NOTHING
	waitsfx
	playmapmusic
	end

Route102SilverTalkScript:
	end

Route102Sign:
	jumptext Route102SignText

SanskritRuinsNorthSign:
	jumptext SanskritRuinsNorthSignText

Route102TrainerTips1:
	jumptext Route102TrainerTips1Text

Route102TrainerTips2:
	jumptext Route102TrainerTips2Text
	
Route102GameHouse:
	jumptext Route102GameHouseText

Route102FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_102

BellignanShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end
	
Movement_36DownOne:
	step DOWN
	turn_head UP
	step_end
	
Movement_36SilverDownOne:
	step DOWN
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route102TreeCut:
	setevent EVENT_ROUTE_102_TREE_CUT
	setscene SCENE_ROUTE102_SILVER
	end
	
Route102RivalBattleExitMovement:
	step UP
	step_end
	
Route102SilverWinText:
	text "¡Hala! ¡Se ve que"
	line "has trabajado duro"
	cont "entrenando a tus"
	cont "#MON!"
	done
	
Route102SilverLossText:
	text "¡Mi equipo es el"
	line "mejor!"
	done
	
Route102RivalBeforeText:
	text "¡<PLAYER>!"
	
	para "¡Tienes que"
	line "pasarte por CIUDAD"
	cont "PONIENTE!"
	
	para "Hay un CENTRO"
	line "COMERCIAL, una"
	cont "TORRE de RADIO, y…"
	
	para "¡Ah, sí!"
	
	para "¡He empezado el"
	line "desafío de la"
	cont "LIGA!"
	
	para "¡Oí que tú"
	line "también, <PLAYER>!"
	
	para "¡Será la mejor"
	line "manera de enseñar-"
	cont "le al mundo que mi"
	cont "equipo es el más"
	cont "fuerte que hay!"
	
	para "¡También he estado"
	line "capturando algunos"
	cont "#MON!"
	
	para "¿Y tú? ¡Vamos a"
	line "combatir para ver"
	para "quién los ha"
	line "entrenado mejor!"
	done
	
Route102RivalAfterText:
	text "¡Uf! ¡Ha estado"
	line "bien encontrarme"
	cont "contigo, <PLAYER>!"
	
	para "¡Voy a regresar a"
	line "la ciudad!"
	
	para "¡Nos vemos!"
	done

Route102LassText:
	text "Un arbusto bloquea"
	line "el paso a CIUDAD"
	cont "PONIENTE."

	para "Si necesitas"
	line "pasar, un #MON"
	cont "podría CORTAR el"
	cont "árbol."
	done

PsychicMarkSeenText:
	text "¡Te voy a leer"
	line "el pensamiento!"
	done

PsychicMarkBeatenText:
	text "¡Te he leído"
	line "mal!"
	done

PsychicMarkAfterBattleText:
	text "Sería fuerte si"
	line "pudiera saber lo"
	para "que está pensando"
	line "mi rival."
	done

SchoolboyAlan1SeenText:
	text "¡Gracias a mis"
	line "estudios, estoy"
	para "preparado para"
	line "cualquier #MON!"
	done

SchoolboyAlan1BeatenText:
	text "¡Ups! ¿Error de"
	line "cálculo?"
	done

SchoolboyAlanBooksText:
	text "Yo también estudio"
	line "5 horas al día."

	para "Leyendo libros"
	line "puedes aprender"
	cont "muchas cosas."
	done

MeetArthurText:
	text "JOSUÉ: ¿Quién"
	line "eres tú?"

	para "Soy JOSUÉ, por"
	line "jueves."
	done

ArthurGivesGiftText:
	text "Toma. Coge esto."
	done

ArthurGaveGiftText:
	text "JOSUÉ: Debería"
	line "usarlo un #MON"
	para "con habilidades de"
	line "tipo roca."

	para "Mejora los ataques"
	line "de tipo roca."
	done

ArthurThursdayText:
	text "JOSUÉ: Soy JOSUÉ,"
	line "por jueves. Soy el"
	cont "cuarto de siete"
	cont "hermanos."
	done

ArthurNotThursdayText:
	text "JOSUÉ: Hoy no es"
	line "jueves."
	cont "¡Qué desilusión!"
	done

Route102SignText:
	text "RUTA 102"
	
	para "CIUDAD PAGOTA -"
	line "CIUDAD PONIENTE"
	done

SanskritRuinsNorthSignText:
	text "Entrada norte de"
	line "las RUINAS ALFA"
	done

Route102TrainerTips1Text:
	text "PISTAS ENTRENADOR"

	para "Las habilidades de"
	line "los #MON varían"
	para "incluso dentro de"
	line "una misma especie."

	para "Al principio, sus"
	line "habilidades pueden"
	cont "parecerse."

	para "Sin embargo, las"
	line "diferencias surgen"
	para "a medida que el"
	line "#MON crece."
	done

Route102TrainerTips2Text:
	text "PISTAS ENTRENADOR"

	para "Usa EXCAVAR para"
	line "volver a la"
	cont "entrada."

	para "Es útil para"
	line "explorar cuevas y"
	cont "otros lugares."
	done
	
Route102GameHouseText:
	text "SALÓN RECREATIVO"
	para "¡Pasa a echar el"
	line "rato!"
	done

YoungsterSamuelSeenText:
	text "¡Aquí es donde"
	line "me entreno!"
	done

YoungsterSamuelBeatenText:
	text "¡Me han"
	line "derrotado!"
	done

YoungsterSamuelAfterText:
	text "Voy a entrenarme"
	line "mucho más."

	para "Después de todo,"
	line "intento ser un"
	cont "LÍDER de GIMNASIO."
	done

YoungsterIanSeenText:
	text "Soy el mejor de mi"
	line "clase en #MON."
	
	para "Te falta mucho"
	line "para ser como yo."
	done

YoungsterIanBeatenText:
	text "¡No! Hay mejores"
	line "entrenadores…"
	done

YoungsterIanAfterText:
	text "Supongo que debo"
	line "esforzarme aún"
	cont "más."
	done
	
WateredWeirdTreeScript::
	end


Route102_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 11, ROUTE_102_WEST_GATE, 4
	warp_event 15, 10, ROUTE_102_GAME_HOUSE, 1

	db 2 ; coord events
	coord_event  6, 12, SCENE_ROUTE102_SILVER, Route102SilverScript
	coord_event 33, 12, SCENE_DEFAULT, Route102TreeCut

	db 4 ; bg events
	bg_event 22, 16, BGEVENT_READ, Route102TrainerTips2
	bg_event 50, 16, BGEVENT_READ, Route102Sign
	bg_event 32, 16, BGEVENT_READ, Route102TrainerTips1
	bg_event 14, 11, BGEVENT_READ, Route102GameHouse

	db 8 ; object events
	object_event  6, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 29, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 50, 13, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route102LassScript, -1
	object_event 38, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route102FruitTree, -1
	object_event 40, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_102_ARTHUR_OF_THURSDAY
	object_event  1,  7, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102SilverTalkScript, EVENT_ROUTE_102_SILVER
	object_event 12, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerYoungsterSamuel, -1
	object_event 20, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterIan, -1
