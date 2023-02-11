BillPhoneMornGreetingText:
	text "¡Buenos días!"

	para "Éste es el SERVI-"
	line "CIO de ADMÓN. del"

	para "SISTEMA de ALMACE-"
	line "NAMIENTO de los"
	cont "#MON."
	done

BillPhoneDayGreetingText:
	text "¿Qué tal?"

	para "Éste es el SERVI-"
	line "CIO de ADMÓN. del"

	para "SISTEMA de ALMACE-"
	line "NAMIENTO de los"
	cont "#MON."
	done

BillPhoneNiteGreetingText:
	text "¡Buenas noches!"

	para "Éste es el SERVI-"
	line "CIO de ADMÓN. del"

	para "SISTEMA de ALMACE-"
	line "NAMIENTO de los"
	cont "#MON."
	done

BillPhoneGenericText:
	text "¿Quién llama?"

	para "<PLAYER>, ¿no?"
	line "Un segundo…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "¡Gracias por"
	line "esperar!"

	para "<PLAYER>, en tu"
	line "CAJA hay sitio"

	para "para @"
	text_ram wStringBuffer3
	text " #MON"
	line "más."

	para "¡Sal ahí fuera y"
	line "llénala!"
	done

BillPhoneNearlyFullText:
	text "¡Gracias por"
	line "esperar!"

	para "<PLAYER>, en la"
	line "CAJA sólo te queda"

	para "sitio para @"
	text_ram wStringBuffer3
	text_start
	line "#MON  más."

	para "Quizá deberías"
	line "cambiar de CAJA."
	done

BillPhoneFullText:
	text "¡Gracias por"
	line "esperar!"

	para "¡<PLAYER>, tu CAJA"
	line "está llena!"

	para "Tendrás que"
	line "cambiar de CAJA"

	para "si quieres coger"
	line "más #MON."
	done

BillPhoneNewlyFullText:
	text "Hola. ¿<PLAYER>?"
	line "¡Soy yo, BILL!"

	para "Gracias por usar"
	line "mi SISTEMA de"
	cont "ALMACENAMIENTO."

	para "El último #MON"
	line "que enviaste ha"
	cont "llenado la CAJA."

	para "Tendrás que"
	line "cambiar de CAJA"

	para "si quieres coger"
	line "más #MON."

	para "¡Hasta luego!"
	done
