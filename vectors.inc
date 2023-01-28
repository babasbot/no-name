; vim: set syntax=asm_ca65:

.segment "VECTORS"

.word nmi_handler
.word reset_handler
.word irq_handler
