	object_const_def ; object_event constants
	const SUNPOINTCITY_STANDING_YOUNGSTER
	const SUNPOINTCITY_POKEFAN_M
	const SUNPOINTCITY_LASS
	const SUNPOINTCITY_ROCK1
	const SUNPOINTCITY_ROCK3
	const SUNPOINTCITY_POKEFAN_F


SunpointCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SUNPOINTCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_SUNPOINTCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint


.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_SUNPOINT
	setevent EVENT_BOARDWALK_PATH_IS_OPEN
	return


SunpointCityLass:
	jumptextfaceplayer SunpointCityLassText

SunpointCityFishingGuru:
	jumptextfaceplayer SunpointCityFishingGuruText

SunpointCityTwin:
	jumptextfaceplayer SunpointCityTwinText

SunpointCityRocker:
	jumptextfaceplayer SunpointCityRockerText

SunpointCitySign:
	jumptext SunpointCitySignText

SunpointCityMartSign:
	jumpstd MartSignScript

SunpointTrainerTipsSign:
	jumptext SunpointTrainerTipsSignText

SunpointMagmaShaftWarningSign:
	jumptext SunpointMagmaShaftWarningSignText

SunpointPokecenterSign:
	jumpstd PokecenterSignScript

SunpointCityRock:
	jumpstd SmashRockScript

SunpointCityHiddenRevive:
	hiddenitem REVIVE, EVENT_SUNPOINT_CITY_HIDDEN_REVIVE

SunpointCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_SUNPOINT_CITY_HIDDEN_MAX_ETHER



SunpointCityLassText:
	text "El clima en esta"
	line "parte de NIHON es"
	para "mucho más cálido"
	line "que en el resto."
	done

ChucksWifeChubbyText:
	text "Mi marido perdió"
	line "contra ti. Debería"
	cont "entrenarse más."

	para "Menos mal, porque"
	line "ya estaba"
	cont "engordando."
	done

SunpointCityFishingGuruText:
	text "¿Has ido alguna"
	line "vez al BOSQUE"
	cont "AZUL?"
	para "Hace frío y está"
	line "cubierto de nieve."

	para "¡No podría vivir"
	line "allí!"

	para "No estoy hecho"
	line "para el frío."
	done

SunpointCityTwinText:
	text "Se dice que viven"
	line "#MON raros en"
	cont "el EJE MAGMA."

	para "Es difícil entrar"
	line "en la cueva porque"
	para "suelen desplomarse"
	line "las rocas y"
	cont "bloquean la"
	cont "entrada."
	done

SunpointCityRockerText:
	text "Esta ciudad no"
	line "tiene GIMNASIO."

	para "No creo que"
	line "necesite uno, de"
	cont "todos modos."
	done

SunpointCitySignText:
	text "CIUDAD CALORINA"
	
	para "El enclave de"
	line "NIHON para el"
	cont "comercio"
	cont "internacional"
	done

SunpointTrainerTipsSignText:
	text "PISTAS ENTRENADOR"
	
	para "¡Hacen falta"
	line "MEDALLAS para usar"
	para "los movimientos de"
	line "MO fuera de"
	cont "combate!"

	para "Aun así, pueden"
	line "usarse en combate."
	done

SunpointMagmaShaftWarningSignText:
	text "AVISO:"
	
	para "Desplome frecuente"
	line "de rocas peligro-"
	cont "sas desde el EJE"
	cont "MAGMA."

	para "Toma la debida"
	line "precaución si te"
	cont "acercas."
	done

SunpointCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 20, 26, MANIAS_HOUSE, 1
	warp_event 16, 11, MAGMA_SHAFT_1F, 1
	warp_event 31, 16, SUNPOINT_POKECENTER_1F, 1
	warp_event 17, 22, SUNPOINT_MART, 1
	warp_event 33, 23, SUNPOINT_MAGMA_SHAFT_SPEECH_HOUSE, 1
	warp_event 33, 11, ROUTE_118_SUNPOINT_GATE, 1
	warp_event 22, 10, SKATEBOARDER_HOUSE, 1
	warp_event 26,  5, SUNPOINT_DOCKS_GATE, 3
	warp_event 27,  5, SUNPOINT_DOCKS_GATE, 4
	warp_event 28, 30, ROUTE_119_SUNPOINT_GATE, 1
	warp_event 29, 30, ROUTE_119_SUNPOINT_GATE, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 26, 21, BGEVENT_READ, SunpointCitySign
	bg_event 32, 16, BGEVENT_READ, SunpointPokecenterSign
	bg_event 18, 22, BGEVENT_READ, SunpointCityMartSign
	bg_event 14, 22, BGEVENT_READ, SunpointTrainerTipsSign
	bg_event 28, 16, BGEVENT_READ, SunpointMagmaShaftWarningSign
	bg_event 34, 24, BGEVENT_ITEM, SunpointCityHiddenRevive
	bg_event 13, 21, BGEVENT_ITEM, SunpointCityHiddenMaxEther

	db 6 ; object events
	object_event 28, 13, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointCityFishingGuru, -1
	object_event 23, 22, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SunpointCityTwin, -1
	object_event 24, 17, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointCityRocker, -1
	object_event 19, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 18, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 22, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SunpointCityLass, -1
