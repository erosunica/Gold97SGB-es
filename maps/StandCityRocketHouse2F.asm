	object_const_def ; object_event constants
	const STANDCITYROCKETHOUSE2F_GRUNTF4
	const STANDCITYROCKETHOUSE2F_GRUNTM6
	const STANDCITYROCKETHOUSE2F_GRUNTM7
	const STANDCITYROCKETHOUSE2F_IMPOSTOR

StandCityRocketHouse2F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneStandCityRocketHouse2FImposterScene ; SCENE_DEFAULT
	scene_script .SceneStandCityRocketHouse2FNothing ;

	db 0 ; callbacks

.SceneStandCityRocketHouse2FImposterScene
	end
.SceneStandCityRocketHouse2FNothing
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end


TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end


TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end
	
ImposterScene2FTop:
	opentext
	writetext ImposterHeyYouText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	applymovement PLAYER, Warden2FOneStepLeft
	jump ImposterSceneMainScript
	
ImposterScene2FBottom:
	opentext
	writetext ImposterHeyYouText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	applymovement PLAYER, Warden2FOneStepLeftAndUp
	jump ImposterSceneMainScript
	
ImposterSceneMainScript:
	applymovement PLAYER, Warden2FRestOfTheSteps
	opentext
	writetext Warden2FWhoDoYouThinkYouAreText
	waitbutton
	closetext
	winlosstext ImposterWinText, ImposterLossText
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext Warden2FFineYouWin
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear STANDCITYROCKETHOUSE2F_GRUNTF4
	disappear STANDCITYROCKETHOUSE2F_GRUNTM6
	disappear STANDCITYROCKETHOUSE2F_GRUNTM7
	disappear STANDCITYROCKETHOUSE2F_IMPOSTOR
	pause 15
	special FadeInQuickly
	setevent EVENT_ROCKETS_IN_STAND_CITY
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_2F_NOTHING
	setmapscene STAND_CITY_ROCKET_HOUSE, SCENE_STAND_CITY_ROCKET_HOUSE_BASE_UNCOVERED
	pause 30
	end
	
StandCityRocketHouse2FTV:
	jumptext StandCityRocketHouse2FTVText
	
StandCityRocketHouse2FPoster:
	jumptext StandCityRocketHouse2FPosterText

Warden2FRestOfTheSteps:
	step LEFT
	step LEFT
	step LEFT
	step_end
	
Warden2FOneStepLeft:
	step LEFT
	step_end
	
Warden2FOneStepLeftAndUp:
	step LEFT
	step UP
	step_end
	
StandCityRocketHouse2FTVText:
	text "Es una reposición…"
	done

StandCityRocketHouse2FPosterText:
	text "¡El TEAM ROCKET"
	line "usará a todos los"
	cont "#MON para ganar"
	cont "dinero!"
	done

Warden2FFineYouWin:
	text "Bah…"
	line "Está bien."

	para "Tú ganas."

	para "Nos vamos."

	para "Aquí ya no hay"
	line "nada que te quede"
	cont "por ver."

	para "Adiós, niño."
	done

ImposterWinText:
	text "¡Pequeño mocoso!"
	done

ImposterLossText:
	text "¡Jaja!"
	done

Warden2FWhoDoYouThinkYouAreText:
	text "¿Quién te crees"
	line "que eres?"
	para "¿Por qué intentas"
	line "interferir en"
	cont "nuestro asombroso"
	cont "trabajo?"
	para "¡El TEAM ROCKET"
	line "está a punto de"
	para "lanzar la mayor"
	line "revolución en la"
	cont "tecnología"
	cont "#MON!"

	para "…"
	para "Está claro que no"
	line "piensas lo mismo."

	para "¡Tendré que"
	line "ayudarte a que lo"
	cont "entiendas!"

	para "¡No permitiré que"
	line "te metas en"
	cont "nuestro camino!"
	done

ImposterHeyYouText:
	text "¡Eh, tú! ¡Mocoso!"
	done

GruntM7SeenText:
	text "He recibido"
	line "órdenes."

	para "¡Aplastaré a todo"
	line "aquel que desafíe"
	cont "al TEAM ROCKET!"
	done

GruntM7BeatenText:
	text "¿¡Qué!?"
	done

GruntM7AfterBattleText:
	text "No he cumplido con"
	line "mi deber…"

	para "Me van a bajar el"
	line "sueldo…"
	done

GruntF4SeenText:
	text "¿Son buenos mis"
	line "#MON?"

	para "¡Creeré que mis"
	line "#MON son buenos"
	para "cuando derroten a"
	line "los tuyos!"
	done

GruntF4BeatenText:
	text "¡Oh, no! ¡Son"
	line "tan inútiles!"
	done

GruntF4AfterBattleText:
	text "¡Me amo a mí"
	line "misma!"

	para "¿Qué importan los"
	line "#MON?"
	done

GruntM6SeenText:
	text "¡Oye! ¡Fuera de"
	line "nuestro camino!"
	done

GruntM6BeatenText:
	text "¡Arggh! Me rindo."
	done

GruntM6AfterBattleText:
	text "Al EJECUTIVO no le"
	line "va a gustar saber"
	para "que hay más moco-"
	line "sos interfiriendo"
	cont "en su plan…"
	done

StandCityRocketHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19,  1, STAND_CITY_ROCKET_HOUSE, 4

	db 2 ; coord events
	coord_event 12,  4, SCENE_DEFAULT, ImposterScene2FTop
	coord_event 12,  5, SCENE_DEFAULT, ImposterScene2FBottom

	db 2 ; bg events
	bg_event 10,  1, BGEVENT_READ, StandCityRocketHouse2FTV
	bg_event  6,  0, BGEVENT_READ, StandCityRocketHouse2FPoster

	db 4 ; object events
	object_event 14,  1, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 5, TrainerGruntF4, EVENT_ROCKETS_IN_STAND_CITY
	object_event 16,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 5, TrainerGruntM6, EVENT_ROCKETS_IN_STAND_CITY
	object_event 17,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 5, TrainerGruntM7, EVENT_ROCKETS_IN_STAND_CITY
	object_event  5,  4, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 5, ObjectEvent, EVENT_ROCKETS_IN_STAND_CITY
