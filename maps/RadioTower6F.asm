	object_const_def ; object_event constants
	const RADIOTOWER6F_TEACHER
	const RADIOTOWER6F_GENTLEMAN
	const RADIOTOWER6F_CLEFABLE
	const RADIOTOWER6F_CLEFABLE_SCARED
	const RADIOTOWER6F_GIOVANNI
	const RADIOTOWER6F_EXECUTIVE

RadioTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower6fClefable:	
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end
	
RadioTower6fClefableTakeover:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iffalse .NormalClefableTemp
	faceplayer
	opentext
	writetext ClefableScaredText
	cry CLEFABLE
	waitbutton
	writetext ClefableScaredText2
	waitbutton
	closetext
	end
	
.NormalClefableTemp
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end

RadioTower6fGentleman:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fGentleman
	writetext RadioTower6fGentlemanText
	waitbutton
	closetext
	end
.MidRocketTakeover6fGentleman
	writetext RadioTower6fGentlemanTextTakeover
	waitbutton
	closetext
	end
	

RadioTower6fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherTextTakeover
	waitbutton
	closetext
	end
	
RadioTower6FDirectorsOfficeSign:
	jumptext RadioTower6FDirectorsOfficeSignText
	
RadioTower6fGiovanni:
	end
	

TrainerExecutive6F:
	trainer EXECUTIVEM, EXECUTIVEM_3, EVENT_BEAT_ROCKET_EXECUTIVEM_3, Executive6FSeenText, Executive6FBeatenText, 0, .Script

.Script:
;	endifjustbattled
	opentext
	writetext Executive6FAfterBattleText
	waitbutton
	closetext
	end
	
GiovanniEncounter:
	special FadeOutMusic
	applymovement PLAYER, TwoStepsToGiovanni
	pause 15
	turnobject RADIOTOWER6F_GIOVANNI, DOWN
	opentext
	writetext GiovanniGreeting
	waitbutton
	closetext
	winlosstext GiovanniWinText, GiovanniLossText
	loadtrainer BROCK, BROCK1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext GiovanniExitingText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
;	disappear RADIOTOWER6F_CLEFABLE_SCARED
	disappear RADIOTOWER6F_GIOVANNI
	disappear RADIOTOWER6F_EXECUTIVE
;	appear RADIOTOWER6F_CLEFABLE
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_WESTPORT_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_WESTPORT_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_TEAM_ROCKET_DISBANDED
	clearevent EVENT_STAND_CITY_ZOO_MONS
	variablesprite SPRITE_STAND_ROCKET, SPRITE_YOUNGSTER
	variablesprite SPRITE_STAND_CITY_IMPOSTOR, SPRITE_OFFICER
	special PlayMapMusic
	moveobject RADIOTOWER6F_GENTLEMAN, 3, 2
	appear RADIOTOWER6F_GENTLEMAN
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks
	showemote EMOTE_SHOCK, RADIOTOWER6F_GENTLEMAN, 15
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks2
	applymovement PLAYER, PlayerWalksToDirector
	opentext
	writetext DirectorThanksText
	buttonsound
	verbosegiveitem HM_ROCK_SMASH
	setevent EVENT_GOT_TM08_ROCK_SMASH
	writetext DirectorThanksText2
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER6F_NOTHING; this scene is also set when you meet silver right at the beginning, then re set as part of the jump to radiotowerrockets
	setmapscene WESTPORT_CITY, SCENE_WESTPORT_CITY_RIVAL
	clearevent EVENT_OKERA_NOT_IN_GYM
	clearevent EVENT_OKERA_OWES_YOU_ONE
	variablesprite SPRITE_OLD_FUCHSIA_GYM_2, SPRITE_SILVER
	end
	
TwoStepsToGiovanni:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
DirectorWalks:
	step DOWN
	step DOWN
	step_end
	
DirectorWalks2:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end
	
PlayerWalksToDirector:
	step UP
	step RIGHT
	step_end
	
DirectorThanksText:
	text "¡Cielos!"
	
	para "¿A dónde han ido"
	line "esos impresenta-"
	cont "bles del TEAM"
	cont "ROCKET?"
	
	para "¿Se han ido?"
	
	para "¡Hola, chico!"
	line "¿Te has encargado"
	cont "de ellos?"
	
	para "¿En serio?"
	line "¡Te lo agradezco"
	cont "muchísimo!"
	
	para "¡Me echaron a"
	line "patadas de mi"
	para "oficina y mi pobre"
	line "CLEFABLE se quedó"
	cont "ahí!"
	
	para "¡No tenía modo de"
	line "abrirme paso!"
	
	para "¡Tengo que darte"
	line "algo como muestra"
	cont "de gratitud!"
	
	para "¡Ya sé, toma esto!"
	done
	
