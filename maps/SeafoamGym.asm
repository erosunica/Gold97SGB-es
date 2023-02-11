	object_const_def ; object_event constants
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUY

SeafoamGym_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .TalkedToSeafoamGymGuyScript
	writetext SeafoamGymGuyWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	end

.TalkedToSeafoamGymGuyScript:
	writetext SeafoamGymGuyWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: ¡Buaaa!"

	para "Mi GIMNASIO de"
	line "PUEBLO ESCARCHA se"
	cont "ha quemado."

	para "El volcán nos ha"
	line "dejado sin casa a"
	para "mis #MON"
	line "comefuego y a mí."

	para "¡Buaaaa!"

	para "Pero sigo haciendo"
	line "mi trabajo de"

	para "LÍDER de GIMNASIO"
	line "en esta cueva."

	para "Si me vences, te"
	line "daré una MEDALLA."

	para "¡Ja! Espero que"
	line "tengas ANTIQUEMAR."
	done

BlaineWinLossText:
	text "BLAINE: Increíble."
	line "Me consumí…"

	para "¡Has ganado la"
	line "MEDALLA VOLCÁN!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> recibió"
	line "la MED. VOLCÁN."
	done

BlaineAfterBattleText:
	text "BLAINE: Esta vez"
	line "he perdido, pero"
	para "la próxima te"
	line "ganaré."

	para "Cuando reconstruya"
	line "mi GIMNASIO de"
	cont "PUEBLO ESCARCHA,"
	cont "tendremos la"
	cont "revancha."
	done

BlaineFightDoneText:
	text "BLAINE: Mis"
	line "#MON de fuego"
	para "serán más fuertes."
	line "¡Ya lo verás!"
	done

SeafoamGymGuyWinText:
	text "¡Vaya!"

	para "¿Eh…?"
	line "¿Ya ha acabado?"

	para "¡Lo siento!"

	para "El GIMNASIO de"
	line "PUEBLO ESCARCHA ya"
	para "no existe y no"
	line "sabía dónde"
	cont "encontrarte."

	para "Pero eres fuerte"
	line "hasta sin mis"
	para "consejos. ¡Sabía"
	line "que ganarías!"
	done

SeafoamGymGuyWinText2:
	text "Los GIMNASIOS"
	line "#MON están allí"
	para "donde se encuentre"
	line "su LÍDER."

	para "No es necesario"
	line "un edificio."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  5, ISEN_STRAIT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
