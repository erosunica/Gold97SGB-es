	object_const_def ; object_event constants
	const SLOWPOKEB2F_SILVER
	const SLOWPOKEB2F_BLUE
	const SLOWPOKEB2F_OAK
	const SLOWPOKEB2F_ROCKET1
	const SLOWPOKEB2F_ROCKET2
	const SLOWPOKEB2F_ROCKET3
	const SLOWPOKEB2F_GYM_GUY
	const SLOWPOKEB2F_ELDER

SlowpokeWellB2F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke2Rockets ; SCENE_DEFAULT
	scene_script .SceneSlowpoke2Nothing ; SCENE_SLOWPOKE2_NOTHING

	db 0 ; callbacks
	
.SceneSlowpoke2Rockets
	end
	
.SceneSlowpoke2Nothing
	end

RocketEncounterScript:
	turnobject SLOWPOKEB2F_BLUE, DOWN
	showemote EMOTE_SHOCK, SLOWPOKEB2F_BLUE, 15
	opentext
	writetext BlueProblemText
	waitbutton
	closetext
	applymovement PLAYER, TwoStepsUpMovement
	turnobject SLOWPOKEB2F_BLUE, UP
	applymovement SLOWPOKEB2F_OAK, OakStepUpMovement
	opentext
	writetext OakStopThisText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakStepBackMovement
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET2, 15
	opentext
	writetext WeDoWhatWeWantText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_SILVER, 15
	opentext
	writetext WeAreAllTrainersText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET3, 15
	opentext
	writetext WellSeeText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ROCKET1, RocketWalksToBlue
	applymovement SLOWPOKEB2F_ROCKET2, RocketWalksToMe
	applymovement SLOWPOKEB2F_ROCKET3, RocketWalksToSilver
	winlosstext GruntM4SeenText, GruntM4BeatenText
	loadtrainer GRUNTM, GRUNTM_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	opentext
	writetext RocketsPlan
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEB2F_ROCKET1
	disappear SLOWPOKEB2F_ROCKET2
	disappear SLOWPOKEB2F_ROCKET3
	pause 15
	special FadeInQuickly
	pause 15
	applymovement SLOWPOKEB2F_OAK, OakReadyForSpeech
	opentext
	writetext OakSpeechText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakLeavesMovement
	turnobject SLOWPOKEB2F_BLUE, RIGHT
	opentext
	writetext BlueOutText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_BLUE, BlueLeavesMovement
	turnobject SLOWPOKEB2F_SILVER, LEFT
	opentext
	writetext SilverOutText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_SILVER, SilverLeavesMovement
	disappear SLOWPOKEB2F_BLUE
	disappear SLOWPOKEB2F_OAK
	disappear SLOWPOKEB2F_SILVER
	pause 25
	moveobject SLOWPOKEB2F_ELDER, 9, 13
	appear SLOWPOKEB2F_ELDER
	applymovement SLOWPOKEB2F_ELDER, ElderWalksToPlayerMovement
	applymovement PLAYER, PlayerLooksAtElderMovement
	opentext
	writetext ElderAsksToSeeYou
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ELDER, ElderWalksAwayFromPlayerMovement
	disappear SLOWPOKEB2F_ELDER
	setevent EVENT_ELDER_IN_WELL
	setevent EVENT_103_SLOWPOKE_SALESMAN
	setevent EVENT_BOARDWALK_PATH_IS_OPEN
	setevent EVENT_SANSKRIT_ROCKET_HOUSE_KEY_ITEM
	setscene SCENE_SLOWPOKE2_NOTHING
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	clearevent EVENT_KINGS_ROCK_GUY_APPEARS
	playmapmusic
	end

SlowpokeWellB1FNPCScript:
	end
	
OakLeavesMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
SilverLeavesMovement:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BlueLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

OakReadyForSpeech:
	step UP
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

TwoStepsUpMovement:
	step UP
	step RIGHT
	step UP
	step_end

OakStepUpMovement:
	step UP
	step_end
	
OakStepBackMovement:
	step DOWN
	turn_head UP
	step_end
	
RocketWalksToSilver:
	step DOWN
	step DOWN
	step_end
	
RocketWalksToBlue:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
RocketWalksToMe:
	step DOWN
	step LEFT
	step DOWN
	step_end
	
OneStepUp:
	step UP
	step_end

ElderWalksToPlayerMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	turn_head RIGHT
	step_end

ElderWalksAwayFromPlayerMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

PlayerLooksAtElderMovement:
	turn_head LEFT
	step_end

SlowpokeWellB2FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuyText
	buttonsound
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuyText_GotKingsRock
	waitbutton
	closetext
	end
	
SlowpokeWellB2FCovenantOrb:
	itemball COVENANT_ORB

	
