	object_const_def ; object_event constants
	const SANSKRITRUINSRESEARCHCENTER_SCIENTIST1
	const SANSKRITRUINSRESEARCHCENTER_SCIENTIST2
	const SANSKRITRUINSRESEARCHCENTER_SCIENTIST3

SanskritRuinsResearchCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SANSKRITRUINSRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	priorityjump .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	return

.ShowScientist:
	moveobject SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, 2, 4
	appear SANSKRITRUINSRESEARCHCENTER_SCIENTIST3
	return

.GetUnownDexScript:
	pause 15
	turnobject SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, DOWN
	showemote EMOTE_SHOCK, SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, 15
	opentext
	writetext SanskritRuinsResearchCenterModifiedDexBeforeText
	waitbutton
	closetext
	applymovement SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext SanskritRuinsResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext SanskritRuinsResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext SanskritRuinsResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	setscene SCENE_SANSKRITRUINSRESEARCHCENTER_NOTHING
	end

SanskritRuinsResearchCenterScientist3Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext SanskritRuinsResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext SanskritRuinsResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

SanskritRuinsResearchCenterScientist1Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext SanskritRuinsResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext SanskritRuinsResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext SanskritRuinsResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext SanskritRuinsResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_YOUNGSTERS
	end

SanskritRuinsResearchCenterScientist2Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext SanskritRuinsResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext SanskritRuinsResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	checkevent EVENT_GOT_UNOWN_DOLL_FROM_SCIENTIST
	iffalse .GetDoll
	writetext SanskritRuinsResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end
	
.GetDoll
	writetext SanskritRuinsResearchCenterScientist2Text_GetDoll
	waitbutton
	waitsfx
	writetext GotUnownDollText
	playsound SFX_ITEM
	waitsfx
;	waitbutton
	setevent EVENT_GOT_UNOWN_DOLL_FROM_SCIENTIST
	setevent EVENT_DECO_UNOWN_DOLL
	writetext SanskritRuinsResearchCenterScientist2Text_GetDoll2
	waitbutton
	closetext
	end

SanskritRuinsResearchCenterComputer:
	opentext
	checkevent EVENT_SANSKRIT_RUINS_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext SanskritRuinsResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext SanskritRuinsResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

SanskritRuinsResearchCenterPrinter:
	opentext
	checkevent EVENT_SANSKRIT_RUINS_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext SanskritRuinsResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext SanskritRuinsResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

SanskritRuinsResearchCenterPhoto:
; unreferenced
	jumptext SanskritRuinsResearchCenterProfSilktreePhotoText

SanskritRuinsResearchCenterBookshelf:
SanskritRuinsResearchCenterBookshelf2:
SanskritRuinsResearchCenterBookshelf3:
	jumptext SanskritRuinsResearchCenterAcademicBooksText
	
SanskritRuinsResearchCenterComputer2:
	jumptext SanskritRuinsResearchCenterComputer2Text

MovementData_0x5926f:
	step DOWN
	step DOWN
	step UP
	step UP
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step UP
	step_end
	
GotUnownDollText:
	text "¡<PLAYER> recibió"
	line "MUÑECO UNOWN!"
	done

SanskritRuinsResearchCenterScientist2Text_GetDoll:
	text "¡Uau! ¡Tienes"
	line "todos los tipos de"
	cont "UNOWN!"

	para "¡Aquí tienes un"
	line "pequeño regalo"
	cont "para celebrarlo!"
	done

SanskritRuinsResearchCenterScientist2Text_GetDoll2:
	text "Es un MUÑECO UNOWN"
	line "de decoración."

	para "¡Colócalo en tu"
	line "dormitorio!"
	done

SanskritRuinsResearchCenterComputer2Text:
	text "Es un ordenador"
	line "que muestra imáge-"
	cont "nes de extraños"
	cont "jeroglíficos."
	done

SanskritRuinsResearchCenterModifiedDexBeforeText:
	text "¡Ah! ¡Aquí estás!"

	para "Muy bien, déjame"
	line "ver tu #DEX"
	cont "un momento."
	done

SanskritRuinsResearchCenterModifiedDexText:
	text "¡Ya está!"

	para "He modificado tu"
	line "#DEX."

	para "Añadí una #DEX"
	line "opcional para"
	para "guardar los datos"
	line "de UNOWN."

	para "Los registra en el"
	line "orden en que son"
	cont "atrapados."
	done

SanskritRuinsResearchCenterDexUpgradedText:
	text "Mejorada #DEX"
	line "de <PLAYER>."
	done

SanskritRuinsResearchCenterScientist3Text:
	text "Todos los UNOWN"
	line "que atrapes serán"
	cont "registrados aquí."

	para "A ver cuántos"
	line "tipos existen."
	done

SanskritRuinsResearchCenterScientist3_PrinterAvailable:
	text "¿Atrapaste a todos"
	line "los UNOWN?"

	para "¡Es un gran logro!"

	para "He ajustado la"
	line "impresora para"
	cont "UNOWN."

	para "Puedes usarla"
	line "cuando quieras."
	done

