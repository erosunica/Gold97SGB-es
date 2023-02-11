	object_const_def ; object_event constants
	const ALLOYLIGHTHOUSE6F_JASMINE
	const ALLOYLIGHTHOUSE6F_MONSTER
	const ALLOYLIGHTHOUSE6F_POKE_BALL

AlloyLighthouse6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyLighthouseJasmine:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .BroughtSecretpotion
	checkevent EVENT_GUY_GIVES_MYSTERYBERRY
	iftrue .ExplainedSickness
	writetext JasmineCrownHouse2Text
	promptbutton
	setevent EVENT_GUY_GIVES_MYSTERYBERRY
.ExplainedSickness:
	writetext JasmineGetSomeMedicineText
	waitbutton
	closetext
	end

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalse .no
	writetext PlayerHandedSecretpotionText
	promptbutton
	takeitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject ALLOYLIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	promptbutton
	closetext
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutPalettes
	pause 10
	special FadeInPalettes
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	faceplayer
	opentext
	writetext JasmineThankYouText
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_ALLOY_GYM_JASMINE
	readvar VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
	applymovement ALLOYLIGHTHOUSE6F_JASMINE, MovementData_0x112da4
	disappear ALLOYLIGHTHOUSE6F_JASMINE
	end

.FacingDown:
	applymovement ALLOYLIGHTHOUSE6F_JASMINE, MovementData_0x112dac
	disappear ALLOYLIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement ALLOYLIGHTHOUSE6F_JASMINE, MovementData_0x112db5
	disappear ALLOYLIGHTHOUSE6F_JASMINE
	end

.no:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject ALLOYLIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	opentext
	writetext JasmineAmphyHangOnText
	waitbutton
	closetext
	end

AlloyLighthouseUnusedDummyScript:
; unused
	end

AlloyLighthouseAmphy:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .HealthyNow
	writetext AmphyPalPalooText
	setval AMPHAROS
	special PlaySlowCry
	promptbutton
	writetext AmphyBreathingLaboredText
	waitbutton
	closetext
	end

.HealthyNow:
	writetext AmphyPaluPaluluText
	cry AMPHAROS
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end

AlloyLighthouse6FSuperPotion:
	itemball SUPER_POTION

MovementData_0x112da4:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_sleep 8
	step_sleep 8
	step_end

MovementData_0x112dac:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x112db5:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_sleep 8
	step_end

JasmineCrownHouse2Text:
	text "YASMINA: Este"
	line "#MON siempre"
	para "iluminaba el mar"
	line "por la noche."

	para "Pero de pronto"
	line "enfermó… Le"
	cont "cuesta respirar…"

	para "Dicen que hay"
	line "una FARMACIA"
	cont "estupenda en"
	cont "CALORINA…"

	para "Pero está al otro"
	line "lado del mar…"

	para "Y no puedo dejar"
	line "solo a AMPHY…"
	done

JasmineGetSomeMedicineText:
	text "¿Podrías traerme"
	line "su medicina?"
	cont "¿Por favor?"
	done

JasmineCureAmphyText:
	text "YASMINA: ¿Le hará"
	line "la medicina algo a"
	cont "AMPHY?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> entregó"
	line "la POCIÓN SECRETA"
	cont "a YASMINA."
	done

JasmineDontBeOffendedText:
	text "YASMINA: ¡Mmm!"
	line "Por favor, no te"
	cont "ofendas…"

	para "AMPHY no aceptaría"
	line "nada de nadie."
	cont "Sólo confía en mí."
	done

JasmineAmphyHowAreYouFeelingText:
	text "YASMINA: …"

	para "AMPHY, ¿cómo te"
	line "sientes?"
	done

JasmineThankYouText:
	text "YASMINA: ¡Oh…!"
	line "¡Menos mal…!"

	para "Es tan estupendo…"
	line "Muchísimas"
	cont "gracias."

	para "Regresaré"
	line "al GIMNASIO…"
	done

JasmineISeeText:
	text "YASMINA: Ya veo…"
	done

JasmineAmphyHangOnText:
	text "¡AMPHY, aguanta!"
	done

AmphyPalPalooText:
	text "AMPHY: ¡Am…"
	line "Am… phyphy…!"
	done

AmphyBreathingLaboredText:
	text "Apenas puede"
	line "respirar…"
	done

AmphyPaluPaluluText:
	text "AMPHY: ¡Amphy!"
	line "¡Amphy!"
	done

AlloyLighthouse6F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, ALLOY_LIGHTHOUSE_5F, 1
	warp_event 16,  5, ALLOY_LIGHTHOUSE_5F, 6
	warp_event 17,  5, ALLOY_LIGHTHOUSE_5F, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  8,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyLighthouseJasmine, EVENT_ALLOY_LIGHTHOUSE_JASMINE
	object_event  9,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyLighthouseAmphy, -1
	object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AlloyLighthouse6FSuperPotion, EVENT_GOT_TEAM_ROCKET_AMULET_COIN
