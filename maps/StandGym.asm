	object_const_def ; object_event constants
	const STANDGYM_OKERA
	const STANDGYM_GYMGUY2
	const STANDGYM_COOLTRAINER
	const STANDGYM_COOLTRAINER2
	const STANDGYM_COOLTRAINER3
	const STANDGYM_COOLTRAINER4

StandGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandGymOkeraScript:
	faceplayer
	checkevent EVENT_OKERA_OWES_YOU_ONE
	iffalse OkeraOwesYouOneScript
	checkevent EVENT_REMATCH_AVAILABLE_OKERA
	iftrue RematchScriptOkera
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptOkera
	faceplayer
	opentext
	checkevent EVENT_BEAT_OKERA
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	winlosstext OkeraLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OKERA
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene STAND_CITY, SCENE_STAND_CITY_IMPOSTOR
	checkcode VAR_BADGES
;	scall StandGymActivateRockets
.FightDone:
	checkevent EVENT_ACTUALLY_GOT_TM46_THIEF
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_COOLTRAINERM_AARON
	setevent EVENT_BEAT_COOLTRAINERF_KELLY
	setevent EVENT_BEAT_COOLTRAINERF_JULIA
	setevent EVENT_BEAT_COOLTRAINERF_IRENE
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_ACTUALLY_GOT_TM46_THIEF
	writetext OkeraExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext OkeraAfterText
	waitbutton
.BagFull:
	closetext
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript
	
OkeraOwesYouOneScript:
	opentext
	writetext OkeraGivesYouSomething
	waitbutton
	verbosegiveitem BLACKGLASSES
	iffalse .NoRoom
	writetext OkeraGivesYouSomething2
	waitbutton
	closetext
	setevent EVENT_OKERA_OWES_YOU_ONE
	end
	
.NoRoom:
	closetext
	end


RematchScriptOkera:
	opentext
	writetext OkeraRematchText
	waitbutton
	closetext
	winlosstext OkeraRematchWinText, 0
	loadtrainer CHUCK, CHUCK2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_OKERA
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptOkera:
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

StandGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext CHUCK, CHUCK1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

StandGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_OKERA
	iftrue .StandGymGuyWinScript2
	opentext
	writetext StandGymGuyText2
	waitbutton
	closetext
	end

.StandGymGuyWinScript2:
	opentext
	writetext StandGymGuyWinText2
	waitbutton
	closetext
	end
	
TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfIreneAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfJulia:
	trainer COOLTRAINERF, JULIA, EVENT_BEAT_COOLTRAINERF_JULIA, CooltrainerfJuliaSeenText, CooltrainerfJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJuliaAfterText
	waitbutton
	closetext
	end
	
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end




TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end
	
LightSwitch:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   23,  31, $3D ; floor
	changeblock   21,  31, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   23,  31, $39 ; floor
	changeblock   21,  31, $39 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch2:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   19,  27, $3F ; floor
	changeblock   25,  23, $3D ; floor
	changeblock   27,  23, $19 ; floor
	changeblock   27,  21, $19 ; floor
	changeblock   27,  19, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   19,  27, $3B ; floor
	changeblock   25,  23, $39 ; floor
	changeblock   27,  23, $10 ; floor
	changeblock   27,  21, $10 ; floor
	changeblock   27,  19, $10 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch3:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   21,  13, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   21,  13, $10 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch4:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   7,  13, $3F ; floor
	changeblock   7,  11, $3F ; floor
	changeblock   7,   9, $3F ; floor
	changeblock  13,  15, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   7,  13, $3B ; floor
	changeblock   7,  11, $3B ; floor
	changeblock   7,   9, $3B ; floor
	changeblock  13,  15, $39 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch5:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock    3,  7, $3F ; floor
	changeblock    3,  9, $3F ; floor
	changeblock    7,  9, $3F ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock    3,  7, $3B ; floor
	changeblock    3,  9, $3B ; floor
	changeblock    7,  9, $3B ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end

OkeraGivesYouSomething:
	text "Buenas tío."

	para "Supongo que te"
	line "debo una por haber"
	para "espantado a esos"
	line "ROCKET de"
	cont "pacotilla."

	para "Toma, tengo algo"
	line "que te puede"
	cont "servir."
	done

OkeraGivesYouSomething2:
	text "Te será útil si"
	line "tienes #MON de"
	cont "tipo siniestro."
	done

ItsASwitch:
	text "Aquí pone"
	line "“DEFECTUOSO”."

	para "¿Lo pulsas?"
	done

ItsASwitch2:
	text "¡Las luces no se"
	line "quedan encendidas!"
	done
	
CooltrainerfIreneSeenText:
	text "¡Kiaaa! ¡Nos han"
	line "encontrado!"
	done

CooltrainerfIreneBeatenText:
	text "¡Ohhh!"
	line "¡Demasiado fuerte!"
	done

CooltrainerfIreneAfterText:
	text "La oscuridad puede"
	line "dar miedo."

	para "Pero también puede"
	line "dar seguridad."
	done

CooltrainerfJuliaSeenText:
	text "¿Crees en la mala"
	line "suerte?"
	done

CooltrainerfJuliaBeatenText:
	text "¡Yo desde luego"
	line "tengo mala suerte!"
	done

