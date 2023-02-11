;Make this project require rgbds 0.5.2.
MAJOR EQU 0
MINOR EQU 5
PATCH EQU 2

IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	FAIL "This project requires rgbds {MAJOR}.{MINOR}.{PATCH} to be installed"
ELIF (__RGBDS_MAJOR__ < MAJOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ < MINOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ == MINOR && __RGBDS_PATCH__ < PATCH)
	FAIL "This project requires that rgbds be upgraded to the {MAJOR}.{MINOR}.{PATCH} release."
ELIF (__RGBDS_MAJOR__ > MAJOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ > MINOR)
	FAIL "This project requires that rgbds be downgraded to {MAJOR}.{MINOR}.{PATCH} at most."
ENDC