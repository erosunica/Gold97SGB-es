	object_const_def ; object_event constants
	const FROSTPOINTOTHERHOUSE_GUY

FrostpointOtherHouse_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

FrostpointOtherHouse:
	jumptextfaceplayer FrostpointOtherHouseText
	end
	
FrostpointOtherHouseText:
	text "En PUEBLO ESCARCHA"
	line "hace frío y además"
	cont "está lejos."

	para "No recibimos"
	line "muchos turistas."

	para "Pero quienes vivi-"
	line "mos aquí somos una"
	cont "comunidad unida."
	done


FrostpointOtherHouseRadio:
	jumpstd Radio2Script

FrostpointOtherHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 5
	warp_event  5,  7, FROSTPOINT_TOWN, 5

	db 0 ; coord events


	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, FrostpointOtherHouseRadio

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, FrostpointOtherHouse, -1
