# Additional avr build rules

# Use the esp toolchain
export PATH := $(PATH):$(shell pwd)/thirdparty/xtensa-esp-elf/bin
CROSS_PREFIX=xtensa-esp32-elf-

dirs-y += src/esp32 src/generic

CFLAGS += -I$(shell pwd)/src/esp32
CFLAGS += -I$(HOME)/esp/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos
# CFLAGS += -I$(HOME)/esp/esp-idf/components/freertos/FreeRTOS-Kernel/portable/linux/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/freertos/config/xtensa/include/
CFLAGS += -I$(HOME)/esp/esp-idf/components/xtensa/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/xtensa/esp32/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/freertos/config/include/freertos
CFLAGS += -I$(HOME)/esp/esp-idf/components/esp_system/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/esp_common/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/esp_hw_support/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/soc/esp32/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/soc/esp32/register
CFLAGS += -I$(HOME)/esp/esp-idf/components/newlib/platform_include
CFLAGS += -I$(HOME)/esp/esp-idf/components/heap/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/hal/include
CFLAGS += -I$(HOME)/esp/esp-idf/components/log/include


THIRDPARTY_INCLUDE_DIRS := $(shell find ~/esp/esp-idf/components/esp* -name "include" -type d)
CFLAGS += $(foreach dir, $(THIRDPARTY_INCLUDE_DIRS), -I$(dir))
CFLAGS += -I$(shell pwd)/thirdparty/xtensa-esp-elf/xtensa-esp-elf/include

# Add esp source files
src-y += esp32/main.c esp32/timer.c 
src-$(CONFIG_HAVE_GPIO_ADC) += esp32/adc.c
src-$(CONFIG_HAVE_GPIO) += esp32/gpio.c
src-$(CONFIG_HAVE_GPIO_SPI) += esp32/spi.c
src-$(CONFIG_HAVE_GPIO_I2C) += esp32/i2c.c
src-$(CONFIG_HAVE_GPIO_HARD_PWM) += esp32/hard_pwm.c
src-$(CONFIG_USBSERIAL) += esp32/usbserial.c generic/usb_cdc.c
src-$(CONFIG_SERIAL) += esp32/serial.c generic/serial_irq.c




# Suppress broken "misspelled signal handler" warnings on gcc 4.8.1
# CFLAGS_klipper.elf := $(CFLAGS_klipper.elf) $(if $(filter 4.8.1, $(shell $(CC) -dumpversion)), -w)


flash: 
	@echo "  Flashing $< to $(FLASH_DEVICE) via idf <--- Not implemented yet"
	# $(Q)if [ -z $(FLASH_DEVICE) ]; then echo "Please specify FLASH_DEVICE"; exit 1; fi
	# $(Q)avrdude -p$(CONFIG_MCU) -c$(CONFIG_AVRDUDE_PROTOCOL) -P"$(FLASH_DEVICE)" -D -U"flash:w:$(<):i"
