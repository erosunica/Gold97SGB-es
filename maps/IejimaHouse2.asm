	object_const_def ; object_event constants
	const IEJIMA_HOUSE2_TEACHER
	const IEJIMA_HOUSE2_BUGCATCHER
	const IEJIMA_HOUSE2_TWIN

IejimaHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
IejimaTownHouse2Teacher:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .House2TeacherNotFixed
	writetext IejimaTownHouse2TeacherText
	waitbutton
	closetext
	end
	
.House2TeacherNotFixed
	writetext IejimaTownHouse2TeacherText2
	waitbutton
	closetext
	end
	
IejimaTownHouse2BugCatcher:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .House2BugCatcherNotFixed
	writetext IejimaTownHouse2BugCatcherText
	waitbutton
	closetext
	end
	
.House2BugCatcherNotFixed
	writetext IejimaTownHouse2BugCatcherText2
	waitbutton
	closetext
	end
	
IejimaTownHouse2Twin:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .House2TwinNotFixed
	writetext IejimaTownHouse2TwinText
	waitbutton
	closetext
	end
	
.House2TwinNotFixed
	writetext IejimaTownHouse2TwinText2
	waitbutton
	closetext
	end
	
IejimaTownHouse2TeacherText2:
	text "A mis niños les"
	line "encanta nadar en"
	para "el estanque que"
	line "hay frente a la"
	para "cascada, pero"
	line "ahora no podemos"
	cont "hacerlo."
	done

IejimaTownHouse2TeacherText:
	text "Tendré que llevar"
	line "a mis niños a"
	cont "nadar pronto."
	done

IejimaTownHouse2BugCatcherText2:
	text "¡Quiero ir a"
	line "nadar!"
	done

IejimaTownHouse2BugCatcherText:
	text "¡Vamos a nadar!"
	done

IejimaTownHouse2TwinText2:
	text "¿Por qué no"
	line "podemos ir a"
	cont "nadar?"
	done

IejimaTownHouse2TwinText:
	text "¡Me encanta ir a"
	line "nadar!"
	done
	
IejimaHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IEJIMA_TOWN, 4
	warp_event  5,  7, IEJIMA_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, IejimaTownHouse2Teacher, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownHouse2BugCatcher, -1
	object_event  9,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IejimaTownHouse2Twin, -1
