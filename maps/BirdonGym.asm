	object_const_def ; object_event constants
	const BIRDONGYM_MORTY
	const BIRDONGYM_GYM_GUY
	const BIRDONGYM_GRANNY1
	const BIRDONGYM_GRANNY2
	const BIRDONGYM_GRAMPS

BirdonGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	end


.DummyScene:
	end
	


TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSageYurei:
	trainer SAGE, YUREI, EVENT_BEAT_SAGE_YUREI, SageYureiSeenText, SageYureiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageYureiAfterBattleText
	waitbutton
	closetext
	end


TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script
	

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

BirdonGymMortyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_MORTY
	iftrue RematchScriptMorty
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptMorty
	
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_MEDIUM_REBECCA
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall BirdonGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_SAGE_YUREI
	writetext MortyText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end
	
RematchScriptMorty:
	opentext
	writetext MortyRematchText
	waitbutton
	closetext
	winlosstext MortyRematchWinText, 0
	loadtrainer MORTY, MORTY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_MORTY
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptMorty:
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

MortyRematchText:
	text "¿Estoy viendo un"
	line "fantasma o es que"
	para "has vuelto a mi"
	line "GIMNASIO?"
	
	para "Si es así,"
	line "¡concédeme un"
	para "combate una vez"
	line "más para avanzar"
	para "con mi"
	line "entrenamiento!"
	done

MortyRematchWinText:
	text "Impecable…"
	done

MortyAfterRematchText:
	text "El ave arcoíris"
	line "de la leyenda…"
	para "¿La has visto"
	line "durante tu viaje?"
	
	para "Si llegase a"
	line "aparecer frente a"
	para "alguien, creo que"
	line "sería frente a ti."
	done

BirdonGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript







BirdonGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .BirdonGymGuyWinScript
	writetext BirdonGymGuyText
	waitbutton
	closetext
	end

.BirdonGymGuyWinScript:
	writetext BirdonGymGuyWinText
	waitbutton
	closetext
	end

BirdonGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext MORTY, MORTY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BirdonGymPlayerStepUpMovement:
	step UP
	step_end

BirdonGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

BirdonGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Me alegro de que"
	line "hayas venido."

	para "Aquí en BIRDON,"
	line "los #MON son"
	cont "venerados."

	para "Se dice que un"
	line "#MON de llamas"
	para "del color del arco"
	line "iris bajará ante"
	para "un verdadero"
	line "entrenador."

	para "Yo creo en esa"
	line "historia y, por"
	para "eso, llevo entre-"
	line "nándome aquí toda"
	cont "mi vida."

	para "Así que ahora"
	line "puedo ver cosas"
	cont "que otros no ven."

	para "Sólo un poco más…"

	para "Con un poco más,"
	line "podría ser yo"
	para "quien viera al"
	line "#MON de los"
	para "colores del arco"
	line "iris."

	para "¡Ayúdame a alcan-"
	line "zar ese nivel!"
	done

MortyWinLossText:
	text "Aún no soy lo"
	line "bastante bueno…"

	para "De acuerdo. Esta"
	line "MEDALLA es tuya."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> recibió la"
	line "MEDALLA NIEBLA."
	done

MortyText_FogBadgeSpeech:
	text "Con la MEDALLA"
	line "NIEBLA, te obede-"
	cont "cerán todos los"
	cont "#MON hasta el"
	cont "nivel 50."

	para "Y los #MON que"
	line "sepan SURF podrán"
	para "usarlo en"
	line "cualquier momento."

	para "Quédate con esto"
	line "también."
	done

MortyText_ShadowBallSpeech:
	text "Es BOLA SOMBRA."
	line "Causa daños y"
	para "puede reducir la"
	line "DEFENSA ESPECIAL."

	para "Úsala si te gusta."
	done

MortyFightDoneText:
	text "Entiendo…"

	para "Tu viaje te ha"
	line "llevado a tierras"
	cont "lejanas."

	para "Y has presenciado"
	line "muchas más cosas"
	cont "que yo."

	para "¡Cómo te envidio…!"
	done

