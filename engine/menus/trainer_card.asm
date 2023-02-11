; TrainerCard.Jumptable indexes
	const_def
	const TRAINERCARDSTATE_PAGE1_LOADGFX ; 0
	const TRAINERCARDSTATE_PAGE1_JOYPAD  ; 1
	const TRAINERCARDSTATE_PAGE2_LOADGFX ; 2
	const TRAINERCARDSTATE_PAGE2_JOYPAD  ; 3
	const TRAINERCARDSTATE_QUIT          ; 4
	const TRAINERCARDSTATE_PAGEFLIP

TrainerCard:
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .InitRAM
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .quit
	ldh a, [hJoyLast]
	and B_BUTTON
	jr nz, .quit
	call .RunJumptable
	call DelayFrame
	jr .loop

.quit
	pop af
	ld [wOptions], a
	pop af
	ld [wVramState], a
	ret

.InitRAM:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD

	ld hl, ChrisCardPic
	ld de, vTiles2
	ld bc, 41 tiles
	ld a, BANK(ChrisCardPic)
	call FarCopyBytes

	ld hl, CardStatusGFX
	ld de, vTiles2 tile $29
	ld bc, 86 tiles
	ld a, BANK(CardStatusGFX)
	call FarCopyBytes

	ld hl, CardNameGFX
	ld de, vTiles0 tile $c8
	ld bc, 6 tiles
	ld a, BANK(CardNameGFX)
	call FarCopyBytes

	call TrainerCard_PrintTopHalfOfCard 

	hlcoord 0, 8
	ld d, 6
	call TrainerCard_InitBorder

	call EnableLCD
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap
	ld hl, wJumptableIndex
	xor a ; TRAINERCARDSTATE_PAGE1_LOADGFX
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTrainerCardBadgeFrameCounter
	ld [hli], a ; wTrainerCardBadgeTileID
	ld [hl], a  ; wTrainerCardBadgeAttributes
	ld [wTrainerCardSelected], a ; v7.xx
	ret

.RunJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
; entries correspond to TRAINERCARDSTATE_* constants
	dw TrainerCard_Page1_LoadGFX
	dw TrainerCard_Page1_Joypad
	dw TrainerCard_Page2_LoadGFX
	dw TrainerCard_Page2_Joypad
	dw TrainerCard_Quit
	dw TrainerCard_PageFlip

TrainerCard_IncrementJumptable:
	ld hl, wJumptableIndex
	inc [hl]
	ret

TrainerCard_Quit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TrainerCard_Page1_LoadGFX:
	;call ClearSprites

	hlcoord 0, 8
	ld d, 6
	call TrainerCard_InitBorder
	call WaitBGMap
	
	ld de, CardStatusGFX
	ld hl, vTiles2 tile $29
	lb bc, BANK(CardStatusGFX), 86
	call Request2bpp

	ld de, CardBorderGFX
	ld hl, vTiles2 tile $79
	lb bc, BANK(CardBorderGFX), 6
	call Request2bpp

	hlcoord 0, 13
	lb bc, 1, $12
	call TextboxBorder
	hlcoord $13, $d
	ld [hl], "─"
	hlcoord $13, $e
	ld [hl], " "
	hlcoord $13, $f
	ld [hl], "─"

	call TrainerCard_Page1_PrintDexCaught_GameTime
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page1_Joypad:
	call TrainerCard_Page1_PrintGameTime
	ld hl, hJoyLast
;	ld a, [hl]
;	and D_RIGHT | A_BUTTON
;	jr nz, .pressed_right_a
	ld a, [hl]
	and D_RIGHT
	jr nz, .pressed_right
	
	ld a, [hl]
	and D_LEFT
	jr nz, .pressed_left
	
	ld a, [hl]
	and A_BUTTON
	jr nz, .selected

