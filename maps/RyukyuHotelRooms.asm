	object_const_def ; object_event constants
	const RYUKYU_HOTEL_ROOMS_OAK
	const RYUKYU_HOTEL_ROOMS_SOLDIER
	const RYUKYU_HOTEL_ROOMS_CAMPER
	const RYUKYU_HOTEL_ROOMS_PSYCHIC
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF2
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF3
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERM
	const RYUKYU_HOTEL_ROOMS_LASS

RyukyuHotelRooms_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekOakBattle
	
.CheckDayOfWeekOakBattle:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .ItsWeekendOak
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .ItsWeekendOak
	disappear RYUKYU_HOTEL_ROOMS_OAK
	return
	
.ItsWeekendOak
	appear RYUKYU_HOTEL_ROOMS_OAK
	return

RyukyuHotelRoomsOakScript:
	checkevent EVENT_BATTLED_OAK
	iftrue .TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakBefore
	yesorno
	iffalse .NoOakBattleYet
	writetext RyukyuHotelRoomsOakBefore2
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	setevent EVENT_BATTLED_OAK
	end
	
.NoOakBattleYet
	writetext RyukyuHotelRoomsOakNoBattle
	waitbutton
	closetext
	end
	
.TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	end
	

TrainerSoldierWarnell:
	trainer SOLDIER, WARNELL, EVENT_BEAT_SOLDIER_WARNELL, SoldierWarnellSeenText, SoldierWarnellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierWarnellAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCamperQuentin:
	trainer CAMPER, QUENTIN, EVENT_BEAT_CAMPER_QUENTIN, CamperQuentinSeenText, CamperQuentinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperQuentinAfterBattleText
	waitbutton
	closetext
	end
	

TrainerPsychicRaphael:
	trainer PSYCHIC_T, RAPHAEL, EVENT_BEAT_PSYCHIC_T_RAPHAEL, PsychicRaphaelSeenText, PsychicRaphaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRaphaelAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfAyano:
	trainer COOLTRAINERF, AYANO, EVENT_BEAT_COOLTRAINERF_AYANO, CooltrainerfAyanoSeenText, CooltrainerfAyanoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfAyanoAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfYuka:
	trainer COOLTRAINERF, YUKA, EVENT_BEAT_COOLTRAINERF_YUKA, CooltrainerfYukaSeenText, CooltrainerfYukaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfYukaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfAyaka:
	trainer COOLTRAINERF, AYAKA, EVENT_BEAT_COOLTRAINERF_AYAKA, CooltrainerfAyakaSeenText, CooltrainerfAyakaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfAyakaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermWozniak:
	trainer COOLTRAINERM, WOZNIAK, EVENT_BEAT_COOLTRAINERM_WOZNIAK, CooltrainermWozniakSeenText, CooltrainermWozniakBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermWozniakAfterBattleText
	waitbutton
	closetext
	end
	

TrainerLassEliza:
	trainer LASS, ELIZA, EVENT_BEAT_LASS_ELIZA, LassElizaSeenText, LassElizaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassElizaAfterBattleText
	waitbutton
	closetext
	end
	
LassElizaSeenText:
	text "¡Que esté de"
	line "vacaciones no"
	para "significa que no"
	line "esté dispuesta a"
	cont "combatir!"
	done

LassElizaBeatenText:
	text "¡Ha sido un buen"
	line "combate!"
	done

LassElizaAfterBattleText:
	text "Aunque pierda,"
	line "cada combate es"
	cont "una buena"
	cont "experiencia."
	done

CooltrainermWozniakSeenText:
	text "¡Es la hora de mi"
	line "victoria diaria!"
	done

CooltrainermWozniakBeatenText:
	text "¡Este combate no"
	line "cuenta!"
	done

CooltrainermWozniakAfterBattleText:
	text "Tendré que buscar"
	line "a alguien a quien"
	cont "derrotar hoy."
	done

CooltrainerfAyakaSeenText:
	text "¡Claro, combatiré"
	line "contigo!"
	done

CooltrainerfAyakaBeatenText:
	text "¡He perdido!"
	done

CooltrainerfAyakaAfterBattleText:
	text "Tengo que pasar"
	line "más tiempo entre-"
	cont "nando a mis"
	cont "#MON."
	done

CooltrainerfYukaSeenText:
	text "¿Un combate?"

	para "¡A eso nunca me"
	line "niego!"
	done

CooltrainerfYukaBeatenText:
	text "¡Muy mal!"
	done

CooltrainerfYukaAfterBattleText:
	text "Mis #MON y yo"
	line "deberíamos"
	cont "entrenar."
	done

CooltrainerfAyanoSeenText:
	text "Oh, ¿un combate?"

	para "Se me dan de lujo."
	done

CooltrainerfAyanoBeatenText:
	text "¡Parece que no"
	line "tan de lujo!"
	done

CooltrainerfAyanoAfterBattleText:
	text "¿Dónde entrenas a"
	line "tus #MON?"
	done

