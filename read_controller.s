; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "ZEROPAGE"

.import controller_1_input

.segment "CODE"

.proc read_controller
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA #$01
  STA CONTROLLER_1

  LDA #$00
  STA CONTROLLER_1

  LDA #%00000001
  STA controller_1_input

get_controller_state:
  LDA CONTROLLER_1
  LSR A
  ROL controller_1_input
  BCC get_controller_state

  PLA
  TAY
  PLA
  TAX
  PLA
  PLP

  RTS
.endproc

.export read_controller