; print arrow
	hlcoord 2, $10
	ld [hl], " "
	hlcoord $9, $10
	ld [hl], " "

	ld a, [wTrainerCardSelected]
	and a
	jr nz, .on_badges
; on 'EXIT'
	hlcoord 2, $10
	ld [hl], "▶"
	ret

.on_badges
	hlcoord $9, $10
	ld [hl], "▶"
	ret
	ret

.pressed_left
	ld a, [wTrainerCardSelected]
	and a
	ret z	; clip when wTrainerCardSelected == 0
	dec a
	ld [wTrainerCardSelected], a
	ret

.pressed_right
	ld a, [wTrainerCardSelected]
	and a
	ret nz ; clip when wTrainerCardSelected == 1
	inc a
	ld [wTrainerCardSelected], a
	ret

.selected
	ld a, [wTrainerCardSelected]
	and a
	jr z, .do_exit
; switch to page 2
	ld a, TRAINERCARDSTATE_PAGEFLIP
	ld [wJumptableIndex], a
	ret

.do_exit
	ld a, TRAINERCARDSTATE_QUIT
	ld [wJumptableIndex], a
	ret

TrainerCard_PageFlip:
; nevermind...
	;ld a, $90
	;ld hl, hSCY
	;dec [hl]
	;dec [hl]
	;cp [hl]
	;ret nz
	;xor a
	;ld [hl], a
	ld a, TRAINERCARDSTATE_PAGE2_LOADGFX
	ld [wJumptableIndex], a
	ret

TrainerCard_Page2_LoadGFX:
	call ClearSprites
	hlcoord 0, 0
	ld d, 14
	call TrainerCard_InitBorder
	call WaitBGMap
;;; erosunica: load darkened portrait and --- name for the last leader if you don't have 8 badges
	ld hl, wBadges
	ld b, wTMsHMs - wBadges
	call CountSetBits
	ld de, wNumSetBits
	cp 8
	jr z, .RisingBadgeObtained
	ld de, LeaderGFXPreRed
	ld hl, vTiles2 tile $29
	lb bc, BANK(LeaderGFXPreRed), 86
	call Request2bpp
	jr .NoRisingBadge	
.RisingBadgeObtained
;;;
	ld de, LeaderGFX
	ld hl, vTiles2 tile $29
	lb bc, BANK(LeaderGFX), 86
	call Request2bpp	
.NoRisingBadge
	ld de, BadgeGFX
	ld hl, vTiles0 tile $00
	lb bc, BANK(BadgeGFX), 44
	call Request2bpp

; temporarily map ÄÖÜäöü to border tiles
	ld de, CardBorderGFX
	ld hl, vTiles0 tile $C0
	lb bc, BANK(CardBorderGFX), 6
	call Request2bpp

; temporarily map ÄÖÜäöü to border tiles
	ld de, CardLeftArrowGFX
	ld hl, vTiles0 tile $C0
	lb bc, BANK(CardLeftArrowGFX), 1
	call Request2bpp

	ld de, LeaderExtraGFX
	ld hl, vTiles0 tile $C6
	lb bc, BANK(LeaderExtraGFX), 2
	call Request2bpp

	call TrainerCard_Page2_3_InitObjectsAndStrings
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page2_Joypad:
	ld hl, TrainerCard_NihonBadgesOAM
	call TrainerCard_Page2_3_AnimateBadges
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON
	jr nz, .Quit
	ld a, [hl]
	and D_LEFT
	jr nz, .d_left
	ret

.d_left
	call ClearSprites

	hlcoord 0, 0
	ld d, 14
	call TrainerCard_InitBorder
	ld c, 3
	call DelayFrames

	ld hl, ChrisCardPic
	ld de, vTiles2
	lb bc, BANK(ChrisCardPic), 41
	call Request2bpp

	ld hl, CardStatusGFX
	ld de, vTiles2 tile $29
	lb bc, BANK(CardStatusGFX), 86
	call Request2bpp

	ld hl, CardNameGFX
	ld de, vTiles0 tile $c8
	lb bc, BANK(CardNameGFX), 6
	call Request2bpp

	call TrainerCard_PrintTopHalfOfCard

	ld a, TRAINERCARDSTATE_PAGE1_LOADGFX
	ld [wJumptableIndex], a
	ret

