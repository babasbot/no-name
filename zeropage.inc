; vim: set syntax=asm_ca65:

.segment "ZEROPAGE"

hero_y_coord: .res 1
hero_x_coord: .res 1

.export hero_y_coord, hero_x_coord
