	object_const_def ; object_event constants
	const WESTPORTBIKESHOP_CLERK

WestportBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

WestportBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext WestportBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext WestportBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext WestportBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext WestportBikeShopClerkRefusedText
	waitbutton
	closetext
	end

WestportBikeShopJustReleasedCompactBike:
; unused
	jumptext WestportBikeShopJustReleasedCompactBikeText

WestportBikeShopBicycle:
	jumptext WestportBikeShopBicycleText

WestportBikeShopClerkIntroText:
	text "(Suspiro…)"
	line "Me trasladé aquí,"
	para "pero no vendo mis"
	line "BICIS. ¿Por qué?"

	para "¿Montarías en una"
	line "BICI para hacerme"
	cont "publicidad?"
	done

WestportBikeShopClerkAgreedText:
	text "¿De verdad? ¡Bien!"

	para "Dime tu nombre y"
	line "número de teléfono"
	cont "y te prestaré una"
	cont "BICI."
	done

BorrowedABicycleText:
	text "<PLAYER> tomó"
	line "prestada una BICI."
	done

WestportBikeShopClerkFirstRateBikesText:
	text "¡Mis BICIS son de"
	line "gran calidad!"

	para "Puedes usarlas en"
	line "cualquier lugar."
	done

WestportBikeShopClerkRefusedText:
	text "(Suspiro…)"
	line "¡Oh, rayos y"
	cont "centellas…!"
	done

WestportBikeShopJustReleasedCompactBikeText:
	text "¡Lo último! ¡BICIS"
	line "compactas de"
	cont "máxima calidad!"
	done

WestportBikeShopBicycleText:
	text "¡Es una BICI"
	line "novísima!"
	done

WestportBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, WESTPORT_UNDERGROUND, 2
	warp_event  3,  7, WESTPORT_UNDERGROUND, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, WestportBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportBikeShopClerkScript, -1
