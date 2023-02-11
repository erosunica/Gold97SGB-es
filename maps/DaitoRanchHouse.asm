ROUTE109FARMHOUSE_MILK_PRICE EQU 500

	object_const_def ; object_event constants
	const DAITOHOUSE_FARMER
	const DAITOHOUSE_WIFE


DaitoRanchHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaitoRanchero_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue DaitoRancheroScript_SellMilk
	writetext DaitoRancheroText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

DaitoRancheroScript_SellMilk:
	checkevent EVENT_GOT_OLD_AMBER_FROM_FARMER
	iffalse .GetOldAmberFromFarmer
	checkitem MOOMOO_MILK
	iftrue DaitoRancheroScript_Milking
	writetext DaitoRancheroText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse DaitoRancheroScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, DaitoRancheroScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse DaitoRancheroScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext DaitoRancheroText_GotMilk
	buttonsound
	itemnotify
	closetext
	end
	
.GetOldAmberFromFarmer
	writetext HeyYouHealedMooMoo
	waitbutton
	verbosegiveitem OLD_AMBER
	writetext HeyYouHealedMooMoo2
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_AMBER_FROM_FARMER
	end

DaitoRancheroScript_NoMoney:
	writetext DaitoRancheroText_NoMoney
	waitbutton
	closetext
	end

DaitoRancheroScript_NoRoom:
	writetext DaitoRancheroText_NoRoom
	waitbutton
	closetext
	end

DaitoRancheroScript_NoSale:
	writetext DaitoRancheroText_NoSale
	waitbutton
	closetext
	end

DaitoRancheroScript_Milking:
	writetext DaitoRancheroText_Milking
	waitbutton
	closetext
	end
	
HeyYouHealedMooMoo:
	text "¡Anda, hola!"

	para "Aprecio mucho que"
	line "hayas ayudado a mi"
	cont "MUU-MUU."

	para "Te debo una,"
	line "chico."

	para "Esto es algo que"
	line "encontré mientras"
	para "preparábamos el"
	line "terreno para"
	cont "construir este"
	cont "RANCHO."

	para "¡Cógelo!"
	done

HeyYouHealedMooMoo2:
	text "Y si necesitas más"
	line "LECHE MU-MU,"
	cont "házmelo saber."
	done

DaitoRancheroText_SickCow:
	text "Mi MILTANK ya no"
	line "da leche."

	para "La leche de esta"
	line "GRANJA es famosa."

	para "Casi todo el mundo"
	line "la quiere."

	para "Seguro que si le"
	line "doy de comer"
	para "muchas MANZANAS,"
	line "me dará mucha"
	cont "leche."
	done

DaitoRancheroText_BuyMilk:
	text "¿Qué te parece mi"
	line "LECHE MU-MU?"

	para "Es la flor y nata"
	line "de este lugar."

	para "¡Dásela a tus"
	line "#MON para"
	cont "restaurar sus PS!"

	para "Es toda tuya por"
	line "solo 500¥."
	done

DaitoRancheroText_GotMilk:
	text "¡Aquí tienes!"
	line "¡Que aproveche!"
	done

DaitoRancheroText_NoMoney:
	text "Lo siento. ¡Sin"
	line "dinero, no hay"
	cont "leche!"
	done

DaitoRancheroText_NoRoom:
	text "Creo que tu"
	line "MOCHILA está"
	cont "llena."
	done

DaitoRancheroText_NoSale:
	text "¿No la quieres?"
	line "¿He oído bien?"
	done

DaitoRancheroText_Milking:
	text "Será mejor que me"
	line "vaya a ordeñar."
	done

DaitoHouseWifeScript:
	faceplayer
	opentext
	writetext Route26HealHouseRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
;	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route26HealHouseKeepAtItText
	waitbutton
	closetext
	end
	
Route26HealHouseRestAWhileText:
	text "Tus #MON"
	line "parecen cansados."

	para "Deberías dejarlos"
	line "descansar un poco."
	done

Route26HealHouseKeepAtItText:
	text "¡Vaya! ¡Tus"
	line "#MON tienen"
	cont "buen aspecto!"

	para "¡Sigue así!"
	done


DaitoRanchHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 1
	warp_event  5,  7, DAITO_RANCH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DaitoRanchero_DairyFarmer, -1
	object_event  7,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DaitoHouseWifeScript, -1
