	object_const_def ; object_event constants
	const SILENTTOWN_TEACHER
	const SILENTTOWN_FISHER
	const SILENTTOWN_SILVER
	const SILENTTOWN_BLUE

SilentTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndFixSaves
	callback MAPCALLBACK_TILES, .ClearRocks
	

.ClearRocks:
	checkevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	iftrue .SilentRocksDone
	changeblock  19, 7, $6B ; rock
	return
	
.SilentRocksDone
	return

.DummyScene0:
	end


.DummyScene1:
	end
	
.FlyPointAndFixSaves:
	setflag ENGINE_FLYPOINT_SILENT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .DontFixSaves
	setevent EVENT_RIVAL_OAK_LAB_FRONT_ROOM_2
	setevent EVENT_OAK_LAB_DEX_TABLE
	setevent EVENT_OAK_OAK_LAB_FRONT_ROOM
	setevent EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	return
	
.DontFixSaves
	return
	
SilentTownPokecenterSign:
	jumpstd PokecenterSignScript
	
SilentTown_RivalGreets:
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement SILENTTOWN_SILVER, Movement_SilverComesFromTheShadows_NBT
	applymovement PLAYER, Movement_PlayerTurnsHead
	opentext
	writetext SilentTownRivalText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SILENTTOWN_SILVER, 15
	opentext
	writetext SilentTownRivalText2
	promptbutton
	special NameMomS
	setevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	showemote EMOTE_SHOCK, SILENTTOWN_SILVER, 15
	writetext SilentTownRivalText3
	waitbutton
	closetext
	applymovement SILENTTOWN_SILVER, Movement_SilverPushesYouAway_NBT
	disappear SILENTTOWN_SILVER
	setscene SCENE_TEACHER_STOPS
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	setevent EVENT_RIVAL_SILENT_TOWN
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	setevent EVENT_DAISY_OAK_LAB_FRONT_ROOM
	setevent EVENT_PAGOTA_GYM_FALKNER
	setevent EVENT_OAK_OAK_LAB_FRONT_ROOM
	setevent EVENT_RIVAL_OAK_LAB_FRONT_ROOM_2
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	setmapscene RADIO_TOWER_6F, SCENE_RADIOTOWER6F_NOTHING; this makes it so the giovanni scene plays, was missed for a while
	end

SilentTown_TeacherStopsYouScene2:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	jump SilentTown_TeacherStopsYouScene3
	end


SilentTown_TeacherStopsYouScene1:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Movement_OneDown
	turnobject PLAYER, RIGHT
	jump SilentTown_TeacherStopsYouScene3
	end
	
SilentTown_TeacherStopsYouScene3:
	moveobject SILENTTOWN_BLUE, 6, 9
	appear SILENTTOWN_BLUE
	applymovement SILENTTOWN_BLUE, Movement_TeacherRunsToYou1_NBT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow SILENTTOWN_BLUE, PLAYER
	applymovement SILENTTOWN_BLUE, Movement_BlueTakesToLab
	stopfollow
	applymovement SILENTTOWN_BLUE, Movement_BlueIntoLab
	playsound SFX_ENTER_DOOR
	disappear SILENTTOWN_BLUE
	setevent EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	clearevent EVENT_RIVAL_OAK_LAB_FRONT_ROOM_2
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_HEAD_TO_THE_BACK
	setmapscene OAK_LAB_BACK_ROOM, SCENE_DEFAULT
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	clearevent EVENT_OAK_OAK_LAB_FRONT_ROOM
	applymovement PLAYER, Movement_PlayerIntoLab
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	warpfacing UP, OAK_LAB_FRONT_ROOM, 4, 15
	end


SilentTownRivalScript:
	faceplayer
	opentext
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end
	
SilentTownBlueScript:
	opentext
	writetext Text_Study101
	waitbutton
	closetext
	end

SilentTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .MonIsAdorable
	writetext Text_BagIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

SilentTownFisherScript:
	jumptextfaceplayer Text_Oak2DiscoveredNewMon

