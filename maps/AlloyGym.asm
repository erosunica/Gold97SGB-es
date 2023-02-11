	object_const_def ; object_event constants
	const ALLOYGYM_JASMINE
	const ALLOYGYM_GYM_GUY
	const ALLOYGYM_BOULDER1
	const ALLOYGYM_BOULDER2
	const ALLOYGYM_BOULDER3
	const ALLOYGYM_GENTLEMAN
	const ALLOYGYM_GENTLEMAN2
	const ALLOYGYM_SUPERNERD

AlloyGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .BouldersAlloy
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable


.BouldersAlloy:
	checkevent EVENT_ALLOY_GYM_BOULDER_1
	iffalse .skip1alloy
	changeblock 10, 12, $15
.skip1alloy
	checkevent EVENT_ALLOY_GYM_BOULDER_2
	iffalse .skip2alloy
	changeblock 4, 14, $15
.skip2alloy
	checkevent EVENT_ALLOY_GYM_BOULDER_3
	iffalse .skip3alloy
	changeblock 4, 0, $15
.skip3alloy
	return
	

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, ALLOYGYM_BOULDER1, .Boulder1
	stonetable 4, ALLOYGYM_BOULDER2, .Boulder2
	stonetable 3, ALLOYGYM_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear ALLOYGYM_BOULDER1
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 10, 12, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_ALLOY_GYM_BOULDER_1
	end

.Boulder2:
	disappear ALLOYGYM_BOULDER2
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_ALLOY_GYM_BOULDER_2
	end

.Boulder3:
	disappear ALLOYGYM_BOULDER3
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 0, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_ALLOY_GYM_BOULDER_3
	end

AlloyGymJasmineScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_JASMINE
	iftrue RematchScriptJasmine
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptJasmine
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
	scall AlloyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	buttonsound
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end
	
RematchScriptJasmine:
	opentext
	writetext JasmineRematchText
	waitbutton
	closetext
	winlosstext JasmineRematchWinText, 0
	loadtrainer JASMINE, JASMINE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_JASMINE
	opentext
	writetext JasmineAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptJasmine:
	opentext
	writetext JasmineAfterRematchText
	waitbutton
	closetext
	end

JasmineRematchText:
	text "¡Tenía fe en que"
	line "podrías ganar la"
	cont "LIGA #MON!"

	para "Ahora, ¡muéstrame"
	line "cuánto has"
	para "mejorado desde la"
	line "última vez!"
	done

JasmineRematchWinText:
	text "Sigo manteniendo"
	line "que eres el mejor"
	cont "entrenador."
	done

JasmineAfterRematchText:
	text "¡Espero verte"
	line "triunfar en"
	para "cualquier otro"
	line "desafío que te"
	cont "propongas!"
	done


AlloyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

AlloyGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .AlloyGymGuyWinScript
	opentext
	writetext AlloyGymGuyText
	waitbutton
	closetext
	end

.AlloyGymGuyWinScript:
	opentext
	writetext AlloyGymGuyWinText
	waitbutton
	closetext
	end


AlloyGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext JASMINE, JASMINE1, MEM_BUFFER_1
	jumpstd GymStatue2Script

AlloyGymBoulder:
	jumpstd StrengthBoulderScript
	

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end


TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end


TrainerSuperNerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SuperNerdTomSeenText, SuperNerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdTomAfterBattleText
	waitbutton
	closetext
	end


Jasmine_SteelTypeIntro:
	text "Solo quienes han"
	line "podido enfrentar"
	para "los #MON de los"
	line "entrenadores de mi"
	para "GIMNASIO han"
	line "demostrado ser"
	para "oponentes dignos"
	line "de mis #MON"
	para "acero y su"
	line "increíble defensa."

	para "Lo has hecho bien"
	line "derrotándolos."

	para "¿Pero podrás"
	line "vencerme a mí?"
	done

