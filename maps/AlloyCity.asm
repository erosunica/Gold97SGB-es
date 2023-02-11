	object_const_def ; object_event constants
	const ALLOYCITY_SAILOR1
	const ALLOYCITY_STANDING_YOUNGSTER
	const ALLOYCITY_SAILOR2
	const ALLOYCITY_ALLOY_RIVAL
	const ALLOYCITY_GRAMPS

AlloyCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_ALLOY
	return

AlloyCityRivalSceneTop:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88d2
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88db
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88db2
	setscene SCENE_FINISHED
	disappear ALLOYCITY_ALLOY_RIVAL
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCityRivalSceneBottom:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88d6
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88e8
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88db2
	disappear ALLOYCITY_ALLOY_RIVAL
	setscene SCENE_FINISHED
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCitySailor1Script:
	jumptextfaceplayer AlloyCitySailor1Text

AlloyCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext AlloyCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext AlloyCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

AlloyCityGrampsScript:
	jumptextfaceplayer AlloyCityGrampsText

AlloyCitySailor2Script:
	jumptextfaceplayer AlloyCitySailor2Text

AlloyCitySign:
	jumptext AlloyCitySignText

AlloyGymSign:
	jumptext AlloyGymSignText

AlloyDojoSign:
	jumptext AlloyDojoSignText

AlloyCityPokecenterSign:
	jumpstd PokecenterSignScript

AlloyCityMartSign:
	jumpstd MartSignScript

MovementData_0x1a88d2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88d6:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88db:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88db2:
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88e8:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88f4:
	step DOWN
	turn_head UP
	step_end

MovementData_0x1a88f7:
	step UP
	turn_head DOWN
	step_end

AlloyCityGrampsText:
	text "¡Jojojojo!"

	para "¿Has combatido"
	line "contra el tipo"
	cont "acero?"
	para "¡Tienen mayor"
	line "defensa!"

	para "¡Tenlo en cuenta"
	line "si te vas a"
	cont "enfrentar a"
	cont "YASMINA!"
	done

AlloyCityRivalText:
	text "¡<PLAYER>!"

	para "¡Cuánto tiempo!"

	para "Acabas de atraves-"
	line "ar el BOSQUE JADE,"
	cont "¿verdad?"

	para "Es un sitio duro."

	para "¡Pero está lleno"
	line "de #MON!"

	para "Ahora mismo no"
	line "tengo ganas de"
	cont "combatir."

	para "Voy a regresar al"
	line "BOSQUE para seguir"
	cont "buscando #MON."

	para "¡No puedo esperar"
	line "a tener los"
	para "#MON más fuer-"
	line "tes de todos en mi"
	cont "equipo!"

	para "Por cierto, la"
	line "ciudad está muy"
	cont "bien."

	para "¡Hay una LÍDER de"
	line "GIMNASIO que usa"
	cont "el tipo acero!"

	para "¡Nunca había oído"
	line "hablar de ese"
	cont "tipo!"

	para "¡Bueno, me voy!"
	line "¡Nos vemos!"
	done

AlloyCitySailor1Text:
	text "Siempre he soñado"
	line "con ir más al"
	cont "norte, donde"
	cont "nieva."
	done

AlloyCityStandingYoungsterPokegearText:
	text "Eso que tienes es"
	line "un #GEAR,"

	para "¿verdad? ¡Uauu!"
	line "¡Es genial!"
	done

AlloyCityStandingYoungsterPokedexText:
	text "¡Uauu, tienes una"
	line "#DEX!"

	para "Es realmente"
	line "increíble."
	done

AlloyCitySailor2Text:
	text "El canal que pasa"
	line "a través de la"
	para "ciudad es precioso"
	line "contemplarlo al"
	cont "atardecer."
	done

AlloyCitySignText:
	text "CIUDAD ALEAR"

	para "Una ciudad"
	line "bulliciosa con"
	cont "aguas bravas"
	done

AlloyGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "ALEAR: YASMINA"

	para "La chica de acero"
	done

AlloyDojoSignText:
	text "DOJO KARATE"
	done

AlloyCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event  7,  8, ALLOY_POKECENTER_1F, 1
	warp_event 30,  9, ALLOY_GYM, 1
	warp_event 35, 30, ALLOY_TIMS_HOUSE, 1
	warp_event 34, 15, FIGHTING_DOJO, 2
	warp_event 11, 28, ALLOY_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 23, 22, ALLOY_GOOD_ROD_HOUSE, 1
	warp_event  5, 23, ALLOY_CAFE, 1
	warp_event  7, 14, ALLOY_MART, 1
	warp_event 23, 13, ALLOY_SAILOR_HO_OH_HOUSE, 1
	warp_event 18,  5, ALLOY_ROUTE_107_GATE, 3
	warp_event 33, 15, FIGHTING_DOJO, 1
	warp_event 19,  5, ALLOY_ROUTE_107_GATE, 4
	warp_event 31,  9, ALLOY_GYM, 2

	db 2 ; coord events
	coord_event  2,  9, SCENE_DEFAULT, AlloyCityRivalSceneTop
	coord_event  2, 10, SCENE_DEFAULT, AlloyCityRivalSceneBottom

	db 5 ; bg events
	bg_event 30, 21, BGEVENT_READ, AlloyCitySign
	bg_event 32, 10, BGEVENT_READ, AlloyGymSign
	bg_event 30, 15, BGEVENT_READ, AlloyDojoSign
	bg_event  8,  8, BGEVENT_READ, AlloyCityPokecenterSign
	bg_event  8, 14, BGEVENT_READ, AlloyCityMartSign

	db 5 ; object events
	object_event 10, 31, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor1Script, -1
	object_event 24,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyCityStandingYoungsterScript, -1
	object_event 26, 25, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor2Script, -1
	object_event  7,  8, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_ALLOY_CITY
	object_event  8, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyCityGrampsScript, -1
