	object_const_def ; object_event constants
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY

CopycatsHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CopycatsHouse1FPokefanMScript:
	jumptextfaceplayer CopycatsHouse1FPokefanMText

CopycatsHouse1FPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CopycatsHouse1FPokefanFText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CopycatsHouse1FPokefanFText_ReturnedMachinePart
	waitbutton
	closetext
	end

CopycatsHouse1FMiltankScript:
	opentext
	writetext CopycatsHouse1FMiltankText
	cry MILTANK
	waitbutton
	closetext
	end

CopycatsHouse1FPokefanMText:
	text "A mi hija le gusta"
	line "imitar a la gente."

	para "Y por eso la"
	line "llaman COPIONA."
	done

CopycatsHouse1FPokefanFText:
	text "Mi hija es muy"
	line "introvertida…"

	para "Tiene muy pocos"
	line "amigos."
	done

CopycatsHouse1FPokefanFText_ReturnedMachinePart:
	text "Acaba de perder el"
	line "# MUÑECO que le"
	para "regaló un niño"
	line "hace tres años."

	para "Desde entonces,"
	line "imita a la gente"
	cont "mucho mejor…"
	done

CopycatsHouse1FMiltankText:
	text "MILTANK: ¡Mooo!"
	done

CopycatsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, RYUKYU_CITY, 8
	warp_event  3,  7, RYUKYU_CITY, 8
	warp_event  2,  0, COPYCATS_HOUSE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanMScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	object_event  6,  6, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FMiltankScript, -1
