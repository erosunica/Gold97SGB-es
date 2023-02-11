	object_const_def ; object_event constants
	const KANTO_LABORATORY_FOSSIL_SCIENTIST
	const KANTO_LABORATORY_SCIENTIST_1
	const KANTO_LABORATORY_SCIENTIST_2
	const KANTO_LABORATORY_GENTLEMAN

KantoLaboratory_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoLaboratoryFossilScientist:
	faceplayer
	opentext
	checkitem OLD_AMBER; old amber
	iftrue .GetAerodactyl
	checkitem HELIX_FOSSIL; helix fossil
	iftrue .GetOmanyte
	checkitem DOME_FOSSIL; dome fossil
	iftrue .GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	closetext
	end
	
.GetAerodactyl
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveOldAmberText
	yesorno
	iftrue .GetAerodactyl2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetAerodactyl2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullAerodactyl
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnAerodactyl
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 15
	takeitem OLD_AMBER
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullAerodactyl
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
	
.GetOmanyte
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveHelixFossilText
	yesorno
	iftrue .GetOmanyte2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetOmanyte2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullOmanyte
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnOmanyte
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 15
	takeitem HELIX_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullOmanyte
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	

.GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveDomeFossilText
	yesorno
	iftrue .GetKabuto2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetKabuto2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullKabuto
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAKabuto
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 15
	takeitem DOME_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullKabuto
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
KantoLaboratoryScientist1Script:
	jumptextfaceplayer KantoLaboratoryScientist1Text
	
KantoLaboratoryScientist2Script:
	faceplayer
	opentext
	writetext KantoLabPhotoStudioScientistText_Question
	yesorno
	iffalse .Refused
	writetext KantoLabPhotoStudioScientistText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext KantoLabPhotoStudioScientistText_No
	waitbutton
	closetext
	end

KantoLaboratoryGentlemanScript:
	jumptextfaceplayer KantoLaboratoryGentlemanText
	
KantoLaboratoryBookshelf:
	jumpstd DifficultBookshelfScript

	
ScientistGoesToMachine1:
	step UP
	step UP
	step UP
	step_end
	
ScientistGoesToMachine2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
ScientistGoesToMachine3:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end
	
ScientistGoesToMachine4:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
ScientistGoesToMachine5:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
ScientistGoesToMachine6:
	step LEFT
	step UP
	step_end
	
ScientistGoesToMachine7:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KantoLaboratoryGentlemanText:
	text "Este lugar es un"
	line "punto de encuentro"
	para "para los mejores"
	line "investigadores de"
	cont "NIHON."
	done

KantoLaboratoryScientist1Text:
	text "¿Lo sabías?"

	para "¡Hemos hecho"
	line "grandes avances en"
	para "la tecnología para"
	line "estudiar los"
	cont "#MON fósil!"

	para "¡Ahora podemos"
	line "revivir #MON"
	para "fosilizados en"
	line "apenas unos"
	cont "segundos!"
	done

ScientistHereYouGoText:
	text "¡Ya está!"

	para "¡Aquí tienes!"
	done

IfYouHaveAnyOtherFossilsText:
	text "¡Vuelve si llegas"
	line "a conseguir otros"
	cont "fósiles!"
	done

NoRoomForFossilmon:
	text "¡Espera! ¡Aún no"
	line "puedo hacerlo!"

	para "¡Tienes que hacer"
	line "un hueco para"
	cont "llevar este"
	cont "#MON!"

	para "¡Vuelve cuando"
	line "tengas un espacio"
	cont "libre en tu"
	cont "equipo!"
	done

PlayerGetsAnOmanyte:
	text "¡<PLAYER> recibió"
	line "a OMANYTE!"
	done

PlayerGetsAKabuto:
	text "¡<PLAYER> recibió"
	line "a KABUTO!"
	done

PlayerGetsAnAerodactyl:
	text "¡<PLAYER> recibió"
	line "a AERODACTYL!"
	done

TimeToGetAFossilmonText:
	text "¡Muy bien, déjame"
	line "el fósil y lo"
	cont "reviviré en un"
	cont "instante!"
	done

YouHaveHelixFossilText:
	text "Oh, ¿qué es esto?"

	para "¡Tienes un FÓSIL"
	line "HELIX!"

	para "¿Quieres que lo"
	line "convierta en un"
	cont "#MON?"
	done

YouHaveDomeFossilText:
	text "Oh, ¿qué es esto?"

	para "¡Tienes un FÓSIL"
	line "DOMO!"

	para "¿Quieres que lo"
	line "convierta en un"
	cont "#MON?"
	done

YouHaveOldAmberText:
	text "Oh, ¿qué es esto?"

	para "¡Tienes un ÁMBAR"
	line "VIEJO!"

	para "¿Quieres que lo"
	line "convierta en un"
	cont "#MON?"
	done

AnotherTimeFossilText:
	text "¿En serio?"

	para "Bueno, vuelve si"
	line "cambias de"
	cont "opinión."
	done

FossilScientistIntroText:
	text "¡Hola! ¡Soy un"
	line "científico"
	para "especializado en"
	line "#MON fósiles!"

	para "¡Si tienes algún"
	line "fósil, dámelo y"
	para "podré revivir a"
	line "esos #MON!"
	done

KantoLabPhotoStudioScientistText_Question:
	text "Este dispositivo"
	line "puede hacer"
	cont "fotografías de tus"
	cont "#MON."

	para "¿Te interesa?"

	para "¿Quieres una foto"
	line "de recuerdo?"
	done

KantoLabPhotoStudioScientistText_Yes:
	text "¡Vale! ¡Sonríe!"
	done

KantoLabPhotoStudioScientistText_No:
	text "¡Oh! ¡Qué mal!"
	line "Pensaba que sería"
	para "un maravilloso"
	line "recuerdo…"
	done	


KantoLaboratory_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  2, 15, KANTO_REGION, 28
	warp_event  3, 15, KANTO_REGION, 29
	warp_event 14, 10, KANTO_LABORATORY, 4
	warp_event  2,  7, KANTO_LABORATORY, 3
	warp_event  3,  7, KANTO_LABORATORY, 3
	warp_event 10, 10, KANTO_LABORATORY, 7
	warp_event 14,  5, KANTO_LABORATORY, 6
	warp_event 15,  5, KANTO_LABORATORY, 6

	db 0 ; coord events

	db 8 ; bg events
	bg_event 19,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 18,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 13,  0, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 12,  0, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  7, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  6, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  5, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  4, 13, BGEVENT_READ, KantoLaboratoryBookshelf

	db 4 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryFossilScientist, EVENT_SCIENTIST_SEQUENCE
	object_event 17,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryScientist1Script, -1
	object_event 12,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryScientist2Script, -1
	object_event 16, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryGentlemanScript, -1
