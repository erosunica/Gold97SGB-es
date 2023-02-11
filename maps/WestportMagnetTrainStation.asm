	object_const_def ; object_event constants
	const SWISLANDS_HOSPITAL_NURSE
	const SWISLANDS_HOSPITAL_ROCKER
	const SWISLANDS_HOSPITAL_JANINE

WestportMagnetTrainStation_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SWIslandsHospitalJanine:
	jumptextfaceplayer SWIslandsHospitalJanineText

SWIslandsHospitalNurse:
	jumptextfaceplayer SWIslandsHospitalNurseText

SWIslandsHospitalRocker:
	jumptextfaceplayer SWIslandsHospitalRockerText
	
SWIslandsHospitalJanineText:
	text "¡Mi novio y yo"
	line "estamos de"
	cont "vacaciones!"
	done
	
SWIslandsHospitalRockerText:
	text "Nunca había estado"
	line "en las ISLAS"
	cont "PONIENTES."

	para "Hay mucho que ver"
	line "aquí."
	done

SWIslandsHospitalNurseText:
	text "¿#MON? No, este"
	line "hotel es para"
	cont "gente."

	para "Estamos completos."
	done

WestportMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  7, KANTO_REGION, 16
	warp_event  2,  7, KANTO_REGION, 16

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SWIslandsHospitalNurse, -1
	object_event 10,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SWIslandsHospitalRocker, -1
	object_event 12,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SWIslandsHospitalJanine, -1
