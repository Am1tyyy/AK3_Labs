# Компілятор і інструменти
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
GDB = gdb-multiarch
QEMU = qemu-system-arm

# Файли
SOURCES = start.S lab2.S
OBJECTS = start.o lab2.o
TARGET = firmware.elf
BINARY = firmware.bin

# Прапори
ASFLAGS = -mcpu=cortex-m4 -mthumb
GCCFLAGS = -mcpu=cortex-m4 -mthumb -x assembler-with-cpp -ggdb -O0
LDFLAGS = -T lscript.ld -nostdlib -g
QEMUFLAGS = -machine netduino2 -nographic -kernel $(BINARY) -s -S

all: $(TARGET) $(BINARY)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

$(BINARY): $(TARGET)
	$(OBJCOPY) -O binary $< $@

%.o: %.S
	$(CC) $(GCCFLAGS) -c $< -o $@

clean:
	rm -f *.o $(TARGET) $(BINARY)

qemu:
	$(QEMU) $(QEMUFLAGS) &

gdb:
	$(GDB) $(TARGET)

.PHONY: all clean qemu gdb
