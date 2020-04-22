ENTRY(_START)
SECTIONS
{
  . = 0x10000;
  .text : { *(.text) }
  .bss : { *(.bss) }
}
