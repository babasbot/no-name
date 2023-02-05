; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "CODE"

.import update_hero_y
.import update_hero_x
.import read_controller
.import update_hero_sprites

.proc nmi_handler
  ; transfer bytes from $0200-$02ff into OAM
  LDA #$00
  STA OAM_ADDR
  LDA #$02
  STA OAM_DMA

  LDA #$00
  STA PPU_SCROLL
  STA PPU_SCROLL

  JSR read_controller
  JSR update_hero_sprites

  JSR update_hero_y
  JSR update_hero_x

  RTI
.endproc

.export nmi_handler
