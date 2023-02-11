TIMESET_UP_ARROW   EQU $d7
TIMESET_DOWN_ARROW EQU $d8

InitClock:
; Ask the player to set the time.
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a

.SkipSavingMenuState:
;	call SetDayOfWeek.OnIntro ; erosunica: moved after .TimeConfirmed
	ld a, $0
	ld [wSpriteUpdatesEnabled], a
	;ld a, $10
	;ld [wMusicFade], a
	;ld a, LOW(MUSIC_NONE)
	;ld [wMusicFadeID], a
	;ld a, HIGH(MUSIC_NONE)
	;ld [wMusicFadeID + 1], a
	;ld c, 8
	;call DelayFrames
	;call RotateFourPalettesLeft
	;call ClearTilemap
	;call ClearSprites
	xor a
	ldh [hBGMapMode], a
	;call LoadStandardFont
	ld de, TimeSetUpArrowGFX
	ld hl, vTiles0 tile TIMESET_UP_ARROW
	lb bc, BANK(TimeSetUpArrowGFX), 1
	call Request1bpp
	ld de, TimeSetDownArrowGFX
	ld hl, vTiles0 tile TIMESET_DOWN_ARROW
	lb bc, BANK(TimeSetDownArrowGFX), 1
	call Request1bpp
	;call .ClearScreen
	;call WaitBGMap
	;call RotateFourPalettesRight
	;ld hl, OakTimeWokeUpText
	;call PrintText
	ld hl, wTimeSetBuffer
	ld bc, wTimeSetBufferEnd - wTimeSetBuffer
	xor a
	call ByteFill
	ld a, 10 ; default hour = 10 AM
	ld [wInitHourBuffer], a

.loop
	ld hl, OakTimeWhatTimeIsItText
	call PrintText
	;hlcoord 3, 7
	;lb bc, 2, 15
	;call Textbox
; render arrows inside the textbox
	hlcoord $12, $0e
	ld [hl], TIMESET_UP_ARROW
	hlcoord $12, $10
	ld [hl], TIMESET_DOWN_ARROW
	hlcoord 1, $10
	call DisplayHourOClock
	ld c, 10
	call DelayFrames

.SetHourLoop:
	call JoyTextDelay
	call SetHour
	jr nc, .SetHourLoop

	ld a, [wInitHourBuffer]
	ld [wStringBuffer2 + 1], a

;	ld hl, OakTimeWhatHoursText
;	call PrintText
;	call YesNoBox
;	jr nc, .HourIsSet
;
;	jr .loop

.HourIsSet:
	ld hl, OakTimeHowManyMinutesText
	call PrintText
	hlcoord $12, $0e
	ld [hl], TIMESET_UP_ARROW
	hlcoord $12, $10
	ld [hl], TIMESET_DOWN_ARROW
	hlcoord 1, $10
	call DisplayMinutesWithMinString
	ld c, 10
	call DelayFrames

.SetMinutesLoop:
	call JoyTextDelay
	call SetMinutes
	jr nc, .SetMinutesLoop

	ld a, [wInitMinuteBuffer]
	ld [wStringBuffer2 + 2], a
	;call .ClearScreen
;	ld hl, OakTimeWhoaMinutesText
;	call PrintText
;	call YesNoBox
;	jr nc, .MinutesAreSet
;	jr .HourIsSet

.MinutesAreSet:
	call InitTimeOfDay
	ld hl, OakText_ResponseToSetTime
	call PrintText
	call YesNoBox
	jr nc, .TimeConfirmed
	jp .SkipSavingMenuState
.TimeConfirmed:
	call SetDayOfWeek.OnIntro ; erosunica: the Time must be set before the Day for the day to be saved successfully
	pop af
	ldh [hInMenu], a
	ret

.ClearScreen:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ld a, $1
	ldh [hBGMapMode], a
	ret

SetHour:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Confirm

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	call DelayFrame
	and a
	ret

.down
	ld hl, wInitHourBuffer
	ld a, [hl]
	and a
	jr nz, .DecreaseThroughMidnight
	ld a, 23 + 1
.DecreaseThroughMidnight:
	dec a
	ld [hl], a
	jr .okay

.up
	ld hl, wInitHourBuffer
	ld a, [hl]
	cp 23
	jr c, .AdvanceThroughMidnight
	ld a, -1
.AdvanceThroughMidnight:
	inc a
	ld [hl], a

