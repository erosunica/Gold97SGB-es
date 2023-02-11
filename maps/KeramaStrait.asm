	object_const_def ; object_event constants
	const KERAMASTRAIT_SWIMMER_GIRL
	const KERAMASTRAIT_SWIMMER_GUY2
	const KERAMASTRAIT_SWIMMER_GUY3
	const KERAMASTRAIT_FISHER1
	const KERAMASTRAIT_FISHER2

KeramaStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

KeramaStraitFisher1Script:
	jumptextfaceplayer KeramaStraitFisher1Text


KeramaStraitFisher2Script:
	jumptextfaceplayer KeramaStraitFisher2Text


KeramaStraitSign:
	jumptext KeramaStraitSignText


SwimmermTuckerSeenText:
	text "(Resoplido…)"
	line "Un… poco más…"
	para "y… llegaré…"
	line "hasta KUME…"
	done

SwimmermTuckerBeatenText:
	text "¡Me ahogo!"
	done

SwimmermTuckerAfterBattleText:
	text "Le… pedí a mi"
	line "novia que nadara"
	cont "hacia KUME…"
	done

SwimmerfDawnSeenText:
	text "¡No me gustan los"
	line "blandengues!"
	done

SwimmerfDawnBeatenText:
	text "Podría ganarte"
	line "nadando…"
	done

SwimmerfDawnAfterBattleText:
	text "No hay que nadar"
	line "mucho hasta CIUDAD"
	cont "KUME…"

	para "¡Con lo grande que"
	line "es mi novio,"
	cont "menudo blandengue!"
	done

SwimmermJeromeSeenText:
	text "¿Natación?"
	line "Es lo que más me"
	cont "gusta."
	done

SwimmermJeromeBeatenText:
	text "Creía que podía"
	line "ganar."
	done

SwimmermJeromeAfterBattleText:
	text "Se me da muy bien"
	line "nadar y me encanta"
	cont "el mar."
	done

KeramaStraitFisher1Text:
	text "Los PESCADORES que"
	line "dicen que el lado"
	para "este del ESTRECHO"
	line "es el mejor punto"
	cont "de pesca se"
	cont "equivocan."

	para "Los PESCADORES que"
	line "dicen que el lado"
	para "oeste del ESTRECHO"
	line "es el mejor punto"
	cont "de pesca se"
	cont "equivocan."

	para "¡El mejor está"
	line "justo aquí en el"
	cont "centro!"
	done

KeramaStraitFisher2Text:
	text "No hay duda de que"
	line "este es el mejor"
	cont "punto de pesca."
	done

KeramaStraitSignText:
	text "ESTRECHO KERAMA"

	para "CIUDAD RYUKYU -"
	line "CIUDAD KUME"
	done


KeramaStrait_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 58, 11, BGEVENT_READ, KeramaStraitSign

	db 5 ; object events
	object_event 19,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDawn, -1
	object_event 46,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event 11, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermTucker, -1
	object_event 27,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 1, KeramaStraitFisher1Script, -1
	object_event 29,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, KeramaStraitFisher2Script, -1
