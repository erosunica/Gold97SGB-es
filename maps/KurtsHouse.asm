	object_const_def ; object constants
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_FALKNER

KurtsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneFalknerVisit1 ; SCENE_DEFAULT
	scene_script .SceneKurtsHouseNothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtCallback
	
.SceneFalknerVisit1
	priorityjump .SceneFalknerVisit2
	end

.SceneFalknerVisit2
	applymovement PLAYER, WalkUpToFalkner
	showemote EMOTE_SHOCK, KURTSHOUSE_FALKNER, 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	opentext
	writetext FalknerGreets
	waitbutton
	closetext
	applymovement KURTSHOUSE_FALKNER, FalknerLeaves
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_FALKNER
	clearevent EVENT_PAGOTA_GYM_FALKNER
	pause 15
	applymovement PLAYER, WalkUpToKurt
	pause 15
	opentext
	writetext KurtTalks
	waitbutton
	closetext
	
	setscene SCENE_KURTS_HOUSE_NOTHING
	end
	
.SceneKurtsHouseNothing:
	end

.KurtCallback:
;	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	return

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
.Done:
	return

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .GotBlessing
	writetext UnknownText_0x18e473
	waitbutton
	closetext
;	special FadeOutMusic
;	setevent EVENT_BIRDON_TOWN_SLOWPOKETAIL_ROCKET
;	checkcode VAR_FACING
;	ifequal UP, .RunAround
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e466
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
	end

;.RunAround:
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e46c
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
;	end

.GotBlessing:
	writetext UnknownText_0x18e615
	buttonsound
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	writetext KurtsHouseKurtBallsFromApricornsText
	promptbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	closetext
	end

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext KurtsHouseKurtItWillTakeADayText
	waitbutton
	closetext
	end

.Cancel:
	writetext KurtsHouseKurtThatsALetdownText
	waitbutton
	closetext
	end

.KurtMakingBallsScript:
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LEVEL_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem MOON_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FRIEND_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FAST_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem HEAVY_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LOVE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat


Script_FirstTimeBuggingKurt:
	writetext UnknownText_0x18e863
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end




Kurt2:
	faceplayer
	opentext
;	checkevent EVENT_GAVE_GS_BALL_TO_KURT
;	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	end
Falkner:
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseLeafeonStatue:
	jumptext KurtsHouseLeafeonStatueText

KurtsHouseBookshelf:
	jumpstd DifficultBookshelfScript

KurtsHouseRadio:
	jumpstd Radio2Script
	
WalkUpToKurt:
	step RIGHT
	step UP
	step_end

WalkUpToFalkner:
	slow_step UP
	slow_step UP
	step_end
	
FalknerWalksToYou:
	step LEFT
	turn_head DOWN
	step_end
	
FalknerLeaves:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x18e46c:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

UnknownText_0x18e473:
	text "Sube la TORRE"
	line "GODAI."
	
	para "Pondrá a prueba"
	line "tu potencial como"
	cont "entrenador."
	done

UnknownText_0x18e615:
	text "Has aprendido"
	line "mucho sobre los"
	cont "#MON."
	
	para "Sería un honor"
	line "para mí ayudarte"
	cont "en tu viaje."
	
	para "Puedo hacer"
	line "# BALLS únicas"
	para "y personalizadas"
	line "que te serán"
	cont "útiles."
	
	para "Ten, te daré esta."
	done

KurtsHouseKurtBallsFromApricornsText:
	text "CÉSAR: Fabrico las"
	line "BALL de los"
	cont "BONGURI."

	para "Recógelos de los"
	line "árboles y"
	cont "tráemelos."

	para "Los usaré para"
	line "hacer las BALL."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "CÉSAR: ¿Tienes"
	line "un BONGURI?"

	para "¡Vale! Te haré"
	line "una BALL."
	done

KurtsHouseKurtItWillTakeADayText:
	text "CÉSAR: Tardaré un"
	line "día en fabricar"
	para "una BALL. Vuelve"
	line "mañana a por ella."
	done

KurtsHouseKurtThatsALetdownText:
	text "CÉSAR: ¡Oh…!"
	line "¡Qué decepción!"
	done

KurtsHouseKurtDontBotherMeText:
	text "CÉSAR: ¡Estoy"
	line "trabajando! ¡Vete!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "CÉSAR: ¡<PLAYER>!"
	line "Acabo de terminar"
	cont "tu BALL. Tuya es."
	done

