; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import hero_x_coord
.import controller_1_mask

.segment "CODE"

.import face_hero_west

.proc update_hero_x
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA controller_1_mask
  AND #BTN_LEFT
  BEQ check_right

  JSR face_hero_west
  DEC hero_x_coord

check_right:
  LDA controller_1_mask
  AND #BTN_RIGHT
  BEQ done_checking
  INC hero_x_coord

  LDA #$03                ; tile
  LDX #$01                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-0 tile

  LDA #%00000000          ; tile
  LDX #$02                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-0 attributes

  LDA #$04                ; tile
  LDX #$05                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-1 tile

  LDA #%00000000          ; tile
  LDX #$06                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-1 attributes

  LDA #$13                ; tile
  LDX #$09                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-2 tile

  LDA #%00000000          ; tile
  LDX #$0a                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-1 attributes

  LDA #$14                ; tile
  LDX #$0d                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-3 tile

  LDA #%00000000          ; tile
  LDX #$0e                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-1 attributes

done_checking:
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
