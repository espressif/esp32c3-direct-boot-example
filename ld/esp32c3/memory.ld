MEMORY
{
    irom (x): org = 0x42000000, len = 0x400000
    drom (r): org = 0x3C000000, len = 0x400000
    ram (rw): org = 0x3FC80000, len = 0x50000
    rtc_ram (rx): org = 0x50000000, len = 0x2000
}