.okay
	hlcoord 1, $10
	ld a, " "
	ld bc, 17 ; OLD 15
	call ByteFill
	hlcoord 1, $10
	call DisplayHourOClock
	call WaitBGMap
	and a
	ret

.Confirm:
	scf
	ret

DisplayHourOClock:
	push hl
	ld a, [wInitHourBuffer]
	ld c, a
	ld e, l
	ld d, h
	push bc
	call PrintAdjustedHour
	ld h, d
	ld l, e
	inc hl
	ld de, String_oclock
	call PlaceString
	ld d, b
	ld e, c
	inc de
	pop bc
	call PrintTimeOfDay
	ld b, d
	ld c, e
;endc
	pop hl
	ret

;Function907ba: ; unreferenced
;	ld h, d
;	ld l, e
;	push hl
;	call DisplayHourOClock
;	pop de
;	inc de
;	inc de
;	ld a, ":"
;	ld [de], a
;	inc de
;	push de
;	ld hl, 3
;	add hl, de
;	ld a, [de]
;	inc de
;	ld [hli], a
;	ld a, [de]
;	ld [hl], a
;	pop hl
;	call DisplayMinutesWithMinString
;	inc hl
;	inc hl
;	inc hl
;	ret

SetMinutes:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .a_button
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	call DelayFrame
	and a
	ret

.d_down
	ld hl, wInitMinuteBuffer
	ld a, [hl]
	and a
	jr nz, .decrease
	ld a, 59 + 1
.decrease
	dec a
	ld [hl], a
	jr .finish_dpad

.d_up
	ld hl, wInitMinuteBuffer
	ld a, [hl]
	cp 59
	jr c, .increase
	ld a, -1
.increase
	inc a
	ld [hl], a
.finish_dpad
	hlcoord 1, $10
	ld a, " "
	ld bc, 7
	call ByteFill
	hlcoord 1, $10
	call DisplayMinutesWithMinString
	call WaitBGMap
	and a
	ret
.a_button
	scf
	ret

DisplayMinutesWithMinString:
	ld de, wInitMinuteBuffer
	call PrintTwoDigitNumberLeftAlign
	inc hl
	ld de, String_min
	call PlaceString
	ret

PrintTwoDigitNumberLeftAlign:
	push hl
	ld a, " "
	ld [hli], a
	ld [hl], a
	pop hl
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ret

OakTimeWokeUpText:
	text_far _OakTimeWokeUpText
	text_end

OakTimeWhatTimeIsItText:
	text_far _OakTimeWhatTimeIsItText
	text_end

String_oclock:
	db "en punto@"

OakTimeWhatHoursText:
	; What?@ @
	text_far _OakTimeWhatHoursText
	text_asm
	hlcoord 1, 16
	call DisplayHourOClock
	ld a, "?"
	ld [bc], a
	inc bc
	ld hl, .OakTimeHoursQuestionMarkText
	ret

.OakTimeHoursQuestionMarkText:
;	text_far _OakTimeHoursQuestionMarkText ;OLD ENABLED
	text_end

OakTimeHowManyMinutesText:
	text_far _OakTimeHowManyMinutesText
	text_end

String_min:
	db "min.@"

OakTimeWhoaMinutesText:
	; Whoa!@ @
	text_far _OakTimeWhoaMinutesText
	text_asm
	hlcoord 9, 14
	call DisplayMinutesWithMinString
	ld a, "?"
	ld [bc], a
	inc bc
	ld hl, .OakTimeMinutesQuestionMarkText
	ret

.OakTimeMinutesQuestionMarkText:
;	text_far _OakTimeMinutesQuestionMarkText ;OLD ENABLED
	text_end

OakText_ResponseToSetTime:
	text_asm
	decoord 1, 14
	ld a, [wInitHourBuffer]
	ld c, a
	push bc
	call PrintAdjustedHour
	ld h, d
	ld l, e
	ld [hl], ":"
	inc hl
	ld de, wInitMinuteBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld d, h
	ld e, l
	inc de
	pop bc
	call PrintTimeOfDay
	ld b, d
	ld c, e
	ld a, [wInitHourBuffer]
	cp MORN_HOUR
	jr c, .nite
	cp DAY_HOUR + 1
	jr c, .morn
	cp NITE_HOUR
	jr c, .day
.nite
	ld hl, .OakTimeYikesText
	ret
.morn
	ld hl, .OakTimeYikesText
	ret
.day
	ld hl, .OakTimeYikesText
	ret

