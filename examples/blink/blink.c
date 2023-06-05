#include <stdio.h>
#include "hal/gpio_hal.h"

static void delay(void);

int main(void)
{
    // Connect an LED between 3V3 and GPIO2.
    // Note that the LED on ESP32-C3-DevKitM-1 is a addressable one,
    // so it can't be used with this example.
    const int gpio_num = 2;

    // Initialize the GPIO
    gpio_hal_context_t gpio_hal = {
        .dev = GPIO_HAL_GET_HW(GPIO_PORT_0)
    };
    gpio_hal_func_sel(&gpio_hal, gpio_num, PIN_FUNC_GPIO);
    gpio_hal_output_enable(&gpio_hal, gpio_num);

    // Blink the LED.
    // Note that this example doesn't disable the watchdogs,
    // so the blinking will get interrupted after some time
    // and will continue after reset.
    while (1) {
        gpio_hal_set_level(&gpio_hal, gpio_num, 0);
        delay();
        gpio_hal_set_level(&gpio_hal, gpio_num, 1);
        delay();
    }

    return 0;
}

static void delay(void)
{
    // around 160ms, resulting in ~3Hz blink rate
    for (int i = 0; i < 300000; i++) {
        asm volatile ("nop");
    }
}
