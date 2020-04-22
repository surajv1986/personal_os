#PLEASE ENSURE THAT THE DIRECTORY PATHS/NAMES AND NAMES OF FILES ARE PROPER
#DONT COPY BLINDLY FROM EBOOK PROVIDED
#OTHERWISE MAKEFILE COMMANDS ESPECIALLY XORISSO WONT EXECUTE PROPERLY
CC=gcc
TARGET=myos
C_FILES=./kernel.c
OBJS=$(C_FILES:.c=.o)

all compile: $(TARGET)
all:finale
.PHONY: all compile clean finale

%.o:
	$(CC) -c $(@:.o=.c) -o $@ -ffreestanding -fno-exceptions -m32

$(TARGET):$(OBJS)
	$(shell nasm -f elf start.asm -o start.o)
	$(CC) -m32 -nostdlib -nodefaultlibs -lgcc start.o $? -T linker.ld -o $(TARGET)

finale:
	$(shell cp $(TARGET) ./iso/boot/$(TARGET))
	$(shell grub2-mkrescue myos --output=$(TARGET).iso)

clean:
	rm -f *.o $(TARGET) $(TARGET).iso
	find .-name \*.o | xargs --no-run-if-empty rm  
