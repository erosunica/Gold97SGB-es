	object_const_def ; object_event constants
	const BIRDONPOKECENTER1F_NURSE
	const BIRDONPOKECENTER1F_GENTLEMAN
	const BIRDONPOKECENTER1F_FISHING_GURU
	const BIRDONPOKECENTER1F_POKEFAN_F

BirdonPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

BirdonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

BirdonPokecenter1FGentlemanScript:
	jumptextfaceplayer BirdonPokecenter1FGentlemanText

BirdonPokecenter1FFishingGuruScript:
	jumptextfaceplayer BirdonPokecenter1FFishingGuruText

BirdonPokecenter1FPokefanFScript:
	jumptextfaceplayer BirdonPokecenter1FPokefanFText

BirdonPokecenter1FGentlemanText:
	text "¿Tus #MON saben"
	line "movimientos MO?"

	para "Se pueden usar"
	line "estos movimientos"
	para "aunque el #MON"
	line "esté debilitado."
	done

BirdonPokecenter1FUnusedText:
; unreferenced
	text "BILL creó el"
	line "Sistema de"

	para "Almacenamiento en"
	line "PC de los #MON."

	para "El PC de BILL"
	line "almacena hasta 20"
	cont "#MON por CAJA."
	done

BirdonPokecenter1FFishingGuruText:
	text "El PC de BILL"
	line "puede almacenar"
	para "hasta 20 #MON"
	line "por CAJA."
	done

BirdonPokecenter1FPokefanFText:
	text "¿Sabes algo sobre"
	line "los BONGURI?"

	para "Abre uno, vacíalo"
	line "y rellénalo con"
	para "un aparato"
	line "especial."

	para "Así podrás atrapar"
	line "#MON."

	para "Antes de que se"
	line "inventaran las"

	para "# BALL, todos"
	line "usaban BONGURI."
	done

BirdonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BIRDON_TOWN, 1
	warp_event  6,  7, BIRDON_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FNurseScript, -1
	object_event  11,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FGentlemanScript, -1
	object_event  10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FPokefanFScript, -1
