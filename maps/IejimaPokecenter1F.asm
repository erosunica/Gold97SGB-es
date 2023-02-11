	object_const_def ; object_event constants
	const IEJIMAPOKECENTER1F_NURSE
	const IEJIMAPOKECENTER1F_JANINE
	const IEJIMAPOKECENTER1F_GENTLEMAN

IejimaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IejimaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

IejimaPokecenter1FJanineScript:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NotFixedYetIejimaTownPokecenterJanine
	writetext IejimaPokecenter1FJanineText
	waitbutton
	closetext
	end
	
.NotFixedYetIejimaTownPokecenterJanine
	writetext IejimaPokecenter1FJanineText2
	waitbutton
	closetext
	end

IejimaPokecenter1FGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NotFixedYetIejimaTownPokecenterGentleman
	writetext IejimaPokecenter1FGentlemanText
	waitbutton
	closetext
	end
	
.NotFixedYetIejimaTownPokecenterGentleman
	writetext IejimaPokecenter1FGentlemanText2
	waitbutton
	closetext
	end

IejimaPokecenter1FJanineText2:
	text "¿Qué está pasando"
	line "aquí?"

	para "¿Por qué no cae"
	line "agua por la"
	cont "cascada?"
	done

IejimaPokecenter1FJanineText:
	text "Seguro que esos"
	line "MOTORISTAS han"
	cont "aprendido la"
	cont "lección."
	done

IejimaPokecenter1FGentlemanText:
	text "¡Qué bonito es"
	line "este pueblo!"
	done

IejimaPokecenter1FGentlemanText2:
	text "¡Oh, cielos!"

	para "¿Por qué está el"
	line "pueblo lleno de"
	cont "rufianes?"
	done

IejimaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, IEJIMA_TOWN, 2
	warp_event  6,  7, IEJIMA_TOWN, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IejimaPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaPokecenter1FJanineScript, -1
	object_event  9,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, IejimaPokecenter1FGentlemanScript, -1