Jasmine_BetterTrainer:
	text "Eres mejor entre-"
	line "nador que yo, y lo"
	para "has demostrado en"
	line "este combate."

	para "De acuerdo con las"
	line "normas de la LIGA,"
	cont "te concedo esta"
	cont "MEDALLA."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> recibió la"
	line "MEDALLA MINERAL."
	done

Jasmine_BadgeSpeech:
	text "La MEDALLA MINERAL"
	line "aumenta la DEFENSA"
	cont "de los #MON."
	
	para "Y te permite usar"
	line "VUELO fuera de"
	cont "combate."

	para "También quiero"
	line "entregarte esto."
	done

Text_ReceivedTM09:
	text "<PLAYER> recibió la"
	line "MT09."
	done

Jasmine_IronTailSpeech:
	text "Usa esta MT para"
	line "enseñar COLA"
	cont "FÉRREA."
	done

Jasmine_GoodLuck:
	text "Buena suerte con"
	line "el resto del desa-"
	cont "fío de la LIGA."

	para "Confío en que lo"
	line "lograrás."
	done

AlloyGymGuyText:
	text "YASMINA usa el"
	line "tipo acero recién"
	cont "descubierto."

	para "No sé mucho sobre"
	line "ese tipo."
	done

AlloyGymGuyWinText:
	text "Ha sido increíble."

	para "El tipo acero se"
	line "las trae, ¿eh?"

	para "¡No había visto un"
	line "combate así en mi"
	cont "vida!"
	done
	
AlloyGymBoulderFilled:
	text "¡La roca tapó el"
	line "agujero!"
	done

GentlemanPrestonSeenText:
	text "¿Alguna vez has"
	line "enfrentado las"
	para "defensas de los"
	line "#MON acero?"
	done

GentlemanPrestonBeatenText:
	text "Un buen entrenador"
 	line "está preparado"
 	para "para enfrentarse"
 	line "a cualquier tipo."
	done

GentlemanPrestonAfterBattleText:
	text "Los #MON acero"
	line "tienen mayor"
	cont "DEFENSA."

	para "Pero no es"
	line "impenetrable."
	done

GentlemanAlfredSeenText:
	text "Este GIMNASIO"
	line "solía usar #MON"
	cont "roca."

	para "Pero YASMINA acabó"
	line "prefiriendo el"
	cont "tipo acero."
	done

GentlemanAlfredBeatenText:
	text "¡Vaya"
	line "espectáculo!"
	done

GentlemanAlfredAfterBattleText:
	text "Hasta hace poco,"
	line "no se sabía que"
	para "ONIX podía"
	line "evolucionar."
	done

SuperNerdTomSeenText:
	text "¡El tipo acero es"
	line "raro!"

	para "¡Lo cual significa"
	line "que debo usarlo!"
	done

SuperNerdTomBeatenText:
	text "También es raro"
	line "que gane…"
	done

SuperNerdTomAfterBattleText:
	text "Solo me interesan"
	line "las cosas raras."
	done

AlloyGym_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16, 15, ALLOY_CITY, 2
	warp_event 17, 15, ALLOY_CITY, 13
	warp_event  4,  1, ALLOY_CITY, 1; boulder 3
	warp_event  4, 15, ALLOY_CITY, 1; boulder 2
	warp_event 10, 13, ALLOY_CITY, 1; boulder 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15, 13, BGEVENT_READ, AlloyGymStatue
	bg_event 18, 13, BGEVENT_READ, AlloyGymStatue

	db 8 ; object events
	object_event  1,  5, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyGymJasmineScript, -1
	object_event 19, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyGymGuyScript, -1
	object_event 16,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_ALLOY_GYM_BOULDER_1
	object_event 10, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_ALLOY_GYM_BOULDER_2
	object_event 12,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_ALLOY_GYM_BOULDER_3
	object_event 18,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGentlemanPreston, -1
	object_event 16,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGentlemanAlfred, -1
	object_event 11,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdTom, -1