CooltrainerfJuliaAfterText:
	text "Esos interruptores"
	line "nunca han"
	cont "funcionado bien."
	done

OkeraRematchText:
	text "¿Qué quieres?"
	
	para "¿No eres ahora el"
	line "CAMPEÓN?"
	para "¿Quieres una"
	line "segunda MEDALLA o"
	cont "qué?"
	para "¡No creas que me"
	line "echaré para atrás"
	para "contra un desafío"
	line "como este!"
	done

OkeraRematchWinText:
	text "Bah…"
	done

OkeraAfterRematchText:
	text "No esperaba poder"
	line "ganar, pero nunca"
	para "me echo atrás en"
	line "un combate."

	para "Incluso si todo"
	line "está en mi contra."

	para "Tú eres igual,"
	line "¿no?"
	done

CooltrainerfKellySeenText:
	text "¿Qué ves cuando"
	line "abres los ojos en"
	cont "la oscuridad?"
	done

CooltrainerfKellyBeatenText:
	text "Vale. He perdido."
	done

CooltrainerfKellyAfterBattleText:
	text "¿Dónde está"
	line "el LÍDER del"
	cont "GIMNASIO?"
	para "Vive en las"
	line "sombras, más allá"
	cont "de lo que puedas"
	cont "ver."
	done

CooltrainermAaronSeenText:
	text "¿Te da miedo la"
	line "oscuridad?"
	done

CooltrainermAaronBeatenText:
	text "¡Uauu…!"
	line "Buen combate."
	done

CooltrainermAaronAfterBattleText:
	text "El GIMNASIO no da"
	line "tanto miedo."

	para "Es solo que las"
	line "luces están"
	cont "apagadas."
	done

StandGymGuyText2:
	text "¡Hola, joven"
	line "promesa!"

	para "¡Esto está muy"
	line "oscuro!"

	para "VELASCO suele"
	line "estar de mal"
	para "humor, y le gusta"
	line "la oscuridad."

	para "Pero no dejes que"
	line "su edad y su"
	cont "temperamento te"
	cont "engañen."

	para "¡Es un entrenador"
	line "duro!"
	done

StandGymGuyWinText2:
	text "¡Sabía que no"
	line "tendrías miedo de"
	cont "la oscuridad!"
	done

ChuckIntroText1:
	text "Je, je…"

	para "Has hecho un largo"
	line "camino desde casa,"
	cont "¿verdad?"
	para "Has experimentado"
	line "muchas cosas"
	cont "nuevas."

	para "Conocido a mucha"
	line "gente."

	para "Afrontado muchos"
	line "desafíos."

	para "…"
	para "¿Pero has enfren-"
	line "tado el poder puro"
	para "que encuentra su"
	line "fortaleza en la"
	cont "oscuridad?"
	para "Los #MON de"
	line "tipo siniestro"
	cont "tienen un poder"
	cont "incomparable."

	para "Incluso aunque sea"
	line "LÍDER de GIMNASIO"
	para "desde hace poco,"
	line "he aprendido mucho"
	cont "sobre lo que son"
	cont "capaces."

	para "Te lo demostraré."
	done

OkeraLossText:
	text "Pues he perdido."

	para "No me lo esperaba."

	para "Pero esto"
	line "demuestra que eres"
	para "digno de tener la"
	line "MEDALLA OCASO."
	done

GetStormBadgeText:
	text "<PLAYER> recibió"
	line "la MEDALLA OCASO."
	done

ChuckExplainBadgeText:
	text "Con la MEDALLA"
	line "OCASO, te obedece-"
	cont "rán los #MON"
	cont "hasta el nivel 70."

	para "Tus #MON podrán"
	line "usar GOLPE ROCA"
	cont "cuando no estén"
	cont "combatiendo."

	para "Me pillas de buen"
	line "humor, así que"
	cont "toma esto."
	done

OkeraExplainTMText:
	text "Se trata de"
	line "LADRÓN."

	para "Además de provocar"
	line "daño, puede robar"
	para "el objeto que"
	line "tenga equipado el"
	cont "oponente."
	done

OkeraAfterText:
	text "Ha sido un buen"
	line "combate."

	para "Tu desafío no me"
	line "ha hecho perder el"
	cont "tiempo."
	done

StandGym_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 26, 35, STAND_CITY, 3
	warp_event 27, 35, STAND_CITY, 12
	warp_event 26, 33, STAND_GYM, 4
	warp_event  7, 35, STAND_GYM, 3

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 33, BGEVENT_READ, StandGymStatue
	bg_event 28, 33, BGEVENT_READ, StandGymStatue
	bg_event 24, 28, BGEVENT_READ, LightSwitch
	bg_event 22, 22, BGEVENT_READ, LightSwitch2
	bg_event 20,  8, BGEVENT_READ, LightSwitch3
	bg_event  8, 12, BGEVENT_READ, LightSwitch4
	bg_event  4,  4, BGEVENT_READ, LightSwitch5

	db 6 ; object events
	object_event  6, 33, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandGymOkeraScript, EVENT_OKERA_NOT_IN_GYM
	object_event 29, 33, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript2, -1
	object_event 20, 25, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, -1
	object_event 23,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKelly, -1
	object_event 10, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfIrene, -1
	object_event  5,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfJulia, -1

