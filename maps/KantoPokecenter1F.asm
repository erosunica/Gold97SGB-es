	object_const_def ; object_event constants
	const KANTOPOKECENTER1F_NURSE
	const KANTOPOKECENTER1F_GENTLEMAN
	const KANTOPOKECENTER1F_PHARMACIST
	const KANTOPOKECENTER1F_COOLTRAINER_F

KantoPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

KantoPokecenter1FGentlemanScript:
	jumpstd HappinessCheckScript

KantoPokecenter1FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .KantoPokeCenter1FCooltrainerBeatClair
	writetext KantoPokecenter1FCooltrainerFText
	waitbutton
	closetext
	end
	
.KantoPokeCenter1FCooltrainerBeatClair
	writetext KantoPokecenter1FCooltrainerFText2
	waitbutton
	closetext
	end

KantoPokecenter1FPharmacistScript:
	jumptextfaceplayer KantoPokecenter1FPharmacistText

KantoPokecenter1FCooltrainerFText2:
	text "¡Uau! ¿Has"
	line "derrotado a ROJO?"

	para "¡Debes ser muy"
	line "fuerte!"
	done

KantoPokecenter1FCooltrainerFText:
	text "ROJO es un maestro"
	line "de todos los"
	cont "#MON."

	para "Será mejor que"
	line "estés preparado"
	cont "para desafiarlo."
	done

KantoPokecenter1FPharmacistText:
	text "¿Ya has estado"
	line "en el CENTRO"
	cont "COMERCIAL?"

	para "Diría que tienen"
	line "una mejor selec-"
	cont "ción de artículos"
	cont "que el de CIUDAD"
	cont "PONIENTE."
	done

KantoPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KANTO_REGION, 5
	warp_event  6,  7, KANTO_REGION, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, KantoPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokecenter1FGentlemanScript, -1
	object_event  10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoPokecenter1FPharmacistScript, -1
	object_event  13,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoPokecenter1FCooltrainerFScript, -1
