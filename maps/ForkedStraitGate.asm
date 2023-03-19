	object_const_def ; object_event constants
	const FSG_COP
	const FSG_SCIENTIST1
	const FSG_SCIENTIST2
	const FSG_SCIENTIST3

ForkedStraitGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

NeedToWalkOverOneTile:
	step LEFT
	step_end

CredCheckLeft:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2 ; blue no longer in the lab at silent town
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end
	

CredCheckRight:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement PLAYER, NeedToWalkOverOneTile
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet2
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet2
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end

OneStepUpNoEntryYet:
	step UP
	step_end
	
NoEntryYetText:
	text "Tenemos un equipo"
	line "de investigadores"
	para "en las ISLAS DEL"
	line "SUR realizando un"
	para "estudio controlado"
	line "sobre los #MON."

	para "No podemos dejar"
	line "entrar a nadie, ni"
	para "siquiera a quienes"
	line "suelen estar"
	cont "cualificados."

	para "Vuelve más tarde"
	line "si tienes las"
	para "credenciales"
	line "adecuadas para tu"
	cont "autorización."
	done

EventCopHALT:
	text "¡ALTO!"
	done

EventCopText:
	text "¡Esta es una zona"
	line "restringida!"

	para "No se permiten"
	line "entrenadores"
	cont "#MON a partir"
	cont "de…"

	para "Un momento."

	para "<……>"
	line "<……>"

	para "Eres…"

	para "¿<PLAYER>, el"
	line "nuevo CAMPEÓN de"
	cont "la LIGA de NIHON?"

	para "¡En efecto!"
	line "¡Mis disculpas!"

	para "No se permite el"
	line "paso a las ISLAS"
	para "DEL SUR a gente de"
	line "a pie, pero puedo"
	para "permitir que viaje"
	line "hasta allí alguien"
	para "con una autoridad"
	line "como la tuya."

	para "Esas ISLAS son"
	line "paraísos naturales"
	para "de los #MON,"
	line "libres de la"
	cont "intervención"
	cont "humana."

	para "Es por ese motivo"
	line "que tienen un gran"
	para "valor para la"
	line "investigación"
	cont "científica."

	para "Supongo que AZUL"
	line "te ha informado"
	cont "sobre ello."

	para "Fue hacia allí"
	line "para realizar una"
	para "investigación en"
	line "la ISLA ARCOÍRIS,"
	cont "al oeste."

	para "¡Puedes continuar!"
	done

FSGCopScript:
	jumptextfaceplayer FSGCopNormalText
	
FSGCopNormalText:
	text "¡<PLAYER>!"
	line "¡Puedes pasar!"
	done


FSGScientist1Script:
	jumptextfaceplayer FSGScientist1Text
	
FSGScientist1Text:
	text "¡La ISLA TROPICAL,"
	line "al este, está"
	para "llena de especies"
	line "raras de #MON!"

	para "Estoy investigando"
	line "una potencial"
	para "NUEVA ESPECIE en"
	line "la isla."
	done

FSGScientist2Script:
	jumptextfaceplayer FSGScientist2Text
	
FSGScientist2Text:
	text "Soy una de las"
	line "pocas personas que"
	para "ha tenido la"
	line "suerte de obtener"
	para "una autorización"
	line "para estudiar las"
	cont "ISLAS DEL SUR."

	para "¡Incluso están"
	line "imprimiendo un"
	para "conjunto de tarje-"
	line "tas promocionales"
	para "con las increíbles"
	line "fotos que tomamos"
	para "a los #MON"
	line "durante nuestro"
	cont "viaje de"
	cont "investigación!"
	done


FSGScientist3Script:
	jumptextfaceplayer FSGScientist3Text
	
FSGScientist3Text:
	text "Existen antiguos"
	line "manuscritos que"
	para "describen la ISLA"
	line "ARCOÍRIS como un"
	para "lugar milagroso"
	line "que siempre está"
	para "envuelto en una"
	line "luz iridiscente."

	para "Me pregunto si es"
	line "solo una leyenda o"
	para "si realmente la"
	line "isla tiene algún"
	cont "poder especial…"
	done

TropicalSign:
	jumptext TropicalSignText
	
RainbowSign:
	jumptext RainbowSignText
	
TropicalSignText:
	text "HACIA EL ESTE"
	line "ISLA TROPICAL"
	done

RainbowSignText:
	text "HACIA EL OESTE"
	line "ISLA ARCOÍRIS"
	done


ForkedStraitGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 18,  0,  FORKED_STRAIT_NORTH, 1
	warp_event 19,  0,  FORKED_STRAIT_NORTH, 2
	warp_event 37, 13,  FORKED_STRAIT_EAST, 1
	warp_event 36, 13,  FORKED_STRAIT_EAST, 1
	warp_event  0, 13, FORKED_STRAIT_WEST, 1
	warp_event  1, 13, FORKED_STRAIT_WEST, 1

	db 2 ; coord events
	coord_event 18,  4, SCENE_DEFAULT, CredCheckLeft
	coord_event 19,  4, SCENE_DEFAULT, CredCheckRight

	db 2 ; bg events
	bg_event 34,  6, BGEVENT_READ, TropicalSign
	bg_event  2,  6, BGEVENT_READ, RainbowSign

	db 4 ; object events
	object_event 16,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGCopScript, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist1Script, -1
	object_event  8,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist2Script, -1
	object_event 28,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist3Script, -1
	