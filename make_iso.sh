#!/bin/bash

echo "Compiling loader..."
nasm -f elf32 loader.s

echo "Linking executable..."
ld -T link.ld -melf_i386 loader.o -o kernel.elf

echo "Downloading GRUB..."
wget http://littleosbook.github.com/files/stage2_eltorito

echo "Copying kernel and GRUB to ISO folder..."
cp stage2_eltorito iso/boot/grub/
cp kernel.elf iso/boot/

echo "Creating ISO..."
genisoimage -R                              	\
                -b boot/grub/stage2_eltorito    \
                -no-emul-boot                   \
                -boot-load-size 4               \
                -A os                           \
                -input-charset utf8             \
                -quiet                          \
                -boot-info-table                \
                -o os.iso                       \
                iso

echo "All done!"
