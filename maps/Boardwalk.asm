	object_const_def ; object_event constants
	const BOARDWALK_BUG_CATCHER
	const BOARDWALK_SUPER_NERD2
	const BOARDWALK_SUPER_NERD3
	const BOARDWALK_FISHER
	const BOARDWALK_FISHER2
	const BOARDWALK_YOUNGSTER
;	const BOARDWALK_INSTRUCTOR

Boardwalk_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor



.MoveTutor:
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear BOARDWALK_FISHER2
	return

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear BOARDWALK_FISHER2
.MoveTutorDone:
	return
	
TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
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

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end



	
TrainerFledglingHidalgo:
	trainer FLEDGLING, HIDALGO, EVENT_BEAT_FLEDGLING_HIDALGO, FledglingHidalgoSeenText, FledglingHidalgoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHidalgoAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end


MoveTutorScript:
	faceplayer
	opentext
	writetext ICanTeachYourMonMovesText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext ItWIllCostYouText
	yesorno
	iffalse .Refused2
	checkcoins 2000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext YouWontRegretItText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte MOVETUTOR_FLAMETHROWER
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte MOVETUTOR_THUNDERBOLT
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte MOVETUTOR_ICE_BEAM
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "LANZALLAMAS@"
	db "RAYO@"
	db "RAYO HIELO@"
	db "SALIR@"

.Refused:
	writetext UnknownText_0x1990b4
	waitbutton
	closetext
	end

.Refused2:
	writetext HmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	special DisplayCoinCaseBalance; looks like putting this here fixed weird CGB glitch
	writetext IfYouUnderstandText
	buttonsound
	takecoins 2000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext WahahahaFarewellKidText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .WalkAroundPlayer
	applymovement BOARDWALK_FISHER2, MovementData_0x198a5f
	jump .GoInside

.WalkAroundPlayer:
	applymovement BOARDWALK_FISHER2, MovementData_0x198a63
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear BOARDWALK_FISHER2
	clearevent EVENT_BOARDWALK_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext YouDontHaveEnoughCoinsTutorText
	waitbutton
	closetext
	end

BoardwalkSign1:
	jumptext BoardwalkSign1Text

BoardwalkSign2:
	jumptext BoardwalkSign2Text

BoardwalkTrainerTips:
	jumptext BoardwalkTrainerTipsText

BoardwalkFruitTree:
	fruittree FRUITTREE_TREE_ROUTE_112


MovementData_0x198a5f:
	step LEFT
	step LEFT
	step UP
	step_end

MovementData_0x198a63:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step_end


ICanTeachYourMonMovesText:
	text "Si quieres, puedo"
	line "enseñar increíbles"
	para "movimientos a tus"
	line "#MON."

	para "¿Le enseño un"
	line "nuevo movimiento?"
	done

ItWIllCostYouText:
	text "Te costará 2000"
	line "fichas. ¿Vale?"
	done

UnknownText_0x1990b4:
	text "Auu… Pero"
	line "son increíbles…"
	done

YouWontRegretItText:
	text "¡Uajajaja! ¡No lo"
	line "lamentarás!"

	para "¿Qué movimiento"
	line "debo enseñar?"
	done

HmTooBadText:
	text "Mm, qué mal."
	line "Tendré que coger"
	cont "algo de dinero de"
	cont "casa…"
	done

IfYouUnderstandText:
	text "Si comprendes lo"
	line "increíble de este"
	para "movimiento, tu"
	line "entrenamiento será"
	cont "de alto nivel."
	done

WahahahaFarewellKidText:
	text "¡Uajajaja!"
	line "¡Adiós!"
	done

UnknownText_0x1991a4:
	text "Pe… Pero…"
	done

YouDontHaveEnoughCoinsTutorText:
	text "No tienes sufi-"
	line "cientes fichas…"
	done

WeirdNotSureText:
	text_start
	done


FledglingHidalgoSeenText:
	text "¿Puedo combatir"
	line "contigo?"
	done
	
FledglingHidalgoBeatenText:
	text "¡Qué difícil!"
	done
	
FledglingHidalgoAfterBattleText:
	text "¡Me esforzaré para"
	line "seguir mejorando!"
	done
	

PokemaniacBrentSeenText:
	text "¡Eh! ¿Tienes algún"
	line "#MON raro?"
	done

