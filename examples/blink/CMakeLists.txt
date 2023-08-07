cmake_minimum_required(VERSION 3.12)

set(ROOT_DIR ${CMAKE_CURRENT_LIST_DIR}/../../)
set(CMAKE_TOOLCHAIN_FILE ${ROOT_DIR}/toolchain-rv32.cmake)

project(blink)

add_executable(blink blink.c)

add_subdirectory(${ROOT_DIR}/common common)
add_subdirectory(${ROOT_DIR}/hal hal)

target_link_libraries(blink PRIVATE common hal)

target_compile_options(blink PRIVATE -g -Og)
target_link_options(blink PRIVATE -g)
target_compile_options(blink PRIVATE -Wall -Werror -Wextra)

include(${ROOT_DIR}/utils.cmake)
add_linker_scripts(blink)
add_map_file(blink blink.map)
make_binary(blink blink.bin)
