	object_const_def ; object_event constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERSHOUSE2F_CLEFAIRY
	const PLAYERSHOUSE2F_KEN

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler
	
MeetKenScript:
	turnobject PLAYER, LEFT
	turnobject PLAYERSHOUSE2F_KEN, RIGHT
PlayersHouse2F_Ken:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	iftrue .KenPart2
	writetext KenGreeting1
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	checkevent EVENT_READ_OAKS_EMAIL
	iffalse .KenEmailScript
	waitbutton
	closetext
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.KenEmailScript
	waitbutton
	writetext KenGreeting1pt2
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .DontNeedToWalk
	applymovement PLAYER, PlayerToReadEmailMovement
	turnobject PLAYERSHOUSE2F_KEN, DOWN
	end
	
.DontNeedToWalk
	end
	
.KenPart2
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .KenGiveMapCard
	writetext KenGreeting2
	waitbutton
	closetext
	end
	
.KenGiveMapCard
	checkflag ENGINE_MAP_CARD
	iftrue .KenAlreadyGaveMap
	writetext KenGreeting3
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGreeting4
	waitbutton
	closetext
	end
	
.KenAlreadyGaveMap
	writetext KenGreeting5
	waitbutton
	closetext
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "TARJ. MAPA@"
	


Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .NormalRadio
	opentext
	writetext PlayersRadioText1
	waitbutton
	closetext
	end

.NormalRadio:
	checkevent EVENT_ROUTE_102_SILVER
	iftrue .NormalRadio2
	opentext
	writetext PlayersRadioText5
	waitbutton
	closetext
	end	
	
.NormalRadio2
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:
	jumpstd PictureBookshelfScript

PlayersHousePCScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .PlayersHousePC2
	opentext
	checkevent EVENT_READ_OAKS_EMAIL
	iftrue .PlayersHousePC3
	playsound SFX_BOOT_PC
	writetext PlayersRadioText2
	yesorno
	iffalse .No
	writetext PlayersRadioText2Yes
	waitbutton
	closetext
	setevent EVENT_READ_OAKS_EMAIL
	checkevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	iffalse .DontSetKenScene
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end

.No
	writetext PlayersRadioText2No
	waitbutton
	closetext
	end	

.DontSetKenScene
	end

.Warp:
	warp NONE, 0, 0
	end

.PlayersHousePC2
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end

.PlayersHousePC3
	writetext PlayersRadioTextAfter
	waitbutton
	closetext
	end	

PlayersDollScript:
	opentext
	writetext PlayersDollText
	waitbutton
	closetext
	end
	
PlayerToReadEmailMovement:
	step DOWN
	step_end
	
PlayersRadioText5:
	text "Parece que está"
	line "apagada…"
	done
	
KenGreeting1:
	text "KEN: ¡Qué pasa,"
	line "hermano!"

	para "Esa cosa"
	line "reluciente en"
	cont "tu muñeca…"
	para "¡Por fin tienes"
	line "un #GEAR!"

	para "Aunque ahora mismo"
	line "no te servirá de"
	cont "mucho…"
	para "¡Debería"
	line "conseguirte una"
	cont "TARJ. MAPA!"

	para "Ya sabes, por si"
	line "llegases a"
	cont "necesitarla."

	para "¡Ven a verme antes"
	line "de que te vayas!"
	done
	
KenGreeting1pt2:
	text "¡Ah, sí!"

	para "Creo que tienes"
	line "un correo nuevo"
	cont "en tu PC."

	para "¡Deberías leerlo"
	line "antes de irte!"
	done
	
KenGreeting2:
	text "¡Ven a verme antes"
	line "de que te vayas!"
	done
	
KenGreeting3:
	text "KEN: ¡Qué pasa,"
	line "hermano!"

	para "¿El PROF. OAK te"
	line "pidió que lo"
	para "ayudases a"
	line "completar una"
	cont "nueva #DEX?"
	para "¡Uau! ¡Hice bien"
	line "en pillarte esto!"
	done
	