PokemaniacBrentBeatenText:
	text "¡Oh, mis pobres"
	line "#MON!"
	done

PokemaniacBrentAfterBattleText:
	text "Sería feliz con"
	line "sólo tener un"
	cont "#MON raro."
	done

PokemaniacRonSeenText:
	text "¿Te lo puedes"
	line "creer?"

	para "¡<RIVAL> ha"
	line "arrasado con mi"
	cont "equipo!"

	para "¡Maldición! ¡Mis"
	line "#MON son"
	cont "geniales!"
	
	para "¡Seguro que a ti"
	line "te puedo ganar!"
	done

PokemaniacRonBeatenText:
	text "¡Mi equipo lo"
	line "hizo muy bien!"
	done

PokemaniacRonAfterBattleText:
	text "Es bueno que a la"
	line "gente le gusten"
	para "distintos tipos de"
	line "#MON."

	para "No sólo se trata"
	line "de tener el más"
	cont "fuerte."
	done

FisherMarvinSeenText:
	text "No estoy en racha."

	para "Quizá sea por el"
	line "equipo que uso."

	para "Luchemos. A ver si"
	line "cambia mi suerte."
	done

FisherMarvinBeatenText:
	text "He perdido, pero"
	line "me siento mejor."
	done

FisherMarvinAfterBattleText:
	text "Las CEBO BALL de"
	line "CÉSAR son las"
	para "mejores para"
	line "pescar #MON."

	para "Son mucho más"
	line "efectivas que las"
	cont "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "Puedo hacer muchas"
	line "cosas con mis"

	para "#MON."
	line "¡Es muy divertido!"
	done

CamperSpencerBeatenText:
	text "Perder no es nada"
	line "divertido…"
	done

CamperSpencerAfterBattleText:
	text "¿Has estado alguna"
	line "vez en el BOSQUE"
	cont "JADE?"

	para "Teníamos pensado"
	line "acampar aquí."
	done

PicnickerTiffanySeenText:
	text "¿Vas a ir al"
	line "CASINO?"

	para "¡Juguemos un"
	line "ratito!"
	done

PicnickerTiffanyBeatenText:
	text "¡He jugado mucho!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Voy a ir de picnic"
	line "con mis #MON."

	para "¿No te vienes?"
	done

PicnickerTiffanyClefairyText:
	text "¿No es mi CLEFAIRY"
	line "lo más bonito del"
	cont "mundo?"
	done

BoardwalkSign1Text:
	text "PASARELA"
	
	para "PUEBLO SÁNSCRITO -"
	line "CIUDAD TEKNOS"
	done

BoardwalkSign2Text:
	text "CASINO MARÍTIMO"
	para "¡Tu fuente de"
	line "diversión!"
	done

BoardwalkTrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Todos los #MON"
	line "tienen ventajas y"
	para "desventajas según"
	line "el tipo."

	para "Entre dos #MON"
	line "de distinto tipo,"
	para "puede perder el"
	line "de nivel superior."

	para "Aprende qué tipos"
	line "son fuertes o"
	para "débiles contra tu"
	line "tipo de #MON."
	done

Boardwalk_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  6, 51, BOARDWALK_TEKNOS_GATE, 1
	warp_event  7, 51, BOARDWALK_TEKNOS_GATE, 2
	warp_event 14,  5, BOARDWALK_GATE, 3
	warp_event 14,  2, BOARDWALK_GATE, 1
	warp_event 15,  2, BOARDWALK_GATE, 2
	warp_event 15,  5, BOARDWALK_GATE, 4
	warp_event 10, 21, BOARDWALK_GAME_CORNER, 1
	warp_event 11, 21, BOARDWALK_GAME_CORNER, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11,  8, BGEVENT_READ, BoardwalkSign1
	bg_event  9, 22, BGEVENT_READ, BoardwalkSign2
	bg_event 13, 38, BGEVENT_READ, BoardwalkTrainerTips

	db 6 ; object events
	object_event 17, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerFledglingHidalgo, -1
	object_event  7, 35, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event  8,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRon, -1
	object_event  2, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event 13, 22, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 4, MoveTutorScript, EVENT_BOARDWALK_MOVE_TUTOR
	object_event  8, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
;	object_event 14, 21, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerInstructorCliff, -1
