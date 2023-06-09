#include <stdio.h>
#include "hal/wdt_hal.h"

static void delay(void);

int main(void)
{
    // Disable the watchdogs
    wdt_hal_context_t mwdt_ctx = {.inst = WDT_MWDT0, .mwdt_dev = &TIMERG0};
    wdt_hal_write_protect_disable(&mwdt_ctx);
    wdt_hal_disable(&mwdt_ctx);
    wdt_hal_set_flashboot_en(&mwdt_ctx, false);
    wdt_hal_context_t rwdt_ctx = RWDT_HAL_CONTEXT_DEFAULT();
    wdt_hal_write_protect_disable(&rwdt_ctx);
    wdt_hal_disable(&rwdt_ctx);
    wdt_hal_set_flashboot_en(&rwdt_ctx, false);
    // Super WDT is still enabled; no HAL API for it yet

    while(1) {
        printf("Hello, world!\n");
        delay();
    }
    return 0;
}

static void delay(void)
{
    for (int i = 0; i < 300000; i++) {
        asm volatile ("nop");
    }
}
