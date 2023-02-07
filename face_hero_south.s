; vim: set syntax=asm_ca65:

.include "constants.inc"
.include "macros/write_oam.inc"

TILE_0_INDEX_DEFAULT = $01
TILE_1_INDEX_DEFAULT = $01
TILE_2_INDEX_DEFAULT = $11
TILE_3_INDEX_DEFAULT = $11

TILE_0_INDEX_ANIMATION_A = $01
TILE_1_INDEX_ANIMATION_A = $01
TILE_2_INDEX_ANIMATION_A = $07
TILE_3_INDEX_ANIMATION_A = $08

TILE_0_INDEX_ANIMATION_B = $01
TILE_1_INDEX_ANIMATION_B = $01
TILE_2_INDEX_ANIMATION_B = $08
TILE_3_INDEX_ANIMATION_B = $07

.segment "ZEROPAGE"

.import frame_counter

.segment "CODE"

.proc face_hero_south
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA frame_counter
  CMP #$10
  BCC @animation_a

  LDA frame_counter
  CMP #$20
  BCC @default

  LDA frame_counter
  CMP #$30
  BCC @animation_b

  JMP @default

@default:
  write_oam TILE_0_INDEX_DEFAULT, HERO_0_INDEX_OFFSET
  write_oam TILE_1_INDEX_DEFAULT, HERO_1_INDEX_OFFSET
  write_oam TILE_2_INDEX_DEFAULT, HERO_2_INDEX_OFFSET
  write_oam TILE_3_INDEX_DEFAULT, HERO_3_INDEX_OFFSET

  write_oam ZERO,              HERO_0_ATTR_OFFSET
  write_oam FLIP_HORIZONTALLY, HERO_1_ATTR_OFFSET
  write_oam ZERO,              HERO_2_ATTR_OFFSET
  write_oam FLIP_HORIZONTALLY, HERO_3_ATTR_OFFSET

  JMP @done

@animation_a:
  write_oam TILE_0_INDEX_ANIMATION_A, HERO_0_INDEX_OFFSET
  write_oam TILE_1_INDEX_ANIMATION_A, HERO_1_INDEX_OFFSET
  write_oam TILE_2_INDEX_ANIMATION_A, HERO_2_INDEX_OFFSET
  write_oam TILE_3_INDEX_ANIMATION_A, HERO_3_INDEX_OFFSET

  write_oam ZERO,              HERO_0_ATTR_OFFSET
  write_oam FLIP_HORIZONTALLY, HERO_1_ATTR_OFFSET
  write_oam ZERO,              HERO_2_ATTR_OFFSET
  write_oam ZERO,              HERO_3_ATTR_OFFSET

  JMP @done

@animation_b:
  write_oam TILE_0_INDEX_ANIMATION_B, HERO_0_INDEX_OFFSET
  write_oam TILE_1_INDEX_ANIMATION_B, HERO_1_INDEX_OFFSET
  write_oam TILE_2_INDEX_ANIMATION_B, HERO_2_INDEX_OFFSET
  write_oam TILE_3_INDEX_ANIMATION_B, HERO_3_INDEX_OFFSET

  write_oam ZERO,              HERO_0_ATTR_OFFSET
  write_oam FLIP_HORIZONTALLY, HERO_1_ATTR_OFFSET
  write_oam FLIP_HORIZONTALLY, HERO_2_ATTR_OFFSET
  write_oam FLIP_HORIZONTALLY, HERO_3_ATTR_OFFSET

@done:
  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export face_hero_south
