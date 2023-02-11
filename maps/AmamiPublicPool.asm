	object_const_def ; object_event constants
	const AMAMI_PUBLIC_POOL_SQUIRTLE_GIRL
	const AMAMI_PUBLIC_POOL_SWIMMER_GUY
	const AMAMI_PUBLIC_POOL_SWIMMER_GIRL
	const AMAMI_PUBLIC_POOL_GRANNY
	const AMAMI_PUBLIC_POOL_BUG_CATCHER
	const AMAMI_PUBLIC_POOL_LASS

AmamiPublicPool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiPublicPoolSwimmerSquirtle:
	faceplayer
	opentext
	checkevent EVENT_GOT_SQUIRTLE_FROM_POOL
	iftrue .AlreadyGotSquirtle
	writetext ILoveSquirtleText
	yesorno
	iffalse .DontTakeSquirtle
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSquirtle
	writetext ReceiveSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writetext GiveSquirtleText
	waitbutton
	closetext
	setevent EVENT_GOT_SQUIRTLE_FROM_POOL
	end
	
.AlreadyGotSquirtle
	writetext AlreadyGotSquirtleText
	waitbutton
	closetext
	end
	
.DontTakeSquirtle
	writetext NoSquirtleText
	waitbutton
	closetext
	end
	
.PartyFullSquirtle
	writetext PartyFullSquirtleText
	waitbutton
	closetext
	end
	
AmamiPublicPoolSwimmerGuyScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGuyText
	
AmamiPublicPoolSwimmerGirlScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGirlText
	
AmamiPublicPoolGrannyScript:
	jumptextfaceplayer AmamiPublicPoolGrannyText
	
AmamiPublicPoolBugCatcherScript:
	jumptextfaceplayer AmamiPublicPoolBugCatcherText

AmamiPublicPoolLassScript:
	jumptextfaceplayer AmamiPublicPoolLassText
	
AmamiPublicPoolLassText:
	text "Un ambiente más"
	line "controlado, como"
	para "una piscina"
	line "cubierta, puede"
	para "ser un lugar mejor"
	line "para entrenar"
	para "#MON débiles"
	line "que en mar"
	cont "abierto."
	done

AmamiPublicPoolBugCatcherText:
	text "¡Quiero ir a"
	line "nadar!"
	done

AmamiPublicPoolGrannyText:
	text "Ya no nado tan"
	line "bien como antes."

	para "Pero a mis #MON"
	line "les encanta el"
	para "agua, así que los"
	line "traigo aquí a"
	cont "menudo."
	done

AmamiPublicPoolSwimmerGirlText:
	text "¡A los #MON de"
	line "agua les encanta"
	cont "nadar!"

	para "Tiene sentido,"
	line "¿no?"
	done

AmamiPublicPoolSwimmerGuyText:
	text "¡Nadar es un buen"
	line "ejercicio tanto"
	cont "para personas como"
	cont "#MON!"
	done

ReceiveSquirtleText:
	text "<PLAYER> recibió a"
	line "SQUIRTLE."
	done

AlreadyGotSquirtleText:
	text "¡Vengo a nadar"
	line "aquí con mi"
	cont "SQUIRTLE casi a"
	cont "diario!"
	done

PartyFullSquirtleText:
	text "¡Ya llevas muchos"
	line "#MON en tu"
	cont "equipo!"
	done

NoSquirtleText:
	text "¿Seguro?"

	para "¡Es un gran"
	line "#MON!"
	done

ILoveSquirtleText:
	text "¡Los SQUIRTLE son"
	line "fantásticos"
	cont "nadadores!"

	para "¿Has nadado alguna"
	line "vez con uno?"

	para "¡Tienes que"
	line "intentarlo!"

	para "Entrenarlos"
	line "también es una"
	cont "gran experiencia."

	para "Tengo uno joven"
	line "que necesita que"
	cont "alguien lo cuide."

	para "¡Deberías entrenar"
	line "a este SQUIRTLE!"

	para "¿Te gustaría"
	line "llevártelo?"
	done

GiveSquirtleText:
	text "¡Ayúdalo a crecer"
	line "sano y fuerte!"
	done
	
AmamiPublicPool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, AMAMI_TOWN, 5
	warp_event  7, 17, AMAMI_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerSquirtle, -1
	object_event  9,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGuyScript, -1
	object_event  11, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGirlScript, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolGrannyScript, -1
	object_event  3, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolBugCatcherScript, -1
	object_event 18,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolLassScript, -1