.OakTimeYikesText:
	text_far _OakTimeYikesText
	text_end

TimeSetBackgroundGFX:
INCBIN "gfx/new_game/timeset_bg.1bpp"
TimeSetUpArrowGFX:
INCBIN "gfx/new_game/up_arrow.1bpp"
TimeSetDownArrowGFX:
INCBIN "gfx/new_game/down_arrow.1bpp"

SetDayOfWeek:
	ldh a, [hInMenu]
	push af
	call .Setup
	call .Run
	pop af
	ldh [hInMenu], a
	ret

.OnIntro:
	call .Setup
	call .RunOnIntro
	ret

.Setup:
	ld a, $1
	ldh [hInMenu], a
	ld de, TimeSetUpArrowGFX
	ld hl, vTiles0 tile TIMESET_UP_ARROW
	lb bc, BANK(TimeSetUpArrowGFX), 1
	call Request1bpp
	ld de, TimeSetDownArrowGFX
	ld hl, vTiles0 tile TIMESET_DOWN_ARROW
	lb bc, BANK(TimeSetDownArrowGFX), 1
	call Request1bpp
	xor a
	ld [wTempDayOfWeek], a
	ret

.Run:
.loop
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	call LoadStandardMenuHeader
	ld hl, .OakTimeWhatDayIsItText
	call PrintText
	hlcoord 9, 3
	lb bc, 2, 9
	call Textbox
	hlcoord 14, 3
	ld [hl], TIMESET_UP_ARROW
	hlcoord 14, 6
	ld [hl], TIMESET_DOWN_ARROW
	hlcoord 10, 5
	call .PlaceWeekdayString
	call ApplyTilemap
	ld c, 10
	call DelayFrames
.loop2
	call JoyTextDelay
	call .PutWeekdayString
	call .GetJoypadAction
	jr nc, .loop2
	call ExitMenu
	call UpdateSprites
	ld hl, .ConfirmWeekdayText
	call PrintText
	call YesNoBox
	jr c, .loop
	ld a, [wTempDayOfWeek]
	ld [wStringBuffer2], a
	call InitDayOfWeek
	call LoadStandardFont
	ret

.RunOnIntro:
.loop_
	call LoadStandardMenuHeader
	ld hl, .OakTimeWhatDayIsItText
	call PrintText
	hlcoord $12, $e
	ld [hl], TIMESET_UP_ARROW
	hlcoord $12, $10
	ld [hl], TIMESET_DOWN_ARROW
	hlcoord $1, $10
	call .PlaceWeekdayString
	call ApplyTilemap
	ld c, 10
	call DelayFrames
.loop2_
	call JoyTextDelay
	call .PutWeekdayString_InTextBox
	call .GetJoypadAction
	jr nc, .loop2_
	call ExitMenu
	ld hl, .ConfirmWeekdayText
	call PrintText
	call YesNoBox
	jr c, .loop_
	ld a, [wTempDayOfWeek]
	ld [wStringBuffer2], a
	call InitDayOfWeek
	call LoadStandardFont
	ret

.GetJoypadAction:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr z, .not_A
	scf
	ret

.not_A
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	call DelayFrame
	and a
	ret

.d_down
	ld hl, wTempDayOfWeek
	ld a, [hl]
	and a
	jr nz, .decrease
	ld a, SATURDAY + 1

.decrease
	dec a
	ld [hl], a
	jr .finish_dpad

.d_up
	ld hl, wTempDayOfWeek
	ld a, [hl]
	cp 6
	jr c, .increase
	ld a, SUNDAY - 1

.increase
	inc a
	ld [hl], a

.finish_dpad
	scf
	ccf
	ret

.PutWeekdayString:
	xor a
	ldh [hBGMapMode], a
	hlcoord 10, 4
	lb bc, 2, 9
	call ClearBox
	hlcoord 10, 5
	call .PlaceWeekdayString
	call WaitBGMap
	and a
	ret

.PutWeekdayString_InTextBox:
	xor a
	ldh [hBGMapMode], a
	hlcoord 1, $10
	lb bc, 1, 9
	call ClearBox
	hlcoord 1, $10
	call .PlaceWeekdayString
	call WaitBGMap
	and a
	ret

.PlaceWeekdayString:
	push hl
	ld a, [wTempDayOfWeek]
	ld e, a
	ld d, 0
	ld hl, .WeekdayStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

