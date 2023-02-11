	object_const_def ; object_event constants
	const SANSKRITROCKETHOUSE_KEY_GUY
	const SANSKRITROCKETHOUSE_BIRD
	const SANSKRITROCKETHOUSE_ROCKET_1
	const SANSKRITROCKETHOUSE_ROCKET_2
	const SANSKRITROCKETHOUSE_ROCKET_3
	const SANSKRITROCKETHOUSE_ITEM

SanskritRocketHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RemoveKeyIfAlreadyHave

.RemoveKeyIfAlreadyHave:
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .RemoveThatKey
	return
	
.RemoveThatKey
	disappear SANSKRITROCKETHOUSE_ITEM
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	return


SanskritRocketHouseKeyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext SanskritRocketHouseKeyGuyText
	waitbutton
	closetext
	end

.GiveKey:
	checkevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	iftrue .AlreadyGotKey
	writetext SanskritRocketHouseKeyGuyTextKeyTime
	waitbutton
	closetext
	winlosstext RocketKey_WinText, RocketKey_LossText
	loadtrainer GRUNTM, GRUNTM_23
	startbattle
	reloadmapafterbattle
	jump .returnfrombattlerocketkey
	
	
.returnfrombattlerocketkey
	opentext
	writetext RocketKey_AfterText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	setevent EVENT_KEY_GUY_IS_GONE
	appear SANSKRITROCKETHOUSE_ITEM
	clearevent EVENT_SANSKRIT_ROCKET_HOUSE_KEY_ITEM
	checkcode VAR_FACING
	ifequal LEFT, .walk_down_around_player
	applymovement SANSKRITROCKETHOUSE_KEY_GUY, KeyGuyRunsAwayInShame
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	end
	
.walk_down_around_player
	applymovement SANSKRITROCKETHOUSE_KEY_GUY, KeyGuyRunsAwayInShame2
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	end

.AlreadyGotKey:; this is unused now
	writetext RocketKey_Afterwards
	waitbutton
	closetext
	end

SanskritRocketHouseBirdScript:
	faceplayer
	opentext
	writetext SanskritRocketHouseBirdText
	cry MURKROW
	waitbutton
	closetext
	end

SanskritRocketHouseRocket1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext SanskritRocketHouseRocket1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext SanskritRocketHouseRocket1TextKey
	waitbutton
	closetext
	end

SanskritRocketHouseRocket2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext SanskritRocketHouseRocket2Text
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext SanskritRocketHouseRocket2TextKey
	waitbutton
	closetext
	end


SanskritRocketHouseRocket3Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext SanskritRocketHouseRocket3Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext SanskritRocketHouseRocket3TextKey
	waitbutton
	closetext
	end


SanskritRocketHousePoster:
	jumptext SanskritRocketHousePosterText

SanskritRocketHouseTelevisionSign:
	jumptext SanskritRocketHouseTelevisionSignText

SanskritRocketHouseReferenceLibrary:
; unreferenced
	jumptext SanskritRocketHouseReferenceLibraryText
	
KeyGuyRunsAwayInShame:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
KeyGuyRunsAwayInShame2:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
SanskritRocketHouseShipKeyItem:
	itemball BASEMENT_KEY

SanskritRocketHouseKeyGuyText:
	text "¡Já!"

	para "¡Los suministros"
	line "no están tardando"
	para "en llegar al"
	line "MUELLE CALORINA!"

	para "¡Ya tenemos casi"
	line "todo lo que"
	para "necesitamos para"
	line "la siguiente fase"
	cont "de nuestro plan!"

	para "¡La banda de"
	line "CIUDAD ENHIESTA va"
	para "a quedar encantada"
	line "con nuestro"
	cont "trabajo!"
	done
	
SanskritRocketHouseBirdText:
	text "MURKROW: ¡Kroow!"
	done
	
SanskritRocketHouseRocket1Text:
	text "¡Los CASINOS"
	line "siempre son"
	cont "fuentes fiables"
	cont "de ingresos!"

	para "¡Recuérdalo!"
	done
	
SanskritRocketHouseRocket1TextKey:
	text "¿Yo? ¿Una llave?"
	para "Qué va, no tengo"
	line "ninguna."

	para "¿Para qué querrías"
	line "una?"
	para "¡No te metas en el"
	line "camino del TEAM"
	cont "ROCKET, niño!"
	done
	
SanskritRocketHouseRocket2Text:
	text "Un niño ha estado"
	line "estorbando"
	cont "nuestros planes."

	para "Primero en el"
	line "ACUARIO, luego en"
	cont "el POZO SLOWPOKE…"
	para "¡Pero da igual!"

	para "¡Solo fueron"
	line "pequeños"
	cont "contratiempos!"

	para "¡JÁ!"
	done
	
SanskritRocketHouseRocket2TextKey:
	text "¿Qué llave? No"
	line "tengo ninguna"
	cont "llave."

	para "¡Oye!"

	para "¡Espero que no"
	line "seas el niño que"
	para "ha estado frus-"
	line "trando nuestros"
	cont "planes!"

	para "¡Lárgate o sabrás"
	line "lo que es bueno!"
	done
	
SanskritRocketHouseRocket3Text:
	text "¡No queda mucho"
	line "para demostrar al"
	para "mundo de lo que es"
	line "realmente capaz el"
	cont "TEAM ROCKET!"
	done
	
SanskritRocketHouseRocket3TextKey:
	text "Qué va, no tengo"
	line "ninguna llave."

	para "El CAPITÁN no"
	line "confía en mí para"
	cont "esas cosas."
	done
	
SanskritRocketHouseRocket3Text_GotExpnCard:
	text "¡Hola!"

	para "¡Soy el súper"
	line "DIRECTOR MUSICAL!"

	para "Todas las maravi-"
	line "llosas melodías"
	para "que escuchas son"
	line "cosa mía."

	para "No te cortes."
	line "¡Siente la música!"
	done
	
SanskritRocketHousePosterText:
	text "¡Todos los #MON"
	line "existen para la"
	cont "gloria del TEAM"
	cont "ROCKET!"
	done
	
SanskritRocketHouseTelevisionSignText:
	text "Está en bucle…"
	done

SanskritRocketHouseReferenceLibraryText:
	text "¡Uau! Un estante"
	line "lleno de CD y"
	cont "vídeos de #MON."

	para "Debe de ser una"
	line "biblioteca."
	done
	
SanskritRocketHouseKeyGuyTextKeyTime:
	text "¿La LLAVE del"
	line "BARCO?"
	para "A lo mejor la"
	line "tengo. ¿Para qué"
	cont "la quieres?"
	done
	
RocketKey_WinText:
	text "¡¿Qué?!"
	done
	
RocketKey_LossText:
	text "¡Já!"
	done
	
RocketKey_AfterText:
	text "¡Oh, no, el"
	line "CAPITÁN me va a"
	cont "matar!"
	done
	
RocketKey_AfterText2:
	text "¡Largo de aquí!"
	done
	
RocketKey_Afterwards:
	text "¡No me hables!"
	done

SanskritRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SANSKRIT_TOWN, 5
	warp_event 17,  7, SANSKRIT_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, SanskritRocketHousePoster
	bg_event  6,  1, BGEVENT_READ, SanskritRocketHouseTelevisionSign

	db 6 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseKeyGuyScript, EVENT_KEY_GUY_IS_GONE
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseBirdScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket1Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket2Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket3Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SanskritRocketHouseShipKeyItem, EVENT_SANSKRIT_ROCKET_HOUSE_KEY_ITEM
