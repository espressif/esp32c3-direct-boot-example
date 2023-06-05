set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER riscv-none-elf-gcc)
set(CMAKE_CXX_COMPILER riscv-none-elf-g++)
set(CMAKE_ASM_COMPILER riscv-none-elf-gcc)

set(riscv_arch_flag "-march=rv32imc_zicsr")

set(CMAKE_C_FLAGS ${riscv_arch_flag} CACHE STRING "C Compiler Base Flags")
set(CMAKE_CXX_FLAGS ${riscv_arch_flag} CACHE STRING "C++ Compiler Base Flags")
set(CMAKE_ASM_FLAGS ${riscv_arch_flag} CACHE STRING "Assembler Base Flags")
set(CMAKE_EXE_LINKER_FLAGS "${riscv_arch_flag} --specs=nano.specs --specs=nosys.specs" CACHE STRING "Linker Base Flags")
