	object_const_def ; object_event constants
	const CROWNPATH_SILVER

CrownPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalBattleFinal:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject CROWNPATH_SILVER, DOWN
	pause 15
	applymovement CROWNPATH_SILVER, UndergroundSilverWalksToPlayer
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundSilverBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundSilverAfterText
	waitbutton
	closetext
	applymovement PLAYER, UndergroundPlayer1StepToTheSide
	applymovement CROWNPATH_SILVER, UndergroundSilverLeavesMovement
	disappear CROWNPATH_SILVER
	setscene SCENE_UNDERGROUND_NOTHING
	setevent EVENT_EMERGENCY_SWITCH
	setmapscene CROWN_CITY, SCENE_CROWNCITY_MEET_RIVAL
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end

CrownPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_CROWN_PATH_HIDDEN_FULL_RESTORE

CrownPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_CROWN_PATH_HIDDEN_X_SPECIAL
	
UndergroundSilverWalksToPlayer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
UndergroundPlayer1StepToTheSide:
	step RIGHT
	turn_head LEFT
	step_end
	
UndergroundSilverLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
UndergroundSilverBeforeText:
	text "¡Hola, <PLAYER>!"

	para "…"

	para "Vas a escalar el"
	line "MT. FUJI, ¿no?"

	para "Ha sido un largo"
	line "viaje."

	para "Hemos pasado por"
	line "muchas cosas."

	para "¿Están tus #MON"
	line "listos?"

	para "¿Lo están los"
	line "míos?"

	para "¡Vamos a compro-"
	line "barlo, aquí y"
	cont "ahora!"

	para "¡Un combate entre"
	line "amigos!"
	done
	
UndergroundSilverWinText:
	text "…"
	done
	
UndergroundSilverLossText:
	text "…"
	done
	
UndergroundSilverAfterText:
	text "¿Sabes de qué me"
	line "he dado cuenta?"

	para "Me emocionaba"
	line "desafiar a la"
	cont "LIGA."

	para "Quería tener los"
	line "#MON más"
	cont "fuertes."

	para "Quería ser el"
	line "entrenador más"
	cont "poderoso."

	para "Solo quería"
	line "derrotar a otros"
	para "entrenadores para"
	line "demostrar lo bueno"
	cont "que soy."

	para "Pero lidiar con el"
	line "TEAM ROCKET me"
	cont "hizo pensar."

	para "Ellos solo ven a"
	line "los #MON como"
	cont "herramientas que"
	cont "usar."

	para "Y aunque sus"
	line "ambiciones eran"
	para "malvadas y las"
	line "mías solo egoís-"
	para "tas, me he dado"
	line "cuenta de que veía"
	para "a los #MON de"
	line "una manera pareci-"
	cont "da a la de ellos."

	para "He visto a mi"
	line "equipo solo como"
	para "una manera de"
	line "tener fuerza."

	para "Y entrenar #MON"
	line "no debería ser"
	cont "algo así."

	para "Tengo que tratar-"
	line "los con cariño."

	para "Y creo que no"
	line "estoy preparado"
	para "para desafiar a la"
	line "LIGA hasta que lo"
	para "haya hecho y me"
	line "asegure de que"
	para "están listos para"
	line "el desafío."

	para "Así que primero"
	line "voy a entrenar"
	cont "algo más."

	para "¡Me aseguraré de"
	line "que mis #MON y"
	para "yo estemos listos"
	line "para la LIGA, com-"
	cont "batiendo juntos!"

	para "Ya nos veremos."
	done

CrownPath_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10, 33, CROWN_PATH_GATE, 3
	warp_event 11, 33, CROWN_PATH_GATE, 4
	warp_event 11,  1, CROWN_CITY, 1
	warp_event 12,  1, CROWN_CITY, 2

	db 1 ; coord events
	coord_event 12,  7, SCENE_DEFAULT, RivalBattleFinal

	db 2 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, CrownPathHiddenFullRestore
	bg_event 12, 14, BGEVENT_ITEM, CrownPathHiddenXSpecial

	db 1 ; object events
	object_event 11,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMERGENCY_SWITCH
