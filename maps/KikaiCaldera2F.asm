	object_const_def ; object_event constants
	const KKC2_BB
	const KKC2_ITEMBALL

KikaiCaldera2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBBOkuma:
	trainer BLACKBELT_T, OKUMA, EVENT_BEAT_BLACKBELT_OKUMA, OkumaSeenText, OkumaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OkumaAfterBattleText
	waitbutton
	closetext
	end

OkumaSeenText:
	text "Mi fuerza…"

	para "¡Viene de avivar"
	line "la llama en mi"
	cont "interior!"
	done

OkumaBeatenText:
	text "¡Nunca te rindas!"
	done

OkumaAfterBattleText:
	text "¡Derrótame y"
	line "volveré a arder"
	cont "con más fuerza!"
	done

KKC2Itemball:
	itemball FOCUS_ORB

KikaiCaldera2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 15, KIKAI_VILLAGE, 6
	warp_event 15, 13, KIKAI_VILLAGE, 7
	warp_event  3,  3, KIKAI_CALDERA_1F, 2
	warp_event 17,  3, KIKAI_CALDERA_3F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBBOkuma, -1
	object_event  0, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KKC2Itemball, EVENT_KKC2_ITEMBALL
