	object_const_def ; object_event constants
	const ALLOYSAILORHOOHHOUSE_ELDER
;	const ALLOYSAILORHOOHHOUSE_RHYDON

AlloySailorHoOhHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloySailorHoOhHouseElderScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingHoOh
	faceplayer
	opentext
	writetext AlloySailorHoOhHouseElderIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloySailorHoOhHouseElderEvilText
	waitbutton
	closetext
	end
	
.NoEvilLeft
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .NotBlessed
	writetext AlloySailorHoOhHouseElderText2
	yesorno
	iffalse AlloyElderNoStory
	writetext AlloyElderStoryText
	waitbutton
	closetext
	pause 20
	applymovement ALLOYSAILORHOOHHOUSE_ELDER, DummyMovementElder
	playsound SFX_MEGA_PUNCH
	waitsfx
	pause 20
	opentext
	writetext HoOhCryText
	cry HO_OH
	pause 15
	closetext
	pause 10
	showemote EMOTE_SHOCK, ALLOYSAILORHOOHHOUSE_ELDER, 20
	opentext
	writetext AlloyElderStoryText2
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .ElderWalkAroundPlayer
	applymovement ALLOYSAILORHOOHHOUSE_ELDER, ElderWalksOutMovement
	jump ElderWalksOutFinalScene
	end

.ElderWalkAroundPlayer
	applymovement ALLOYSAILORHOOHHOUSE_ELDER, ElderWalksAroundPlayerMovement
	jump ElderWalksOutFinalScene
	end

	
.NotBlessed
	writetext AlloySailorHoOhHouseElderNotBlessedText
	waitbutton
	closetext
	end
	
.AfterEverythingHoOh
	faceplayer
	opentext
	writetext SometimesYouLiveLongEnough
	waitbutton
	closetext
	end
	

ElderWalksOutFinalScene:
	playsound SFX_EXIT_BUILDING
	disappear ALLOYSAILORHOOHHOUSE_ELDER
	setevent EVENT_ALLOY_CAPTAIN_AT_HOME
	setevent EVENT_HO_OH_EVENT_STARTED
	clearevent EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene FIVE_FLOOR_TOWER_5F, SCENE_HO_OH_EVENT
	end
	
AlloyElderNoStory:
	writetext AlloySailorHoOhHouseElderAnotherTime
	waitbutton
	closetext
	end
	
DummyMovementElder:
	step_end
	
ElderWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ElderWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
HoOhCryText:
	text "HO-OH: ¡Hooh!"
	done

SometimesYouLiveLongEnough:
	text "A veces vives lo"
	line "suficiente para"
	para "ser testigo de"
	line "cosas que nunca"
	cont "esperarías ver."

	para "Tuve un encuentro"
	line "con el ave de la"
	cont "leyenda."

	para "Un suceso verdade-"
	line "ramente mágico."

	para "…"
	
	para "Deberías ir por"
	line "NIHON en busca de"
	cont "las bestias"
	cont "legendarias."

	para "Si HO-OH ha"
	line "vuelto, todo es"
	cont "posible."
	done

AlloyElderStoryText:
	text "Escucha"
	line "atentamente…"
	para "Antaño, NIHON era"
	line "protegido por una"
	para "noble ave, cuyas"
	line "alas ardían como"
	cont "el fuego."

	para "Esta ave hizo su"
	line "nido en la cima de"
	para "la TORRE GODAI en"
	line "CIUDAD PAGOTA."

	para "Reposó allí duran-"
	line "te muchos años."

	para "Hay quien dice"
	line "que fue durante"
	cont "siglos."

	para "Sin embargo, un"
	line "día aciago, algo"
	para "inquietó al ave y"
	line "se marchó de la"
	cont "torre."

	para "Mientras lo hacía,"
	line "cayeron cenizas de"
	cont "sus alas."

	para "Y de esas cenizas"
	line "nacieron tres"
	para "bestias, consagra-"
	line "das a velar por"
	para "NIHON mientras el"
	line "ave no volviese."

	para "Las bestias se"
	line "dispersaron, y"
	cont "nadie ha vuelto a"
	cont "verlas."

	para "Pero se sabe que"
	line "han permanecido en"
	para "NIHON, protegién-"
	line "dolo desde las"
	cont "sombras."

	para "Se dice que, un"
	line "día, el ave"
	cont "regresará."
	done

AlloyElderStoryText2:
	text "¡¿Será posible?!"

	para "¿Ha llegado el"
	line "fatídico día?"
	done

AlloySailorHoOhHouseElderAnotherTime:
	text "Será en otra"
	line "ocasión."
	done

AlloySailorHoOhHouseElderText2:
	text "¿Quieres escuchar"
	line "la historia del"
	cont "ave?"
	done

AlloySailorHoOhHouseElderIntroText:
	text "Espero saber la"
	line "conclusión de esta"
	cont "leyenda algún día."
	done

AlloySailorHoOhHouseElderEvilText:
	text "Siento una"
	line "presencia maligna"
	cont "acechando a NIHON."

	para "El ave no regresa-"
	line "rá hasta que haya"
	cont "desaparecido."
	done

AlloySailorHoOhHouseElderNotBlessedText:
	text "El momento podría"
	line "llegar cualquier"
	para "día, pero no creo"
	line "que seas el tipo"
	para "de entrenador ante"
	line "el que se presen-"
	cont "taría el ave."
	done

AlloySailorHoOhHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloySailorHoOhHouseElderScript, EVENT_ALLOY_CAPTAIN_AT_HOME
