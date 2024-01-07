	object_const_def ; object_event constants
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_OFFICER

Pokecenter2F_MapScripts:
	db 4 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script .Scene2 ; SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	scene_script .Scene3 ; SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE

	db 0 ; callbacks

.Scene0:
	special CheckMysteryGift
	ifequal $0, .Scene0Done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Scene0Done
	prioritysjump Pokecenter2F_AppearMysteryGiftDeliveryGuy

.Scene0Done:
	end

.Scene1:
	prioritysjump Script_LeftCableTradeCenter
	end

.Scene2:
	prioritysjump Script_LeftCableColosseum
	end

.Scene3:
	prioritysjump Script_LeftTimeCapsule
	end

Pokecenter2F_AppearMysteryGiftDeliveryGuy:
	appear POKECENTER2F_OFFICER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	iffalse Script_TradeCenterClosed
	special SetBitsForLinkTradeRequest
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .AbortLink
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	closetext
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	iffalse Script_BattleRoomClosed
	special SetBitsForBattleRequest
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .AbortLink
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	closetext
	end

Script_TimeCapsuleClosed:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckTimeCapsuleCompatibility
	ifequal $1, .MonTooNew
	ifequal $2, .MonMoveTooNew
	ifequal $3, .MonHasMail
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .OK
	special CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.OK:
	special EnterTimeCapsule
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .FacingLeft
	ifequal RIGHT, .FacingRight
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special WaitForOtherPlayerToExit
	closetext
	end

.MonTooNew:
	writetext Text_RejectNewMon
	closetext
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	closetext
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	closetext
	end

.FacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksLeftAndUp
	warpcheck
	end

.FacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksRightAndUp
	warpcheck
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_DEFAULT
	setmapscene TRADE_CENTER, SCENE_DEFAULT
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_DEFAULT
	setmapscene COLOSSEUM, SCENE_DEFAULT
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
	setscene SCENE_DEFAULT
	setmapscene TIME_CAPSULE, SCENE_DEFAULT
	end

Pokecenter2FLinkRecordSign:
	refreshscreen
	special DisplayLinkRecord
	closetext
	end

Pokecenter2FOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .AlreadyGotGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	promptbutton
	waitsfx
	special GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
.AlreadyGotGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	waitbutton
	closetext
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	waitbutton
	closetext
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
	waitbutton
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_end

Text_BattleReceptionistIntro:
	text "Éste es el COLISEO"
	line "del CLUB DEL"
	cont "CABLE."

	para "Puedes luchar con"
	line "un/a amigo/a aquí."

	para "¿Quieres luchar"
	line "ahora?"
	done

Text_TradeReceptionistIntro:
	text "Éste es el CENTRO"
	line "DE CAMBIO del CLUB"
	cont "DEL CABLE."

	para "Puedes cambiar un"
	line "#MON aquí"
	cont "con un/a amigo/a."

	para "¿Quieres"
	line "intercambiar?"
	done

Text_TimeCapsuleReceptionistIntro:
	text "Ésta es la CÁPSULA"
	line "DEL TIEMPO del"
	cont "CLUB DEL CABLE."

	para "Puedes viajar al"
	line "pasado y cambiar"
	cont "tu #MON."

	para "¿Quieres viajar en"
	line "el tiempo?"
	done

YourFriendIsNotReadyText:
	text "Tu amigo/a no está"
	line "preparado/a."
	prompt

Text_MustSaveGame:
	text "Antes de conectar"
	line "las consolas,"
	cont "guarda el juego."
	done

Text_PleaseWait:
	text "Espera, por favor."
	done

Text_LinkTimedOut:
	text "La conexión se ha"
	line "interrumpido por"
	cont "inactividad."

	para "Habla con tu"
	line "amigo/a y vuelve"
	cont "cuando quieras."
	prompt

Text_PleaseComeAgain:
	text "Vuelve algún día."
	prompt

Text_PleaseComeIn:
	text "Entra, por favor."
	prompt

Text_TemporaryStagingInLinkRoom:
	text "Por ahora, te"
	line "pondremos en la"
	cont "sala de conexión."
	done

Text_CantLinkToThePast:
	text "Aquí no puedes"
	line "conectarte con"
	cont "el pasado."
	prompt

Text_IncompatibleRooms:
	text "Tu amigo/a eligió"
	line "una sala distinta."
	prompt

Text_PleaseComeIn2:
	text "Entra, por favor."
	done

Text_PleaseEnter:
	text "Entra, por favor."
	prompt

Text_RejectNewMon:
	text "Perdona. No"
	line "puedes llevar a"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

Text_RejectMonWithNewMove:
	text "No puedes llevar a"
	line "@"
	text_ram wStringBuffer1
	text " con"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_RejectMonWithMail:
	text "No puedes llevarte"
	line "a @"
	text_ram wStringBuffer1
	text_start
	cont "con la CARTA."
	prompt

Text_TimeCapsuleClosed:
	text "Lo siento. Estamos"
	line "arreglando la"

	para "CÁPSULA DEL"
	line "TIEMPO."
	done

Text_TradeRoomClosed:
	text "Lo siento. Estamos"
	line "ajustando la"
	cont "MÁQUINA DE CAMBIO."
	done

Text_BattleRoomClosed:
	text "Lo siento. Estamos"
	line "ajustando la"
	cont "MÁQUINA DE LUCHA."
	done

Text_MysteryGiftDeliveryGuy_Intro:
	text "¡Hola! Tú eres"
	line "<PLAYER>, ¿no?"

	para "¿Quieres recoger"
	line "lo que tengo para"
	cont "ti?"
	done

Text_MysteryGiftDeliveryGuy_HereYouGo:
	text "¡Aquí tienes!"
	done

Text_MysteryGiftDeliveryGuy_Outro:
	text "Esperamos poder"
	line "ayudarte de nuevo."
	done

Text_MysteryGiftDeliveryGuy_NoRoom:
	text "¡Oh! No tienes"
	line "espacio para esto."

	para "Para en cualquier"
	line "CENTRO #MON"
	para "del país y podrás"
	line "recogerlo."
	done

Text_MysteryGiftDeliveryGuy_SaidNo:
	text "¿No? Es muy"
	line "extraño…"
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1
	warp_event 13,  2, TIME_CAPSULE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  2, BGEVENT_READ, Pokecenter2FLinkRecordSign

	db 4 ; object events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	object_event  1,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Pokecenter2FOfficerScript, EVENT_MYSTERY_GIFT_DELIVERY_GUY
