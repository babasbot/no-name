; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import hero_y_coord
.import controller_1_mask

.segment "CODE"

.import face_hero_north
.import face_hero_south

.proc update_hero_y
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA controller_1_mask
  AND #BTN_UP
  BEQ check_down

  JSR face_hero_north
  DEC hero_y_coord

check_down:
  LDA controller_1_mask
  AND #BTN_DOWN
  BEQ done_checking

  JSR face_hero_south
  INC hero_y_coord

done_checking:
  LDA hero_y_coord

  STA HERO_SPRITE_ADDR     ; write sprite-0 y-coord

  LDX #$04                 ; offset
  STA HERO_SPRITE_ADDR, X  ; write sprite-1 y-coord

  CLC
  ADC #$08

  LDX #$08                 ; offset
  STA HERO_SPRITE_ADDR, X  ; write sprite 3 y-coord

  LDX #$0c                 ; offset
  STA HERO_SPRITE_ADDR, X  ; update sprite 4 Y-coord

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export update_hero_y
