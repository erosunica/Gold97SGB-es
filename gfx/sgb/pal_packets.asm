; macros taken from pokered's data/sgb_packets.asm
; names taken from pandocs
; http://gbdev.gg8.se/wiki/articles/SGB_Functions#SGB_Palette_Commands

sgb_pal_set: MACRO
	db (SGB_PAL_SET << 3) + 1
	dw PREDEFPAL_\1, PREDEFPAL_\2, PREDEFPAL_\3, PREDEFPAL_\4
	ds 7
ENDM

sgb_pal01: MACRO
	db (SGB_PAL01 << 3) + 1
ENDM

sgb_pal23: MACRO
	db (SGB_PAL23 << 3) + 1
ENDM

PalPacket_PackYellowred:
	sgb_pal_set PACK_YELLOWRED, PACK_BLUEGREEN, ROUTES, ROUTES

PalPacket_BetaPokegear:
	sgb_pal_set BETA_POKEGEAR, POKEGEAR, BETA_RADIO, ROUTES

PalPacket_BetaPoker:
	sgb_pal_set BETA_POKER_0, BETA_POKER_1, BETA_POKER_2, BETA_POKER_3

PalPacket_UnownPuzzle:
	sgb_pal_set UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE

PalPacket_a045:
	sgb_pal_set ROUTES, ROUTES, ROUTES, ROUTES

PalPacket_GSIntroShellderLapras:
	sgb_pal_set GS_INTRO_SHELLDER_LAPRAS, ROUTES, ROUTES, ROUTES

PalPacket_Pokedex:
	sgb_pal_set RB_REDMON, ROUTES, POKEDEX_BW, ROUTES

PalPacket_GSIntroJigglypuffPikachu:
	sgb_pal_set GS_INTRO_JIGGLYPUFF_PIKACHU_BG, GS_INTRO_JIGGLYPUFF_PIKACHU_OB, ROUTES, ROUTES

PalPacket_GSIntroStartersTransition:
	sgb_pal_set GS_INTRO_STARTERS_TRANSITION, ROUTES, ROUTES, ROUTES

PalPacket_BetaIntroVenusaur: ; unused
	sgb_pal_set ROUTES, ROUTES, ROUTES, ROUTES

PalPacket_PackBluegreen:
	sgb_pal_set PACK_BLUEGREEN, PACK_YELLOWRED, ROUTES, ROUTES

PalPacket_BetaPikachuMinigame:
	sgb_pal_set GS_INTRO_JIGGLYPUFF_PIKACHU_OB, ROUTES, ROUTES, ROUTES

PalPacket_PartyMenu:
	sgb_pal_set BETA_SHINY_GREYMON, HP_GREEN, HP_YELLOW, HP_RED

PalPacket_BattleGrayscale:
	sgb_pal_set BLACKOUT, BLACKOUT, BLACKOUT, BLACKOUT

PalPacket_Pokegear:
	sgb_pal_set POKEGEAR, ROUTES, ROUTES, ROUTES

PalPacket_OptionsMenu:
	sgb_pal_set NITE, ROUTES, ROUTES, ROUTES

PalPacket_SlotMachine:
	sgb_pal_set SLOT_MACHINE_0, SLOT_MACHINE_1, SLOT_MACHINE_2, SLOT_MACHINE_3

PalPacket_BetaTitleScreen:
	sgb_pal_set BETA_LOGO_1, BETA_LOGO_2, RB_MEWMON, RB_PURPLEMON

PalPacket_Diploma:
	sgb_pal_set RB_MEWMON, ROUTES, ROUTES, ROUTES

PalPacket_TradeTube:
	sgb_pal_set RB_BLUEMON, ROUTES, ROUTES, ROUTES

PalPacket_GamefreakLogo:
	sgb_pal_set GS_INTRO_GAMEFREAK_LOGO, ROUTES, ROUTES, ROUTES

PalPacket_Pack:
	sgb_pal_set PACK, ROUTES, ROUTES, ROUTES

PalPacket_a155:
	sgb_pal01
IF MGB
	RGB 22, 23, 19
ELSE
	RGB 28, 28, 28
ENDC
rept 6
IF MGB
	RGB 04, 05, 04
ELSE
	RGB 04, 04, 04
ENDC
endr
	ds 1

PalPacket_a165:
	sgb_pal23
IF MGB
	RGB 22, 23, 19
ELSE
	RGB 28, 28, 28
ENDC
rept 6
IF MGB
	RGB 04, 05, 04
ELSE
	RGB 04, 04, 04
ENDC
endr
	ds 1
