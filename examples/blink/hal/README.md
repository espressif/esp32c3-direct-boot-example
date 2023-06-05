This component provides a HAL for GPIO functions. So that we don't have to implement it from scratch, the source from https://github.com/espressif/esp-hal-components/tree/sync-3-master is used. Since the upstream CMakeLists.txt files can't yet be used a normal CMake library, the [CMakeLists.txt](CMakeLists.txt) of this component manually adds the right set of include directories and source files to the build.

Note: this is done just for demonstration purposes. This component isn't intended to provide the HAL for all peripherals and all chips.
