target extended-remote | openocd -c "gdb_port pipe" -c "set ESP_RTOS none" -c "set ESP_FLASH_SIZE 0" -f "board/esp32c3-builtin.cfg" -c "init; reset halt"
mon gdb_breakpoint_override hard
mon reset halt
tb main
c
