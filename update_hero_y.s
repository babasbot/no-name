; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import hero_y_coord

.segment "CODE"

.proc update_hero_y
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

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
