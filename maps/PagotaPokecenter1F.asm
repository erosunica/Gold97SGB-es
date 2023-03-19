	object_const_def ; object_event constants
	const PAGOTAPOKECENTER1F_NURSE
	const PAGOTAPOKECENTER1F_GAMEBOY_KID
	const PAGOTAPOKECENTER1F_GENTLEMAN
	const PAGOTAPOKECENTER1F_YOUNGSTER
	const PAGOTAPOKECENTER1F_SCIENTIST

PagotaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaPokecenterNurse:
	jumpstd PokecenterNurseScript

PagotaPokecenter1F_Oak2sAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	iftrue .SecondTimeAsking
	writetext UnknownText_0x69555
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	stringtotext .eggname, MEM_BUFFER_1
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	;setevent EVENT_TOGEPI_HATCHED
	clearevent EVENT_OAK2S_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	;setmapscene ROUTE_112, SCENE_ROUTE112_OFFER_SLOWPOKETAIL
	writetext UnknownText_0x695c5
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTAPOKECENTER1F_SCIENTIST
	waitsfx
	clearevent EVENT_MET_BILL
	end

.AideWalksAroundPlayer:
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTAPOKECENTER1F_SCIENTIST
	clearevent EVENT_MET_BILL
	waitsfx
	end

.eggname
	db "HUEVO@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext UnknownText_0x69693
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext UnknownText_0x696f2
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	end

.SecondTimeAsking:
	writetext UnknownText_0x69712
	jump .AskTakeEgg

PagotaPokecenter1FGameboyKidScript:
	jumptextfaceplayer PagotaPokecenter1FGameboyKidText

PagotaPokecenter1FGentlemanScript:
	jumptextfaceplayer PagotaPokecenter1FGentlemanText

PagotaPokecenter1FYoungsterScript:
	jumptextfaceplayer PagotaPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end

UnknownText_0x69555:
	text "<PLAYER>, cuánto"
	line "tiempo sin vernos."

	para "El PROF. OAK me ha"
	line "pedido que te"
	cont "encontrase."

	para "Tiene otro favor"
	line "que pedirte."

	para "¿Podrías quedarte"
	line "con este HUEVO"
	cont "#MON?"
	
	para "Saber un poco más" 
	line "sobre cómo se"
	para "relacionan los"
	line "bebés #MON con"
	para "otros #MON y"
	line "cómo puede influir"
	para "en su desarrollo"
	line "sería de ayuda"
	cont "para nuestra"
	cont "investigación."
	
	para "Así que, ¿podrías"
	line "encargarte del"
	cont "HUEVO?"
	done

UnknownText_0x695c5:
	text "¿Qué #MON hay"
	line "en el huevo?"
	
	para "¡Bueno, preferimos"
	line "que sea una"
	cont "sorpresa!"
	
	para "¡Estoy seguro de"
	line "que será una buena"
	para "adición para tu"
	line "equipo!"
	
	para "¡Considéralo un"
	line "regalo!"
	
	para "Por cierto, ¿has"
	line "oído que BILL está"
	cont "en la ciudad?"
	
	para "Por si no lo"
	line "sabías, ¡él creó"
	para "el Sistema de"
	line "Almacenamiento de"
	cont "los PC!"
	
	para "Es muy respetado"
	line "por los investi-"
	cont "gadores #MON."
	
	para "Deberías ir a"
	line "visitarlo si"
	cont "tienes la"
	cont "oportunidad."
	
	para "¡Bueno, me marcho!"
	line "¡Nos vemos!"
	done

UnknownText_0x69693:
	text "¡Oh, no! No puedes"
	line "llevar más"
	cont "#MON."

	para "Esperaré aquí a"
	line "que le hagas"
	cont "sitio al HUEVO."
	done

UnknownText_0x696f2:
	text "Pero…"
	line "El PROF. OAK"
	cont "preguntó por ti."
	done

UnknownText_0x69712:
	text "<PLAYER>, ¿tomas"
	line "el HUEVO?"
	done

UnknownText_0x6972d:
	text "He pensado que"
	line "sería genial co-"
	cont "nectarme y luchar"
	cont "con mis amigos que"
	cont "viven lejos."
	done

UnknownText_0x69791:
	text "Combatí con un"
	line "amigo de CALORINA"
	para "mediante un enlace"
	line "móvil."

	para "Si conectas un"
	line "ADAPTADOR DE MÓVIL"
	para "puedes enlazar con"
	line "un/a amigo/a"
	cont "lejano/a."
	done

PagotaPokecenter1FGameboyKidText:
	text "Un tal BILL creó"
	line "el Sistema de"

	para "Almacenamiento"
	line "de #MON."
	done

PagotaPokecenter1FGentlemanText:
	text "Fue hace un año"
	line "más o menos."

	para "El TEAM ROCKET"
	line "quería hacer daño"
	cont "a los #MON."

	para "Pero prevaleció la"
	line "justicia y un niño"
	cont "acabó con ellos."
	done

PagotaPokecenter1FYoungsterText:
	text "Los #MON son"
	line "listos y no"
	para "obedecen a quien"
	line "no respetan."

	para "Sin las MEDALLAS"
	line "necesarias, harán"
	cont "lo que ellos"
	cont "quieran."
	done

PagotaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, PAGOTA_CITY, 5
	warp_event  6,  7, PAGOTA_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PagotaPokecenterNurse, -1
	object_event  11,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1F_Oak2sAideScript, EVENT_OAK2S_AIDE_IN_PAGOTA_POKEMON_CENTER