SilentTownSilverScript:
	opentext
	writetext SilentTownRivalText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SILENTTOWN_SILVER, 15
	opentext
	writetext SilentTownRivalText2
	waitbutton
	closetext
	applymovement SILENTTOWN_SILVER, Movement_SilverPushesYouAway_NBT
	end

SilentTownSign:
	jumptext SilentTownSignText

SilentTownPlayersHouseSign:
	opentext
	checkevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	iffalse .NameMomAgain
	writetext SilentTownPlayersHouseSignText
	waitbutton
	closetext
	end
	
.NameMomAgain
	writetext NameMomAgainText
	yesorno
	iffalse .DontNameMomAgain
	special NameMomS
	closetext 
	setevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	opentext
	writetext MomHasBeenRenamed
	waitbutton
	closetext
	end
	
.DontNameMomAgain
	writetext NameMomAgainText2
	waitbutton
	closetext
	end

SilentTownOakLabSign:
	jumptext SilentTownOakLabSignText

SilentTownRivalsHouseSign:
	jumptext SilentTownRivalsHouseSignText
	
Movement_PlayerIntoLab:
	step RIGHT
	slow_step UP
	step_end
	
Movement_BlueIntoLab:
	step UP
	step_end
	
Movement_BlueTakesToLab:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
Movement_OneDown:
	step DOWN
	step_end
	
Movement_MoveFromDoor:
	step DOWN
	step_end

Movement_TeacherRunsToYou1_NBT:
	step LEFT
	step LEFT
	step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

Movement_TeacherRunsToYou2_NBT:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

Movement_SilverPushesYouAway_NBT:
	turn_head DOWN
	slow_step DOWN
	step DOWN
	step DOWN
	big_step DOWN
	big_step DOWN
	step_end

Movement_SilverShovesYouOut_NBT:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

Movement_SilverComesFromTheShadows_NBT:
	big_step UP
	big_step UP
	step UP
	step UP
	slow_step UP
	turn_head LEFT
	step_end
	
Movement_PlayerTurnsHead:
	turn_head RIGHT
	step_end
	
MomHasBeenRenamed:
	text "¡Ahora tu madre se"
	line "llama <MOM>!"
	done
	
NameMomAgainText:
	text "¡Hola!"

	para "Este mensaje sólo"
	line "aparece en"
	para "archivos de"
	line "guardado antiguos"
	para "en los que MAMÁ"
	line "tiene un nombre"
	para "incorrecto en el"
	line "TELÉFONO."

	para "Comprueba si el"
	line "nombre de MAMÁ"
	para "aparece correcta-"
	line "mente en el"
	cont "TELÉFONO."

	para "Suele ser un error"
	line "común que tenga el"
	para "nombre del jugador"
	line "en lugar de MAMÁ."

	para "Ahora, puedes"
	line "renombrarla para"
	para "arreglar el error"
	line "o si tan sólo"
	para "quieres ponerle"
	line "otro nombre."

	para "Esto sólo puede"
	line "hacerse una vez."

	para "¿Quieres renombrar"
	line "a tu MAMÁ?"
	done
	
NameMomAgainText2:
	text "Habla de nuevo con"
	line "este cartel para"
	cont "nombrar a tu MAMÁ."
	done
	
Text_Study101:
	text "Y si pasamos"
	line "unos días más"
	para "observando a los"
	line "#MON que viven"
	cont "en la RUTA 101…"
	
	para "…"
	para "Parece estar muy"
	line "ocupado…"
	done

Text_GearIsImpressive:
	text "¡Uau! ¡Tu #GEAR"
	line "es impresionante!"

	para "¿Te lo ha dado tu"
	line "madre?"
	done

Text_WaitPlayer:
	text "¡Eh! ¡Espera!"
	line "¡Alto ahí!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "¿Qué crees que"
	line "estás haciendo?"
	
	para "¡En la hierba"
	line "alta viven"
	cont "#MON salvajes!"
	
	para "Necesitas tu"
	line "propio #MON"
	cont "como protección."
	
	para "¡Ah! ¿Acaso"
	line "eres…?"
	
	para "¡Ven conmigo un"
	line "segundo!"
	done

