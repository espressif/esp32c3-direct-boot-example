set(LD_DIR "${CMAKE_CURRENT_LIST_DIR}/ld")

function(__add_linker_script_and_dep target ldscript)
    set(ldscript_path ${LD_DIR}/${ldscript})
    target_link_libraries(${target} PRIVATE -T ${ldscript_path})
    set_target_properties(${target} PROPERTIES LINK_DEPENDS ${ldscript_path})
endfunction()

function(add_linker_scripts target)
    __add_linker_script_and_dep(${target} esp32c3.ld)
    __add_linker_script_and_dep(${target} common.ld)
    __add_linker_script_and_dep(${target} romfuncs.ld)
endfunction()

function(add_map_file target filename)
    set(mapfile "${CMAKE_BINARY_DIR}/${filename}")
    target_link_libraries(${target} PRIVATE "-Wl,--Map=${mapfile}")
endfunction()

function(make_binary elf_target filename)
    add_custom_target(${elf_target}-size ALL DEPENDS ${elf_target})
    add_custom_command(TARGET ${elf_target}-size POST_BUILD COMMAND riscv-none-elf-size ${elf_target})

    add_custom_target(${filename}-binary ALL DEPENDS ${filename})
    add_custom_command(OUTPUT ${filename}
                       COMMAND ${CMAKE_OBJCOPY}
                       ARGS -v -O binary ${elf_target} ${CMAKE_BINARY_DIR}/${filename}
                       DEPENDS ${elf_target})
endfunction()
