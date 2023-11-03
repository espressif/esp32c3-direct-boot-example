# Blink example

## Hardware

Attach an LED and a current limiting resistor between GPIO 2 and 3V3 pins of a development board.

## Building and running the example

1. Make sure you have a `riscv-none-elf-gcc` toolchain installed and added to PATH.
2. Build the example with CMake:
   ```bash
   cd examples/blink
   mkdir build
   cmake -B build -D target=esp32c3 -G Ninja .
   cmake --build build
   ```
   For other chip, please use the `target=chip_name`, where `chip_name` can be any from the supported ones.
   You should get the following output at the end:
   ```
   [3/4] Running utility command for blink-size
   text	   data	    bss	    dec	    hex	filename
   1844	    132	    177	   2153	    869	blink
   [4/4] Generating blink.bin
   copy from `blink' [elf32-littleriscv] to `blink.bin' [binary]
   ```
   The following files will be generated:
   - `blink` — ELF output file
   - `blink.bin` — binary file for flashing into the chip
   - `blink.map` — linker map file
3. Flash the example using [esptool](https://pypi.org/project/esptool/):
   ```bash
   esptool.py --port /dev/ttyUSB0 --baud 921600 write_flash 0x0000 build/blink.bin
   ```
   (Adjust the serial port name as needed.)
4. The LED attached to GPIO 2 should be blinking at around 3 Hz rate for ESP32-C3 (frequency can be vary depending on the maximum frequency of the selected chip).
