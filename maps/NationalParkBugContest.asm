	object_const_def ; object_event constants
	const NATIONALPARKBUGCONTEST_YOUNGSTER1
	const NATIONALPARKBUGCONTEST_YOUNGSTER2
	const NATIONALPARKBUGCONTEST_ROCKER
	const NATIONALPARKBUGCONTEST_POKEFAN_M
	const NATIONALPARKBUGCONTEST_YOUNGSTER3
	const NATIONALPARKBUGCONTEST_YOUNGSTER4
	const NATIONALPARKBUGCONTEST_LASS
	const NATIONALPARKBUGCONTEST_YOUNGSTER5
	const NATIONALPARKBUGCONTEST_YOUNGSTER6
	const NATIONALPARKBUGCONTEST_YOUNGSTER7
	const NATIONALPARKBUGCONTEST_POKE_BALL1
	const NATIONALPARKBUGCONTEST_POKE_BALL2

NationalParkBugContest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BugCatchingContestant1AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant1AText
	waitbutton
	closetext
	end

BugCatchingContestant2AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant2AText
	waitbutton
	closetext
	end

BugCatchingContestant3AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant3AText
	waitbutton
	closetext
	end

BugCatchingContestant4AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant4AText
	waitbutton
	closetext
	end

BugCatchingContestant5AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant5AText
	waitbutton
	closetext
	end

BugCatchingContestant6AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant6AText
	waitbutton
	closetext
	end

BugCatchingContestant7AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant7AText
	waitbutton
	closetext
	end

BugCatchingContestant8AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant8AText
	waitbutton
	closetext
	end

BugCatchingContestant9AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant9AText
	waitbutton
	closetext
	end

BugCatchingContestant10AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant10AText
	waitbutton
	closetext
	end

NationalParkBugContestRelaxationSquareSign:
	jumptext NationalParkBugContestRelaxationSquareText

NationalParkBugContestBattleNoticeSign:
	jumptext NationalParkBugContestBattleNoticeText

NationalParkBugContestTrainerTipsSign:
	jumptext NationalParkBugContestTrainerTipsText

NationalParkBugContestParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkBugContestTMDig:
	itemball TM_DIG

NationalParkBugContestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

BugCatchingContestant1AText:
	text "RAFA: ¡Voy a"
	line "ganar!"
	cont "No me molestes."
	done

BugCatchingContestant2AText:
	text "SAM: Mi PARASECT"
	line "duerme a los #-"
	cont "MON con ESPORA."
	done

BugCatchingContestant3AText:
	text "NANO: Entreno a"
	line "#MON rápidos"
	cont "para luchar."
	done

BugCatchingContestant4AText:
	text "GUILLE: No me"
	line "importa ganar."

	para "Sólo busco"
	line "#MON raros."
	done

BugCatchingContestant5AText:
	text "TINO: ¡Ssh! Vas a"
	line "asustar a SCYTHER."

	para "Hablaré contigo"
	line "después."
	done

BugCatchingContestant6AText:
	text "BENITO: Debilita a"
	line "los #MON bicho"
	para "y lánzales una"
	line "PARQUE BALL."
	done

BugCatchingContestant7AText:
	text "CINDY: Me gustan"
	line "los #MON bicho."

	para "Seguro que a ti"
	line "también."
	done

BugCatchingContestant8AText:
	text "KAI: Colecciono"
	line "#MON bicho"
	para "desde que era sólo"
	line "un niño."

	para "¡Es imposible que"
	line "pueda perder!"
	done

BugCatchingContestant9AText:
	text "SAMUEL: Si tienes"
	line "tiempo para"
	para "conversar, busca"
	line "#MON bicho."
	done

BugCatchingContestant10AText:
	text "KOLDO: Soy un gran"
	line "estudioso de los"
	cont "#MON bicho."

	para "Estoy seguro de"
	line "ganar."
	done

NationalParkBugContestRelaxationSquareText:
	text "PLAZA DEL DESCANSO"
	line "PARQUE NACIONAL"
	done

NationalParkBugContestBattleNoticeText:
	text "¿Qué dice este"
	line "cartel?"

	para "Por favor, lucha"
	line "sólo en la hierba."

	para "PARQUE NACIONAL"
	line "PUESTO DEL GUARDA"
	done

NationalParkBugContestTrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Diferentes #MON"
	line "aparecen en"
	para "diferentes"
	line "momentos del día."
	done

NationalParkBugContest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 32, 31, STAND_CITY_NATIONAL_PARK_GATE, 1
	warp_event 33, 31, STAND_CITY_NATIONAL_PARK_GATE, 2
	warp_event  9, 53, ROUTE_103_NATIONAL_PARK_GATE, 1
	warp_event 10, 53, ROUTE_103_NATIONAL_PARK_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8, 48, BGEVENT_READ, NationalParkBugContestRelaxationSquareSign
	bg_event 12, 24, BGEVENT_READ, NationalParkBugContestBattleNoticeSign
	bg_event 21, 53, BGEVENT_ITEM, NationalParkBugContestHiddenFullHeal
	bg_event 34, 38, BGEVENT_READ, NationalParkBugContestTrainerTipsSign

	db 12 ; object events
	object_event 16, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 21, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event 11, 10, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  7, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 36, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 33, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event 14, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 16,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 27,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	object_event 36,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 35, 47, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestTMDig, EVENT_NATIONAL_PARK_TM_DIG
