; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import hero_y_coord, hero_x_coord

.segment "CODE"

.import main

.proc reset_handler
  SEI
  CLD

  LDX #$00
  STX PPU_CTRL
  STX PPU_MASK

  LDA #HERO_DEFAULT_X_COORD
  STA hero_x_coord

  LDA #HERO_DEFAULT_Y_COORD
  STA hero_y_coord

vblank_wait:
  BIT PPU_STAT
  BPL vblank_wait

  JMP main
.endproc

.export reset_handler
