	object_const_def ; object_event constants
	const WESTPORTGYM_BUGSY
	const WESTPORTGYM_BUG_CATCHER1
	const WESTPORTGYM_BUG_CATCHER2
	const WESTPORTGYM_BUG_CATCHER3
	const WESTPORTGYM_TWIN1
	const WESTPORTGYM_TWIN2
	const WESTPORTGYM_GYM_GUY

WestportGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportGymBugsyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_BUGSY
	iftrue RematchScriptBugsy
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptBugsy
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
	scall WestportGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	setevent EVENT_GRAMPS_AT_MINE
	setevent EVENT_GRAMPS_IS_AT_GRAMPS_HOUSE
	setevent EVENT_GIRL_IS_IN_MINE
	setevent EVENT_BOULDER_MINE_WHITNEY
	setevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	clearevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end
	
RematchScriptBugsy:
	opentext
	writetext BugsyRematchText
	waitbutton
	closetext
	winlosstext BugsyRematchWinText, 0
	loadtrainer BUGSY, BUGSY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_BUGSY
	opentext
	writetext BugsyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptBugsy:
	opentext
	writetext BugsyAfterRematchText
	waitbutton
	closetext
	end

BugsyRematchText:
	text "¡He seguido con"
	line "mis estudios sobre"
	cont "los #MON bicho!"
	
	para "¡Permíteme"
	line "mostrarte los"
	cont "frutos de mi"
	cont "labor!"
	done

BugsyRematchWinText:
	text "¡Asombroso!"
	
	para "¡Aún tengo mucho"
	line "que aprender!"
	done

BugsyAfterRematchText:
	text "¿Eres el CAMPEÓN?"
	
	para "¡Supongo que eso"
	line "te hace experto en"
	para "todos los tipos"
	line "de #MON!"
	
	para "Yo creo que"
	line "seguiré enfocán-"
	cont "dome en los"
	cont "#MON bicho."
	
	para "¡Hay mucho que"
	line "aprender sobre"
	cont "cada tipo de"
	cont "#MON!"
	done


WestportGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

WestportGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .WestportGymGuyWinScript
	opentext
	writetext WestportGymGuyText
	waitbutton
	closetext
	end

.WestportGymGuyWinScript:
	opentext
	writetext WestportGymGuyWinText
	waitbutton
	closetext
	end

WestportGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext BUGSY, BUGSY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BugsyText_INeverLose:
	text "¡Soy ANTÓN!"
	
	para "¡He dedicado mi"
	line "vida a aprender"
	cont "sobre los #MON"
	cont "bicho!"
	
	para "¡A mi familia"
	line "siempre le han"
	para "dado asco los"
	line "bichos, pero a"
	cont "mí no!"
	
	para "¡Los #MON bicho"
	line "son fascinantes,"
	para "y crecen muy"
	line "rápido!"
	
	para "¡Déjame enseñarte"
	line "cuánto he"
	cont "aprendido!"
	done

BugsyText_ResearchIncomplete:
	text "¡Uauu, increíble!"
	line "¡No hay #MON"
	cont "que se te resista!"

	para "Mi investigación"
	line "aún no ha acabado."

	para "Vale, tú ganas."
	line "Toma esta MEDALLA."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> recibió la"
	line "MEDALLA COLMENA."
	done

BugsyText_HiveBadgeSpeech:
	text "¿Conoces las"
	line "ventajas de la"
	cont "MEDALLA COLMENA?"

	para "Si la tienes, los"
	line "#MON hasta N.30"
	cont "te obedecerán."

	para "Y los #MON"
	line "que sepan FUERZA"
	para "pueden usarla"
	line "fuera del combate."

	para "Mira, también te"
	line "daré esto."
	done

BugsyText_FuryCutterSpeech:
	text "MT49 contiene"
	line "CORTE FURIA."

	para "Si no fallas, se"
	line "hace cada vez más"
	cont "fuerte."

	para "Cuanto más dure"
	line "el combate, más"
	cont "fuerte será."

	para "¿No es genial?"
	line "¡Lo descubrí yo!"
	done

BugsyText_BugMonsAreDeep:
	text "Los #MON bicho"
	line "son muy complejos."

	para "Quedan muchos"
	line "misterios por"
	cont "resolver."

	para "Estudia a fondo"
	line "tus favoritos."
	done

BugCatcherBennySeenText:
	text "Los #MON bicho"
	line "evolucionan pronto"
	para "y se hacen fuertes"
	line "mucho antes."
	done

BugCatcherBennyBeatenText:
	text "¡No se trata sólo"
	line "de evolucionar!"
	done

BugCatcherBennyAfterBattleText:
	text "Los #MON se"
	line "hacen más fuertes"
	cont "si evolucionan."
	done

BugCatcherAlSeenText:
	text "¡Los #MON bicho"
	line "son buenos y muy"
	para "fuertes! ¡Te lo"
	line "demostraré!"
	done

BugCatcherAlBeatenText:
	text "Has demostrado lo"
	line "fuerte que eres…"
	done

BugCatcherAlAfterBattleText:
	text "Son geniales,"
	line "pero la mayoría de"
	para "las chicas odian"
	line "los #MON bicho."

	para "No sé por qué…"
	done

BugCatcherJoshSeenText:
	text "¡Los #MON bicho"
	line "se hacen fuertes"
	cont "muy rápido!"
	
	para "¿Quieres"
	line "comprobarlo?"
	done

BugCatcherJoshBeatenText:
	text "¡Urrggg!"
	done

BugCatcherJoshAfterBattleText:
	text "Supongo que"
	line "debería enseñarles"
	cont "mejores ataques…"
	done

TwinsAmyandmay1SeenText:
	text "AMY: ¡Hola! ¿Estás"
	line "retando al LÍDER?"
	cont "¡No puede ser!"
	done

TwinsAmyandmay1BeatenText:
	text "AMY-MAY: ¡Ay,"
	line "Dios mío!"
	done

TwinsAmyandmay1AfterBattleText:
	text "AMY: ¡Eres muy"
	line "fuerte!"
	done

TwinsAmyandmay2SeenText:
	text "MAY: ¿Quieres ver"
	line "al LÍDER? ¡Antes"
	cont "vamos nosotras!"
	done

TwinsAmyandmay2BeatenText:
	text "AMY-MAY: ¡Ay,"
	line "Dios mío!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MAY: Han perdido"
	line "nuestros #MON."
	cont "¡Qué lástima!"
	done

WestportGymGuyText:
	text "¡Hola, valiente!"

	para "ANTÓN es joven,"
	line "pero conoce muy"
	para "bien a los #MON"
	line "bicho."

	para "Y sin mis consejos"
	line "te resultaría aún"
	cont "más duro."

	para "Veamos… A los"
	line "#MON bicho no"
	cont "les va el fuego."

	para "Y los ataques de"
	line "tipo volador son"
	cont "muy efectivos."
	done

WestportGymGuyWinText:
	text "¡Eso es! Ha sido"
	line "un gran encuentro"
	para "entre jóvenes con"
	line "talento."

	para "Con gente como tú,"
	line "¡el futuro de los"

	para "#MON será"
	line "maravilloso!"
	done

WestportGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, WESTPORT_CITY, 1
	warp_event  5, 15, WESTPORT_CITY, 12

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, WestportGymStatue
	bg_event  6, 13, BGEVENT_READ, WestportGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherBenny, -1
	object_event  8,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportGymGuyScript, -1
