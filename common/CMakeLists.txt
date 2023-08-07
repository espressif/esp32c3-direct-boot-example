enable_language(C ASM)

list(APPEND srcs
    "start.S"
    "vectors.S"
    "syscalls.c"
    )

add_library(common STATIC ${srcs})
target_include_directories(common PUBLIC)
set_target_properties(common PROPERTIES C_STANDARD 11)
target_compile_options(common PRIVATE -g -Og)
target_link_libraries(common INTERFACE -nostartfiles)


