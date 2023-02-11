	object_const_def ; object_event constants
	const KKS_SWIMMER1
	const KKS_SWIMMER2
	const KKS_YOUNGSTER
	const KKS_ITEMBALL

KikaiStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end
	
KikaiStraitYoungsterScript:
	faceplayer
	opentext
	writetext KikaiStraitYoungsterText
	waitbutton
	closetext
	turnobject KKS_YOUNGSTER, UP
	end
	
KikaiStraitStarPiece:
	itemball STAR_PIECE

	
KikaiStraitYoungsterText:
	text "Guau, la CALDERA"
	line "KIKAI luce de lo"
	cont "más imponente"
	cont "desde aquí."
	done

SwimmerfDeniseSeenText:
	text "¡No me puedo creer"
	line "el buen día que"
	cont "hace!"
	done

SwimmerfDeniseBeatenText:
	text "¡Oooh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Quemarse al sol es"
	line "muy malo para la"
	cont "piel."

	para "Pero yo no uso"
	line "protección solar."

	para "No quiero ensuciar"
	line "el agua."
	done

SwimmerfWendySeenText:
	text "Por la noche, los"
	line "STARYU se reúnen"
	para "cerca de la"
	line "superficie."
	done

SwimmerfWendyBeatenText:
	text "¡Oh, vaya…!"
	done

SwimmerfWendyAfterBattleText:
	text "Los grupos de"
	line "STARYU se iluminan"
	cont "al mismo tiempo."

	para "Es muy bonito,"
	line "pero da miedo."
	done


KikaiStrait_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 15, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event  9, 22, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfWendy, -1
	object_event  8,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiStraitYoungsterScript, -1
	object_event  5,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KikaiStraitStarPiece, EVENT_PICKED_UP_STAR_PIECE_KIKAI_STRAIT
