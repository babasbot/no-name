; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "CODE"

.import main

.proc reset_handler
  SEI
  CLD

  LDX #$00
  STX PPU_CTRL
  STX PPU_MASK

vblank_wait:
  BIT PPU_STAT
  BPL vblank_wait

  JMP main
.endproc

.export reset_handler
