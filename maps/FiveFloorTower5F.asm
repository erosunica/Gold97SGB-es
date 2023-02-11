	object_const_def ; object_event constants
	const TINTOWER5F_SAGE1
	const TINTOWER5F_KURT
	const TINTOWER5F_CAPTAIN

FiveFloorTower5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
	checkevent EVENT_HO_OH_EVENT_STARTED
	iffalse .DoneStairs
	changeblock   0,  5, $3A ; ladder
.DoneStairs:
	return

FiveFloorTower5FSageScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterHoOh
	checkevent EVENT_HO_OH_EVENT_STARTED
	iftrue .DuringHoOh
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSageYup
	waitbutton
	closetext
	end
	
.AfterHoOh
	faceplayer
	opentext
	writetext Text_5FSageAfterHoOh
	waitbutton
	closetext
	end
	
.DuringHoOh
	faceplayer
	opentext
	writetext Text_5FSageDuringHoOh
	waitbutton
	closetext
	end
	
HoOhEventSceneUp:
	applymovement PLAYER, PlayerWalksToHoOhGroup1
	jump HoOhEventMainScene
	end
	
HoOhEventSceneLeft:
	applymovement PLAYER, PlayerWalksToHoOhGroup2
	jump HoOhEventMainScene
	end
	
HoOhEventMainScene:
	showemote EMOTE_SHOCK, TINTOWER5F_KURT, 15
	opentext
	writetext KurtKnewIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TINTOWER5F_CAPTAIN, 15
	opentext
	writetext CaptainCantBelieve
	waitbutton
	closetext
	applymovement TINTOWER5F_SAGE1, SageOneStepDown
	opentext
	writetext SageTellsYouToSeeBird
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
SageOneStepDown:
	step DOWN
	step_end
	
PlayerWalksToHoOhGroup2:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksToHoOhGroup1:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
KurtKnewIt:
	text "CÉSAR: Sabía que"
	line "tenía razón cuando"
	cont "sentí algo en ti."
	done
	
CaptainCantBelieve:
	text "¡No puedo creerlo!"
	
	para "¡El regreso del"
	line "ave!"
	
	para "¡Se ha cumplido!"
	done
	
SageTellsYouToSeeBird:
	text "<PLAYER>."
	
	para "HO-OH reposa"
	line "por encima de"
	cont "nosotros."
	
	para "El ave ha regre-"
	line "sado, tal y como"
	para "predijo la"
	line "leyenda."
	
	para "Siento que quiere"
	line "conocerte."

	para "Ha dictado que tus"
	line "acciones y"
	para "decisiones son"
	line "dignas de que te"
	cont "acerques."

	para "Sube al tejado."
	done
	
Text_5FSageDuringHoOh:
	text "El ave aguarda"
	line "por ti."
	done

Text_5FSageAfterHoOh:
	text "Un encuentro con"
	line "el ave es un"
	cont "suceso legendario."
	done
	
Text_5FSageNope:
	text "Has alcanzado la"
	line "cima de la torre."
	
	para "Pero no has"
	line "escuchado todos"
	cont "sus mensajes."
	
	para "Asegúrate de leer"
	line "las inscripciones"
	cont "de cada piso."
	
	para "Cada una enseña"
	line "una valiosa"
	cont "lección."
	done
	
Text_5FSageYup:
	text "Bienvenido a la"
	line "cima de la TORRE"
	cont "GODAI."
	
	para "Este es un lugar"
	line "sagrado que solo"
	para "puede ser visitado"
	line "por aquellos que"
	para "desean mostrar el"
	line "debido respeto."
	
	para "Asumo que CÉSAR te"
	line "sugirió ascender"
	cont "por estos pisos."
	
	para "Espero que puedas"
	line "llegar lejos tras"
	para "haber comprendido"
	line "cómo tratar"
	para "debidamente a"
	line "los #MON."
	
	para "Regresa con CÉSAR."
	
	para "Tienes mi"
	line "bendición."
	done

FiveFloorTower5FSign:
	setevent EVENT_READ_5F5F_SIGN
	jumptext FiveFloorTower5FSignText

	
FiveFloorTower5FSignText:
	text "Es una estatua de"
	line "ABRA."
	
	para "Los ABRA se asus-"
	line "tan con facilidad"
	para "y huyen cuando se"
	line "encuentran en"
	cont "estado salvaje."
	
	para "Has de honrar y"
	line "respetar a todos"
	para "los #MON en"
	line "sus hábitats"
	cont "naturales."
	done
	
FiveFloorTower5FIncense:
	jumptext FiveFloorTower5FIncenseText

FiveFloorTower5FIncenseText:
	text "Es un altar"
	line "budista."
	
	para "Mmm… huele a"
	line "incienso."
	done

FiveFloorTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, FIVE_FLOOR_TOWER_4F, 2
	warp_event  0,  5, FIVE_FLOOR_TOWER_ROOF, 1

	db 2 ; coord events
	coord_event  5,  4, SCENE_HO_OH_EVENT, HoOhEventSceneUp
	coord_event  4,  5, SCENE_HO_OH_EVENT, HoOhEventSceneLeft

	db 2 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower5FSign
	bg_event 3, 0, BGEVENT_READ, FiveFloorTower5FIncense


	db 3 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, -1
	object_event  1,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	object_event  3,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
