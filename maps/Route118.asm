	object_const_def ; object_event constants
	const ROUTE118_YOUNGSTER
	const ROUTE118_LASS1
	const ROUTE118_LASS2
	const ROUTE118_POKE_BALL
	const SANSKRIT_ROUTE_TRAINER
	const SANSKRIT_ROUTE_MON
	const ROUTE118_FRUIT_TREE
	const ROUTE118_SWIMMERM
	const ROUTE118_SWIMMERM2
	const ROUTE118_SWIMMERM3

Route118_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SanskritTownRouteCooltrainermScript:
	end
SanskritTownRouteMonsterScript:
	end
	
Route118FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_118

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermHal:
	trainer SWIMMERM, HAL, EVENT_BEAT_SWIMMERM_HAL, SwimmermHalSeenText, SwimmermHalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHalAfterBattleText
	waitbutton
	closetext
	end

Route118Sign:
	jumptext Route118SignText

Route118HPUp:
	itemball HP_UP

Route118HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_118_HIDDEN_ULTRA_BALL
	
	
SwimmermHalSeenText:
	text "¿Vas hacia"
	line "CALORINA?"

	para "¿Te apetece luchar"
	line "antes?"
	done
	
SwimmermHalBeatenText:
	text "¡He perdido!"
	done

SwimmermHalAfterBattleText:
	text "Creo que nado"
	line "mejor que tú."
	cont "¡Sin duda!"
	done

BirdKeeperHankSeenText:
	text "Estoy mejorando"
	line "mis #MON."

	para "¿Quieres luchar"
	line "contra mí?"
	done

BirdKeeperHankBeatenText:
	text "¡Argh! He perdido"
	line "esta vez…"
	done

BirdKeeperHankAfterBattleText:
	text "Si tienes un"
	line "#MON que desees"
	para "mejorar, ponlo en"
	line "primer lugar y"
	para "cámbialo nada más"
	line "empezar."

	para "Así es como hay"
	line "que hacerlo."
	done

PicnickerHopeSeenText:
	text "Presiento que"
	line "puedo ganar."

	para "¡Veamos si tengo"
	line "razón!"
	done

PicnickerHopeBeatenText:
	text "¡Uau! Eres"
	line "demasiado fuerte."
	done

PicnickerHopeAfterBattleText:
	text "He oído que algu-"
	line "nos #MON tienen"
	para "formas bebé que"
	line "nacen de HUEVOS."

	para "¿Pero de dónde"
	line "saca uno un HUEVO"
	cont "#MON?"
	done

PicnickerSharonSeenText:
	text "Eh…"
	line "Yo…"
	para "¿Combates conmigo?"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "Vine aquí por los"
	line "CLEFAIRY, pero no"
	cont "he encontrado ni"
	cont "uno…"
	done
	
SwimmermRandallSeenText:
	text "¡Eres joven y"
	line "estás en forma!"

	para "¡No vayas sobre tu"
	line "#MON! ¡Nada!"
	done

SwimmermRandallBeatenText:
	text "¡Oh, he perdido…!"
	done

SwimmermRandallAfterBattleText:
	text "La natación"
	line "fortalece tu"
	cont "cuerpo. Es sana."
	done

Route118SignText:
	text "RUTA 118"
	
	para "CIUDAD CALORINA -"
	line "PUEBLO SÁNSCRITO"
	done
	
SwimmermBerkeSeenText:
	text "Aquí el agua está"
	line "templada. Estoy"
	cont "muy a gusto."

	para "¡Claro que lucharé"
	line "contigo!"
	done
	
SwimmermBerkeBeatenText:
	text "¡Vaya! ¡Estoy"
	line "como una pasa!"
	done

SwimmermBerkeAfterBattleText:
	text "¡Qué relajante es"
	line "flotar así!"
	done

Route118_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_118_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, Route118Sign
	bg_event 12, 13, BGEVENT_ITEM, Route118HiddenUltraBall

	db 10 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 20,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118HPUp, EVENT_ROUTE_118_HP_UP
	object_event 72,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteMonsterScript, -1
	object_event  5,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route118FruitTree, -1
	object_event 55,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermRandall, -1
	object_event 44,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerSwimmermBerke, -1
	object_event 30,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermHal, -1
