	object_const_def ; object_event constants
	const RAINBOWISLAND_BLUE

RainbowIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueScriptRI:
	special FadeOutMusic
	faceplayer
	opentext
	writetext BlueSeenText
	waitbutton
	closetext
	winlosstext BlueWinLossText, BlueWinLossText
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RAINBOWISLAND_BLUE
	setevent EVENT_BLUE_ON_RAINBOW_ISLAND
	setevent EVENT_DECO_SILVER_TROPHY; blue trophy
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
BlueWinLossText:
	text "¡Se acabó!"

	para "¡Ha sido un"
	line "combate histórico,"
	cont "sin duda!"
	done

BlueSeenText:
	text "¡Hola, <PLAYER>!"

	para "He venido a"
	line "estudiar las"
	para "numerosas especies"
	line "de #MON que"
	cont "viven en esta"
	cont "isla."

	para "Vaya, veo el"
	line "fuego en tus ojos."

	para "Conozco bien ese"
	line "sentimiento."

	para "Es lo que me"
	line "impulsó a conver-"
	cont "tirme en CAMPEÓN."

	para "Bueno… ¡Solo hay"
	line "una cosa que puedo"
	cont "imaginar que"
	cont "deseas!"

	para "¡<PLAYER>!"

	para "Como antiguo"
	line "CAMPEÓN de la"
	para "LIGA #MON,"
	line "¡te desafío!"
	done

BlueLeavesText:
	text "Uf…"

	para "¡Nadie me había"
	line "puesto en tantos"
	para "aprietos desde que"
	line "combatí contra mi"
	para "viejo amigo cuando"
	line "era CAMPEÓN!"

	para "Todavía parece"
	line "que fue ayer…"

	para "…"

	para "¡Qué tiempos"
	line "aquellos!"

	para "En fin <PLAYER>,"
	line "supongo que ha"
	para "llegado el momento"
	line "de dar por"
	para "concluida mi"
	line "investigación."

	para "¡Hasta luego!"
	done

RainbowIsland_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 30,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueScriptRI, EVENT_BLUE_ON_RAINBOW_ISLAND
