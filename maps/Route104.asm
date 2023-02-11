	object_const_def ; object_event constants
	const ROUTE104_LASS
	const ROUTE104_FRUIT_TREE
	const ROUTE104_GARDENER
	const ROUTE104_SUPER_NERD
	const ROUTE104_POKEFAN_M
	const ROUTE104_FIREBREATHER
	const ROUTE104_CAMPER
	const ROUTE104_TEACHER
	const ROUTE104_OFFICER
	const ROUTE104_TUSCANY
	const ROUTE104_ITEMBALL

Route104_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute104Gardener ; SCENE_DEFAULT
	scene_script .SceneRoute104Nothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany


.SceneRoute104Gardener
	end

.SceneRoute104Nothing
	end

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE104_TUSCANY
	return

.DoesTuscanyAppear:
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE104_TUSCANY
	return
	
GardenerStopsYou:
	jump Route104GardenerScript
	end

GardenerStopsYou2:
	jump Route104GardenerScript
	end

Route104GardenerScript:
	showemote EMOTE_SHOCK, ROUTE104_GARDENER, 15
	opentext
	writetext DontStepFlowers
	waitbutton
	closetext
	applymovement PLAYER, Movement_1LEFT
	end
	
Route104GardenerWateringScript:
	opentext
	writetext LaDiDa
	waitbutton
	closetext
	end
	
Route104LassScript:
	jumptextfaceplayer Route104LassText

Route104TeacherScript:
	jumptextfaceplayer Route104TeacherText


Route104Sign:
	jumptext Route104SignText
	
Route104SignActual:
	jumptext Route104SignActualText

Route104FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_104
	
Movement_1LEFT:
	step LEFT
	step_end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end


TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end


TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end
	
Route104TMEndure:
	itemball TM_ENDURE


Route104LassText:
	text "Uf, uf…"

	para "Menuda caminata"
	line "para llegar hasta"
	cont "aquí."

	para "Pero aún queda"
	line "mucho para llegar"
	cont "a CIUDAD ALEAR."

	para "El BOSQUE JADE es"
	line "un laberinto."

	para "Será mejor que me"
	line "prepare."
	done

Route104TeacherText:
	text "No lo entiendo."

	para "Vine a esta ruta"
	line "saltando por esta"
	cont "cornisa."

	para "Pero ahora no sé"
	line "cómo volver a"
	cont "PUEBLO BIRDON."

	para "Tiene que haber"
	line "una manera…"
	done

DontStepFlowers:
	text "¡Eh!"

	para "¡No pises ahí!"

	para "¡He trabajado"
	line "mucho para tener"
	para "un bonito jardín"
	line "en una zona tan"
	cont "seca!"

	para "¡No arruines mis"
	line "flores!"
	done

LaDiDa:
	text "Lalala, lalalala."

	para "¡Cómo me gusta"
	line "cuidar mi jardín!"
	done

SupernerdSamSeenText:
	text "¿Coleccionas"
	line "#MON raros?"
	done

SupernerdSamBeatenText:
	text "¡Oye!"
	done

SupernerdSamAfterBattleText:
	text "Colecciono #MON"
	line "raros."

	para "O eso me gustaría"
	line "decir."
	done
	
HikerDanielSeenText:
	text "Voy de camino a"
	line "una gran escalada."

	para "¡Veamos lo"
	line "preparado que"
	cont "estoy!"
	done

HikerDanielBeatenText:
	text "¡Calambre en los"
	line "pies!"
	done

HikerDanielAfterBattleText:
	text "Tendré que"
	line "prepararme mejor"
	cont "para este viaje."
	done

FirebreatherBurtSeenText:
	text "¿Podrás aguantar"
	line "el calor que puedo"
	cont "dar?"
	done

FirebreatherBurtBeatenText:
	text "¡Quema, quema!"
	done

FirebreatherBurtAfterBattleText:
	text "¡Vaya calor hace"
	line "en esta RUTA!"
	done

CamperElliotSeenText:
	text "¡Voy de camino a"
	line "acampar en el"
	cont "BOSQUE!"
	done

CamperElliotBeatenText:
	text "¡Me has vencido!"
	done

CamperElliotAfterBattleText:
	text "Esta zona es muy"
	line "seca."

	para "Pero el BOSQUE que"
	line "hay más adelante"
	cont "es mucho más"
	cont "fértil."
	done
	

OfficerDirkSeenText:
	text "¡El peligro acecha"
	line "por la noche!"
	done

OfficerDirkBeatenText:
	text "¡Uy!"
	done

OfficerDirkAfterBattleText:
	text "Ya sabes, la noche"
	line "es divertida a su"
	cont "manera."

	para "Pero no te pases,"
	line "¿vale?"
	done

OfficerDirkPrettyToughText:
	text "Tus #MON son"
	line "bastante fuertes."

	para "Estarás a salvo en"
	line "cualquier parte."
	done

Route104SignText:
	text "CASA DE GODOFREDO"
	line "EL JARDINERO"
	done
	
Route104SignActualText:
	text "RUTA 104"
	
	para "PUEBLO BIRDON -"
	line "CIUDAD ALEAR"
	done	

MeetTuscanyText:
	text "MARTA: Creo que es"
	line "la primera vez que"
	cont "nos vemos."

	para "Déjame que me"
	line "presente. Soy"
	cont "MARTA, por martes."
	done

TuscanyGivesGiftText:
	text "Como presentación,"
	line "por favor, toma"
	para "este regalo:"
	line "un LAZO ROSA."
	done

TuscanyGaveGiftText:
	text "MARTA: ¿No crees"
	line "que es adorable?"

	para "Fortalece los"
	line "movimientos de"
	cont "tipo normal."

	para "Seguro que te"
	line "será muy útil."
	done

TuscanyTuesdayText:
	text "MARTA: ¿Has visto"
	line "a LUNA, mi hermana"
	cont "mayor?"

	para "¿O a mi hermano"
	line "pequeño, MIGUEL?"

	para "Soy la segunda de"
	line "siete hermanos."
	done

TuscanyNotTuesdayText:
	text "MARTA: Hoy no es"
	line "martes."
	cont "¡Qué pena…!"
	done

Route104_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 55,  7, ROUTE_104_GEOFFS_HOUSE, 1

	db 2 ; coord events
	coord_event 52, 12, SCENE_DEFAULT, GardenerStopsYou
	coord_event 52, 13, SCENE_DEFAULT, GardenerStopsYou2

	db 2 ; bg events
	bg_event 56,  8, BGEVENT_READ, Route104Sign
	bg_event  6,  8, BGEVENT_READ, Route104SignActual

	db 11 ; object events
	object_event 88,  7, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104LassScript, -1
	object_event 61,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route104FruitTree, -1
	object_event 52, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route104GardenerWateringScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 59,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdSam, -1
	object_event 12, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event 82, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
	object_event 45,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperElliot, -1
	object_event 24, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104TeacherScript, -1
	object_event 76, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event 48,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_101_TUSCANY_OF_TUESDAY
	object_event 68,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route104TMEndure, EVENT_BURNED_TOWER_B1F_TM_ENDURE

