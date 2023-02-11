	object_const_def ; object_event constants
	const MILK_BAR_POKEFAN_M
	const MILK_BAR_POKEFAN_F
	const BAR_FISHER
	const BAR_LASS
	const BAR_N64_YOUNGSTER

BirdonMilkBar_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
BarFisherScript:
	jumptextfaceplayer BarFisherScriptText
	
BarLassScript:
	jumptextfaceplayer BarLassScriptText

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	jumptextfaceplayer FarmerFText_SnoreSpeech


FarmhouseBookshelf:
	jumpstd PictureBookshelfScript
	
BarN64YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GO_LOOK_FOR_PEOPLE_FOR_GAME_HOUSE
	iftrue .SendN64YoungsterOff
	writetext BarN64YoungsterBoredText
	waitbutton
	closetext
	end

.SendN64YoungsterOff
	writetext BarN64YoungsterBoredText
	buttonsound
	writetext SendN64YoungsterOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, BarN64YoungsterDownScript
	jump BarN64YoungsterLeftScript
	end
	
BarN64YoungsterDownScript:
	applymovement BAR_N64_YOUNGSTER, BarN64YoungsterDownMovement
	playsound SFX_EXIT_BUILDING
	disappear BAR_N64_YOUNGSTER
	setevent EVENT_YOUNGSTER_IN_BIRDON_MILK_BAR
	clearevent EVENT_YOUNGSTER_FROM_BIRDON_IN_GAME_HOUSE
	clearevent EVENT_GAME_HOUSE_NPC_IN_KANTO_GAME_CORNER
	waitsfx
	end
	
BarN64YoungsterLeftScript:
	applymovement BAR_N64_YOUNGSTER, BarN64YoungsterLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear BAR_N64_YOUNGSTER
	setevent EVENT_YOUNGSTER_IN_BIRDON_MILK_BAR
	clearevent EVENT_YOUNGSTER_FROM_BIRDON_IN_GAME_HOUSE
	clearevent EVENT_GAME_HOUSE_NPC_IN_KANTO_GAME_CORNER
	waitsfx
	end
	
BarN64YoungsterLeftMovement:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BarN64YoungsterDownMovement:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
BarN64YoungsterBoredText:
	text "Vaya aburrimiento."

	para "En este pueblo no"
	line "hay nada que"
	cont "hacer."

	para "Me encantaría"
	line "conocer otros"
	para "entrenadores,"
	line "quedar con ellos y"
	cont "jugar videojuegos."

	para "Pero no sé dónde"
	line "podría hacer algo"
	cont "así."
	done
	
SendN64YoungsterOffText:
	text "¿Qué?"
	para "¿Que hay un sitio"
	line "por CIUDAD"
	para "PONIENTE donde"
	line "podría ir?"
	para "Pues mira, no"
	line "tengo nada mejor"
	cont "que hacer."

	para "¡Iré a pasarme!"
	line "¡Gracias!"
	done
	
BarFisherScriptText:
	text "Vengo aquí cada"
	line "día."

	para "La LECHE MU-MU"
	line "está riquísima,"
	cont "en serio."
	done
	
BarLassScriptText:
	text "No hay mucho que"
	line "hacer en este"
	cont "pueblo."

	para "Muchos pasamos"
	line "aquí el tiempo"
	cont "bebiendo leche."
	done

FarmerMText_BuyMilk:
	text "¿Te apetece beber"
	line "algo?"
	para "Aquí servimos"
	line "LECHE MU-MU."

	para "¿Quieres una"
	line "botella?"
	done

FarmerMText_GotMilk:
	text "¡Toma! ¡Bébetela"
	line "y disfruta!"
	done

FarmerMText_NoMoney:
	text "Lo siento."
	line "¡Si no hay dinero,"
	cont "no hay trato!"
	done

FarmerMText_NoRoom:
	text "Vaya, tu MOCHILA"
	line "está llena."
	done

FarmerMText_NoSale:
	text "¿No la quieres?"
	line "Vuelve otro día."
	done

FarmerMText_Milking:
	text "Se bebe que da"
	line "gusto."

	para "¡Y a los #MON"
	line "también les"
	cont "encanta!"
	done

FarmerFText_SnoreSpeech:
	text "¡La LECHE MU-MU es"
	line "toda una delicia!"
	done

BirdonMilkBar_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BIRDON_TOWN, 2
	warp_event  3,  7, BIRDON_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BarFisherScript, -1
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BarLassScript, -1
	object_event  0,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BarN64YoungsterScript, EVENT_YOUNGSTER_IN_BIRDON_MILK_BAR