Text_YourMonIsAdorable:
	text "¡Oh, tu #MON es"
	line "adorable! ¡Ojalá"
	cont "tuviera yo uno!"
	done

Text_TellMomIfLeaving:
	text "¡Hola, <PLAYER>!"
	line "¿Te vas otra vez?"

	para "Deberías avisar"
	line "a tu madre de que"
	cont "te vas."
	done

Text_CallMomOnGear:
	text "Llama a tu madre"
	line "con el #GEAR"
	cont "y cuéntale cómo"
	cont "te va."
	done

Text_Oak2DiscoveredNewMon:
	text "¿Hay alguien en el"
	line "mundo a quien no"
	cont "le gusten los"
	cont "#MON?"
	done

SilentTownRivalText1:
	text "<RIVAL>: ¡Eh,"
	line "<PLAYER>!"

	para "¡Tengo algo de lo"
	line "que presumir!"
	
	para "¡Recibí un correo"
	line "del PROF. OAK!"

	para "¡Sí, el mismísimo!"
	done

SilentTownRivalText2:
	text "¡¿Tú también"
	line "recibiste uno?!"
	cont "¡Venga ya!"
	
	para "Mmm… bueno…"
	line "pues… eh…"
	
	para "¡¿Y tú cómo decías"
	line "que llamabas a tu"
	cont "madre?!"
	done
	
SilentTownRivalText3:
	text "¡Jajaja!"

	para "¡No me hagas reír!"

	para "¡Qué gracia,"
	line "pareces un niño"
	cont "pequeño!"
	
	para "¡Pues bueno, a ver"
	line "si a tu “<MOM>”"
	para "le parece bien"
	line "que vayas al"
	cont "LABORATORIO de"
	cont "OAK!"
	
	para "¡En fin, me voy!"

	para "¡Te espero en el"
	line "LABORATORIO!"
	done

SilentTownSignText:
	text "PUEBLO SILENTE"
	
	para "Un remanso de paz"
	done

SilentTownPlayersHouseSignText:
	text "CASA DE <PLAYER>"
	done

SilentTownOakLabSignText:
	text "LABORATORIO DE"
	line "INVESTIGACIÓN"
	cont "#MON DE OAK"
	done

SilentTownRivalsHouseSignText:
	text "CASA DE <RIVAL>"
	done

Text_BagIsImpressive:
	text "¡Qué MOCHILA tan"
	line "mona! ¿Dónde la"
	cont "has comprado?"
	done

SilentTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 14, 11, OAK_LAB_FRONT_ROOM, 1
	warp_event  5,  4, PLAYERS_HOUSE_1F, 1
	warp_event 13,  4, SILENT_POKECENTER_1F, 1
	warp_event  3, 12, RIVALS_HOUSE, 1
	warp_event 15, 11, OAK_LAB_FRONT_ROOM, 2
	warp_event  9,  9, AMAMI_POKECENTER_1F, 1


	db 3 ; coord events
	coord_event  0,  8, SCENE_TEACHER_STOPS, SilentTown_TeacherStopsYouScene1
	coord_event  0,  9, SCENE_TEACHER_STOPS, SilentTown_TeacherStopsYouScene2
	coord_event  5,  5, SCENE_DEFAULT, SilentTown_RivalGreets

	db 5 ; bg events
	bg_event 16,  5, BGEVENT_READ, SilentTownSign
	bg_event  8,  4, BGEVENT_READ, SilentTownPlayersHouseSign
	bg_event 10, 11, BGEVENT_READ, SilentTownOakLabSign
	bg_event  6, 12, BGEVENT_READ, SilentTownRivalsHouseSign
	bg_event 14,  4, BGEVENT_READ, SilentTownPokecenterSign

	db 4 ; object events
	object_event  9,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SilentTownTeacherScript, -1
	object_event 12, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1,  0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentTownFisherScript, -1
	object_event  6, 10, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilentTownRivalScript, EVENT_RIVAL_SILENT_TOWN
	object_event  3,  9, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilentTownBlueScript, EVENT_BLUE_SILENT_TOWN