.Quit:
	ld a, TRAINERCARDSTATE_QUIT
	ld [wJumptableIndex], a
	ret

TrainerCard_PrintTopHalfOfCard:
	hlcoord 0, 0
	ld d, 5
	call TrainerCard_InitBorder
	hlcoord 1, 0
	ld de, .NameTilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 2
	ld de, .Name_Money
	call PlaceString
	hlcoord 2, 4
	ld de, .ID_No
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 2
	ld de, wPlayerName
	call PlaceString
	hlcoord 5, 4
	ld de, wPlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 7, 6
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 1, 3
	ld de, .HorizontalDivider
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 14, 1
	ld de, SCREEN_WIDTH
	xor a
	ld b, 7

.row
	ld c, 5
	push hl

.col
	ld [hli], a
	inc a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	dec b
	jr nz, .row
	ret

.NameTilemap:
	db $c8, $c9, $ca, $cb, $cc, $cd, -1
	
.Name_Money:
	db   ""
	next ""
	next "DIN.@"

.ID_No:
	db $27, $28, -1 ; ID NO

.HorizontalDivider:
	db $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $26, -1 ; ____________>

TrainerCard_Page1_PrintDexCaught_GameTime:	
	hlcoord 1, 8
	ld de, .StatusTilemap
	call TrainerCardSetup_PlaceTilemapString
	
	ld a, [wStatusFlags]
	bit STATUSFLAGS_POKEDEX_F, a
	jr z, .skip_dex

	hlcoord 2, 10
	ld de, .Dex
	call PlaceString

	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 15, 10
	lb bc, 1, 3
	call PrintNum

.skip_dex
	hlcoord 2, 12
	ld de, .PlayTime
	call PlaceString

	hlcoord 2, 14
	ld de, .Badges
	call PlaceString

	hlcoord 2, 16
	ld de, .Options
	call PlaceString

	ld hl, wBadges
	ld b, wTMsHMs - wBadges
	call CountSetBits
	ld de, wNumSetBits
	hlcoord $f, $e
	lb bc, 1, 3
	call PrintNum
	call TrainerCard_Page1_PrintGameTime
	ret

.Dex:
	db   "#DEX@"

.PlayTime:
	db "TIEMPO J.@"

.Badges:
	db "MEDALLAS@"

.Options:
	db " SALIR  MEDALLAS@"

.StatusTilemap:
	db $29, $2a, $2b, $2c, $2d, $2e, -1

TrainerCard_Page2_3_InitObjectsAndStrings:
	hlcoord 3, 2
	ld de, .LeagueTitle
	call PlaceString

	hlcoord 1, 3
	ld de, .HorizDivide
	call TrainerCardSetup_PlaceTilemapString

	hlcoord 1, 4
	ld de, .LinePart2
	call PlaceString

	hlcoord 1, 8
	ld de, .LinePart1
	call PlaceString

	hlcoord 18, 9
	ld de, .LinePart2
	call PlaceString

	hlcoord 18, 11
	ld de, .LinePart2
	call PlaceString

	hlcoord 0, 13
	ld de, .LinePart4
	call PlaceString

	hlcoord 0, 15
	ld de, .LinePart3
	call PlaceString

	hlcoord 0, 14
	ld de, .StatusTitle
	call PlaceString

	hlcoord 1, 0
	ld de, .BadgesTilemap
	call TrainerCardSetup_PlaceTilemapString

	hlcoord 2, 4
	ld a, $29
	ld c, 4
.loop
	call TrainerCard_Page2_3_PlaceLeadersFaces
