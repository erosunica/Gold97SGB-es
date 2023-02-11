	object_const_def ; object_event constants
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

KikaiVillageHiddenPowerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	promptbutton
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.Done:
	closetext
	end

HiddenPowerHouseBookshelf:
	jumpstd DifficultBookshelfScript

HiddenPowerGuyText1:
	text "Te has perdido…"

	para "Yo he estado aquí"
	line "meditando y un"
	para "nuevo poder ha na-"
	line "cido dentro de mí."

	para "Déjame compartir"
	line "mi poder con tus"

	para "#MON."
	line "Toma esto, joven."
	done

HiddenPowerGuyText2:
	text "¿Lo ves? ¡Es PODER"
	line "OCULTO!"

	para "Saca el poder de"
	line "los #MON para"
	cont "atacar."

	para "Recuerda: su tipo"
	line "y poder dependen"
	para "del #MON que"
	line "lo usa."
	done

HiddenPowerGuyText3:
	text "Estoy meditando…"
	done

KikaiVillageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KIKAI_VILLAGE, 1
	warp_event  3,  7, KIKAI_VILLAGE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
