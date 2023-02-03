; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import hero_x_coord

.segment "CODE"

.proc update_hero_x
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA hero_x_coord

  LDX #$03                 ; offset
  STA HERO_SPRITE_ADDR, X  ; write sprite-0 x-coord

  LDX #$0b                 ; offset
  STA HERO_SPRITE_ADDR, X  ; write sprite-2 x-coord

  CLC
  ADC #$08

  LDX #$07                 ; offset
  STA HERO_SPRITE_ADDR, X  ; write sprite-1 x-coord

  LDX #$0f                 ; offset
  STA HERO_SPRITE_ADDR, X  ; write sprite-3 x-coord

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export update_hero_x
