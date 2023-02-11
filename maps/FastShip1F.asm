	object_const_def ; object_event constants
	const FASTSHIP1F_SAILOR1
	const FASTSHIP1F_SAILOR2
	const FASTSHIP1F_SAILOR3
	const FASTSHIP1F_GENTLEMAN

FastShip1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .EnterFastShip ; SCENE_FASTSHIP1F_ENTER_SHIP
	scene_script .DummyScene2 ; SCENE_FASTSHIP1F_ROUGH_WEATHER

	db 0 ; callbacks

.DummyScene0:
	end

.EnterFastShip:
	priorityjump .EnterFastShipScript
	end

.DummyScene2:
	end

.EnterFastShipScript:
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x7520e
	applymovement PLAYER, MovementData_0x75217
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x75211
	pause 30
	playsound SFX_BOAT
	earthquake 30
	blackoutmod FAST_SHIP_CABINS_SW_SSW_NW
	clearevent EVENT_FAST_SHIP_HAS_ARRIVED
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .SkipGrandpa
	setscene SCENE_FASTSHIP1F_ROUGH_WEATHER
	end

.SkipGrandpa:
	setscene SCENE_DEFAULT
	end

FastShip1FSailor1Script:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .Arrived
	checkevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	iftrue .Alloy
	writetext FastShip1FSailor1Text_ToAmami
	waitbutton
	closetext
	end

.Alloy:
	writetext FastShip1FSailor1Text_ToAlloy
	waitbutton
	closetext
	end

.Arrived:
	checkevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	iftrue ._Alloy
	writetext FastShip1FSailor1Text_InAmami
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	setevent EVENT_AMAMI_PORT_SAILOR_AT_GANGWAY
	setmapscene AMAMI_PORT, SCENE_AMAMIPORT_LEAVE_SHIP
	warp AMAMI_PORT, 7, 17
	end

._Alloy:
	writetext FastShip1FSailor1Text_InAlloy
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	setevent EVENT_WESTPORT_PORT_SAILOR_AT_GANGWAY
	setmapscene WESTPORT_PORT, SCENE_WESTPORTPORT_LEAVE_SHIP
	warp WESTPORT_PORT, 7, 23
	end

.LetThePlayerOut:
	checkcode VAR_FACING
	ifequal RIGHT, .YouAreFacingRight
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x7520e
	applymovement PLAYER, MovementData_0x75235
	end

.YouAreFacingRight:
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x75214
	applymovement PLAYER, MovementData_0x75238
	end

FastShip1FSailor2Script:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Amami
	writetext FastShip1FSailor2Text_FirstTime
	waitbutton
	closetext
	end

.Amami:
	writetext FastShip1FSailor2Text
	waitbutton
	closetext
	end

FastShip1FSailor3Script:
	jumptextfaceplayer FastShip1FSailor3Text


RoughWeatherScene:
	playsound SFX_TACKLE
	earthquake 80
	waitsfx
	pause 30
	playsound SFX_TACKLE
	earthquake 80
	waitsfx
	pause 30
	playsound SFX_TACKLE
	earthquake 80
	waitsfx
	pause 50
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext CaptainSpeakingText
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end

MovementData_0x7520e:
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_0x75211:
	slow_step RIGHT
	turn_head DOWN
	step_end

MovementData_0x75214:
	slow_step DOWN
	turn_head UP
	step_end

MovementData_0x75217:
	step DOWN
	step DOWN
	turn_head DOWN
	step_end

MovementData_0x7521b:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x75220:
	step RIGHT
	step_end

MovementData_0x75222:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x7522e:
	big_step RIGHT
	turn_head LEFT
	step_end

MovementData_0x75231:
	step UP
	step_end

MovementData_0x75233:
	step DOWN
	step_end

MovementData_0x75235:
	step UP
	step UP
	step_end

MovementData_0x75238:
	step RIGHT
	step UP
	step_end
	
CaptainSpeakingText:
	text "¡Ejem! Hola a"
	line "todos."

	para "Os habla vuestro"
	line "CAPITÁN."

	para "Nos hemos topado"
	line "con un clima"
	cont "inesperado."

	para "¡Pero no pasa"
	line "nada!"

	para "Esto… ¡Todo va a"
	line "salir bien!"

	para "Llegaremos tal y"
	line "como estaba"
	cont "previsto."

	para "Y… Eso es todo."
	done


FastShip1FSailor1Text_ToAmami:
	text "El FERRY S.S. AQUA"
	line "se dirige a"
	cont "PUEBLO AMAMI."

	para "Daremos un aviso"
	line "cuando lleguemos."
	done

FastShip1FSailor1Text_ToAlloy:
	text "El FERRY S.S. AQUA"
	line "se dirige a"
	cont "CIUDAD PONIENTE."

	para "Daremos un aviso"
	line "cuando lleguemos."
	done

FastShip1FSailor2Text_FirstTime:
	text "Éste es tu"
	line "camarote."

	para "Si están cansados"
	line "tus #MON,"

	para "échate una"
	line "siestecita."

	para "Eso los curará."
	done

FastShip1FSailor2Text:
	text "Es tu camarote."

	para "Puedes curar a tus"
	line "#MON durmiendo"
	cont "una siesta."

	para "El barco llegará"
	line "a su destino"
	cont "mientras duermes."
	done

FastShip1FSailor3Text:
	text "Los pasajeros son"
	line "entrenadores."

	para "Están deseando"
	line "luchar en sus"
	cont "camarotes."
	done

FastShip1FSailor1Text_InAlloy:
	text "El FERRY S.S. AQUA"
	line "ha llegado a"
	cont "CIUDAD PONIENTE."
	done

FastShip1FSailor1Text_InAmami:
	text "El FERRY S.S. AQUA"
	line "ha llegado a"
	cont "PUEBLO AMAMI."
	done

FastShip1F_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 25,  1, FAST_SHIP_1F, -1
	warp_event 27,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 1
	warp_event 23,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 2
	warp_event 19,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 3
	warp_event 15,  8, FAST_SHIP_CABINS_SW_SSW_NW, 1
	warp_event 15, 15, FAST_SHIP_CABINS_SW_SSW_NW, 2
	warp_event 19, 15, FAST_SHIP_CABINS_SW_SSW_NW, 4
	warp_event 23, 15, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 1
	warp_event 27, 15, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 3
	warp_event  3, 13, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 5
	warp_event  6, 12, FAST_SHIP_B1F, 1
	warp_event 30, 14, FAST_SHIP_B1F, 2

	db 5 ; coord events
	coord_event 30,  9, SCENE_FASTSHIP1F_ROUGH_WEATHER, RoughWeatherScene
	coord_event 25, 16, SCENE_FASTSHIP1F_ROUGH_WEATHER, RoughWeatherScene
	coord_event 31, 10, SCENE_FASTSHIP1F_ROUGH_WEATHER, RoughWeatherScene
	coord_event 11, 11, SCENE_FASTSHIP1F_ROUGH_WEATHER, RoughWeatherScene
	coord_event 10, 12, SCENE_FASTSHIP1F_ROUGH_WEATHER, RoughWeatherScene

	db 0 ; bg events

	db 4 ; object events
	object_event 25,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor1Script, -1
	object_event 14,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor2Script, -1
	object_event 22, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor3Script, -1
	object_event 19,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FAST_SHIP_1F_GENTLEMAN
