	object_const_def ; object_event constants
	const URASOETRAIL_FISHER3
	const URASOETRAIL_FISHER4
	const URASOETRAIL_POKE_BALL1
	const URASOETRAIL_POKE_BALL2
	const URASOETRAIL_POKEMANIAC

UrasoeTrail_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerPokemaniacShane:
	trainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacShaneAfterBattleText
	waitbutton
	closetext
	end


TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

UrasoeTrailSign:
	jumptext UrasoeTrailSignText

FishingSpotSign:
	jumptext FishingSpotSignText

UrasoeTrailCalcium:
	itemball CALCIUM

UrasoeTrailNugget:
	itemball NUGGET

UrasoeTrailHiddenElixer:
	hiddenitem ELIXER, EVENT_URASOE_TRAIL_HIDDEN_ELIXER


FisherStephenSeenText:
	text "Me gusta pescar"
	line "mientras escucho"
	cont "canciones por la"
	cont "radio."
	done

FisherStephenBeatenText:
	text "¡Mi estúpida radio"
	line "me ha distraído!"
	done

FisherStephenAfterBattleText:
	text "¿Has conocido a"
	line "alguno de los"
	cont "presentadores de"
	cont "la radio?"

	para "Me pregunto si son"
	line "igual de estupen-"
	cont "dos en persona."
	done

FisherBarneySeenText:
	text "¡Nada mejor que un"
	line "día de pesca!"
	done

FisherBarneyBeatenText:
	text "¡Uf!"
	done

FisherBarneyAfterBattleText:
	text "Dicen los rumores"
	line "que PUNTO KUME, al"
	para "otro lado del"
	line "ESTRECHO, es un"
	cont "mejor lugar para"
	cont "pescar."

	para "Vaya tontería."

	para "¡Este lado es"
	line "claramente mejor!"
	done

PokemaniacShaneSeenText:
	text "¿Qué significa"
	line "para ti la rareza?"
	done

PokemaniacShaneBeatenText:
	text "Debí haber usado"
	line "mi PIEDRA LUNAR…"
	done

PokemaniacShaneAfterBattleText:
	text "¿Tienes una"
	line "#DEX?"

	para "¡Uau, habrás visto"
	line "#MON muy raros!"

	para "¿Puedo verla, por"
	line "favor?"
	done

UrasoeTrailSignText:
	text "SENDA URASOE"

	para "CIUDAD RYUKYU -"
	line "CIUDAD KUME"
	done

FishingSpotSignText:
	text "BOSQUE NANJO"
	
	para "Entrada a la"
	line "derecha"
	done

UrasoeTrail_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8,  5, URASOE_PARK_URASOE_TRAIL_GATE, 3
	warp_event  9,  5, URASOE_PARK_URASOE_TRAIL_GATE, 4
	warp_event 14, 26, NANJO_FOREST, 1
	warp_event 14, 27, NANJO_FOREST, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  7, BGEVENT_READ, UrasoeTrailSign
	bg_event 11, 25, BGEVENT_READ, FishingSpotSign
	bg_event  4,  4, BGEVENT_ITEM, UrasoeTrailHiddenElixer

	db 5 ; object events
	object_event  6, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherStephen, -1
	object_event  4, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherBarney, -1
	object_event 13,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeTrailCalcium, EVENT_URASOE_TRAIL_CALCIUM
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeTrailNugget, EVENT_URASOE_TRAIL_NUGGET
	object_event 10,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacShane, -1
