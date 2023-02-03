; vim: set syntax=asm_ca65:

.segment "ZEROPAGE"

hero_y_coord:      .res 1
hero_x_coord:      .res 1
controller_1_mask: .res 1

.export hero_y_coord
.export hero_x_coord
.export controller_1_mask
