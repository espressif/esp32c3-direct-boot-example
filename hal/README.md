This component provides a HAL for functions such as:
* GPIO
* WDT

So that we don't have to implement the HAL from scratch, the source from https://github.com/espressif/esp-hal-components/tree/sync-3-master is used. Since the upstream CMakeLists.txt files can't yet be used a normal CMake library, the [CMakeLists.txt](CMakeLists.txt) of this component manually adds the right set of include directories and source files to the build.

Note: this is done just for demonstration purposes, to be used in the examples. This component isn't intended to provide the HAL for all peripherals and all chips.
