	object_const_def ; object_event constants
	const ROUTE109_BEAUTY
;	const ROUTE109_POKEFAN_M
	const ROUTE109_POKEFAN_F1
	const ROUTE109_PSYCHIC_NORMAN
	const ROUTE109_FRUIT_TREE
	const ROUTE109_POKEFAN_F2
	const ROUTE109_BUGCATCHER

Route109_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end


TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end


TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end



Route109PokecenterSign:
	jumptext Route109PokecenterSignText


Route109FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_109

Route109HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_109_HIDDEN_NUGGET
	

BugCatcherEdSeenText:
	text "¿Usas algún"
	line "#MON bicho?"
	done

BugCatcherEdBeatenText:
	text "¡Solo uso bichos!"
	done

BugCatcherEdAfterBattleText:
	text "¡Todo entrenador"
	line "debería tener un"
	cont "#MON bicho!"
	done

PokefanmDerekSeenText:
	text "¡Es buen momento"
	line "para alardear de"
	cont "mi PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "No tuve tiempo de"
	line "presumir de mi"
	cont "PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "¡No te estoy"
	line "escuchando!"

	para "¡Los #FANS"
	line "tenemos por norma"
	para "no escuchar a la"
	line "gente presumida!"
	done

PokefanfRuthSeenText:
	text "¡Qué #MON más"
	line "encantadores!"

	para "Enseñemos nuestros"
	line "#MON al mismo"
	cont "tiempo."
	done

PokefanfRuthBeatenText:
	text "No me importa"
	line "perder."
	done

PokefanfRuthAfterBattleText:
	text "¿Sabes algo sobre"
	line "los #MON bebés?"

	para "¡Son todos tan"
	line "adorables!"
	done

PokefanMDerekPikachuIsItText:
	text "¡PIKACHU es lo"
	line "más! ¿No crees?"
	done

PsychicNormanSeenText:
	text "Déjame ver de qué"
	line "son capaces tus"
	cont "#MON."
	done

PsychicNormanBeatenText:
	text "¡Ooh! Tus #MON"
	line "tienen potencial."
	done

PsychicNormanAfterBattleText:
	text "¿Sabes que los"
	line "#MON tienen"
	para "distintas"
	line "habilidades?"

	para "Son como las"
	line "personas. Cada uno"
	para "tiene su propio"
	line "potencial."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Jujujuju… Espero"
	line "que oscurezca"
	cont "pronto."
	done

PokefanfJaimeSeenText:
	text "Llegas justo a"
	line "tiempo."

	para "Luchemos."
	done

PokefanfJaimeBeatenText:
	text "Oh, qué"
	line "decepcionante…"
	done

PokefanfJaimeAfterBattleText:
	text "Encontré mi PONYTA"
	line "aquí por la noche,"
	cont "en la RUTA 109."

	para "No estoy segura,"
	line "pero parece que"
	para "le gusta que me"
	line "entrene aquí."

	para "Cuando estamos por"
	line "esta zona, se"
	cont "vuelve más cari-"
	cont "ñoso."
	done


BeautyValerieSeenText:
	text "¡Hola! ¡Tienes"
	line "buen aspecto!"

	para "¿Me dejas ver a"
	line "tus #MON?"
	done

BeautyValerieBeatenText:
	text "Encantada de haber"
	line "visto a tus"
	cont "#MON."
	done

BeautyValerieAfterBattleText:
	text "Cuando veo #MON"
	line "me tranquilizo."
	done

Route109PokecenterSignText:
	text "CENTRO #MON"
	line "Cura a tus #MON"
	done

Route109_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 13, AMPARE_CAVERN_1F, 1
	warp_event 13, 28, ROUTE_109_POKECENTER_1F, 1
	warp_event  8,  5, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  9,  5, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 28, BGEVENT_READ, Route109PokecenterSign
	bg_event  4, 11, BGEVENT_ITEM, Route109HiddenNugget

	db 6 ; object events
	object_event  4, 63, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyValerie, -1
;	object_event  9, 52, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 14, 36, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerPokefanfRuth, -1
	object_event  5, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPsychicNorman, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route109FruitTree, -1
	object_event  4, 49, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  9, 84, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherEd, -1
