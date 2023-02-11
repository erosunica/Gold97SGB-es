	object_const_def ; object_event constants
	const SANSKRITRUINSKABUTOCHAMBER_RECEPTIONIST

SanskritRuinsKabutoChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SanskritRuinsKabutoChamberHiddenDoors

SanskritRuinsKabutoChamberReceptionistScript:
	jumptextfaceplayer SanskritRuinsKabutoChamberReceptionistText

SanskritRuinsKabutoChamberHiddenDoors:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

SanskritRuinsKabutoChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_KABUTO
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SANSKRIT_RUINS_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_K
	setevent EVENT_SANSKRIT_RUINS_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene SANSKRIT_RUINS_INNER_CHAMBER, SCENE_SANSKRITRUINSINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	warpcheck
	end

SanskritRuinsKabutoChamberAncientReplica:
	jumptext SanskritRuinsKabutoChamberAncientReplicaText

SanskritRuinsKabutoChamberDescriptionSign:
	jumptext SanskritRuinsKabutoChamberDescriptionText

SanskritRuinsKabutoChamberReceptionistText:
	text "Bienvenidos a esta"
	line "cámara."

	para "Hay paneles móvi-"
	line "les que muestran"
	para "a un #MON"
	line "dibujado por los"
	cont "antepasados."

	para "Mueve los paneles"
	line "para formar el"
	cont "dibujo."

	para "A la derecha hay"
	line "una descripción"
	cont "del #MON."
	done

SanskritRuinsKabutoChamberAncientReplicaText:
	text "Es una réplica de"
	line "un #MON"
	cont "antiguo."
	done

SanskritRuinsKabutoChamberDescriptionText:
	text "Un #MON que se"
	line "oculta en el mar."

	para "Con sus ojos"
	line "explora la zona."
	done

SanskritRuinsKabutoChamber_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, SANSKRIT_RUINS_OUTSIDE, 2
	warp_event  4,  9, SANSKRIT_RUINS_OUTSIDE, 2
	warp_event  3,  3, SANSKRIT_RUINS_INNER_CHAMBER, 4
	warp_event  4,  3, SANSKRIT_RUINS_INNER_CHAMBER, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  3, BGEVENT_READ, SanskritRuinsKabutoChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, SanskritRuinsKabutoChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, SanskritRuinsKabutoChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, SanskritRuinsKabutoChamberDescriptionSign

	db 1 ; object events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRuinsKabutoChamberReceptionistScript, EVENT_SANSKRIT_RUINS_KABUTO_CHAMBER_RECEPTIONIST
