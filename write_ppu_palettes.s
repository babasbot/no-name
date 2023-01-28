; vim: set syntax=asm_ca65:

.include "constants.inc"
.include "ppu_palettes.inc"

.segment "CODE"

.proc write_ppu_palettes
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA;

  LDX PPU_STAT
  LDX #$3f
  STX PPU_ADDR
  LDX #$00
  STX PPU_ADDR

write_palettes:
  LDA ppu_palettes, X
  STA PPU_DATA
  INX
  CPX #$20
  BNE write_palettes

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export write_ppu_palettes
