; vim: set syntax=asm_ca65:

PPU_CTRL     = $2000
PPU_MASK     = $2001
PPU_STAT     = $2002
OAM_ADDR     = $2003
PPU_SCROLL   = $2005
PPU_ADDR     = $2006
PPU_DATA     = $2007
OAM_DMA      = $4014
CONTROLLER_1 = $4016

HERO_SPRITE_ADDR = $0200

HERO_DEFAULT_Y_COORD = $70
HERO_DEFAULT_X_COORD = $80

BTN_RIGHT   = %00000001
BTN_LEFT    = %00000010
BTN_DOWN    = %00000100
BTN_UP      = %00001000
BTN_START   = %00010000
BTN_SELECT  = %00100000
BTN_B       = %01000000
BTN_A       = %10000000

ZERO              = %00000000
FLIP_HORIZONTALLY = %01000000

HERO_0_INDEX_OFFSET = $01
HERO_1_INDEX_OFFSET = $05
HERO_2_INDEX_OFFSET = $09
HERO_3_INDEX_OFFSET = $0d

HERO_0_ATTR_OFFSET  = $02
HERO_1_ATTR_OFFSET  = $06
HERO_2_ATTR_OFFSET  = $0a
HERO_3_ATTR_OFFSET  = $0e
