    .section .text.entry
    .type _entry, @function
    .global _entry
_entry:
    .option push
    .option norelax
    la a0, _data_start
    la a1, _data_lma
    la a2, _data_size
    call memcpy
    .option pop
    j _start


    .section .text
    .type   _start, @function
    .global _start
_start:

    /* Setup the global pointer, which the ABI assumes points to the
     * __global_pointer$ symbol. */
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    /* Clear the bss segment */
    la      a0, _edata
    la      a2, _end
    sub     a2, a2, a0
    li      a1, 0
    call    memset

    /* Set MTVEC */
    la      t0, _vector_table
    ori     t0, t0, 1
    csrrw   zero, mtvec, t0

    /* Enable FPU */
#ifdef __riscv_flen
    li      t0, 0x6000
    csrrs   t0, mstatus, t0
#endif

    /* Set up the stack pointer */
    la sp,  __stack_top

    la      a0, __libc_fini_array   # Register global termination functions
    call    atexit                  #  to be called upon exit
    call    __libc_init_array       # Run global initialization functions

    call    syscalls_init

    /* Call main */
    la      a0, _main_argc
    lw      a0, 0(a0)
    la      a1, _main_argv
    li      a2, 0
    call    main
    tail    exit

    .size  _start, .-_start


    /* These don't have to do anything since we use init_array/fini_array. */
    .global _init
    .type   _init, @function
    .global _fini
    .type   _fini, @function
_init:
_fini:
    ret

    .size  _init, .-_init
    .size  _fini, .-_fini

    /* Default arguments for 'main' */
    .section .data
    .global _main_argc
    .weak _main_argc
_main_argc:
    .word 1
_argv_0:
    .string "test"
    .global _main_argv
    .weak _main_argv
_main_argv:
    .word _argv_0