PsychicRaphaelSeenText:
	text "¡Puedo leer tu"
	line "mente!"
	done

PsychicRaphaelBeatenText:
	text "¡Sé por qué estás"
	line "aquí!"
	done

PsychicRaphaelAfterBattleText:
	text "¡Estás aquí porque"
	line "estás de"
	cont "vacaciones!"
	done

CamperQuentinSeenText:
	text "¿Un hotel cuenta"
	line "como sitio de"
	cont "acampada?"
	done

CamperQuentinBeatenText:
	text "¡Me has"
	line "machacado!"
	done

CamperQuentinAfterBattleText:
	text "¡Si digo que estoy"
	line "de acampada, es"
	cont "que estoy de"
	cont "acampada!"
	done

SoldierWarnellSeenText:
	text "¡Esta ISLA es mi"
	line "puesto oficial!"
	done

SoldierWarnellBeatenText:
	text "¡Nada que"
	line "informar!"
	done

SoldierWarnellAfterBattleText:
	text "Realmente estoy"
	line "destinado aquí, lo"
	cont "creas o no."
	done

RyukyuHotelRoomsOakBefore2:
	text "¡Vamos a dar lo"
	line "mejor!"
	done

RyukyuHotelRoomsOakNoBattle:
	text "¡No pasa nada!"

	para "Otra vez será."
	done

RyukyuHotelRoomsOakBefore:
	text "PROF. OAK: ¡Vaya,"
	line "<PLAYER>!"

	para "¡Me alegra verte"
	line "por aquí!"

	para "¡Parece que has"
	line "vivido una"
	para "aventura de lo más"
	line "enriquecedora y"
	para "emocionante con"
	line "tus #MON!"

	para "¡<RIVAL> y tú me"
	line "habéis inspirado!"

	para "He estado entre-"
	line "nando algunos"
	cont "#MON."

	para "¡Es algo que no"
	line "había hecho en"
	cont "mucho tiempo!"

	para "¡Si quieres,"
	line "podemos combatir!"

	para "Estoy seguro que a"
	line "nuestros #MON"
	cont "les encantará."

	para "¿Qué me dices?"
	done

RyukyuHotelRoomsOakTextWin:
	text "¡Fascinante!"
	done

RyukyuHotelRoomsOakTextLoss:
	text "¡Oh, vaya!"
	done

RyukyuHotelRoomsOakAfter:
	text "PROF. OAK: ¡No"
	line "puedo agradecer tu"
	cont "ayuda lo"
	cont "suficiente!"

	para "¡He alcanzado"
	line "nuevas cotas en mi"
	para "investigación y"
	line "amor por los"
	para "#MON a las que"
	line "nunca creí llegar!"
	done

HotelBed:	
	opentext
	writetext HotelBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext HotelBedText2
	waitbutton
	closetext
	end
	
HotelBedText1:
	text "Es tu cama."

	para "Hora de descansar…"
	done

HotelBedText2:
	text "¡Como nuevo!"
	done


RyukyuHotelRooms_MapEvents:
	db 0, 0 ; filler


	db 16 ; warp events
	warp_event  1,  5, RYUKYU_HOTEL_2F, 4
	warp_event  2,  5, RYUKYU_HOTEL_2F, 4
	warp_event  1, 17, RYUKYU_HOTEL_2F, 5
	warp_event  2, 17, RYUKYU_HOTEL_2F, 5
	
	warp_event 12,  5, RYUKYU_HOTEL_3F, 4
	warp_event 13,  5, RYUKYU_HOTEL_3F, 4
	warp_event 12, 17, RYUKYU_HOTEL_3F, 5
	warp_event 13, 17, RYUKYU_HOTEL_3F, 5
	
	warp_event 24,  7, RYUKYU_HOTEL_4F, 4
	warp_event 25,  7, RYUKYU_HOTEL_4F, 4
	warp_event 24, 17, RYUKYU_HOTEL_4F, 5
	warp_event 25, 17, RYUKYU_HOTEL_4F, 5
	
	warp_event 36,  5, RYUKYU_HOTEL_5F, 3
	warp_event 37,  5, RYUKYU_HOTEL_5F, 3
	warp_event 36, 17, RYUKYU_HOTEL_5F, 4
	warp_event 37, 17, RYUKYU_HOTEL_5F, 4
	db 0 ; coord events

	db 2 ; bg events
	bg_event 39, 12, BGEVENT_READ, HotelBed
	bg_event 39, 13, BGEVENT_READ, HotelBed

	db 9 ; object events
	object_event 35,  1, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuHotelRoomsOakScript, EVENT_OAK_HERE_ON_WEEKENDS
	object_event  3,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierWarnell, -1
	object_event 12,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerCamperQuentin, -1
	object_event  0, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicRaphael, -1
	object_event 14, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAyano, -1
	object_event 10, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfYuka, -1
	object_event 15, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAyaka, -1
	object_event 25,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermWozniak, -1
	object_event 23, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEliza, -1

