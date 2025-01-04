override IMAGE_NAME := template
BUILD_DIR = build
ISO_DIR = $(BUILD_DIR)/iso_img

CFLAGS = -m64 -Os -ffunction-sections -fdata-sections
CFLAGS += -mno-80387 -mno-mmx -mno-sse -mno-sse2 -mno-red-zone
LDFLAGS = -nostdlib -static -gc-sections -s -T assets/linker.ld
VFLAGS = -manualfree -gc none -enable-globals -nofloat -d no_backtrace

XORRISOFLAGS = -as mkisofs --efi-boot limine-uefi-cd.bin
QEMUFLAGS = -M q35 -cpu qemu64,+x2apic -no-reboot
QEMUFLAGS += -drive if=pflash,format=raw,file=assets/ovmf-code.fd

.PHONY: default setup kernel image clean

default: image

# Create build directories
setup:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(ISO_DIR)
	@cp -r assets/limine/* $(ISO_DIR)/

# Compile V to C and link to kernel
kernel: setup
	@v $(VFLAGS) -o $(BUILD_DIR)/blob.c kernel
	@gcc $(CFLAGS) -c $(BUILD_DIR)/blob.c -o $(BUILD_DIR)/blob.o
	@ld $(LDFLAGS) $(BUILD_DIR)/blob.o -o $(BUILD_DIR)/kernel
	@cp $(BUILD_DIR)/kernel $(ISO_DIR)/kernel

# Create ISO image
image: kernel
	@xorriso $(XORRISOFLAGS) $(ISO_DIR) -o $(BUILD_DIR)/$(IMAGE_NAME).iso 2> /dev/null
	@echo "Image created: $(BUILD_DIR)/$(IMAGE_NAME).iso"

# Boot ISO image in QEMU
run: image
	@qemu-system-x86_64 $(QEMUFLAGS) $(BUILD_DIR)/$(IMAGE_NAME).iso

# Clean build artifacts
clean:
	@rm -rf $(BUILD_DIR)