ElderAsksToSeeYou:
	text "¡Jojo!"

	para "¡Veo que esos"
	line "hombres ya no"
	para "están torturando a"
	line "nuestros pobres"
	cont "SLOWPOKE!"

	para "¡En mis tiempos"
	line "mozos yo mismo me"
	cont "habría encargado"
	cont "de ellos!"

	para "Pero ya estoy muy"
	line "viejo para esas"
	cont "cosas."

	para "¡Debo darte las"
	line "gracias por tu"
	cont "ayuda!"

	para "Por favor, pasa a"
	line "verme a mi casa."

	para "Tengo un regalo"
	line "para ti."
	done

SlowpokeWellB2FGymGuyText:
	text "Me gustaría ver"
	line "cómo evolucionan"
	cont "los SLOWPOKE."

	para "Observándolos he"
	line "hecho un nuevo"
	cont "descubrimiento."

	para "Un SLOWPOKE con"
	line "una ROCA DEL REY"
	para "suele ser mordido"
	line "por un DISTURBAN."

	para "Toma, compartiré"
	line "una ROCA DEL REY"
	cont "contigo."
	done

SlowpokeWellB2FGymGuyText_GotKingsRock:
	text "Voy a ser como"
	line "SLOWPOKE."

	para "Tendré paciencia"
	line "y a ver si"
	cont "evoluciona alguno."
	done
	
OakSpeechText:
	text "OAK: Bueno…"
	
	para "El viaje de inves-"
	line "tigación no ha ido"
	cont "como planeamos…"
	
	para "Pero de todos"
	line "modos…"
	
	para "Hemos rescatado a"
	line "los SLOWPOKE."
	
	para "Ahora pueden vivir"
	line "sin que el TEAM"
	para "ROCKET les corte"
	line "sus COLAS."
	
	para "Pero que el TEAM"
	line "ROCKET haya"
	cont "regresado…"
	
	para "Son malas"
	line "noticias."
	
	para "AZUL, será mejor"
	line "que regresemos al"
	cont "laboratorio a"
	cont "investigar."
	
	para "¡<PLAYER>, <RIVAL>!"
	line "Vosotros dos"
	para "deberíais seguir"
	line "con vuestro viaje."
	
	para "Si me necesitáis,"
	line "ya sabéis dónde"
	cont "estoy."
	done
	
BlueOutText:
	text "AZUL: Gracias por"
	line "vuestra ayuda hoy,"
	cont "chicos."
	done
	
SilverOutText:
	text "<RIVAL>: ¡Nos"
	line "vemos, <PLAYER>!"

	para "¡No te quedes muy"
	line "atrás!"
	done

RocketsPlan:
	text "No importa."

	para "¡El TEAM ROCKET ha"
	line "avanzado tanto con"
	para "su plan que no"
	line "significan nada"
	para "pequeños contra-"
	line "tiempos como este!"

	para "¡Pronto comproba-"
	line "rás los frutos de"
	para "nuestro trabajo"
	line "cuando todos los"
	cont "#MON estén bajo"
	para "nuestro control!"
	done

GruntM4SeenText:
	text "¡Agh! ¿Derrotado"
	line "por un niño?"
	done

GruntM4BeatenText:
	text "¡Já! ¡Te lo dije!"
	done

WeDoWhatWeWantText:
	text "¡El TEAM ROCKET"
	line "hará lo que"
	cont "quiera!"

	para "¡No puedes"
	line "detenernos!"
	done
	
WeAreAllTrainersText:
	text "<RIVAL>: ¡AZUL,"
	line "<PLAYER> y yo somos"
	cont "entrenadores!"

	para "¡Claro que podemos"
	line "deteneros!"

	para "¡Mis #MON son"
	line "más fuertes que"
	cont "los de los demás!"
	done
	
WellSeeText:
	text "¡Já!"

	para "¡Ya lo veremos!"
	done

BlueProblemText:
	text "AZUL: ¡<PLAYER>!"
	line "¡Menos mal que"
	para "habéis aparecido"
	line "<RIVAL> y tú!"

	para "¡Tenemos un"
	line "problema!"
	done

OakStopThisText:
	text "OAK: ¡Estáis"
	line "haciendo daño a"
	cont "estos inocentes"
	cont "SLOWPOKE!"

	para "¡No está bien"
	line "cortar sus COLAS y"
	para "venderlas en"
	line "beneficio propio!"
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 15, SLOWPOKE_WELL_B1F, 2
	warp_event  9, 15, SLOWPOKE_WELL_B1F, 2

	db 1 ; coord events
	coord_event  9, 10, SCENE_DEFAULT, RocketEncounterScript


	db 0 ; bg events

	db 10 ; object events
	object_event 11,  8, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  9,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  8,  8, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  8,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event 12,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event 10,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  4,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FGymGuyScript, EVENT_KINGS_ROCK_GUY_APPEARS
	object_event 11,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FGymGuyScript, EVENT_ELDER_IN_WELL
	object_event 17, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FCovenantOrb, EVENT_SLOWPOKE_WELL_B2F_COVENANT_ORB
