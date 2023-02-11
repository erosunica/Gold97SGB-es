	object_const_def ; object_event constants
	const STANDPOKECENTER1F_NURSE
	const STANDPOKECENTER1F_COOLTRAINER_M
	const STANDPOKECENTER1F_COOLTRAINER_F
	const STANDPOKECENTER1F_JANINE_IMPERSONATOR

StandPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

StandPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

StandPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FCooltrainerMRocketsGone
	writetext StandPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end
	
.StandPokecenter1FCooltrainerMRocketsGone
	writetext StandPokecenter1FCooltrainerMText2
	waitbutton
	closetext
	end

StandPokecenter1FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FCooltrainerFRocketsGone
	writetext StandPokecenter1FCooltrainerFText
	waitbutton
	closetext
	end
	
.StandPokecenter1FCooltrainerFRocketsGone
	writetext StandPokecenter1FCooltrainerFText2
	waitbutton
	closetext
	end

StandPokecenter1FJanineImpersonatorScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FJanineImpersonatorRocketsGone
	writetext StandPokecenter1FJanineImpersonatorText1
	waitbutton
	closetext
	end
	
.StandPokecenter1FJanineImpersonatorRocketsGone
	writetext StandPokecenter1FJanineImpersonatorText2
	waitbutton
	closetext
	end

StandPokecenter1FCooltrainerMText:
	text "Me preocupa que"
	line "mi #MON se"
	cont "enferme."
	done

StandPokecenter1FCooltrainerMText2:
	text "Los trabajadores"
	line "del ZOO de CIUDAD"
	para "ENHIESTA se están"
	line "esforzando mucho"
	para "para que los"
	line "#MON estén"
	cont "sanos."
	done

StandPokecenter1FCooltrainerFText:
	text "¿Qué está pasando"
	line "en esta ciudad?"
	para "Normalmente está"
	line "todo muy"
	cont "tranquilo."
	done

StandPokecenter1FCooltrainerFText2:
	text "¡Tienes un montón"
	line "de MEDALLAS!"

	para "¿Ya has ido a la"
	line "LIGA?"
	para "Un día quiero"
	line "escalar el MT."
	cont "FUJI."
	done

StandPokecenter1FJanineImpersonatorText1:
	text "Vine de visita a"
	line "CIUDAD ENHIESTA"
	para "para ver el PARQUE"
	line "NACIONAL y todos"
	cont "sus #MON."

	para "Qué rabia que no"
	line "pueda hacer nada"
	cont "de eso ahora"
	cont "mismo…"
	done

StandPokecenter1FJanineImpersonatorText2:
	text "¡CIUDAD ENHIESTA"
	line "tiene tantas cosas"
	cont "interesantes que"
	cont "ver!"
	done

StandPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, STAND_CITY, 5
	warp_event  6,  7, STAND_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FNurseScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FCooltrainerMScript, -1
	object_event 13,  6, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FJanineImpersonatorScript, -1