KurtsHouseKurtTurnedOutGreatText:
	text "CÉSAR: Ha salido"
	line "muy bien."

	para "Intenta capturar"
	line "#MON con ella."
	done

UnknownText_0x18e863:
	text "Siento que he"
	line "mejorado y que"
	para "puedo trabajar"
	line "mucho más rápido"
	cont "que antes."
	done

UnknownText_0x18e8ab:
	text "¿Qué es eso?"

	para "Nunca lo había"
	line "visto."

	para "Se parece mucho a"
	line "una # BALL,"
	para "pero parece que"
	line "tiene algo más."

	para "Déjame que lo vea."
	done

UnknownText_0x18e934:
	text "Estoy viéndolo."
	done

UnknownText_0x18e949:
	text "¡Ajá! ¡Ya veo!"
	line "Entonces…"
	done

UnknownText_0x18e95c:
	text "¡<PLAYER>!"

	para "Esta BALL comenzó"
	line "a agitarse cuando"
	cont "la examinaba."

	para "¡Tiene que haber"
	line "algo!"
	done

KurtsHouseSlowpokeText:
	text "SLOWPOKE: ¡Mmm!"
	line "(Bostezo)."
	done

KurtsHouseOakPhotoText:
	text "Es CÉSAR en la"
	line "TORRE GODAI con un"
	para "SABIO y un hombre"
	line "con gorra de"
	cont "CAPITÁN."
	done

KurtsHouseLeafeonStatueText:
	text "Es una estatua del"
	line "guardián del"
	cont "bosque."
	done
	
FalknerGreets:
	text "PEGASO: ¿Quién"
	line "eres tú?"
	
	para "Así que <PLAYER>."
	line "¿Qué te trae aquí?"
	
	para "Debe ser porque no"
	line "estoy donde"
	para "debería estar en"
	line "estos momentos."
	
	para "Volveré al"
	line "GIMNASIO para que"
	para "puedas retarme por"
	line "la MEDALLA."
	
	para "…"
	
	para "¿Qué?"
	
	para "¿No vas a afrontar"
	line "el desafío de la"
	cont "LIGA #MON?"
	
	para "¿Qué te trae a"
	line "CIUDAD PAGOTA?"
	
	para "…"
	
	para "Vaya, es"
	line "impresionante que"
	para "el PROF. OAK te"
	line "haya encargado"
	para "ayudarlo con su"
	line "investigación"
	cont "#MON."
	
	para "¡Pero puedo ver el"
	line "brillo en tu"
	cont "mirada!"
	
	para "¡Si deseas iniciar"
	line "tu desafío en la"
	para "LIGA, siéntete"
	line "libre de combatir"
	cont "contra mí!"
	
	para "Ahora, me marcho."
	
	para "¡Espero que nos"
	line "veamos pronto!"
	done
	
KurtTalks:
	text "CÉSAR: Lo supe"
	line "desde el momento"
	cont "en que entraste."
	
	para "Tienes un gran"
	line "potencial como"
	cont "entrenador."
	
	para "PEGASO también se"
	line "dio cuenta."
	
	para "Te sugiero"
	line "encarecidamente"
	para "que afrontes el"
	line "desafío de la LIGA"
	cont "durante tu viaje."
	
	para "Aparte, me"
	line "gustaría ayudarte"
	para "con tu investiga-"
	line "ción ofreciéndote"
	para "algo que te"
	line "ayudará a capturar"
	cont "#MON."
	
	para "Pero primero"
	line "quiero que"
	cont "demuestres tu"
	cont "valía."
	
	para "La TORRE GODAI de"
	line "CIUDAD PAGOTA es"
	para "un lugar sagrado"
	line "en el que he"
	para "pasado muchos años"
	line "fortaleciendo todo"
	para "lo que sé sobre la"
	line "relación entre las"
	cont "personas y los"
	cont "#MON."
	
	para "Te encargo que"
	line "subas esa torre."
	
	para "Hazlo, y entonces"
	line "vuelve a verme."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 10
	warp_event  4,  7, PAGOTA_CITY, 10

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6,  0, BGEVENT_READ, KurtsHouseRadio
	bg_event 14,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event 15,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  7,  0, BGEVENT_READ, KurtsHouseLeafeonStatue

	db 3 ; object events
	object_event  4,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event 15,  4, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event  4,  3, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Falkner, EVENT_KURTS_HOUSE_FALKNER
