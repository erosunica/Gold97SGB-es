	object_const_def ; object_event constants
;	const ROUTE108_STANDING_YOUNGSTER1
;	const ROUTE108_LASS
	const ROUTE108_STANDING_YOUNGSTER2
;	const ROUTE108_SAILOR
	const ROUTE108_FRUIT_TREE
	const ROUTE108_BUENA2

Route108_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

;TrainerSailorHarry:
;	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

;.Script
;	endifjustbattled
;	opentext
;	writetext SailorHarryAfterBattleText
;	waitbutton
;	closetext
;	end


TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route108Sign:
	jumptext Route108SignText

Route108TrainerTips:
	jumptext Route108TrainerTipsText

Route108FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_108

BirdKeeperTobySeenText:
	text "¡Vuela alto hacia"
	line "el cielo, querido"
	cont "pájaro #MON!"
	done

BirdKeeperTobyBeatenText:
	text "¡Me apetece salir"
	line "volando ahora!"
	done

BirdKeeperTobyAfterBattleText:
	text "Estoy pensando en"
	line "entrenar en el"
	para "DOJO KARATE de"
	line "CIUDAD ALEAR."

	para "Los #MON vola-"
	line "dores son fuertes"
	para "contra los del"
	line "tipo lucha…"
	para "¿No es una ventaja"
	line "injusta?"
	done


UnknownText_0x1a200e:
	text "Tengo que hacer"
	line "muchos exámenes y"
	para "no tengo tiempo"
	line "para los #MON."

	para "Así que, cuando"
	line "puedo jugar, me"
	cont "concentro mucho."
	done

LassDana1SeenText:
	text "Parece que sabes"
	line "de #MON."

	para "Si es así, ¿por"
	line "qué no me das"
	cont "algún consejo?"
	done

LassDana1BeatenText:
	text "Ya veo. De modo"
	line "que luchas así."
	done

UnknownText_0x1a20ec:
	text "¡Tengo una buena"
	line "noticia!"

	para "¡La LECHE MU-MU es"
	line "una bebida nutri-"
	cont "tiva para los"
	cont "#MON!"

	para "Puedes comprarla"
	line "en CIUDAD"
	cont "ENHIESTA."
	done

SailorHarrySeenText:
	text "He estado en el"
	line "extranjero. ¡Así"
	para "que conozco todo"
	line "tipo de #MON!"
	done

SailorHarryBeatenText:
	text "¡Tu destreza es de"
	line "categoría mundial!"
	done

SailorHarryAfterBattleText:
	text "Gentes de todo el"
	line "mundo viven"
	cont "felices con los"
	cont "#MON."
	done

BeautyOliviaSeenText:
	text "¿No crees que mis"
	line "#MON y yo"
	cont "somos bonitos?"
	done

BeautyOliviaBeatenText:
	text "Mantengo a mi"
	line "#MON como es"
	cont "debido."
	done

BeautyOliviaAfterBattleText:
	text "¿Alguna vez has"
	line "estado en la pelu-"
	cont "quería #MON de"
	cont "CIUDAD PONIENTE?"
	done

Route108SignText:
	text "RUTA 108"
	
	para "CIUDAD ALEAR -"
	line "BOSQUE AZUL"
	done

Route108TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Si un #MON"
	line "va a evolucionar,"
	cont "puedes pararlo."

	para "Pulsa el Botón B"
	line "mientras intenta"
	cont "evolucionar."

	para "Esto asusta al"
	line "#MON y detiene"
	cont "su evolución."
	done

Route108_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  0, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  1,  0, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  4, BGEVENT_READ, Route108Sign
	bg_event 18,  4, BGEVENT_READ, Route108TrainerTips

	db 3 ; object events
;	object_event 19,  6, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
;	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event  7, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperToby, -1
;	object_event 24,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	object_event 28,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route108FruitTree, -1
	object_event 18, 11, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBeautyOlivia, -1
