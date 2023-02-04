; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "CODE"

.proc face_hero_southwest
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  ; sprite-0 data

  LDA #$05
  LDX #$01
  STA HERO_SPRITE_ADDR, X ; write tile number

  LDA #%00000000
  LDX #$02
  STA HERO_SPRITE_ADDR, X ; write sprite attributes

  ; sprite-1 data

  LDA #$06
  LDX #$05
  STA HERO_SPRITE_ADDR, X ; write tile number

  LDA #%00000000
  LDX #$06
  STA HERO_SPRITE_ADDR, X ; write sprite attributes

  ; sprite-2 data

  LDA #$15
  LDX #$09
  STA HERO_SPRITE_ADDR, X ; write tile number

  LDA #%00000000
  LDX #$0a
  STA HERO_SPRITE_ADDR, X ; write sprite attributes

  ; sprite-3 data

  LDA #$16
  LDX #$0d
  STA HERO_SPRITE_ADDR, X ; write tile number

  LDA #%00000000
  LDX #$0e
  STA HERO_SPRITE_ADDR, X ; write sprite attributes

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export face_hero_southwest
