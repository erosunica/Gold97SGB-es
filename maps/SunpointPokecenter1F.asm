	object_const_def ; object_event constants
	const SUNPOINTPOKECENTER1F_NURSE
	const SUNPOINTPOKECENTER1F_LASS
	const SUNPOINTPOKECENTER1F_GYM_GUY
	const SUNPOINTPOKECENTER1F_SUPER_NERD

SunpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SunpointPokecenter1FLassScript:
	jumptextfaceplayer SunpointPokecenter1FLassText

StandGymGuyScript:
	faceplayer
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iftrue .StandGymGuyWinScript
	opentext
	writetext StandGymGuyText
	waitbutton
	closetext
	end

.StandGymGuyWinScript:
	opentext
	writetext StandGymGuyWinText
	waitbutton
	closetext
	end

SunpointPokecenter1FSuperNerdScript:
	jumptextfaceplayer SunpointPokecenter1FSuperNerdText

SunpointPokecenter1FLassText:
	text "¿A veces no te dan"
	line "ganas de enseñar"
	cont "tus #MON a tus"
	cont "amigos?"
	para "Yo siempre presumo"
	line "de mi precioso"
	cont "BELLEDAM."
	done

StandGymGuyText:
	text "¿Has ido al"
	line "MUELLE?"
	para "Se está cociendo"
	line "algo sospechoso"
	cont "allí."
	done

StandGymGuyWinText:
	text "¿Esos que estaban"
	line "en el MUELLE no"
	para "eran miembros del"
	line "TEAM ROCKET?"
	para "¡No puedo creer"
	line "que hayan vuelto"
	cont "a dar la cara!"
	done

SunpointPokecenter1FUnusedText1:
; unreferenced
	text "¿A veces no te dan"
	line "ganas de enseñar"
	cont "tus #MON a tus"
	cont "amigos?"

	para "Ojalá pudiera"
	line "enseñarle a mi"
	para "amigo en PAGOTA"
	line "el #MON que he"
	cont "criado."
	done

SunpointPokecenter1FUnusedText2:
; unreferenced
	text "He estado comba-"
	line "tiendo contra mi"
	para "amigo en PAGOTA"
	line "usando el cable"
	cont "del ADAPTADOR"
	cont "MÓVIL."

	para "Voy perdiendo 5 a"
	line "7. ¡Tengo que"
	cont "remontar!"
	done

SunpointPokecenter1FSuperNerdText:
	text "Me encanta enseñar"
	line "los #MON que"
	cont "he criado."

	para "¿A ti no?"
	para "¡Voy a participar"
	line "en muchos combates"
	para "para poder mostrar"
	line "a mis #MON!"
	done

SunpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SUNPOINT_CITY, 3
	warp_event  6,  7, SUNPOINT_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FLassScript, -1
	object_event 10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FSuperNerdScript, -1
