	object_const_def ; object_event constants
	const SEASIDE_PATH_YOUNGSTER_1
	const SEASIDE_PATH_YOUNGSTER_2
	const SEASIDE_PATH_POKEFAN_M
	const SEASIDE_PATH_POKEFAN_M_2
	const SEASIDE_PATH_ITEMBALL
	
SeasidePath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end
	
TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end
	
SeasidePathCleanseTag:
	itemball CLEANSE_TAG


SeasidePathSign:
	jumptext SeasidePathSignText
	
JouleCaveSign:
	jumptext JouleCaveSignText
	
SeasidePathSignText:
	text "PASEO LITORAL"

	para "PUEBLO AMAMI -"
	line "VILLA NAGO"
	done

JouleCaveSignText:
	text "Entrada a la"
	line "CUEVA JULIO"
	done

HikerTimothySeenText:
	text "¿Que por qué"
	line "escalo montañas?"

	para "Porque están ahí."

	para "¿Que por qué"
	line "entreno #MON?"

	para "¡Porque están ahí!"
	done

HikerTimothyBeatenText:
	text "Las derrotas…"
	line "¡son inevitables!"
	done

HikerTimothyAfterBattleText:
	text "Lo mejor que me ha"
	line "pasado nunca fue"
	cont "descubrir a los"
	cont "#MON."
	done

PsychicFidelSeenText:
	text "Ya veo…"

	para "Todo lo que hay"
	line "que ver de ti…"
	done

PsychicFidelBeatenText:
	text "No me imaginaba"
	line "tu poder…"
	done

PsychicFidelAfterBattleText:
	text "Lo cierto es que"
	line "podrías considerar"
	para "un islote donde"
	line "estoy ahora mismo."
	done

BirdKeeperPeterSeenText:
	text "Mis pájaros no"
	line "pueden volar lo"
	para "bastante lejos"
	line "como para llevarme"
	cont "de vuelta al"
	cont "continente."
	done

BirdKeeperPeterBeatenText:
	text "Conozco mis"
	line "debilidades."
	done

BirdKeeperPeterAfterText:
	text "Ojalá pudiese"
	line "volar…"
	done
	
PokefanmJoshuaSeenText:
	text "¡Jijiji! ¿Quieres"
	line "luchar contra mi"
	cont "grupo de PIKACHU?"
	done

PokefanmJoshuaBeatenText:
	text "¡PI, PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Parece que tienes"
	line "muchos #MON,"
	cont "pero PIKACHU es el"
	cont "mejor."
	done

SeasidePath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, SEASIDE_PATH_ISEN_STRAIT_GATE, 4
	warp_event 53, 11, JOULE_CAVE_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 26,  4, BGEVENT_READ, SeasidePathSign
	bg_event 52, 12, BGEVENT_READ, JouleCaveSign

	db 5 ; object events
	object_event 15, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperPeter, -1
	object_event 43, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicFidel, -1
	object_event 21,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 30,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerTimothy, -1
	object_event 50,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeasidePathCleanseTag, EVENT_PICKED_UP_CLEANSE_TAG_FROM_SEASIDE_PATH
