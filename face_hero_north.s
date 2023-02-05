; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "CODE"

.proc face_hero_north
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  ; sprite-0 data

  LDA #$02
  LDX #$01
  STA HERO_SPRITE_ADDR, X ; write sprite number

  LDA #%00000000
  LDX #$02
  STA HERO_SPRITE_ADDR, X ; write sprite attributes

  ; sprite-1 data

  LDA #$02
  LDX #$05
  STA HERO_SPRITE_ADDR, X ; write sprite number

  LDA #%01000000
  LDX #$06
  STA HERO_SPRITE_ADDR, X ; write sprite attributes

  ; sprite-2 data

  LDA #$12
  LDX #$09
  STA HERO_SPRITE_ADDR, X ; write sprite number

  LDA #%00000000
  LDX #$0a
  STA HERO_SPRITE_ADDR, X ; write sprite attributes

  ; sprite-3 data

  LDA #$12
  LDX #$0d
  STA HERO_SPRITE_ADDR, X ; write sprite number

  LDA #%01000000
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

.export face_hero_north