rept 4
	inc hl
endr
	dec c
	jr nz, .loop
	hlcoord 2, 9
	ld a, $51
	ld c, 4
.loop2
	call TrainerCard_Page2_3_PlaceLeadersFaces
rept 4
	inc hl
endr
	dec c
	jr nz, .loop2
	xor a
	ld [wTrainerCardBadgeFrameCounter], a
	ld hl, TrainerCard_NihonBadgesOAM
	call TrainerCard_Page2_3_OAMUpdate
	ret

.BadgesTilemap:
	db $79, $7a, $7b, $7c, $7d, $7e, $c6, $c7, -1 ; "BADGES"

.LeagueTitle:
	db " LIGA #MON @"

; pushc and popc isn't working lol
.StatusTitle:
	db " ÄESTADO@"

.HorizDivide:
rept 18
	db $25
endr
	db -1

; pushc and popc isn't working lol
.LinePart1:
	db "öÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÜ"
	db "@"
.LinePart2:
	db "ä<LF>"
	db "ä<LF>"
	db "ä<LF>"
	db "ä<LF>"
	db "@"
.LinePart3:
	db "ÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖü"
	db "@"
.LinePart4:
	db "ÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖÖ"
	db "@"

TrainerCardSetup_PlaceTilemapString:
.loop
	ld a, [de]
	cp -1
	ret z
	ld [hli], a
	inc de
	jr .loop

TrainerCard_InitBorder:
	ld e, SCREEN_WIDTH
.loop1
	ld a, $23
	ld [hli], a
	dec e
	jr nz, .loop1

	ld a, $23
	ld [hli], a

	ld e, SCREEN_WIDTH - 3
	ld a, " "
.loop2
	ld [hli], a
	dec e
	jr nz, .loop2

	ld a, $04
	ld [hli], a
	ld a, $23
	ld [hli], a

.loop3
	ld a, $23
	ld [hli], a

	ld e, SCREEN_WIDTH - 2
	ld a, " "
.loop4
	ld [hli], a
	dec e
	jr nz, .loop4

	ld a, $23
	ld [hli], a

	dec d
	jr nz, .loop3

	ld a, $23
	ld [hli], a
	ld a, $24
	ld [hli], a

	ld e, SCREEN_WIDTH - 3
	ld a, " "
.loop5
	ld [hli], a
	dec e
	jr nz, .loop5

	ld a, $23
	ld [hli], a

	ld e, SCREEN_WIDTH
.loop6
	ld a, $23
	ld [hli], a
	dec e
	jr nz, .loop6
	ret

TrainerCard_Page2_3_PlaceLeadersFaces:
	push de
	push hl
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 3
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 3
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	pop hl
	pop de
	ret

TrainerCard_Page1_PrintGameTime:
	hlcoord 11, 12
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
;;; erosunica: static small colon tile
	hlcoord 15, 12
	ld [hl], $2f
;;;
	ret

TrainerCard_Page2_3_AnimateBadges:
	ldh a, [hVBlankCounter]
	and %111
	ret nz
	ld a, [wTrainerCardBadgeFrameCounter]
	inc a
	and %111
	ld [wTrainerCardBadgeFrameCounter], a
	jr TrainerCard_Page2_3_OAMUpdate

TrainerCard_Page2_3_OAMUpdate:
; copy flag array pointer
	ld a, [hli]
	ld e, a
	ld a, [hli]
; get flag array
	ld d, a
	ld a, [de]
	ld c, a
	ld de, wVirtualOAMSprite00
	ld b, NUM_NIHON_BADGES
.loop
	srl c
	push bc
	jr nc, .skip_badge
	push hl
	ld a, [hli] ; y
	ld b, a
	ld a, [hli] ; x
	ld c, a
	ld a, [hli] ; pal
	ld [wTrainerCardBadgeAttributes], a
	ld a, [wTrainerCardBadgeFrameCounter]
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	ld [wTrainerCardBadgeTileID], a
	call .PrepOAM
	pop hl