KenGreeting4:
	text "¡Ahora podrás"
	line "saber por dónde"
	para "andas con ayuda"
	line "de tu #GEAR!"

	para "¡Con esto nunca"
	line "te vas a perder!"

	para "Por cierto,"
	line "¿sabes qué?"
	para "¡Me han llamado"
	line "para una"
	para "entrevista de"
	line "trabajo como DJ de"
	para "radio en CIUDAD"
	line "PONIENTE!"

	para "¡Podrías escuchar"
	line "a tu hermano en"
	cont "la radio!"

	para "¡Deséame suerte!"

	para "¡La misma que yo"
	line "te deseo a ti!"
	done
	
KenGreeting5:
	text "¡Me han llamado"
	line "para una"
	para "entrevista de"
	line "trabajo como DJ de"
	para "radio en CIUDAD"
	line "PONIENTE!"

	para "¡Podrías escuchar"
	line "a tu hermano en"
	cont "la radio!"

	para "¡Deséame suerte!"

	para "¡La misma que yo"
	line "te deseo a ti!"
	done

PlayersDollText:
	text "Es un muñeco que"
	line "un familiar de"
	para "KANTO te regaló"
	line "en Navidad."
	done

PlayersRadioText1:
	text "<PLAYER> encendió"
	line "la radio."
	
	para "¡Estás escuchando"
	line "JOPM, la emisora"
	cont "#MON!"
	
	para "¡A continuación,"
	line "NOTICIAS #MON!"
	
	para "¡El PROF. OAK,"
	line "investigador"
	para "#MON de fama"
	line "mundial, ha"
	para "desaparecido"
	line "de KANTO!"
	
	para "Aunque hay quien"
	line "considera que se"
	para "ha trasladado en"
	line "busca de un nuevo"
	para "lugar de estudio,"
	line "existe la"
	para "posibilidad de que"
	line "se haya visto"
	para "envuelto en un"
	line "incidente."
	
	para "Las partes"
	line "implicadas están"
	cont "muy preocupadas."
	
	para "…"
	
	para "¡Y hasta aquí las"
	line "Noticias #MON!"
	done

PlayersRadioText2:
	text "<PLAYER> encendió"
	line "el PC."
	
	para "¿Eh? ¡Parece que"
	line "hay un nuevo"
	para "correo dirigido a"
	line "<PLAYER>! ¿Leerlo?"
	done
	
PlayersRadioText2Yes:
	text "Espero que me"
	line "disculpes por"
	para "enviarte un correo"
	line "tan de repente,"
	para "pero hay algo que"
	line "me gustaría"
	cont "entregarte."
	
	para "¿Te importaría"
	line "venir a recogerlo?"
	
	para "OAK, investigador"
	line "#MON"	
	done

PlayersRadioText2No:
	text "Lo leeré más"
	line "tarde…"
	done

PlayersRadioTextAfter:
	text "DIARIO #MON"
	line "PÁGINA DE INICIO"
	
	para "…"
	
	para "¡Se ha descubierto"
	line "un nuevo #MON!"
	
	para "Sus fuertes alas "
	line "son duras como el"
	para "acero. No sólo es"
	line "de tipo volador,"
	para "¡sino que también"
	line "forma parte del"
	cont "nuevo tipo acero!"
	
	para "Se están llevando"
	line "a cabo más"
	cont "investigaciones…"
	done

PlayersRadioText3:
	text "¡Soy DJ ROSA,"
	line "la presentadora!"
	done

PlayersRadioText4:
	text "¡#MON!"
	line "El CANAL #MON…"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  0, PLAYERS_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  9,  1, SCENE_DEFAULT, MeetKenScript


	db 5 ; bg events
	bg_event  3,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  8,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 6 ; object events
	object_event  7,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  6, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  6, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  6, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	object_event  6,  1, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersDollScript, -1
	object_event  8,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouse2F_Ken, EVENT_ROUTE_102_SILVER
