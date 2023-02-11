	object_const_def ; object_event constants
	const AMAMIMART_CLERK
	const AMAMIMART_SUPER_NERD
	const AMAMIMART_BUENA

AmamiMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AMAMI
	closetext
	end

AmamiMartSuperNerdScript:
	jumptextfaceplayer AmamiMartSuperNerdText

AmamiMartBuenaScript:
	jumptextfaceplayer AmamiMartBuenaText

AmamiMartSuperNerdText:
	text "¿El TEAM ROCKET"
	line "regresó al"
	cont "continente?"

	para "¡Menos mal que no"
	line "tuvimos que verlos"
	cont "por aquí!"
	done

AmamiMartBuenaText:
	text "Estoy pensando en"
	line "ir de compras a"
	cont "CIUDAD PONIENTE."
	done

AmamiMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 7
	warp_event  5,  7, AMAMI_TOWN, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiMartClerkScript, -1
	object_event  5,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AmamiMartSuperNerdScript, -1
	object_event  8,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiMartBuenaScript, -1