.skip_badge
	ld bc, $b ; 3 + 2 * 4
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrepOAM:
	ld a, [wTrainerCardBadgeTileID]
	and 1 << 7
	jr nz, .xflip
	ld hl, .facing1
	jr .loop2

.xflip
	ld hl, .facing2
.loop2
	ld a, [hli]
	cp -1
	ret z
	add b
	ld [de], a ; y
	inc de

	ld a, [hli]
	add c
	ld [de], a ; x
	inc de

	ld a, [wTrainerCardBadgeTileID]
	and $ff ^ (1 << 7)
	add [hl]
	ld [de], a ; tile id
	inc hl
	inc de

	ld a, [wTrainerCardBadgeAttributes]
	add [hl]
	ld [de], a ; attributes
	inc hl
	inc de
	jr .loop2

.facing1
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  0,  1,  0,  0, $02, 0
	dbsprite  1,  1,  0,  0, $03, 0
	db -1

.facing2
	dbsprite  0,  0,  0,  0, $01, 0 | X_FLIP
	dbsprite  1,  0,  0,  0, $00, 0 | X_FLIP
	dbsprite  0,  1,  0,  0, $03, 0 | X_FLIP
	dbsprite  1,  1,  0,  0, $02, 0 | X_FLIP
	db -1

TrainerCard_NihonBadgesOAM:
; Template OAM data for each badge on the trainer card.
; Format:
	; y, x, palette
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw wNihonBadges

	; Zephyrbadge
	db $40, $18, 0
	db $00, $20, $24, $20 | (1 << 7)
	db $00, $20, $24, $20 | (1 << 7)

	; Hivebadge
	db $40, $38, 0
	db $04, $20, $24, $20 | (1 << 7)
	db $04, $20, $24, $20 | (1 << 7)

	; Plainbadge
	db $40, $58, 0
	db $08, $20, $24, $20 | (1 << 7)
	db $08, $20, $24, $20 | (1 << 7)

	; Fogbadge
	db $40, $78, 0
	db $0c, $20, $24, $20 | (1 << 7)
	db $0c, $20, $24, $20 | (1 << 7)

	; Stormbadge
	db $68, $18, 0
	db $14, $20, $24, $20 | (1 << 7)
	db $14, $20, $24, $20 | (1 << 7)

	; Glacierbadge
	db $68, $58, 0
	db $18, $20, $24, $20 | (1 << 7)
	db $18, $20, $24, $20 | (1 << 7)

	; Mineralbadge
	db $68, $38, 0
	db $10, $20, $24, $20 | (1 << 7)
	db $10, $20, $24, $20 | (1 << 7)

	; Risingbadge
	; X-flips on alternate cycles.
	db $68, $78, 0
	db $1c,            $20, $24, $20 | (1 << 7)
	db $1c | (1 << 7), $20, $24, $20 | (1 << 7)

ChrisCardPic:  INCBIN "gfx/trainer_card/chris_card.2bpp"
CardGFX:       INCBIN "gfx/trainer_card/trainer_card.2bpp"
CardStatusGFX: INCBIN "gfx/trainer_card/card_status.2bpp"
CardBorderGFX: INCBIN "gfx/trainer_card/border.2bpp"
CardLeftArrowGFX: INCBIN "gfx/trainer_card/left_arrow.2bpp"

LeaderGFXPreRed:  INCBIN "gfx/trainer_card/leaders_prered.2bpp"
LeaderGFX: INCBIN "gfx/trainer_card/leaders.2bpp"
BadgeGFX:   INCBIN "gfx/trainer_card/badges.2bpp"

LeaderExtraGFX:  INCBIN "gfx/trainer_card/leaders_extra.2bpp"
CardNameGFX:  INCBIN "gfx/trainer_card/card_name.2bpp"
