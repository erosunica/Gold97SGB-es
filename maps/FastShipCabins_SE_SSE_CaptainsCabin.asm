	object_const_def ; object_event constants
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	checkevent EVENT_CAPTAIN_TOLD_YOU_ABOUT_BROKEN_SHIP
	iffalse .FirstCaptainTalk
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end
	
.FirstCaptainTalk
	writetext SSAquaCaptainShipIsBrokenText
	waitbutton
	closetext
;	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN, DOWN
;	pause 20
;	playsound SFX_ELEVATOR_END
;	pause 30
;	opentext
;	writetext SSAquaHasArrivedAmamiText
;	waitbutton
;	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	setevent EVENT_CAPTAIN_TOLD_YOU_ABOUT_BROKEN_SHIP
;	closetext
	end
	

.LaterTrip:
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iffalse .GiveMetalCoatCaptain
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end
	
.GiveMetalCoatCaptain
	writetext SSAquaCaptainThankYouText
	waitbutton
	verbosegiveitem METAL_COAT
	iffalse SSCaptain_NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end
	
SSCaptain_NoRoom:
	writetext SSCaptain_NoRoomText
	waitbutton
	closetext
	end
	
;.NoRoom:
;	closetext
;	waitsfx
;	playsound SFX_ELEVATOR_END
;	pause 30
;	opentext
;	writetext SSAquaHasArrivedAmamiText
;	waitbutton
;	setevent EVENT_FAST_SHIP_HAS_ARRIVED
;	setevent EVENT_FAST_SHIP_FOUND_GIRL
;	closetext
;	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd TrashCanScript

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end
	
SSCaptain_NoRoomText:
	text "¡Vaya, no tienes"
	line "sitio para mi"
	cont "regalo!"
	done

SSAquaCaptainThankYouText:
	text "¡Ah, eres tú!"

	para "¡El chico que"
	line "ayudó a reparar el"
	cont "barco!"

	para "¡Muchísimas"
	line "gracias!"

	para "Me gustaría darte"
	line "esto como muestra"
	cont "de mi gratitud."
	done

SSAquaCaptainShipIsBrokenText:
	text "Oh, vaya."

	para "Estamos en un"
	line "serio aprieto."

	para "Este mal tiempo"
	line "ha dañado el"
	para "principal TUBO"
	line "COMBUSTIBLE del"
	cont "barco."

	para "Tenemos reservas"
	line "para llegar hasta"
	cont "PUEBLO AMAMI."

	para "¡Pero no podremos"
	line "hacer el viaje de"
	para "vuelta hasta que"
	line "esté reparado!"

	para "¿Es mucho pedir"
	line "que nos eches una"
	cont "mano?"

	para "Hay un tipo en"
	line "CIUDAD KUME"
	para "especializado en"
	line "reparar barcos."

	para "Él tendrá la pieza"
	line "que necesitamos."

	para "Cuando atraquemos,"
	line "¿podrías pasarte"
	para "por allí para"
	line "conseguir el"
	cont "reemplazo?"

	para "¡No podremos"
	line "volver a tierra"
	cont "firme hasta que lo"
	cont "reparemos!"
	done

SSAquaCaptainExhaustingText:
	text "¿Nos ayudarías,"
	line "por favor?"
	done

SSAquaCaptainHowDoYouLikeText:
	text "¿Te gusta viajar"
	line "en el S.S. AQUA?"

	para "Prácticamente"
	line "vuela por encima"
	cont "de las olas."
	done

PokefanmColinSeenText:
	text "¡Hola, peque!"
	line "¿Quieres luchar?"
	done

PokefanmColinBeatenText:
	text "¡Eres fuerte!"
	done

PokefanmColinAfterBattleText:
	text "¿Viajas sin"
	line "compañía?"

	para "¿Tu madre no está"
	line "preocupada?"
	done

TwinsMegandpeg1SeenText:
	text "¿Crees que soy un"
	line "bebé?"
	cont "¡No es justo!"
	done

TwinsMegandpeg1BeatenText:
	text "¡Oh! ¡Perdimos!"
	done

TwinsMegandpeg1AfterBattleText:
	text "¡No deberías"
	line "llamarnos bebé a"
	cont "las chicas!"
	done

TwinsMegandpeg2SeenText:
	text "¡No soy un bebé!"

	para "¡Y no deberías"
	line "llamar así a"
	para "una señorita!"
	done

TwinsMegandpeg2BeatenText:
	text "¡Oh! ¡Perdimos!"
	done

TwinsMegandpeg2AfterBattleText:
	text "A veces, los niños"
	line "son más listos que"
	cont "los adultos."
	done

PsychicRodneySeenText:
	text "¡Ssh! ¡Mi cerebro"
	line "está captando"
	cont "señales de radio!"
	done

PsychicRodneyBeatenText:
	text "¡Escucho algo…!"
	done

PsychicRodneyAfterBattleText:
	text "Entiendo. Puedes"
	line "oír la radio de"
	cont "NIHON aquí."
	done

PokefanmJeremySeenText:
	text "¿Qué opinas? Mis"
	line "#MON son"
	cont "bonitos, ¿verdad?"
	done

PokefanmJeremyBeatenText:
	text "¡Oh, no! ¡Mis"
	line "preciosos #MON!"
	done

PokefanmJeremyAfterBattleText:
	text "¡Debo ir a la"
	line "PELUQUERÍA #MON"
	cont "para ponerlos"
	cont "guapos!"
	done

PokefanfGeorgiaSeenText:
	text "Me voy de compras"
	line "al C. COMERCIAL"
	cont "y luego…"
	done

PokefanfGeorgiaBeatenText:
	text "¿Qué es lo que"
	line "iba a hacer?"
	done

PokefanfGeorgiaAfterBattleText:
	text "¡Ah, sí! Tengo que"
	line "ir a buscar a mis"

	para "#MON a la"
	line "GUARDERÍA."
	done

SupernerdShawnSeenText:
	text "¿Qué tipos de"
	line "# BALL llevas"
	cont "contigo?"
	done

SupernerdShawnBeatenText:
	text "¡Espera! ¡Detente!"
	line "¡No, por favor!"
	done

SupernerdShawnAfterBattleText:
	text "Deberías usar las"
	line "BALL adecuadas"
	para "para cada"
	line "situación."
	done

SSAquaHasArrivedAmamiText:
	text "El FERRY S.S. AQUA"
	line "ha llegado a"
	cont "PUEBLO AMAMI."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  4, 33, FAST_SHIP_1F, 10
	warp_event  5, 33, FAST_SHIP_1F, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	db 8 ; object events
	object_event  5, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
