include(FetchContent)
message(STATUS "Downloading esp-hal-components...")
FetchContent_Declare(
    esp-hal-components
    GIT_REPOSITORY https://github.com/espressif/esp-hal-components.git
    GIT_TAG b4376e491dba17ee4c13e56210f880729fd99692
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)
FetchContent_MakeAvailable(esp-hal-components)
FetchContent_GetProperties(
    esp-hal-components
    SOURCE_DIR esp_hal_components_srcdir
)
message(STATUS "Downloaded esp-hal-components into ${esp_hal_components_srcdir}")

set(supported_mcu esp32c3 esp32h2)
if(DEFINED target AND target IN_LIST supported_mcu)
    message(STATUS "Configure project for ${target} ... ")
else()
    message(FATAL_ERROR "Invalid target. \nUse argument '-D target=chip_name', where chip_name=[${supported_mcu}]")
endif()

# FIXME: soc component depends on sdkconfig.h
string(TOUPPER ${target} target_uppercase)
set(config_dir ${CMAKE_CURRENT_BINARY_DIR}/config)
file(MAKE_DIRECTORY ${config_dir})
configure_file(${CMAKE_CURRENT_LIST_DIR}/sdkconfig.h.in ${config_dir}/sdkconfig.h)

add_library(hal STATIC)

# FIXME: CMakeLists.txt files in components/soc and components/hal are IDF-specific,
# and can't be used in a normal CMake project.
target_include_directories(hal PUBLIC
    ${esp_hal_components_srcdir}/components/soc/include
    ${esp_hal_components_srcdir}/components/soc/${target}/include
    ${esp_hal_components_srcdir}/components/hal/include
    ${esp_hal_components_srcdir}/components/hal/${target}/include
    ${esp_hal_components_srcdir}/components/hal/platform_port/include
# FIXME: soc component depends on esp_common for ESP_ASSERT
    ${esp_hal_components_srcdir}/components/esp_common/include
# FIXME: hal component depends on esp_rom due to efuse_ll.h
    ${esp_hal_components_srcdir}/components/esp_rom/include
    ${esp_hal_components_srcdir}/components/esp_rom/${target}
    ${config_dir}
    )

target_sources(hal PRIVATE
    ${esp_hal_components_srcdir}/components/soc/${target}/gpio_periph.c
    ${esp_hal_components_srcdir}/components/hal/gpio_hal.c
    ${esp_hal_components_srcdir}/components/hal/wdt_hal_iram.c
    )

# FIXME: hal component can't be compiled with -Wall -Wextra -Werror:
target_compile_options(hal PUBLIC -Wno-unused-parameter)

# Add the linker script for peripheral objects
target_link_options(hal PUBLIC -T ${esp_hal_components_srcdir}/components/soc/${target}/ld/${target}.peripherals.ld)

