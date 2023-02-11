	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE6F_SUPER_NERD
	const WESTPORTDEPTSTORE6F_MON
	const WESTPORTDEPTSTORE6F_BIRD

WestportDeptStore6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportVendingMachine:
	opentext
	writetext WestportVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, 200
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 200
	itemtotext FRESH_WATER, MEM_BUFFER_0
	jump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 300
	itemtotext SODA_POP, MEM_BUFFER_0
	jump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, 350
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 350
	itemtotext LEMONADE, MEM_BUFFER_0
	jump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext WestportClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext WestportVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext WestportVendingNoSpaceText
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "AGUA FRESCA  200¥@"
	db "REFRESCO     300¥@"
	db "LIMONADA     350¥@"
	db "SALIR@"


WestportDeptStore6FSuperNerdScript:
	jumptextfaceplayer WestportDeptStore6FSuperNerdText

WestportDeptStore6FDirectory:
	jumptext WestportDeptStore6FDirectoryText

WestportDeptStore6FElevatorButton:
	jumpstd ElevatorButtonScript
	
WestportDeptStore6FMonScript:
	faceplayer
	opentext
	writetext WestportDeptStore6FMonText
	cry AMPHAROS
	waitbutton
	closetext
	end
	
WestportDeptStore6FBirdScript:
	faceplayer
	opentext
	writetext WestportDeptStore6FBirdText
	cry LUXWAN
	waitbutton
	closetext
	end
	
WestportDeptStore6FMonText:
	text "AMPHAROS:"
	line "¡Ampha!"
	done
	
WestportDeptStore6FBirdText:
	text "LUXWAN:"
	line "¡Waan!"
	done

WestportVendingText:
	text "¡Una máquina"
	line "expendedora!"
	done

WestportClangText:
	text "¡Clang! ¡Salió"
	line "una lata de"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

WestportVendingNoMoneyText:
	text "¡Uups! No tienes"
	line "bastante dinero."
	done

WestportVendingNoSpaceText:
	text "No hay sitio para"
	line "nada más."
	done

WestportDeptStore6FSuperNerdText:
	text "Estoy fuera de"
	line "servicio."
	
	para "Me gusta traer a"
	line "mis #MON aquí"
	para "cuando tengo"
	line "tiempo libre."
	
	para "¡A los #MON les"
	line "encantan las"
	para "bebidas de"
	line "las máquinas"
	cont "expendedoras!"
	done
WestportDeptStore6FDirectoryText:
	text "¡Descansa de las"
	line "compras!"

	para "P5 PLAZA TRANQUILA"
	done

WestportDeptStore6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15,  0, WESTPORT_DEPT_STORE_5F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore6FElevatorButton
	bg_event  8,  1, BGEVENT_UP, WestportVendingMachine
	bg_event  9,  1, BGEVENT_UP, WestportVendingMachine
	bg_event 10,  1, BGEVENT_UP, WestportVendingMachine
	bg_event 11,  1, BGEVENT_UP, WestportVendingMachine

	db 3 ; object events
	object_event  8,  3, SPRITE_OFFICER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportDeptStore6FSuperNerdScript, -1
	object_event  6,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportDeptStore6FMonScript, -1
	object_event  3,  6, SPRITE_BIRD, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WestportDeptStore6FBirdScript, -1

