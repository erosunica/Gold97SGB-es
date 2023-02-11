_PartyAnimateHPBar:
	call .IsMaximumMoreThan48Pixels
	jr c, .MoreThan48Pixels
	call .ComputePixels
.ShortAnimLoop:
	push bc
	push hl
	call ShortAnim_UpdateVariables
	pop hl
	pop bc
	push af
	push bc
	push hl
	call ShortHPBarAnimParty_UpdateTiles ; modded
	call HPBarAnim_BGMapUpdate
	pop hl
	pop bc
	pop af
	jr nc, .ShortAnimLoop
	ret

.MoreThan48Pixels:
	call .ComputePixels
.LongAnimLoop:
	push bc
	push hl
	call LongAnim_UpdateVariables
	pop hl
	pop bc
	ret c
	push af
	push bc
	push hl
	call LongHPBarAnimParty_UpdateTiles ; modded
	call HPBarAnim_BGMapUpdate
	pop hl
	pop bc
	pop af
	jr nc, .LongAnimLoop
	ret

.IsMaximumMoreThan48Pixels:
	ld a, [wCurHPAnimMaxHP + 1]
	and a
	jr nz, .player
	ld a, [wCurHPAnimMaxHP]
	cp HP_BAR_LENGTH_PX
	jr nc, .player
	and a
	ret

.player
	scf
	ret

.ComputePixels:
	push hl
	ld hl, wCurHPAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	call ComputeHPBarPixels
	ld a, e
	ld [wCurHPBarPixels], a

	ld a, [wCurHPAnimNewHP]
	ld c, a
	ld a, [wCurHPAnimNewHP + 1]
	ld b, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	call ComputeHPBarPixels
	ld a, e
	ld [wNewHPBarPixels], a

	push hl
	ld hl, wCurHPAnimOldHP
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .negative
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimLowHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimHighHP], a
	ld bc, 1
	jr .got_direction

.negative
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimHighHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimLowHP], a
	ld a, e
	xor $ff
	inc a
	ld e, a
	ld a, d
	xor $ff
	ld d, a
	ld bc, -1
.got_direction
	ld a, d
	ld [wCurHPAnimDeltaHP], a
	ld a, e
	ld [wCurHPAnimDeltaHP + 1], a
	ret

;;;

ShortHPBarAnimParty_UpdateTiles:
	call HPBarAnimParty_UpdateHPRemaining
	ld d, HP_BAR_LENGTH
	ld a, [wWhichHPBar]
	and $1
	ld b, a
	ld a, [wCurHPBarPixels]
	ld e, a
	ld c, a
	push de
	call HPBarAnim_RedrawHPBar
	pop de
	call HPBarAnim_PaletteUpdate
	ret

LongHPBarAnimParty_UpdateTiles:
	call HPBarAnimParty_UpdateHPRemaining
	ld a, [wCurHPAnimOldHP]
	ld c, a
	ld a, [wCurHPAnimOldHP + 1]
	ld b, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	call ComputeHPBarPixels
	ld c, e
	ld d, HP_BAR_LENGTH
	ld a, [wWhichHPBar]
	and $1
	ld b, a
	push de
	call HPBarAnim_RedrawHPBar
	pop de
	call HPBarAnim_PaletteUpdate
	ret

HPBarAnimParty_UpdateHPRemaining:
	ld a, [wWhichHPBar]
	and a
	ret z
	cp $1
	jr z, .load_15
	ld de, 0 * SCREEN_WIDTH + 9 ; modded
	jr .loaded_de
.load_15
	ld de, 0 * SCREEN_WIDTH + 8 ; modded
.loaded_de
	push hl
	add hl, de
	ld a, " "
	ld [hli], a
	ld [hli], a
	ld [hld], a
	dec hl
	ld a, [wCurHPAnimOldHP]
	ld [wStringBuffer2 + 1], a
	ld a, [wCurHPAnimOldHP + 1]
	ld [wStringBuffer2], a
	ld de, wStringBuffer2
	lb bc, 2, 3
	call PrintNum
	pop hl
	ret
