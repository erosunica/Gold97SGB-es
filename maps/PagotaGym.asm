	object_const_def ; object_event constants
	const PAGOTAGYM_FALKNER
	const PAGOTAGYM_YOUNGSTER1
	const PAGOTAGYM_YOUNGSTER2
	const PAGOTAGYM_GYM_GUY

PagotaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaGymFalknerScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_FALKNER
	iftrue RematchScriptFalkner
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptFalkner
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall PagotaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
;	setmapscene ROUTE_102, SCENE_ROUTE102_SILVER; 
	clearevent EVENT_ROUTE_102_SILVER; 
;	setmapscene OAK_LAB_BACK_ROOM, SCENE_OAK2SLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end
	

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end
	
RematchScriptFalkner:
	opentext
	writetext FalknerRematchText
	waitbutton
	closetext
	winlosstext FalknerRematchWinText, 0
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_FALKNER
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptFalkner:
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

FalknerRematchText:
	text "Me han dicho que"
	line "ganaste la LIGA"
	cont "#MON."

	para "¡Enhorabuena!"
	
	para "He entrenado sin"
	line "descanso aquí, en"
	para "el GIMNASIO"
	line "PAGOTA."
	
	para "¡Veamos si aún"
	line "puedes derrotarme!"
	done

FalknerRematchWinText:
	text "¡No me sorprende"
	line "tu victoria!"
	done

FalknerAfterRematchText:
	text "¡Me siento"
	line "orgulloso de haber"
	para "sido tu primer"
	line "escalón hacia"
	cont "la cima!"
	
	para "¡Sigue así!"
	done



PagotaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end


PagotaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PAGOTA_GYM_FALKNER
	iftrue .nothere
	checkevent EVENT_BEAT_FALKNER
	iftrue .PagotaGymGuyWinScript
	writetext PagotaGymGuyText
	waitbutton
	closetext
	end
	
.nothere
	writetext PagotaGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.PagotaGymGuyWinScript:
	writetext PagotaGymGuyWinText
	waitbutton
	closetext
	end

PagotaGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext FALKNER, FALKNER1, MEM_BUFFER_1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "¡Sabía que"
	line "acabarías"
	cont "viniendo!"
	
	para "Siempre es bueno"
	line "ver a un nuevo"
	para "entrenador"
	line "queriendo desafiar"
	cont "la LIGA."

	para "¿Crees que podrás"
	line "derrotarme?"

	para "¡Yo te enseñaré el"
	line "auténtico poder de"
	para "los magníficos"
	line "pájaros #MON!"
	done

FalknerWinLossText:
	text "¡Maldición! Los"
	line "queridos #MON"
	cont "de mi padre…"

	para "¡Muy bien!"
	line "Toma esto."

	para "Es la MEDALLA"
	line "CÉFIRO oficial de"
	cont "la LIGA #MON."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> recibió"
	line "la MEDALLA CÉFIRO."
	done

FalknerZephyrBadgeText:
	text "La MEDALLA CÉFIRO"
	line "mejora el ATAQUE"
	cont "de los #MON."

	para "Y permite que"
	line "los #MON"
	para "usen CORTE, si"
	line "lo tienen."

	para "Toma, también te"
	line "daré esto."
	done

FalknerTMMudSlapText:
	text "Al usar una MT, el"
	line "#MON aprenderá"
	para "inmediatamente un"
	line "nuevo movimiento."

	para "Piensa antes de"
	line "actuar, ya que las"

	para "MT sólo se pueden"
	line "usar una vez."

	para "MT31 contiene"
	line "BOFETÓN LODO."

	para "Reduce la"
	line "precisión del"
	para "enemigo y causa"
	line "grandes daños."

	para "Es decir, es tanto"
	line "defensiva como"
	cont "ofensiva."
	done

FalknerFightDoneText:
	text "Encontrarás"
	line "GIMNASIOS #MON"
	para "en las ciudades"
	line "y en los pueblos."

	para "Deberías probar"
	line "tus habilidades en"
	cont "estos GIMNASIOS."

	para "¡Yo seguiré"
	line "entrenándome para"
	para "ser el maestro de"
	line "los pájaros!"
	done

BirdKeeperRodSeenText:
	text "¡La clave está en"
	line "tener valor!"

	para "Éstos se entrenan"
	line "noche y día para"
	para "convertirse en"
	line "maestros #MON."

	para "¡Adelante!"
	done

BirdKeeperRodBeatenText:
	text "¡Aaah!"
	done

BirdKeeperRodAfterBattleText:
	text "¡La destreza de"
	line "PEGASO es real!"

	para "¡No te confíes por"
	line "haberme vencido!"
	done

BirdKeeperAbeSeenText:
	text "¡Demuéstrame que"
	line "vales lo suficien-"
	cont "te para luchar"
	cont "contra PEGASO!"
	done

BirdKeeperAbeBeatenText:
	text "¡No puede ser"
	line "cierto!"
	done

BirdKeeperAbeAfterBattleText:
	text "Qué patético"
	line "resulta perder"
	para "contra entrena-"
	line "dores novatos…"
	done

PagotaGymGuyText:
	text "¡Hola! ¡No soy"
	line "entrenador pero te"
	cont "puedo aconsejar!"

	para "¡Créeme!"
	line "Si confías, tus"
	para "sueños de triunfo"
	line "podrían cumplirse."

	para "¿Confías? Pues"
	line "escucha."

	para "El tipo planta es"
	line "débil contra el"
	para "tipo volador."
	line "¡No lo olvides!"
	done

PagotaGymGuyTextNotHere:
	text "¡Hola! ¿Vienes a"
	line "desafiar a PEGASO?"
	
	para "¡Odio tener que"
	line "decir esto, pero"
	cont "no está aquí!"
	
	para "Acaba de salir"
	line "para ir a algún"
	cont "sitio."
	
	para "Echa un vistazo"
	line "por la ciudad."

	para "No puede haber ido"
	line "muy lejos."
	done

PagotaGymGuyWinText:
	text "¡Bonita batalla!"
	line "¡Sigue así y"
	para "podrás conseguir"
	line "lo que quieras!"
	done

PagotaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 2
	warp_event  4, 15, PAGOTA_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 13, BGEVENT_READ, PagotaGymStatue
	bg_event  5, 13, BGEVENT_READ, PagotaGymStatue

	db 4 ; object events
	object_event  4,  4, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PagotaGymFalknerScript, EVENT_PAGOTA_GYM_FALKNER
	object_event  7,  0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  0,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  6, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaGymGuyScript, -1
