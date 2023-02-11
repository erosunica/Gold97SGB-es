	object_const_def ; object_event constants
	const COPYCATSHOUSE2F_COPYCAT
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL

CopycatsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Copycat:
	faceplayer
	checkevent EVENT_GOT_KANTO_BATTLE_CLUB_PASS
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	writetext CopycatText_Male_1
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	writetext CopycatText_Male_2
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_KANTO_BATTLE_CLUB_PASS
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Male_3
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>: ¿Te"
	line "gustan los"
	cont "#MON?"

	para "<PLAYER>: No, yo"
	line "sólo preguntaba."

	para "<PLAYER>: ¿Eh?"
	line "¡Qué rara eres!"
	done

CopycatText_QuickMimicking:
	text "COPIONA: ¿Cómo?"
	line "¿Que no imite?"

	para "¡Pero si es mi"
	line "hobby favorito!"
	done

CopycatText_Male_2:
	text "<PLAYER>: ¡Hola!"
	line "Oí que habías"
	para "perdido tu #"
	line "MUÑECO favorito."

	para "<PLAYER>: Si lo"
	line "encuentro, ¿me"
	para "darás un PASE para"
	line "el tren?"

	para "<PLAYER>: Iré a"
	line "buscarlo para ti."

	para "¿Crees que lo"
	line "perdiste en"
	cont "PUEBLO AMAMI?"
	done

CopycatText_Worried:
	text "COPIONA: ¿Perdona?"

	para "¿No tendría que"
	line "decirte yo lo"
	cont "que debes hacer?"

	para "Estoy preocupada."
	line "¿Y si alguien lo"
	cont "encuentra?"
	done

CopycatText_GiveDoll:
	text "COPIONA: ¡Sí! ¡Ése"
	line "es mi # MUÑECO"
	cont "CLEFAIRY!"

	para "¿Ves el descosido"
	line "que tiene en la"
	para "pata derecha?"
	line "¡Ésa es la prueba!"
	done

CopycatText_GivePass:
	text "Está bien. ¡Aquí"
	line "tienes el PASE del"
	para "MAGNETOTRÉN que"
	line "te prometí!"
	done

CopycatText_ExplainPass:
	text "COPIONA: Ése es"
	line "el PASE para el"
	cont "MAGNETOTRÉN."

	para "La empresa de"
	line "ferrocarriles me"
	para "lo dio cuando"
	line "derribaron nuestra"
	para "casa para edificar"
	line "la ESTACIÓN."
	done

CopycatText_Male_3:
	text "<PLAYER>: ¡Hola!"
	line "Muchas gracias por"
	cont "el PASE de tren."

	para "<PLAYER>: ¿Perdona?"

	para "<PLAYER>: ¿Tanto"
	line "te divierte imitar"
	cont "todo lo que hago?"
	done

CopycatText_ItsAScream:
	text "COPIONA: ¿Apuestas"
	line "algo? ¡Es genial!"
	done

CopycatsDodrioText1:
	text "DODRIO: ¡Dodrii!"
	done

CopycatsDodrioText2:
	text "Espejito, espeji-"
	line "to… ¿Quién es la"
	cont "más guapa de"
	cont "todas?"
	done

CopycatsHouse2FDollText:
	text "¡Qué #MON más"
	line "raro!"

	para "Es un muñeco…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	db 5 ; object events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Copycat, -1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
