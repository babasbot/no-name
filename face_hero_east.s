; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "CODE"

.proc face_hero_east
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  ; sprite-0 data

  LDA #$03
  LDX #$01
  STA HERO_SPRITE_ADDR, X ; set tile number

  LDA #%00000000
  LDX #$02
  STA HERO_SPRITE_ADDR, X ; set sprite attributes

  ; sprite-1 data

  LDA #$04
  LDX #$05
  STA HERO_SPRITE_ADDR, X ; set sprite number

  LDA #%00000000
  LDX #$06
  STA HERO_SPRITE_ADDR, X ; set sprite attributes

  ; sprite-2 data

  LDA #$13
  LDX #$09
  STA HERO_SPRITE_ADDR, X ; set sprite number

  LDA #%00000000
  LDX #$0a
  STA HERO_SPRITE_ADDR, X ; set sprite attributes

  ; sprite-3 data

  LDA #$14
  LDX #$0d
  STA HERO_SPRITE_ADDR, X ; set sprite number

  LDA #%00000000
  LDX #$0e
  STA HERO_SPRITE_ADDR, X ; set sprite attributes

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export face_hero_east
