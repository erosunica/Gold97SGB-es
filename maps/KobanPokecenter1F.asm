	object_const_def ; object_event constants
	const KOBANPOKECENTER1F_NURSE
	const KOBANPOKECENTER1F_GENTLEMAN
	const KOBANPOKECENTER1F_TEACHER
	const KOBANPOKECENTER1F_YOUNGSTER

KobanPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

KobanPokecenter1FGentlemanScript:
	jumptextfaceplayer KobanPokecenter1FGentlemanText

KobanPokecenter1FTeacherScript:
	jumptextfaceplayer KobanPokecenter1FTeacherText

KobanPokecenter1FYoungsterScript:
	jumptextfaceplayer KobanPokecenter1FYoungsterText
	

KobanPokecenter1FGentlemanText:
	text "Este pueblo no"
	line "recibe muchos"
	cont "visitantes."

	para "Solo viene gente"
	line "que quiere entre-"
	cont "nar en la cueva."
	done

KobanPokecenter1FTeacherText:
	text "He vivido en esta"
	line "isla toda mi vida"
	cont "y no te he visto"
	cont "antes."

	para "Supongo que vienes"
	line "a aprender sobre"
	cont "los #MON"
	cont "dragón."
	done

KobanPokecenter1FYoungsterText:
	text "No me interesan"
	line "los #MON"
	cont "dragón."

	para "No tengo mucho que"
	line "hacer aquí."

	para "Algún día me"
	line "marcharé."
	done


KobanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KOBAN_ISLAND, 3
	warp_event  6,  7, KOBAN_ISLAND, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FNurseScript, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FGentlemanScript, -1
	object_event 10,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FTeacherScript, -1
	object_event 14,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FYoungsterScript, -1
