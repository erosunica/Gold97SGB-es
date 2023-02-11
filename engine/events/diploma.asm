ret_e0000:
	ret

	ret ; unused

_Diploma:
	call PlaceDiplomaOnScreen
	call WaitPressAorB_BlinkCursor ; erosunica: extra wait step to show the 2nd page of the diploma
	call PrintDiplomaPage2 ; erosunica: show the 2nd page of the diploma
	call WaitPressAorB_BlinkCursor
	ret

PlaceDiplomaOnScreen:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	call DisableLCD
	ld hl, DiplomaGFX
	ld de, vTiles2
	call Decompress
	ld hl, DiplomaPage1Tilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, .Player
	hlcoord 3, 5
	call PlaceString
	ld de, .EmptyString
	hlcoord 16, 5
	call PlaceString
	ld de, wPlayerName
	hlcoord 11, 5
	call PlaceString
	ld de, .Certification
	hlcoord 2, 8
	call PlaceString
	ld de, .GameFreak
	hlcoord 8, 16
	call PlaceString
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	ret

.Player:
	db "JUGADOR@"

.EmptyString:
	db "@"

.Certification:
	db   "Se certifica que"
	next "has completado"
	next "con éxito tu"
	next "POKéDEX.@"

.GameFreak: db "GAME FREAK@"

PrintDiplomaPage2:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ld hl, DiplomaPage2Tilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, .PlayTime
	hlcoord 2, 15
	call PlaceString
	hlcoord 11, 15
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], $67 ; colon
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.PlayTime: db "TIEMPO J.@"

DiplomaGFX:
INCBIN "gfx/diploma/diploma.2bpp.lz"

DiplomaPage1Tilemap:
INCBIN "gfx/diploma/page1.tilemap"

DiplomaPage2Tilemap:
INCBIN "gfx/diploma/page2.tilemap"