SanskritRuinsResearchCenterScientist1Text:
	text "Las RUINAS datan"
	line "de hace unos"
	cont "1.500 años."

	para "Pero ignoramos"
	line "por qué o por"
	para "quién fueron"
	line "construidas."
	done

SanskritRuinsResearchCenterScientist1Text_GotUnownDex:
	text "¿Cuántos tipos de"
	line "#MON habrá en"
	cont "las RUINAS?"
	done

SanskritRuinsResearchCenterScientist1Text_UnownAppeared:
	text "¿Hay #MON"
	line "en las RUINAS?"

	para "¡Qué noticia"
	line "tan increíble!"

	para "Tendremos que"
	line "investigarlo."
	done

SanskritRuinsResearchCenterScientist1Text_GotAllUnown:
	text "Nuestra investiga-"
	line "ción, con tu"
	para "ayuda, nos está"
	line "reportando infor-"
	cont "mación acerca de"
	cont "las RUINAS."

	para "Las RUINAS parecen"
	line "haber sido cons-"
	cont "truidas como un"
	cont "hábitat para"
	cont "#MON."
	done

SanskritRuinsResearchCenterScientist2Text:
	text "En las paredes de"
	line "las RUINAS hay"
	para "unos dibujos muy"
	line "raros."

	para "Son la clave para"
	line "resolver el"
	cont "misterio de las"
	cont "RUINAS."
	done

SanskritRuinsResearchCenterScientist2Text_UnownAppeared:
	text "¿Los #MON"
	line "raros que viste"
	cont "en las RUINAS?"

	para "Son muy parecidos"
	line "a los dibujos de"
	para "esas paredes de"
	line "ahí."

	para "¡Mmm…!"

	para "Debe de significar"
	line "que hay muchos"
	cont "tipos diferentes…"
	done

SanskritRuinsResearchCenterUnusedText1:
; unused
	text "Pensamos que algo"
	line "hizo aparecer en"
	para "las RUINAS esos"
	line "enigmáticos"
	cont "dibujos."

	para "Basamos nuestros"
	line "estudios en ello."
	done

SanskritRuinsResearchCenterUnusedText2:
; unused
	text "De acuerdo con mi"
	line "investigación…"

	para "Esos misteriosos"
	line "dibujos aparecie-"
	cont "ron cuando se"
	cont "construyó el"
	cont "CENTRO #COM."

	para "Debe de ser que"
	line "las ondas de radio"
	para "tienen algún tipo"
	line "de relación…"
	done

SanskritRuinsResearchCenterScientist2Text_GotAllUnown:
	text "¿Por qué estos"
	line "antiguos dibujos"
	para "aparecen ahora en"
	line "el muro?"

	para "Esto es cada vez"
	line "más misterioso…"
	done

SanskritRuinsResearchCenterComputerText:
	text "RUINAS ALFA"

	para "10 Años"
	line "de Exploración"
	done

SanskritRuinsResearchCenterComputerText_GotAllUnown:
	text "Nombre de #MON"
	line "misterioso: UNOWN"

	para "Encontrados un"
	line "total de 26 tipos."
	done

SanskritRuinsResearchCenterPrinterText_DoesntWork:
	text "Parece que esto"
	line "aún no funciona."
	done

SanskritRuinsResearchCenterUnownPrinterText:
	text "Se puede imprimir"
	line "UNOWN."
	done

SanskritRuinsResearchCenterProfSilktreePhotoText:
; unused
	text "Es una foto del"
	line "fundador del"

	para "CENTRO de INVES-"
	line "TIGACIÓN, el"
	cont "PROF. SILKTREE."
	done

SanskritRuinsResearchCenterAcademicBooksText:
	text "Hay muchos libros"
	line "académicos."

	para "Ruinas Antiguas…"
	line "Los Misterios de"
	cont "los Antiguos…"
	done

SanskritRuinsResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SANSKRIT_TOWN, 3
	warp_event  3,  7, SANSKRIT_TOWN, 3
	
	db 0 ; coord events

	db 6 ; bg events
	bg_event  1,  1, BGEVENT_READ, SanskritRuinsResearchCenterBookshelf
	bg_event  0,  1, BGEVENT_READ, SanskritRuinsResearchCenterBookshelf
	bg_event  3,  1, BGEVENT_READ, SanskritRuinsResearchCenterBookshelf
	bg_event  0,  0, BGEVENT_READ, SanskritRuinsResearchCenterComputer
	bg_event  6,  1, BGEVENT_READ, SanskritRuinsResearchCenterPrinter
	bg_event  2,  3, BGEVENT_READ, SanskritRuinsResearchCenterComputer2

	db 3 ; object events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsResearchCenterScientist1Script, -1
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsResearchCenterScientist2Script, -1
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsResearchCenterScientist3Script, EVENT_SANSKRIT_RUINS_RESEARCH_CENTER_SCIENTIST
