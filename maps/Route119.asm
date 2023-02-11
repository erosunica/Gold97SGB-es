	object_const_def ; object_event constants
	const ROUTE119_FISHER1
	const ROUTE119_FISHER2
	const ROUTE119_ROCKET1
	const ROUTE119_ROCKET2
	const LAKEOFRAGE_WESLEY
	const ROUTE119_ITEMBALL_1
	const ROUTE119_ITEMBALL_2
	const ROUTE119_COOLTRAINER_M

Route119_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Wesley


.Wesley:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return
	
Route119Roar:
	itemball TM_ROAR

Route119CrownPathSign:
	jumptext Route119CrownPathSignText

Route119LockedDoor:
	jumptext Route119LockedDoorText
	
TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end



TrainerFisherChris:
	trainer FISHER, CHRIS1, EVENT_BEAT_FISHER_CHRIS, FisherChrisSeenText, FisherChrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_CHRIS_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_FISHER_CHRIS
	iftrue .NumberAccepted
	checkevent EVENT_CHRIS_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherChrisAfterBattleText
	promptbutton
	setevent EVENT_CHRIS_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_CHRIS
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, CHRIS1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext FisherChrisBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer FISHER, CHRIS1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, CHRIS2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, CHRIS3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
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

.Rematch:
	jumpstd RematchMScript
	end
	
	
Route119Rocket1Script:
	opentext
	writetext Route119Rocket1Text
	waitbutton
	closetext
	end
	
Route119Rocket2Script:
	opentext
	writetext Route119Rocket2Text
	waitbutton
	closetext
	end
	
WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end


Route119SoftSand:
	itemball SOFT_SAND
	
TrainerSportsmanBryson:
	trainer SPORTSMAN, BRYSON, EVENT_BEAT_SPORTSMAN_BRYSON, SportsmanBrysonSeenText, SportsmanBrysonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanBrysonAfterText
	waitbutton
	closetext
	end


FisherChrisSeenText:
	text "¡Déjame que te"
	line "enseñe el poder de"
	cont "mis #MON!"
	done

FisherChrisBeatenText:
	text "¿Qué? Eso no está"
	line "bien."
	done

FisherChrisAfterBattleText:
	text "Quiero convertirme"
	line "en un CAMPEÓN con"
	para "los #MON que"
	line "he atrapado."

	para "¡Eso es lo mejor"
	line "de la pesca!"
	done

SportsmanBrysonSeenText:
	text "¡Uf!"

	para "¡Nada como correr"
	line "un poco por la"
	cont "playa!"
	done

SportsmanBrysonBeatenText:
	text "¡Tengo arena en"
	line "las zapatillas!"
	done

SportsmanBrysonAfterText:
	text "En realidad, la"
	line "playa no es el"
	cont "mejor sitio para"
	cont "correr."
	done

FisherJustinSeenText:
	text "¡Vaya!"

	para "¡Se me escapó ese"
	line "pez por tu culpa!"
	done

FisherJustinBeatenText:
	text "¡Chas!"
	done

FisherJustinAfterText:
	text "Paciencia… La"
	line "base de la pesca"
	para "y de los #MON"
	line "es la misma."
	done

FisherRalph1SeenText:
	text "Soy muy bueno,"
	line "tanto pescando"
	para "como con los"
	line "#MON."

	para "¡No voy a perder"
	line "con alguien tan"
	cont "joven!"
	done

FisherRalph1BeatenText:
	text "Intenté acelerar"
	line "las cosas…"
	done

FisherRalphAfterText:
	text "¡Pescar es una"
	line "pasión eterna y"
	para "los #MON son"
	line "amigos eternos!"
	done

FisherRalphSwarmText:
	text "Uno, dos, tres…"
	line "¡Jajajajaja!"

	para "¡Qué gran botín!"

	para "¡Vale! ¡Sigue y"
	line "atrapa tantos como"
	cont "puedas!"
	done

Route119CrownPathSignText:
	text "RUTA 119"
	
	para "CIUDAD TEKNOS -"
	line "CIUDAD CALORINA"
	done

Route119LockedDoorText:
	text "Cruza el acceso"
	line "para llegar a"
	cont "CIUDAD CALORINA"
	done
	
Route119Rocket1Text:
	text "Jujujuju…"
	para "¿Por qué se supone"
	line "que estamos aquí?"
	done
	
Route119Rocket2Text:
	text "Jejejeje…"
	para "Creo que no le"
	line "caemos muy bien al"
	cont "jefe…"
	done
	
MeetWesleyText:
	text "MIGUEL: Hola,"
	line "¿qué tal estás?"

	para "Hoy es miércoles"
	line "y yo soy MIGUEL,"
	para "por lo de"
	line "miércoles."
	done

WesleyGivesGiftText:
	text "Encantado de"
	line "conocerte. Toma"
	cont "un recuerdo."
	done

WesleyGaveGiftText:
	text "MIGUEL: CINTURÓN"
	line "NEGRO potencia los"
	cont "ataques de lucha."
	done

WesleyWednesdayText:
	text "MIGUEL: Si me"
	line "has encontrado,"
	para "habrás visto a"
	line "mis hermanos."

	para "¿O es que has"
	line "tenido suerte?"
	done

WesleyNotWednesdayText:
	text "MIGUEL: Hoy no es"
	line "miércoles."
	cont "¡Qué pena!"
	done


Route119_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  9, ROUTE_119_SUNPOINT_GATE, 3
	warp_event 11,  9, ROUTE_119_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 44, BGEVENT_READ, Route119CrownPathSign
	bg_event  8, 10, BGEVENT_READ, Route119LockedDoor

	db 8 ; object events
	object_event  7, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 10, 41, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherChris, -1
	object_event 10, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Route119Rocket1Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event 11, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Route119Rocket2Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event 12, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_KIKAI_VILLAGE_WESLEY_OF_WEDNESDAY
	object_event  4, 49, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119Roar, EVENT_ROUTE_119_ROAR_TM
	object_event 10, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119SoftSand, EVENT_PICKED_UP_CHARCOAL_FROM_HO_OH_ITEM_ROOM
	object_event  5, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSportsmanBryson, -1
