	object_const_def ; object_event constants
	const KUMEPOKECENTER1F_NURSE
	const KUMEPOKECENTER1F_TEACHER
	const KUMEPOKECENTER1F_JIGGLYPUFF
	const KUMEPOKECENTER1F_BUG_CATCHER
	const KUMEPOKECENTER1F_CHRIS

KumePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

KumePokecenter1FTeacherScript:
	jumptextfaceplayer KumePokecenter1FTeacherText

KumeJigglypuff:
	opentext
	writetext KumeJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

KumePokecenter1FBugCatcherScript:
	jumptextfaceplayer KumePokecenter1FBugCatcherText

Chris:
	faceplayer
	opentext
	trade NPC_TRADE_CHRIS
	waitbutton
	closetext
	end

KumePokecenter1FTeacherText:
	text "Sí… ¡Y ni siquiera"
	line "es un verdadero"
	cont "LÍDER de GIMNASIO!"

	para "¿Sí? Estoy al"
	line "teléfono. ¡Fuera!"
	done

KumeJigglypuffText:
	text "JIGGLYPUFF: Puff,"
	line "puff."
	done

KumePokecenter1FBugCatcherText:
	text "Casi todos los"
	line "#MON se duermen"
	para "al oír cantar a"
	line "JIGGLYPUFF."

	para "Cuando un #MON"
	line "está dormido sólo"
	para "se pueden usar"
	line "ciertos movi-"
	cont "mientos."
	done

KumePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KUME_CITY, 2
	warp_event  6,  7, KUME_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, KumePokecenter1FNurseScript, -1
	object_event 10,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumePokecenter1FTeacherScript, -1
	object_event  2,  3, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KumeJigglypuff, -1
	object_event  3,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumePokecenter1FBugCatcherScript, -1
	object_event 10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Chris, -1
