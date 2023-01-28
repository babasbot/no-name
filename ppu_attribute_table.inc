; vim: set syntax=asm_ca65:

.segment "RODATA"

; 76 54 32 10
; || || || ||
; || || || ++-- top left palette
; || || ++----- top right palette
; || ++-------- bottom left palette
; ++----------- bottom right palette
;
; with:
;   - %00 → palette 0
;   - %01 → palette 1
;   - %10 → palette 2
;   - %11 → palette 3
;
; See: https://www.nesdev.org/wiki/PPU_attribute_tables
;

ppu_attribute_table:
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000

  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000

  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000

  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
  .byte %00000000
