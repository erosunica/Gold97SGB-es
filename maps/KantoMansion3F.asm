	object_const_def ; object_event constants
	const KANTOMANSION3F_COOLTRAINER_M
	const KANTOMANSION3F_GYM_GUY
	const KANTOMANSION3F_SUPER_NERD
	const KANTOMANSION3F_FISHER

KantoMansion3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	checkcode VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 1, .CompletedPokedex
	waitbutton
	closetext
	end

.CompletedPokedex:
	buttonsound
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	buttonsound
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting:
; unused
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

KantoMansion3FDevRoomSign:
	jumptext KantoMansion3FDevRoomSignText

KantoMansion3FDrawing:
	jumptext KantoMansion3FDrawingText

KantoMansion3FGameProgram:
	jumptext KantoMansion3FGameProgramText

KantoMansion3FReferenceMaterial:
	jumptext KantoMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "¡Hola!"

	para "¡Soy el DISEÑADOR"
	line "DEL JUEGO!"

	para "Te costará"
	line "completar tu"

	para "#DEX, pero…"
	line "¡no te rindas!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "¡Uau! ¡Excelente!"
	line "¡Has completado tu"
	cont "#DEX!"

	para "¡Enhorabuena!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "El DISEÑADOR GRÁ-"
	line "FICO te imprimirá"
	cont "un DIPLOMA."

	para "Deberías presumir"
	line "de ello."
	done

GameFreakGraphicArtistText:
	text "Soy el DISEÑADOR"
	line "GRÁFICO."

	para "¡Yo te he"
	line "dibujado!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "Soy el DISEÑADOR"
	line "GRÁFICO."

	para "¿Has completado tu"
	line "#DEX?"

	para "¿Quieres imprimir"
	line "tu DIPLOMA?"
	done

GameFreakGraphicArtistRefusedText:
	text "Avísame si quieres"
	line "que te imprima tu"
	cont "DIPLOMA."
	done

GameFreakGraphicArtistErrorText:
	text "Algo va mal."
	line "Tengo que cancelar"
	cont "la impresión."
	done

GameFreakProgrammerText:
	text "¿Quién? ¿Yo? Soy"
	line "el PROGRAMADOR."

	para "¡Juega a las"
	line "tragaperras!"
	done

GameFreakCharacterDesignerText:
	text "¿A que las GEMELAS"
	line "son adorables?"

	para "Y YASMINA también"
	line "es muy guapa."

	para "¡Me encantan!"
	done

KantoMansion3FDevRoomSignText:
	text "SALA DE DESARROLLO"
	line "DE GAME FREAK"
	done

KantoMansion3FDrawingText:
	text "Es un dibujo"
	line "detallado de una"
	cont "chica guapa."
	done

KantoMansion3FGameProgramText:
	text "Es el programa del"
	line "juego. ¡No lo"
	para "toques! ¡Podrías"
	line "estropearlo!"
	done

KantoMansion3FReferenceMaterialText:
	text "Está lleno de"
	line "material de"
	para "referencia: hasta"
	line "un # MUÑECO."
	done

KantoMansion3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, KANTO_MANSION_ROOF, 1
	warp_event  4,  0, KANTO_MANSION_2F, 2
	warp_event  6,  0, KANTO_MANSION_2F, 3
	warp_event  7,  0, KANTO_MANSION_ROOF, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  4,  9, BGEVENT_UP, KantoMansion3FDevRoomSign
	bg_event  3,  3, BGEVENT_UP, KantoMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, KantoMansion3FGameProgram
	bg_event  1,  4, BGEVENT_UP, KantoMansion3FReferenceMaterial

	db 4 ; object events
	object_event  0,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  2,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
