; vim: set syntax=asm_ca65:

.include "constants.inc"
.include "dungeon_room.inc"

.segment "CODE"

.proc draw_dungeon_room
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA;

  LDA PPU_STAT

  LDA #$20
  STA PPU_ADDR
  LDA #$40
  STA PPU_ADDR

  LDX #$00

draw_dungeon_top_walls:
  LDA dungeon_top_walls,X
  STA PPU_DATA
  INX

  CPX #$40
  BNE draw_dungeon_top_walls

  LDY #$00

loop:
  LDX #$00

draw_dungeon_side_walls:
  LDA dungeon_side_walls,X
  STA PPU_DATA
  INX

  CPX #$40
  BNE draw_dungeon_side_walls

  INY
  CPY #$0b
  BNE loop

  LDX #$00

draw_dungeon_bottom_walls:
  LDA dungeon_bottom_walls,X
  STA PPU_DATA
  INX

  CPX #$40
  BNE draw_dungeon_bottom_walls

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export draw_dungeon_room
