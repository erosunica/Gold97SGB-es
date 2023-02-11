SpriteAnimSeqData:
; entries correspond to SPRITE_ANIM_INDEX_* constants
	; frameset, sequence, tile
	db SPRITE_ANIM_FRAMESET_PARTY_MON,                SPRITE_ANIM_SEQ_PARTY_MON,                   $00 ; SPRITE_ANIM_INDEX_PARTY_MON
	db SPRITE_ANIM_FRAMESET_GS_INTRO_BUBBLE,          SPRITE_ANIM_SEQ_GS_INTRO_BUBBLE,             $00 ; SPRITE_ANIM_INDEX_GS_INTRO_BUBBLE
	db SPRITE_ANIM_FRAMESET_GS_INTRO_SHELLDER,        SPRITE_ANIM_SEQ_GS_INTRO_SHELLDER,           $00 ; SPRITE_ANIM_INDEX_GS_INTRO_SHELLDER
	db SPRITE_ANIM_FRAMESET_GS_INTRO_MAGIKARP,        SPRITE_ANIM_SEQ_GS_INTRO_MAGIKARP,           $00 ; SPRITE_ANIM_INDEX_GS_INTRO_MAGIKARP
	db SPRITE_ANIM_FRAMESET_UNUSED_LAPRAS,            SPRITE_ANIM_SEQ_UNUSED_LAPRAS,               $00 ; SPRITE_ANIM_INDEX_UNUSED_LAPRAS
	db SPRITE_ANIM_FRAMESET_GS_INTRO_LAPRAS,          SPRITE_ANIM_SEQ_GS_INTRO_LAPRAS,             $00 ; SPRITE_ANIM_INDEX_GS_INTRO_LAPRAS
	db SPRITE_ANIM_FRAMESET_GS_INTRO_NOTE,            SPRITE_ANIM_SEQ_GS_INTRO_NOTE,               $01 ; SPRITE_ANIM_INDEX_GS_INTRO_NOTE
	db SPRITE_ANIM_FRAMESET_GS_INTRO_INVISIBLE_NOTE,  SPRITE_ANIM_SEQ_GS_INTRO_NOTE,               $01 ; SPRITE_ANIM_INDEX_GS_INTRO_INVISIBLE_NOTE
	db SPRITE_ANIM_FRAMESET_GS_INTRO_JIGGLYPUFF,      SPRITE_ANIM_SEQ_GS_INTRO_JIGGLYPUFF,         $01 ; SPRITE_ANIM_INDEX_GS_INTRO_JIGGLYPUFF
	db SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU,         SPRITE_ANIM_SEQ_GS_INTRO_PIKACHU,            $01 ; SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU
	db SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL,    SPRITE_ANIM_SEQ_GS_INTRO_PIKACHU_TAIL,       $01 ; SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU_TAIL
	db SPRITE_ANIM_FRAMESET_GS_INTRO_FIREBALL,        SPRITE_ANIM_SEQ_GS_INTRO_FIREBALL,           $02 ; SPRITE_ANIM_INDEX_GS_INTRO_FIREBALL
	db SPRITE_ANIM_FRAMESET_GS_INTRO_CHIKORITA,       SPRITE_ANIM_SEQ_GS_INTRO_CHIKORITA_PALSSIO,  $02 ; SPRITE_ANIM_INDEX_GS_INTRO_CHIKORITA
	db SPRITE_ANIM_FRAMESET_GS_INTRO_CUBBURN,         SPRITE_ANIM_SEQ_GS_INTRO_CUBBURN,            $02 ; SPRITE_ANIM_INDEX_GS_INTRO_CUBBURN
	db SPRITE_ANIM_FRAMESET_GS_INTRO_PALSSIO,         SPRITE_ANIM_SEQ_GS_INTRO_CHIKORITA_PALSSIO,  $02 ; SPRITE_ANIM_INDEX_GS_INTRO_PALSSIO
	db SPRITE_ANIM_FRAMESET_GS_TITLE_TRAIL,           SPRITE_ANIM_SEQ_GS_TITLE_TRAIL,              $00 ; SPRITE_ANIM_INDEX_GS_TITLE_TRAIL
	db SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU,         SPRITE_ANIM_SEQ_UNUSED_PIKACHU,              $01 ; SPRITE_ANIM_INDEX_UNUSED_PIKACHU
	db SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL,    SPRITE_ANIM_SEQ_UNUSED_PIKACHU_TAIL,         $01 ; SPRITE_ANIM_INDEX_UNUSED_PIKACHU_TAIL
	db SPRITE_ANIM_FRAMESET_GS_INTRO_NOTE,            SPRITE_ANIM_SEQ_UNUSED_NOTE,                 $01 ; SPRITE_ANIM_INDEX_UNUSED_NOTE
	db SPRITE_ANIM_FRAMESET_GS_INTRO_JIGGLYPUFF,      SPRITE_ANIM_SEQ_UNUSED_JIGGLYPUFF,           $01 ; SPRITE_ANIM_INDEX_UNUSED_JIGGLYPUFF
	db SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR,        SPRITE_ANIM_SEQ_NAMING_SCREEN_CURSOR,        $05 ; SPRITE_ANIM_INDEX_NAMING_SCREEN_CURSOR
	db SPRITE_ANIM_FRAMESET_GAMEFREAK_LOGO,           SPRITE_ANIM_SEQ_GAMEFREAK_LOGO,              $06 ; SPRITE_ANIM_INDEX_GAMEFREAK_LOGO
	db SPRITE_ANIM_FRAMESET_GS_INTRO_STAR,            SPRITE_ANIM_SEQ_GS_INTRO_STAR,               $06 ; SPRITE_ANIM_INDEX_GS_INTRO_STAR
	db SPRITE_ANIM_FRAMESET_GS_INTRO_SPARKLE,         SPRITE_ANIM_SEQ_GS_INTRO_SPARKLE,            $06 ; SPRITE_ANIM_INDEX_GS_INTRO_SPARKLE
	db SPRITE_ANIM_FRAMESET_SLOTS_GOLEM,              SPRITE_ANIM_SEQ_SLOTS_GOLEM,                 $07 ; SPRITE_ANIM_INDEX_SLOTS_GOLEM
	db SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY,            SPRITE_ANIM_SEQ_SLOTS_CHANSEY,               $07 ; SPRITE_ANIM_INDEX_SLOTS_CHANSEY
	db SPRITE_ANIM_FRAMESET_SLOTS_EGG,                SPRITE_ANIM_SEQ_SLOTS_EGG,                   $07 ; SPRITE_ANIM_INDEX_SLOTS_EGG
	db SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR,        SPRITE_ANIM_SEQ_MAIL_CURSOR,                 $05 ; SPRITE_ANIM_INDEX_COMPOSE_MAIL_CURSOR
	db SPRITE_ANIM_FRAMESET_RED_WALK,                 SPRITE_ANIM_SEQ_NULL,                        $00 ; SPRITE_ANIM_INDEX_RED_WALK
	db SPRITE_ANIM_FRAMESET_STILL_CURSOR,             SPRITE_ANIM_SEQ_UNUSED_CURSOR,               $08 ; SPRITE_ANIM_INDEX_UNUSED_CURSOR
	db SPRITE_ANIM_FRAMESET_STILL_CURSOR,             SPRITE_ANIM_SEQ_DUMMY_GAME_CURSOR,           $08 ; SPRITE_ANIM_INDEX_DUMMY_GAME
	db SPRITE_ANIM_FRAMESET_STILL_CURSOR,             SPRITE_ANIM_SEQ_POKEGEAR_ARROW,              $08 ; SPRITE_ANIM_INDEX_POKEGEAR_ARROW
	db SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL,          SPRITE_ANIM_SEQ_TRADE_POKE_BALL,             $00 ; SPRITE_ANIM_INDEX_TRADE_POKE_BALL
	db SPRITE_ANIM_FRAMESET_TRADE_POOF,               SPRITE_ANIM_SEQ_NULL,                        $00 ; SPRITE_ANIM_INDEX_TRADE_POOF
	db SPRITE_ANIM_FRAMESET_TRADE_TUBE_BULGE,         SPRITE_ANIM_SEQ_TRADE_TUBE_BULGE,            $00 ; SPRITE_ANIM_INDEX_TRADE_TUBE_BULGE
	db SPRITE_ANIM_FRAMESET_TRADEMON_ICON,            SPRITE_ANIM_SEQ_TRADEMON_IN_TUBE,            $00 ; SPRITE_ANIM_INDEX_TRADEMON_ICON
	db SPRITE_ANIM_FRAMESET_TRADEMON_BUBBLE,          SPRITE_ANIM_SEQ_TRADEMON_IN_TUBE,            $00 ; SPRITE_ANIM_INDEX_TRADEMON_BUBBLE
	db SPRITE_ANIM_FRAMESET_EVOLUTION_BALL_OF_LIGHT,  SPRITE_ANIM_SEQ_REVEAL_NEW_MON,              $00 ; SPRITE_ANIM_INDEX_EVOLUTION_BALL_OF_LIGHT
	db SPRITE_ANIM_FRAMESET_RADIO_TUNING_KNOB,        SPRITE_ANIM_SEQ_RADIO_TUNING_KNOB,           $00 ; SPRITE_ANIM_INDEX_RADIO_TUNING_KNOB
	db SPRITE_ANIM_FRAMESET_MAGNET_TRAIN_RED,         SPRITE_ANIM_SEQ_NULL,                        $00 ; SPRITE_ANIM_INDEX_MAGNET_TRAIN_RED
	db SPRITE_ANIM_FRAMESET_LEAF,                     SPRITE_ANIM_SEQ_CUT_LEAVES,                  $00 ; SPRITE_ANIM_INDEX_LEAF
	db SPRITE_ANIM_FRAMESET_CUT_TREE,                 SPRITE_ANIM_SEQ_NULL,                        $00 ; SPRITE_ANIM_INDEX_CUT_TREE
	db SPRITE_ANIM_FRAMESET_LEAF,                     SPRITE_ANIM_SEQ_FLY_LEAF,                    $00 ; SPRITE_ANIM_INDEX_FLY_LEAF
	db SPRITE_ANIM_FRAMESET_EGG_CRACK,                SPRITE_ANIM_SEQ_NULL,                        $00 ; SPRITE_ANIM_INDEX_EGG_CRACK
	db SPRITE_ANIM_FRAMESET_GS_INTRO_HO_OH_BLISSEY,   SPRITE_ANIM_SEQ_GS_INTRO_HO_OH_BLISSEY,      $00 ; SPRITE_ANIM_INDEX_GS_INTRO_HO_OH_BLISSEY
	db SPRITE_ANIM_FRAMESET_HEADBUTT,                 SPRITE_ANIM_SEQ_NULL,                        $00 ; SPRITE_ANIM_INDEX_HEADBUTT
	db SPRITE_ANIM_FRAMESET_EGG_HATCH_1,              SPRITE_ANIM_SEQ_REVEAL_NEW_MON,              $00 ; SPRITE_ANIM_INDEX_EGG_HATCH
