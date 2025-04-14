ENTRY(__hard_reset__)

MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1M
    SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 192K
}

SECTIONS
{
    .text : {
        *(.vectors)
        *(.text*)
        *(.rodata*)
    } > FLASH

    .data : {
        *(.data*)
    } > SRAM AT > FLASH

    .bss : {
        *(.bss*)
    } > SRAM

    __stack_start = ORIGIN(SRAM) + LENGTH(SRAM);
}
