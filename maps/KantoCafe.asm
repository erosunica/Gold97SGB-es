	object_const_def ; object_event constants
	const KANTOCAFE_SUPER_NERD
	const KANTOCAFE_FISHER1

KantoCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCafeChef:
	checkevent EVENT_GUY_GIVES_MYSTERYBERRY
	iftrue .TrashEmpty
	faceplayer
	opentext
	writetext KantoCafeChefText1
	waitbutton
	verbosegiveitem LEFTOVERS
	iffalse .PackFull
	closetext
	setevent EVENT_GUY_GIVES_MYSTERYBERRY
	end

.PackFull:
	closetext
	end

.TrashEmpty:
	faceplayer
	opentext
	writetext AlreadyGotLeftovers
	waitbutton
	closetext
	end
	
KantoCafeFisher1:
	jumptextfaceplayer KantoCafeFisher1Text
	
KantoCafeFisher1Text:
	text "Dirijo el CASINO."

	para "¡Prueba tu suerte"
	line "y podrás ser un"
	cont "gran ganador!"
	done

KantoCafeChefText1:
	text "No he podido"
	line "terminar mi"
	cont "comida."

	para "A lo mejor tus"
	line "#MON la"
	cont "quieren."
	done

AlreadyGotLeftovers:
	text "No tengo nada más"
	line "que darte."
	done

FoundLeftoversText:
	text "<PLAYER> encontró"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

NoRoomForLeftoversText:
	text "Pero <PLAYER> no"
	line "tiene espacio…"
	done

KantoCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 9
	warp_event  5,  7, KANTO_REGION, 9

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoCafeChef, -1
	object_event  6,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafeFisher1, -1
	