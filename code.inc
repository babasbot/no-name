; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "CODE"

.import irq_handler
.import nmi_handler
.import reset_handler
.import write_ppu_palettes
.import write_ppu_attribute_table
.import draw_dungeon_room

.proc main
  JSR write_ppu_palettes
  JSR write_ppu_attribute_table
  JSR draw_dungeon_room

vblank_wait:
  BIT PPU_STAT
  BPL vblank_wait

  ; 7  bit  0
  ; ---- ----
  ; VPHB SINN
  ; |||| ||||
  ; |||| ||++- Base nametable address
  ; |||| ||    (0 = $2000; 1 = $2400; 2 = $2800; 3 = $2C00)
  ; |||| |+--- VRAM address increment per CPU read/write of PPUDATA
  ; |||| |     (0: add 1, going across; 1: add 32, going down)
  ; |||| +---- Sprite pattern table address for 8x8 sprites
  ; ||||       (0: $0000; 1: $1000; ignored in 8x16 mode)
  ; |||+------ Background pattern table address (0: $0000; 1: $1000)
  ; ||+------- Sprite size (0: 8x8 pixels; 1: 8x16 pixels – see PPU OAM#Byte 1)
  ; |+-------- PPU master/slave select
  ; |          (0: read backdrop from EXT pins; 1: output color on EXT pins)
  ; +--------- Generate an NMI at the start of the
  ;            vertical blanking interval (0: off; 1: on)

  LDA #%10010000
  STA PPU_CTRL

  ; 7  bit  0
  ; ---- ----
  ; BGRs bMmG
  ; |||| ||||
  ; |||| |||+- Greyscale (0: normal color, 1: produce a greyscale display)
  ; |||| ||+-- 1: Show background in leftmost 8 pixels of screen, 0: Hide
  ; |||| |+--- 1: Show sprites in leftmost 8 pixels of screen, 0: Hide
  ; |||| +---- 1: Show background
  ; |||+------ 1: Show sprites
  ; ||+------- Emphasize red
  ; |+-------- Emphasize green
  ; +--------- Emphasize blue

  LDA #%00011110
  STA PPU_MASK

loop:
  JMP loop
.endproc

.export main
