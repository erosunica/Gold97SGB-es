	object_const_def ; object_event constants
	const MERIDIANPATH_YOUNGSTER1
	const MERIDIANPATH_LASS1
	const MERIDIANPATH_YOUNGSTER2
	const MERIDIANPATH_LASS2
	const MERIDIANPATH_YOUNGSTER3
	const MERIDIANPATH_LASS3
	const MERIDIANPATH_SUPER_NERD
	const MERIDIANPATH_COOLTRAINER_M2
	const MERIDIANPATH_POKE_BALL

MeridianPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	trainer COOLTRAINERM, KEVIN, EVENT_BEAT_COOLTRAINERM_KEVIN, CooltrainermKevinSeenText, CooltrainermKevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermKevinAfterBattleText
	waitbutton
	closetext
	end


MeridianPathProtein:
	itemball PROTEIN

MeridianPathHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MERIDIAN_PATH_HIDDEN_HYPER_POTION
	
MeridianPathSign:
	jumptext MeridianPathSignText
	
MeridianPathSignText:
	text "SENDA MERIDIONAL"

	para "VILLA NAGO -"
	line "CIUDAD RYUKYU"
	done

BeautyVictoriaSeenText:
	text "¿Has escalado ya"
	line "la CUMBRE"
	cont "CALCINADA?"
	done

BeautyVictoriaBeatenText:
	text "¿Cómo he podido"
	line "perder?"
	done

BeautyVictoriaAfterBattleText:
	text "La vista es muy"
	line "bonita desde allí."
	done

SchoolboyJoeSeenText:
	text "¿Has viajado por"
	line "todo NIHON?"

	para "Fascinante."

	para "¿Pero tendrás"
	line "alguna posibilidad"
	para "contra un entrena-"
	line "dor como yo?"
	done

SchoolboyJoeBeatenText:
	text "¡Au! ¡Se acabó!"
	done

SchoolboyJoeAfterBattleText:
	text "Parece que tuviste"
	line "tiempo de sobra"
	para "para entrenar a"
	line "tus #MON"
	cont "mientras viajabas."
	done

LassLauraSeenText:
	text "Parece que vienes"
	line "de muy lejos."
	done

LassLauraBeatenText:
	text "¡Estoy acabada!"
	done

LassLauraAfterBattleText:
	text "¿De dónde eres?"

	para "¿PUEBLO SILENTE?"

	para "Nunca he estado"
	line "allí."
	done

CamperLloydSeenText:
	text "¿Vas a la CUMBRE"
	line "CALCINADA?"
	done

CamperLloydBeatenText:
	text "¡Uau! Demasiado."
	done

CamperLloydAfterBattleText:
	text "Cuenta la leyenda"
	line "que aquí vive un"
	cont "#MON raro."

	para "Pero subiendo a la"
	line "cima nunca vi"
	cont "nada."
	done

LassShannonSeenText:
	text "¡Que sepas que soy"
	line "una entrenadora"
	cont "muy fuerte!"
	done

LassShannonBeatenText:
	text "¿Estás bromeando?"
	done

LassShannonAfterBattleText:
	text "Hice lo que pude."
	line "Pero supongo que"
	cont "tú eres mejor."
	done

SupernerdPatSeenText:
	text "¡Jujujuju…!"

	para "Combate contra mí."
	done

SupernerdPatBeatenText:
	text "No deberías haber"
	line "ganado."
	done

SupernerdPatAfterBattleText:
	text "Hay una mujer en"
	line "VILLA NAGO que"
	para "tiene un montón de"
	line "CHARMANDER en su"
	cont "casa."

	para "A este paso se va"
	line "a incendiar."
	done

CooltrainermKevinSeenText:
	text "Quieres combatir,"
	line "¿no?"

	para "Pues vale."
	done

CooltrainermKevinBeatenText:
	text "¡Nunca había"
	line "visto nada igual!"
	done

CooltrainermKevinAfterBattleText:
	text "¡Ha sido"
	line "fantástico!"

	para "Tus #MON y tú"
	line "sois realmente"
	cont "buenos."
	done


MeridianPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 47, MERIDIAN_PATH_RYUKYU_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 14, BGEVENT_ITEM, MeridianPathHiddenHyperPotion
	bg_event 11,  5, BGEVENT_READ, MeridianPathSign

	db 8 ; object events
	object_event  9,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event  8, 47, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyJoe, -1
	object_event 13, 44, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 14, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event  8, 18, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassShannon, -1
	object_event  6, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdPat, -1
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermKevin, -1
	object_event  6, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeridianPathProtein, EVENT_MERIDIAN_PATH_PROTEIN
