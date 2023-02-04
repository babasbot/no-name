; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import hero_y_coord
.import controller_1_mask

.segment "CODE"

.import face_hero_north

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
  INC hero_y_coord

  LDA #$01                ; tile
  LDX #$01                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-0 tile

  LDA #%00000000          ; mask
  LDX #$02                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-0 attributes

  LDA #$01                ; tile
  LDX #$05                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-1 tile

  LDA #%01000000          ; mask
  LDX #$06                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-1 attributes

  LDA #$11                ; tile
  LDX #$09                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-2 tile

  LDA #%00000000          ; mask
  LDX #$0a                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-2 attributes

  LDA #$11                ; tile
  LDX #$0d                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-3 tile

  LDA #%01000000          ; mask
  LDX #$0e                ; offset
  STA HERO_SPRITE_ADDR, X ; write sprite-0 attributes

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
