	object_const_def ; object_event constants
	const SKATEBOARDERHOUSE_GRAMPS

SkateboarderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SkateboarderHouseSkateboarderDude:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iffalse .nobicycleyet
	checkevent EVENT_GOT_SKATEBOARD
	iftrue .alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText
	waitbutton
	verbosegiveitem SKATEBOARD
	setevent EVENT_GOT_SKATEBOARD
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end
	
.alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end

.nobicycleyet
	writetext SkateboarderHouseSkateboarderDudeTextNoBike
	waitbutton
	closetext
	end

SkateboarderHouseSkateboarderDudeText:
	text "¡Pero bueno,"
	line "chaval!"

	para "¿Sigues yendo por"
	line "ahí en bici?"
	para "¡Ponte a la moda!"

	para "¡Va siendo hora de"
	line "que patines!"

	para "¡Anda, toma esto!"
	done
	
SkateboarderHouseSkateboarderDudeText2:
	text "¡Así sí, chaval!"

	para "¡Con este"
	line "monopatín, puedes"
	para "ir rápidamente por"
	line "hasta más sitios"
	cont "que con una bici!"
	done
	
SkateboarderHouseSkateboarderDudeTextNoBike:
	text "¡Pero bueno,"
	line "chaval!"

	para "¿Qué haces yendo"
	line "a pata?"
	para "¡Si no sueles ir"
	line "en bici, menos"
	cont "podrás ir en"
	cont "monopatín!"
	done
	

SkateboarderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 7
	warp_event  5,  7, SUNPOINT_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_SOUTH, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SkateboarderHouseSkateboarderDude, -1
