	object_const_def ; object_event constants
	const KKC_BB1
	const KKC_BB2
	const KKC_BB3
	const KKC_ITEMBALL1
	const KKC_ITEMBALL2

KikaiCaldera1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBBIzo:
	trainer BLACKBELT_T, IZO, EVENT_BEAT_BLACKBELT_IZO, IzoSeenText, IzoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext IzoAfterBattleText
	waitbutton
	closetext
	end

IzoSeenText:
	text "¡Hiyah! ¡Siente mi"
	line "ardiente espíritu"
	cont "de lucha!"
	done

IzoBeatenText:
	text "¡Uau!"
	done

IzoAfterBattleText:
	text "¡No sé qué es más"
	line "caluroso, si este"
	cont "volcán o mi pasión"
	cont "ardiente!"
	done

TrainerBBTakeshi:
	trainer BLACKBELT_T, TAKESHI, EVENT_BEAT_BLACKBELT_TAKESHIKKC, TakeshiSeenText, TakeshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TakeshiAfterBattleText
	waitbutton
	closetext
	end
	
TakeshiSeenText:
	text "¡Bienvenido al"
	line "fogón de la"
	cont "CALDERA!"

	para "¡Prepárate para"
	line "pasar calor!"
	done

TakeshiBeatenText:
	text "¡Puedo oler lo"
	line "que te traes "
	cont "entre manos!"
	done

TakeshiAfterBattleText:
	text "¡Quienes no"
	line "soporten el calor"
	cont "no deberían estar"
	cont "aquí!"
	done
	
	
TrainerBBTaro:
	trainer BLACKBELT_T, TARO, EVENT_BEAT_BLACKBELT_TARO, TaroSeenText, TaroBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TaroAfterBattleText
	waitbutton
	closetext
	end

TaroSeenText:
	text "¡Mis puños golpean"
	line "más rápido de lo"
	cont "que puedo llegar a"
	cont "sudar!"
	done

TaroBeatenText:
	text "Debería pasarme"
	line "ya por la sauna."
	done

TaroAfterBattleText:
	text "¡Venimos a"
	line "entrenar a la"
	para "CALDERA porque"
	line "el intenso calor"
	para "fortalece nuestra"
	line "resistencia"
	cont "cardiovascular!"
	done

KKC1Itemball1:
	itemball PROTEIN
	
KKC1Itemball2:
	itemball FIRE_STONE


KikaiCaldera1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 19, KIKAI_VILLAGE, 5
	warp_event  5,  3, KIKAI_CALDERA_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 19, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBIzo, -1
	object_event 25,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBBTakeshi, -1
	object_event 14,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBTaro, -1
	object_event  0, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KKC1Itemball1, EVENT_KKC1_ITEMBALL1
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KKC1Itemball2, EVENT_KKC1_ITEMBALL2
	
