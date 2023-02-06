; vim: set syntax=asm_ca65:

.macro write_oam value, offset
  LDA #value
  LDX #offset
  STA HERO_SPRITE_ADDR, X
.endmacro
