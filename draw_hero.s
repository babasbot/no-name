; vim: set syntax=asm_ca65:

.include "constants.inc"

DOWN_SPRITE_L_ATTR = %00000000
DOWN_SPRITE_R_ATTR = %01000000
;                     76543210
;                     --------
;                     ||||||||
;                     ||||||++-- Palette (4 to 7) of sprite
;                     |||+++---- Unimplemented (read 0)
;                     ||+------- Priority (0: in front of background; 1: behind background)
;                     |+-------- Flip sprite horizontally
;                     +--------- Flip sprite vertically

.segment "RODATA"

hero:
  .byte $70, $01, DOWN_SPRITE_L_ATTR, $80 ; sprite 0
  .byte $70, $01, DOWN_SPRITE_R_ATTR, $88 ; sprite 1
  .byte $78, $11, DOWN_SPRITE_L_ATTR, $80 ; sprite 2
  .byte $78, $11, DOWN_SPRITE_R_ATTR, $88 ; sprite 3
  ;     |    |    |                   |
  ;     |    |    |                   +-- x-coord
  ;     |    |    +---------------------- tile attributes
  ;     |    +--------------------------- tile index
  ;     +-------------------------------- y-coord

.segment "CODE"

.proc draw_hero
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDY #$00

; A -> PPU OAM hero data
; Y -> Hero sprite address offsetdra
loop:
  LDA hero,Y
  STA HERO_SPRITE_ADDR,Y
  INY
  CPY #$10
  BNE loop

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export draw_hero
