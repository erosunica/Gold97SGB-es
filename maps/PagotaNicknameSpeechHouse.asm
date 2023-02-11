	object_const_def ; object_event constants
	const PAGOTANICKNAMESPEECHHOUSE_TEACHER
	const PAGOTANICKNAMESPEECHHOUSE_LASS
	const PAGOTANICKNAMESPEECHHOUSE_BIRD

PagotaNicknameSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaNicknameSpeechHouseTeacherScript:
	jumptextfaceplayer PagotaNicknameSpeechHouseTeacherText

PagotaNicknameSpeechHouseLassScript:
	jumptextfaceplayer PagotaNicknameSpeechHouseLassText

PagotaNicknameSpeechHouseBirdScript:
	faceplayer
	opentext
	writetext PagotaNicknameSpeechHouseBirdText
	cry PIDGEY
	waitbutton
	closetext
	end
	
NicknameHouseRadio:
	jumpstd Radio2Script


PagotaNicknameSpeechHouseTeacherText:
	text "Usa los nombres"
	line "de sus comidas"
	cont "favoritas."

	para "Quiero decir,"
	line "como motes para"
	cont "sus #MON."
	done

PagotaNicknameSpeechHouseLassText:
	text "¡A mi PIDGEY le"
	line "llamo FRESITA!"
	done

PagotaNicknameSpeechHouseBirdText:
	text "FRESITA: ¡Pidgey!"
	done

PagotaNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 4
	warp_event  4,  7, PAGOTA_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  1, BGEVENT_READ, NicknameHouseRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaNicknameSpeechHouseTeacherScript, -1
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PagotaNicknameSpeechHouseBirdScript, -1
