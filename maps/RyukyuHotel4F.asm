	object_const_def ; object_event constants
	const RYUKYU_HOTEL_4F_PLACEHOLDER_1
	const RYUKYU_HOTEL_4F_PLACEHOLDER_2
	const RYUKYU_HOTEL_4F_PLACEHOLDER_3
	const RYUKYU_HOTEL_4F_POKEFAN_M
	const RYUKYU_HOTEL_4F_FISHER

RyukyuHotel4F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .FlipStairs4F

.FlipStairs4F:
	changeblock  19,  1, $1E ; flipped
	return
	
RyukyuHotel4FPokefanM:
	jumptextfaceplayer RyukyuHotel4FPokefanMText
	
RyukyuHotel4FFisher:
	jumptextfaceplayer RyukyuHotel4FFisherText
	
HotelDoorLockedScript4F:
	jumptextfaceplayer HotelDoorLockedText4F

RyukyuHotel4FPokefanMText:
	text "¿Eres de por aquí?"

	para "¿PUEBLO SILENTE,"
	line "dices? Eso está"
	cont "muy lejos."
	done

RyukyuHotel4FFisherText:
	text "¡No puedo esperar"
	line "a pescar otro día"
	cont "más en la costa!"
	done

HotelDoorLockedText4F:
	text "La puerta está"
	line "cerrada…"
	done

RyukyuHotel4F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16,  0, RYUKYU_ELEVATOR, 1
	warp_event 19,  0, RYUKYU_HOTEL_3F, 3
	warp_event 18,  0, RYUKYU_HOTEL_5F, 2
	warp_event 13,  2, RYUKYU_HOTEL_ROOMS, 9
	warp_event 13, 14, RYUKYU_HOTEL_ROOMS, 11

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event   7,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript4F, -1
	object_event   1,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript4F, -1
	object_event   7, 14, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript4F, -1
	object_event  15,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuHotel4FPokefanM, -1
	object_event  10, 15, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotel4FFisher, -1