DirectorThanksText2:
	text "Con este movimien-"
	line "to, tus #MON"
	para "podrán romper"
	line "rocas que bloquean"
	cont "algunos caminos."

	para "¡Seguro que le"
	line "darás más uso que"
	cont "yo!"

	para "¡No quiero salir"
	line "de esta oficina"
	cont "nunca más!"
	done
	
GiovanniExitingText:
	text "Te diré algo."

	para "El mundo volverá a"
	line "ser testigo del"
	cont "TEAM ROCKET."

	para "¡Ya resurgimos"
	line "antes de las"
	para "cenizas, y un día,"
	line "volveremos a"
	cont "hacerlo!"
	done
	
GiovanniWinText:
	text "¡No! ¡Otra vez no!"
	
	para "Mis planes…"
	
	para "Mis esfuerzos…"
	
	para "¡¿Todo ha sido en"
	line "vano?!"
	done
	
GiovanniLossText:
	text "Bah…"
	done
	
GiovanniGreeting:
	text "Ah…"

	para "Supongo que eres"
	line "uno de los dos"
	para "niños de los que"
	line "he oído hablar."

	para "¿Eres <RIVAL>?"
	para "No, debes de ser"
	line "<PLAYER>."

	para "Bueno, <PLAYER>,"
	line "¿entiendes por qué"
	para "estás aquí ahora"
	line "frente a mí?"
	para "Yo sé por qué."
	
	para "Es porque eres muy"
	line "valiente…"
	para "O muy necio."
	
	para "Soy el líder del"
	line "TEAM ROCKET."
	
	para "Me he esforzado"
	line "mucho por hacer"
	para "que mi organiza-"
	line "ción vuelva a su"
	cont "vieja gloria."
	
	para "Me recuerdas a"
	line "otro niño al que"
	cont "me enfrenté una"
	cont "vez."

	para "…"
	
	para "Lo detesto, no"
	line "sabes cuánto."

	para "Sé perfectamente"
	line "cuáles son tus"
	cont "erróneas"
	cont "intenciones."
	
	para "Quieres frustrar"
	line "mis planes."
	
	para "Pues no lo voy a"
	line "permitir."
	
	para "¡No esta vez!"
	
	para "Yo, GIOVANNI, el"
	line "poderoso LÍDER del"
	cont "TEAM ROCKET,"	
	para "¡acabaré contigo!"	
	done
	

	
Executive6FSeenText:
	text "EJECUTIVO: ¡No!"

	para "¡No darás ni un"
	line "paso más!"
	
	para "¡Los mocosos como"
	line "tú no son dignos"
	cont "de reunirse con"
	cont "nuestro jefe!"
	
	para "¡Esto acaba aquí"
	line "y ahora!"
	done
	
Executive6FBeatenText:
	text "¡No!"
	
	para "¡GIOVANNI,"
	line "perdóneme!"
	done
	
Executive6FAfterBattleText:
	text "…"
	para "Ya no tengo más"
	line "ira que descargar"
	cont "contra ti."

	para "Si quieres"
	line "encontrarte con"
	para "GIOVANNI, está"
	line "justo delante."
	done
	
RadioTower6FDirectorsOfficeSignText:
	text "P5 OFICINA DEL"
	line "   DIRECTOR"
	done
	
RadioTower6FClefableText:
	text "CLEFABLE:"
	line "¡Clefa-ble!"
	done

ClefableScaredText:
	text "CLEFABLE:"
	line "¿Cle… clefa?"
	done
	
ClefableScaredText2:
	text "Parece asustado…"
	para "Por cierto, no"
	line "puedes hablar con"
	para "el CLEFABLE"
	line "asustado, así que"
	cont "nunca verás este"
	cont "texto…"
	done

RadioTower6fTeacherText:
	text "¡Esta es la"
	line "oficina del"
	para "DIRECTOR a cargo"
	line "de toda la"
	cont "realización!"
	done
	
RadioTower6fTeacherTextTakeover:
	text "¿Dónde ha ido el"
	line "DIRECTOR?"
	para "¡Espero que esté"
	line "bien!"
	done

RadioTower6fGentlemanText:
	text "¡Fundé la COMPAÑÍA"
	line "DE RADIO JOPM para"
	para "compartir mi amor"
	line "por los #MON!"

	para "Espero que tanto"
	line "la gente como los"
	para "#MON disfruten"
	line "de nuestros"
	cont "programas."
	done
	
RadioTower6fGentlemanTextTakeover:
	text "No estoy, así que"
	line "nunca verás este"
	cont "texto."
	done
	

RadioTower6F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RADIO_TOWER_5F, 2

	db 1 ; coord events
	coord_event  3,  3, SCENE_DEFAULT, GiovanniEncounter

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower6FDirectorsOfficeSign

	db 6 ; object events
	object_event  6,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower6fTeacher, -1
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fGentleman, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  1,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefable, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  0,  5, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefableTakeover, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3,  6, SPRITE_BROCK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RadioTower6fGiovanni, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerExecutive6F, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

