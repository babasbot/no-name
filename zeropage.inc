; vim: set syntax=asm_ca65:

.segment "ZEROPAGE"

hero_y_coord:       .res 1
hero_x_coord:       .res 1
controller_1_input: .res 1
lolwut:             .res 1 ; By some reason, I cannot update this memory address. LOLWUT?
frame_counter:      .res 1, $00

.export hero_y_coord
.export hero_x_coord
.export controller_1_input
.export lolwut
.export frame_counter
