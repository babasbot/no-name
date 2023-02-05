; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import controller_1_mask

.segment "CODE"

.import face_hero_north
.import face_hero_northwest
.import face_hero_west
.import face_hero_southwest
.import face_hero_south
.import face_hero_southeast
.import face_hero_east
.import face_hero_northeast

.proc update_hero_sprites
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA controller_1_mask
  AND #BTN_UP
  BEQ check_left

  LDA controller_1_mask
  AND #BTN_LEFT
  BEQ check_up_right

  JMP face_northwest

check_up_right:
  LDA controller_1_mask
  AND #BTN_RIGHT
  BEQ face_north

  JMP face_northeast

check_left:
  LDA controller_1_mask
  AND #BTN_LEFT
  BEQ check_down

  LDA controller_1_mask
  AND #BTN_DOWN
  BEQ face_west

  JMP face_southwest

check_down:
  LDA controller_1_mask
  AND #BTN_DOWN
  BEQ check_right

  LDA controller_1_mask
  AND #BTN_RIGHT
  BEQ face_south

  JMP face_southeast

check_right:
  LDA controller_1_mask
  AND #BTN_RIGHT
  BEQ done

  JMP face_east

face_north:
  JSR face_hero_north
  JMP done

face_northwest:
  JSR face_hero_northwest
  JMP done

face_west:
  JSR face_hero_west
  JMP done

face_southwest:
  JSR face_hero_southwest
  JMP done

face_south:
  JSR face_hero_south
  JMP done

face_southeast:
  JSR face_hero_southeast
  JMP done

face_east:
  JSR face_hero_east
  JMP done

face_northeast:
  JSR face_hero_northeast
  JMP done

done:
  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export update_hero_sprites
