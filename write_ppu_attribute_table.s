; vim: set syntax=asm_ca65:

.include "constants.inc"
.include "ppu_attribute_table.inc"

.segment "CODE"

.proc write_ppu_attribute_table
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA;

  LDA PPU_STAT

  LDA #$23
  STA PPU_ADDR
  LDA #$e0
  STA PPU_ADDR

  LDX #$00

write_attribute_table_namespace_0:
  LDA ppu_attribute_table,X
  STA PPU_DATA
  INX
  CPX #$20
  BNE write_attribute_table_namespace_0

  LDA PPU_STAT

  LDA #$27
  STA PPU_ADDR
  LDA #$e0
  STA PPU_ADDR

  LDX #$00

write_attribute_table_namespace_1:
  LDA ppu_attribute_table,X
  STA PPU_DATA
  INX
  CPX #$20
  BNE write_attribute_table_namespace_1

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export write_ppu_attribute_table
