Function1c0a0d: ; unreferenced
	ld a, b
	ld b, c
	ld c, a
	push bc
	push de
	ld hl, sp+2
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	pop bc
	ret

StripString::
; Strips leading and trailing whitespace from string provided in de

	push bc
	ld h, d
	ld l, e

.strip_front
	ld a, [hli]
	cp " "
	jr z, .strip_front
	dec hl

	ld b, d
	ld c, e
.copy
	ld a, [hli]
	ld [de], a
	cp "@"
	jr z, .done
	inc de

	cp " "
	jr z, .copy
	ld b, d
	ld c, e
	jr .copy

.done
	ld a, "@"
	ld [bc], a
	pop bc
	ret
;endc

PrintHoursMins:
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, 12
.PM:
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, sp+1
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, sp+0
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM
	pop af
	jr c, .place_am_pm
	ld de, String_PM
.place_am_pm
	inc hl
	call PlaceString
	ret

String_AM: db "AM@"
String_PM: db "PM@"

PrintHoursMins2:
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, 12
.PM:
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, sp+1
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, sp+0
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM2
	pop af
	jr c, .place_am_pm
	ld de, String_PM2
.place_am_pm
	inc hl
	call PlaceString
	ret

String_AM2: db "@"
String_PM2: db "@"

UpdateTimePredef::
	call UpdateTime
	ld hl, wDSTBackupDay
	ld a, [wCurDay]
	ld [hli], a ; wDSTBackupDay
	ldh a, [hHours]
	ld [hli], a ; wDSTBackupHours
	ldh a, [hMinutes]
	ld [hli], a ; wDSTBackupMinutes
	ldh a, [hSeconds]
	ld [hli], a ; wDSTBackupSeconds
	ret
