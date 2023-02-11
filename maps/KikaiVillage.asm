	object_const_def ; object_event constants
	const KIKAIV_BRUNO
	const KIKAIV_BLACKBELT
	const KIKAIV_ELDER
	const KIKAIV_ITEMBALL
	const KIKAIV_ROCK1
	const KIKAIV_ROCK2

KikaiVillage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KIKAI
	return

KikaiPokecenterSign:
	jumpstd PokecenterSignScript

KikaiMartSign:
	jumpstd MartSignScript

KikaiSummitRock:
	jumpstd SmashRockScript
	
KikaiSummitRock2:
	jumptextfaceplayer HeyKidWatchOutText

KikaiBlackBeltScript:
	jumptextfaceplayer KikaiBlackBeltText
	
KikaiGrampsScript:
	jumptextfaceplayer KikaiGrampsText
	
KikaiItemball:
	itemball FIRE_TAIL
	
MovementData_BrunoRockSmash:
	rock_smash 10
	step_end	

KikaiBrunoScript:
	checkevent EVENT_BRUNO_SMASHED_ROCK
	iftrue .skipsmashing
	opentext
	writetext BrunoHooHahSmashText
	waitbutton
	closetext
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovement KIKAIV_ROCK1, MovementData_BrunoRockSmash
	disappear KIKAIV_ROCK1
	clearevent EVENT_BRUNO_SMASHED_ROCK
.skipsmashing:
	faceplayer
	checkevent EVENT_BRUNO_BATTLE_DONE
	iftrue .afterbruno
	opentext
	writetext BrunoPrebattleText
	waitbutton
	winlosstext BrunoWinText, 0
	loadtrainer JANINE, JANINE1 ; bruno is over janine
	startbattle
	reloadmapafterbattle
	setevent EVENT_BRUNO_BATTLE_DONE
	setevent EVENT_BRUNO_SMASHED_ROCK
.afterbruno:
	opentext
	writetext BrunoAfterBattletext
	waitbutton
	closetext
	end
	
HeyKidWatchOutText:
	text "BRUNO: ¡Cuidado,"
	line "chico!"

	para "¡Voy a pulverizar"
	line "esta roca!"
	done
	
BrunoHooHahSmashText:
	text "…"
	
	para "¡UAARGH!"
	done
	
BrunoPrebattleText:
	text "Soy BRUNO, del"
	line "antiguo ALTO"
	cont "MANDO."

	para "Me entreno siempre"
	line "al máximo porque"
	para "confío en nuestro"
	line "potencial."

	para "Por eso somos tan"
	line "fuertes."

	para "¿Resistirás"
	line "nuestro poder?"

	para "¿Mmm? No veo que"
	line "tengas miedo."

	para "Pareces audaz."
	line "¡Perfecto!"
	
	para "¡Te doblegarás"
	line "ante nuestro"
	cont "inmenso poder!"

	para "¡Ja, ja!"
	done

BrunoWinText:
	text "¿Qué? ¿Cómo hemos"
	line "podido perder?"
	done
	
BrunoAfterBattletext:
	text "Como he perdido,"
	line "no tengo derecho"
	cont "a decir nada…"

	para "Sigue adelante y"
	line "afronta los"
	cont "desafíos que te"
	cont "encuentres."
	done

KikaiBlackBeltText:
	text "¡Esta villa es un"
	line "sitio popular"
	para "entre los practi-"
	line "cantes de las"
	cont "artes marciales!"
	done

KikaiGrampsText:
	text "La CALDERA es un"
	line "lugar de entrena-"
	cont "miento para artis-"
	cont "tas marciales."

	para "Si entras,"
	line "¡prepárate para"
	cont "combatir!"
	done

KikaiSign:
	jumptext KikaiSignText
	
CalderaSign:
	jumptext CalderaSignText
	
KikaiSignText:
	text "VILLA KIKAI"

	para "¡Donde viven"
	line "ardientes"
	cont "luchadores!"
	done

CalderaSignText:
	text "CALDERA KIKAI"

	para "Cuidado con la"
	line "lava"
	done

KikaiVillage_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 15, 26, KIKAI_POKECENTER_1F, 1
	warp_event  3, 22, KIKAI_MART, 1
	warp_event 14, 21, KIKAI_HOUSE_1, 1
	warp_event  7, 27, KIKAI_HOUSE_2, 1
	warp_event  7, 19, KIKAI_CALDERA_1F, 1
	warp_event 11, 17, KIKAI_CALDERA_2F, 1
	warp_event 15, 17, KIKAI_CALDERA_2F, 2
	warp_event  9, 13, KIKAI_CALDERA_3F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 12, 24, BGEVENT_READ, KikaiSign
	bg_event  8, 20, BGEVENT_READ, CalderaSign
	bg_event 16, 26, BGEVENT_READ, KikaiPokecenterSign
	bg_event  4, 22, BGEVENT_READ, KikaiMartSign

	db 6 ; object events
	object_event 10,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KikaiBrunoScript, -1
	object_event  9, 23, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KikaiBlackBeltScript, -1
	object_event  6, 20, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KikaiGrampsScript, -1
	object_event 13, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KikaiItemball, EVENT_KIKAI_SUMMIT_ITEMBALL
	object_event 10,  6, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KikaiSummitRock2, EVENT_BRUNO_SMASHED_ROCK
	object_event 14,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KikaiSummitRock, EVENT_KIKAI_SUMMIT_OTHER_ROCK
