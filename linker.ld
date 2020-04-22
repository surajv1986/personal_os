ENTRY(_START)
SECTIONS
{
  . = 0x100000;
  .text : { *(.text) }
  .bss : { *(.bss) }
}
