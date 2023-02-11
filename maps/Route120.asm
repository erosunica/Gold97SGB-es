	object_const_def ; object_event constants
	const ROUTE120_FRUIT_TREE
	const ROUTE120_YOUNGSTER
	const ROUTE120_SCHOOLBOY
	const ROUTE120_LASS
	const ROUTE120_GRAMPS
	const ROUTE120_ITEMBALL

Route120_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
	
TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_JOEY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftrue .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext YoungsterJoey1BeatenText, 0
	checkflag ENGINE_FLYPOINT_KANTO
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_ALLOY
	iftrue .LoadFight1
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end
	

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end
	
Route120GrampsScript:
	faceplayer
	opentext
	writetext Route120GrampsText
	waitbutton
	closetext
	end

Route120BoulderMineSign:
	jumptext Route120BoulderMineSignText

Route120FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_120
	
Route120SuperRepel:
	itemball SUPER_REPEL
	
Route120GrampsText:
	text "¡Ah, bien!"
	line "¡Ya estás aquí!"

	para "Ayúdame, por"
	line "favor."

	para "¡Mi nieta podría"
	line "estar atrapada ahí"
	cont "dentro!"
	done

LassConnie1SeenText:
	text "No sé por qué"
	line "salgo con CHEMA y"
	cont "JULIO."

	para "¡Seguro que tú"
	line "eres mejor que"
	cont "ellos!"
	done

LassConnie1BeatenText:
	text "¡Ay! ¡Mi #MON!"
	done

LassConnie1AfterBattleText:
	text "He perdido, pero"
	line "ha sido un mejor"
	para "combate que"
	line "cualquiera que"
	para "hubiera tenido"
	line "contra esos dos."
	done

SchoolboyDudleySeenText:
	text "¡Esta ruta es"
	line "donde se reúnen"
	para "mis amigos después"
	line "del cole!"
	done

SchoolboyDudleyBeatenText:
	text "¡Uau! Muy bien."
	done

SchoolboyDudleyAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done
	
YoungsterJoey1SeenText:
	text "Me gusta jugar en"
	line "la MINA."

	para "¡Pero no se lo"
	line "digas a mis"
	cont "padres!"
	done

YoungsterJoey1BeatenText:
	text "¡Argh!"
	line "¡He perdido!"
	done

YoungsterJoey1AfterText:
	text "¿Debo tener más"
	line "#MON para poder"
	cont "luchar mejor?"

	para "¡No! ¡Continuaré"
	line "sólo con éste,"
	cont "pase lo que pase!"
	done

YoungsterJoeyText_GiveHPUpAfterBattle:
	text "Perdí otra vez…"
	line "¡Eres fuerte!"

	para "Oh. Casi olvido"
	line "que tenía que"
	cont "darte esto."

	para "Úsalo para hacerte"
	line "aún más fuerte,"
	cont "¿vale?"

	para "Yo también seré"
	line "más fuerte."
	done

Route120BoulderMineSignText:
	text "MINA PEÑASCO"
	
	para "¡Área para minar"
	line "peligrosa!"

	para "Por favor, no"
	line "entrar sin un"
	para "#MON como"
	line "protección."
	done

Route120_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, BOULDER_MINE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route120BoulderMineSign

	db 6 ; object events
	object_event 42,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route120FruitTree, -1
	object_event 12, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJoey, -1
	object_event 24,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDudley, -1
	object_event 12,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
	object_event  8,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route120GrampsScript, EVENT_GRAMPS_AT_MINE
	object_event 21, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route120SuperRepel, EVENT_PICKED_UP_ROUTE_120_SUPER_REPEL


