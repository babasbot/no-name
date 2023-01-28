; vim: set syntax=asm_ca65:

.include "constants.inc"

.segment "CODE"

.proc irq_handler
  RTI
.endproc

.export irq_handler