MediumRebeccaSeenText:
	text "¡El poder de todos"
	line "a los que venciste"
	cont "está en mí!"
	done

MediumRebeccaBeatenText:
	text "Fuerte…"
	line "Muy fuerte…"
	done

MediumRebeccaAfterBattleText:
	text "¿De dónde proviene"
	line "tu poder?"
	done

BirdonGymGuyText:
	text "Este GIMNASIO está"
	line "repleto de"
	para "agujeros que te"
	line "enviarán de vuelta"
	cont "a la entrada."

	para "Pero hay algunos"
	line "por los que puedes"
	cont "caminar."

	para "¡Vigila tus pasos!"
	done

BirdonGymGuyWinText:
	text "¡Uauu, <PLAYER>!"
	line "¡Genial!"

	para "¡Me escondí en el"
	line "rincón muerto de"
	cont "miedo!"
	done

SageYureiSeenText:
	text "¿Puedes demostrar"
	line "que estás vivo?"
	done
	
SageYureiBeatenText:
	text "Entiendo…"
	done
	
SageYureiAfterBattleText:
	text "¿Puedes demostrar"
	line "que estoy vivo?"
	done

MediumDorisSeenText:
	text "¡Fufufufu…!"
	line "Lo veo claramente."

	para "¡Puedo ver lo que"
	line "encierra tu alma!"
	done

MediumDorisBeatenText:
	text "A pesar de leerte"
	line "el pensamiento,"
	cont "he perdido…"
	done

MediumDorisAfterBattleText:
	text "¡Maldición! Olvidé"
	line "que predije mi"
	cont "derrota contra ti."
	done

BirdonGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  2,  9, BIRDON_TOWN, 5
	warp_event  3,  9, BIRDON_TOWN, 9
	warp_event  2,  7, BIRDON_GYM, 4
	warp_event  1,  0, BIRDON_GYM, 3
	warp_event  2,  0, BIRDON_GYM, 3
	warp_event  3,  0, BIRDON_GYM, 3
	warp_event  9,  9, BIRDON_GYM, 3
	warp_event 13,  0, BIRDON_GYM, 3
	warp_event 17,  4, BIRDON_GYM, 3
	warp_event  0,  0, BIRDON_GYM, 3
	warp_event  4,  0, BIRDON_GYM, 3
	warp_event  5,  0, BIRDON_GYM, 3
	warp_event  7,  0, BIRDON_GYM, 3
	warp_event 12,  0, BIRDON_GYM, 3
	warp_event 14,  0, BIRDON_GYM, 3
	warp_event  8,  0, BIRDON_GYM, 3
	warp_event 16,  4, BIRDON_GYM, 3
	warp_event 10,  0, BIRDON_GYM, 3
	warp_event 15,  0, BIRDON_GYM, 3
	warp_event  6,  4, BIRDON_GYM, 3
	warp_event  6,  5, BIRDON_GYM, 3
	warp_event  7,  8, BIRDON_GYM, 3
	warp_event  6,  8, BIRDON_GYM, 3
	warp_event 18,  0, BIRDON_GYM, 3
	warp_event 17,  0, BIRDON_GYM, 3
	warp_event  2,  4, BIRDON_GYM, 3
	warp_event  3,  4, BIRDON_GYM, 3
	warp_event 19,  0, BIRDON_GYM, 3
	warp_event 16,  0, BIRDON_GYM, 3
	warp_event 17,  6, BIRDON_GYM, 3
	warp_event 17,  7, BIRDON_GYM, 3
	warp_event 12,  8, BIRDON_GYM, 3
	warp_event 13,  8, BIRDON_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  7, BGEVENT_READ, BirdonGymStatue
	bg_event  4,  7, BGEVENT_READ, BirdonGymStatue

	db 5 ; object events
	object_event 16,  2, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonGymMortyScript, -1
	object_event  0,  7, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonGymGuyScript, -1
	object_event  5,  6, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event 11,  5, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSageYurei, -1

