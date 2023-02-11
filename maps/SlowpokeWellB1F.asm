	object_const_def ; object_event constants
	const SLOWPOKE_WELL_B1F_SILVER


SlowpokeWellB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke1Rival ; SCENE_DEFAULT
	scene_script .SceneSlowpoke1Nothing ;

	db 0 ; callbacks

.SceneSlowpoke1Rival:
	priorityjump .SceneSlowpoke1RivalContinued
	end
	
.SceneSlowpoke1RivalContinued
	showemote EMOTE_SHOCK, SLOWPOKE_WELL_B1F_SILVER, 15
	special FadeOutMusic
	pause 15
	turnobject SLOWPOKE_WELL_B1F_SILVER, DOWN
	pause 15
	applymovement PLAYER, WellPlayerWalksToSilver
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerSilver_BeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .palssio
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .chikorita
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.palssio
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.chikorita
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerSilver_AfterText1
	waitbutton
	closetext
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToRoom2
	playsound SFX_EXIT_BUILDING
	disappear SLOWPOKE_WELL_B1F_SILVER
	setscene SCENE_SLOWPOKE1_NOTHING
	setevent EVENT_RIVAL_IN_SLOWPOKE_WELL
	setevent EVENT_KINGS_ROCK_GUY_APPEARS
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end
	


.SceneSlowpoke1Nothing
	end
	
WellPlayerWalksToSilver:
	step UP
	step UP
	step_end
	
WellSilverWalksToPlayer:
	step RIGHT
	turn_head DOWN
	step_end
	
WellSilverWalksToRoom2:
	step UP
	step UP
	step UP
	step_end

SlowpokeWellB1FSilverScript:
	end
;<……>
BurnedTowerSilver_BeforeText:
	text "¡<PLAYER>!"

	para "El PROF. OAK y"
	line "AZUL nos esperan"
	cont "bajo el pozo."

	para "¡Pero si vine es"
	line "porque sabía que"
	cont "tú lo harías!"

	para "Mi equipo es mucho"
	line "más fuerte que la"
	para "última vez que nos"
	line "vimos."

	para "¡Mira, te lo"
	line "demostraré!"
	done

BurnedTowerSilver_WinText:
	text "Vaya."

	para "He entrenado a mi"
	line "equipo para que"
	para "sea el mejor, y"
	line "aun así he"
	cont "perdido…"
	done

BurnedTowerSilver_AfterText1:
	text "Qué más da."

	para "¡Solo tengo que"
	line "hacerlos aún más"
	cont "fuertes!"

	para "¡Bueno, mejor"
	line "bajemos ya y"
	cont "reunámonos con los"
	cont "demás!"
	done

BurnedTowerSilver_LossText:
	text "¡Toma!"

	para "¡Soy el mejor!"
	done

BurnedTowerSilver_AfterText2:
	text "¡Bah!"

	para "¿Qué haces cayén-"
	line "dote por un"
	para "agujero? ¡Menudo"
	line "genio estás hecho!"

	para "¡Te está bien"
	line "empleado!"
	done
	
Text_RivalGreets:
	text "¡Hola!"
	done


SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 13, BIRDON_TOWN, 6
	warp_event 11,  7, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 10, 10, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSilverScript, EVENT_RIVAL_IN_SLOWPOKE_WELL

