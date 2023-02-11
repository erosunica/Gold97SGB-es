; see engine/naming_screen.asm

NameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "× ( ) : ; [ ] <PK> <MN>"
	db "MAYÚS BORRA  FIN "

BoxNameInputLower:
	db "  abcdefghijklm  "
	db "  nopqrstuvwxyz  "
	db "  àáèéìíòóùúñ    "
	db "  <PK><MN>.,♂♀!¡?¿-×/  "
	db "  0123456789     "
	db "MAYÚS BORRA  FIN "

NameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "- ? ! / . ,      "
	db "minús BORRA  FIN "

BoxNameInputUpper:
	db "  ABCDEFGHIJKLM  "
	db "  NOPQRSTUVWXYZ  "
	db "  ÀÁÈÉÌÍÒÓÙÚÑ    "
	db "  <PK><MN>°'()[]:;&    "
	db "  0123456789     "
	db "minús BORRA  FIN "