.WeekdayStrings:
; entries correspond to wCurDay constants (see constants/wram_constants.asm)
	dw .Sunday
	dw .Monday
	dw .Tuesday
	dw .Wednesday
	dw .Thursday
	dw .Friday
	dw .Saturday
	dw .Sunday

.Sunday:    db "DOMINGO@"
.Monday:    db "LUNES@"
.Tuesday:   db "MARTES@"
.Wednesday: db "MIÉRCOLES@"
.Thursday:  db "JUEVES@"
.Friday:    db "VIERNES@"
.Saturday:  db "SÁBADO@"

.OakTimeWhatDayIsItText:
	text_far _OakTimeWhatDayIsItText
	text_end

.ConfirmWeekdayText:
	text_far _OakTimeIsItText1
	text_asm
	hlcoord 1, 16
	call .PlaceWeekdayString
	ld hl, .OakTimeIsItText
	ret

.OakTimeIsItText:
	text_far _OakTimeIsItText2
	text_end

InitialSetDSTFlag:
	ld a, [wDST]
	set 7, a
	ld [wDST], a
	predef UpdateTimePredef
	ret

InitialClearDSTFlag:
	ld a, [wDST]
	res 7, a
	ld [wDST], a
	predef UpdateTimePredef
	ret

MrChrono:
	hlcoord 1, 14
	lb bc, 3, SCREEN_WIDTH - 2
	call ClearBox
	ld hl, .Text
	call PlaceHLTextAtBC
	ret

.Text:
	text_asm
	call UpdateTime

	hlcoord 1, 14
	ld [hl], "R"
	inc hl
	ld [hl], "T"
	inc hl
	ld [hl], " "
	inc hl

	ld de, hRTCDayLo
	call .PrintTime

	hlcoord 1, 16
	ld [hl], "D"
	inc hl
	ld [hl], "F"
	inc hl
	ld [hl], " "
	inc hl

	ld de, wStartDay
	call .PrintTime

	ld [hl], " "
	inc hl

	ld a, [wDST]
	bit 7, a
	jr z, .off

	ld [hl], "O"
	inc hl
	ld [hl], "N"
	inc hl
	jr .done

.off
	ld [hl], "O"
	inc hl
	ld [hl], "F"
	inc hl
	ld [hl], "F"
	inc hl

.done
	ld hl, .NowOnDebug
	ret

.NowOnDebug:
	text "<PARA>Now on DEBUG…"
	prompt

.PrintTime:
	lb bc, 1, 3
	call PrintNum
	ld [hl], "."
	inc hl
	inc de
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	inc de
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

PrintHourAndMinutesAdjusted:
	ld a, [wInitHourBuffer]
	ld c, a
	ld l, e
	ld h, d
	call AdjustHourForAMorPM
	push af
	ld [wDeciramBuffer], a
	ld de, wDeciramBuffer
	call PrintTwoDigitNumberLeftAlign
	ld [hl], ":"
	inc hl
	ld de, wInitMinuteBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop af
	jr nc, .not_am
	ld de, .am
	jr .end
.not_am
	ld de, .pm
.end
	inc hl
	call PlaceString
	ret
.am: db "AM@"
.pm: db "PM@"

PrintHour::
	call PrintTimeOfDay
	inc de
	call PrintAdjustedHour
	ret

PrintTimeOfDay:
	push bc
	ld h, d
	ld l, e
	call GetTimeOfDayString
	call PlaceString
	ld d, b
	ld e, c
	pop bc
	ret

GetTimeOfDayString:
	ld a, c
	cp MORN_HOUR
	jr c, .nite
	cp DAY_HOUR
	jr c, .morn
	cp NITE_HOUR
	jr c, .day
.nite
	ld de, .nite_string
	ret
.morn
	ld de, .morn_string
	ret
.day
	ld de, .day_string
	ret

.nite_string: db "NOCH@"
.morn_string: db "MAÑ@"
.day_string:  db "DÍA@"

PrintAdjustedHour:
	push bc
	call AdjustHourForAMorPM
	ld [wDeciramBuffer], a
	ld h, d
	ld l, e
	ld de, wDeciramBuffer
	call PrintTwoDigitNumberLeftAlign
	ld d, h
	ld e, l
	pop bc
	ret

AdjustHourForAMorPM:
; Convert the hour stored in c (0-23) to a 1-12 value
	ld a, c
	or a
	jr z, .midnight
	cp NOON_HOUR
	ret c
	ret z
	sub NOON_HOUR
	ret

.midnight
	ld a, NOON_HOUR
	ret
