	object_const_def ; object_event constants
	const SANSKRITPOKECENTER1F_NURSE
	const SANSKRITPOKECENTER1F_POKEFAN_M
	const SANSKRITPOKECENTER1F_YOUNGSTER
	const SANSKRITPOKECENTER1F_COOLTRAINER_F

SanskritPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SanskritPokecenter1FPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iffalse .SanskritPokecenterRocketsInTown
	writetext SanskritPokecenter1FPokefanMText
	waitbutton
	closetext
	end
	
.SanskritPokecenterRocketsInTown
	writetext SanskritPokecenter1FPokefanMText2
	waitbutton
	closetext
	end

SanskritPokecenter1FYoungsterScript:
	jumptextfaceplayer SanskritPokecenter1FYoungsterText

SanskritPokecenter1FCooltrainerFScript:
	jumptextfaceplayer SanskritPokecenter1FCooltrainerFText

SanskritPokecenter1FPokefanMText:
	text "¡Adiós al TEAM"
	line "ROCKET!"

	para "¡No tienen cabida"
	line "en nuestro pueblo!"
	done

SanskritPokecenter1FPokefanMText2:
	text "¿Qué es esto? ¿Ha"
	line "vuelto el TEAM"
	cont "ROCKET?"
	
	para "Hay una casa en"
	line "el pueblo en la"
	cont "que hay muchos"
	cont "miembros."

	para "Me pregunto qué"
	line "están tramando…"
	done

SanskritPokecenter1FYoungsterText:
	text "No permito que mis"
	line "#MON evolu-"
	cont "cionen demasiado"
	cont "pronto."

	para "Antes de dejarles"
	line "evolucionar, les"
	para "enseño algunos"
	line "movimientos."
	done

SanskritPokecenter1FCooltrainerFText:
	text "Al evolucionar,"
	line "los #MON se"
	para "fortalecen, pero"
	line "tardan más en"
	cont "aprender ataques."
	done

SanskritPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SANSKRIT_TOWN, 4
	warp_event  6,  7, SANSKRIT_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FCooltrainerFScript, -1
