	object_const_def ; object_event constants
	const MOUNTMOONSQUARE_POKEFAN_M
	const MOUNTMOONSQUARE_SPORTSMAN
	const MOUNTMOONSQUARE_LASS

MountFujiOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSportsmanArthur:
	trainer SPORTSMAN, ARTHUR, EVENT_BEAT_SPORTSMAN_ARTHUR, SportsmanArthurSeenText, SportsmanArthurBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanArthurAfterBattleText
	waitbutton
	closetext
	end

HealerLassScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_9
	iftrue .LassHealSequence
	writetext LassIntroText
	setevent EVENT_SWITCH_9
	waitbutton
	jump .LassHealSequence
	end

.LassHealSequence
	writetext LassAsksToHeal
	yesorno
	iftrue .LassHealTime
	writetext NoHealThisTime
	waitbutton
	closetext
	end
	
.LassHealTime
	writetext LassHealTimeText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special HealParty
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext LassHealTimeText2
	waitbutton
	closetext
	end
	
LassIntroText:
	text "Ya estamos en lo"
	line "alto de la"
	cont "montaña."

	para "¿Qué? Sí, soy una"
	line "entrenadora, pero"
	cont "estoy descansando."

	para "He traído muchas"
	line "medicinas."

	para "Si necesitas curar"
	line "a tus #MON,"
	cont "dímelo y te"
	cont "ayudaré."
	done

LassAsksToHeal:
	text "¿Entonces qué?"

	para "¿Quieres que cure"
	line "a tus #MON?"
	done

NoHealThisTime:
	text "Bueno, vale."

	para "Seguiré por aquí"
	line "un rato más, así"
	cont "que pásate si lo"
	cont "necesitas."
	done

LassHealTimeText:
	text "Vale, déjame ver"
	line "un momento a tus"
	cont "#MON…"
	done

LassHealTimeText2:
	text "¡Ya está!"

	para "¡Tu equipo está"
	line "listo para seguir!"
	done

SportsmanArthurSeenText:
	text "Creo que puedo"
	line "llegar corriendo"
	cont "hasta la cima."
	done

SportsmanArthurBeatenText:
	text "¡Me he quedado"
	line "sin aliento!"
	done

SportsmanArthurAfterBattleText:
	text "No soy un"
	line "MONTAÑERO, después"
	cont "de todo."
	done

HikerBenjaminSeenText:
	text "¡Ah! ¡Qué bien se"
	line "está fuera! ¡Me"
	cont "siento tan libre!"
	done

HikerBenjaminBeatenText:
	text "¡Gahahah!"
	done

HikerBenjaminAfterBattleText:
	text "Lleva mucho tiempo"
	line "alcanzar la cima."

	para "¡Salir al exterior"
	line "es un soplo de"
	cont "aire fresco!"
	done

MountFujiOutside_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 11, 15, MT_FUJI_INTERIOR_LOWER, 2
	warp_event  5, 13, MT_FUJI_INTERIOR_LOWER, 3
	warp_event 15, 11, MT_FUJI_INTERIOR_LOWER, 4
	warp_event 11,  9, MT_FUJI_INTERIOR_LOWER, 5
	warp_event  1,  7, MT_FUJI_INTERIOR_LOWER, 6
	warp_event 17,  5, MT_FUJI_INTERIOR_UPPER, 1
	warp_event 11,  3, MT_FUJI_INTERIOR_UPPER, 2
	warp_event  7,  1, MT_FUJI_INTERIOR_UPPER, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBenjamin, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSportsmanArthur, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, HealerLassScript, -1
