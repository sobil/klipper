# Additional avr build rules

# Use the esp toolchain
CROSS_PREFIX=xtensa-esp32-elf-

export PATH := $(PATH):$(shell pwd)/thirdparty/xtensa-esp-elf/bin

THIRDPARTY_INCLUDE_DIRS := $(shell find ~/esp/esp-idf/components -name "include" -type d)
CFLAGS += -I$(HOME)/esp/esp-idf/components/freertos/config/include/freertos
CFLAGS += $(foreach dir, $(THIRDPARTY_INCLUDE_DIRS), -I$(dir))
dirs-y += src/esp32 src/generic


## This all seems wrong... need to fix this
CFLAGS += -I/usr/include/bsd
CFLAGS += -I/usr/include
CFLAGS += -I/usr/include/aarch64-linux-gnu


# Add avr source files
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
