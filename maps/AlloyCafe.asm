	object_const_def ; object_event constants
	const ALLOYCAFE_SAILOR1
	const ALLOYCAFE_FISHING_GURU
	const ALLOYCAFE_SAILOR2
	const ALLOYCAFE_CLERK

AlloyCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotStrength
	writetext AlloyCafeStrengthSailorText
	buttonsound
	verbosegiveitem HM_FLY
	setevent EVENT_GOT_HM02_FLY
.GotStrength:
	writetext AlloyCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end
	
AlloyCafeClerkScript:
	jumptextfaceplayer AlloyCafeClerkText

AlloyCafeFishingGuruScript:
	jumptextfaceplayer AlloyCafeFishingGuruText

AlloyCafeSailorScript:
	jumptextfaceplayer AlloyCafeSailorText

AlloyCafeStrengthSailorText:
	text "¡Jaja! ¡Navegar es"
	line "una forma de"
	cont "viajar anticuada!"

	para "¡Y andar también!"

	para "¿Por qué no dejas"
	line "que tu #MON te"
	cont "lleve volando?"
	done

AlloyCafeStrengthSailorText_GotStrength:
	text "Los barcos aún"
	line "tienen que navegar"
	para "porque los #MON"
	line "voladores no"
	cont "pueden llevar"
	cont "carga."
	done

AlloyCafeFishingGuruText:
	text "¡El menú del CAFÉ"
	line "ALEAR está repleto"
	para "de buena comida"
	line "para quien venga"
	cont "con hambre!"
	done

AlloyCafeSailorText:
	text "Cuando estoy de"
	line "paso, siempre"
	cont "visito el CAFÉ"
	cont "ALEAR."

	para "¡Aquí todo está de"
	line "rechupete!"
	done

AlloyCafeClerkText:
	text "¡Bienvenido al"
	line "CAFÉ ALEAR!"

	para "¡Tenemos comida al"
	line "gusto de todo"
	cont "paladar!"
	done

AlloyCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ALLOY_CITY, 7
	warp_event  3,  7, ALLOY_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  6,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeStrengthSailorScript, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeFishingGuruScript, -1
	object_event  5,  6, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeSailorScript, -1
	object_event  1,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeClerkScript, -1
