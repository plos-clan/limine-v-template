# Limine V Template

This repository will demonstrate how to set up a basic x86-64 kernel in V using Limine.

## Build

**The build system is simplified:**

- Can only build ISO image
- Not fetch assets (limine and OVMF) from the internet

**Available targets:**
- `make`: Build the ISO image
- `make run`: Run the ISO image in QEMU
- `make clean`: Remove the build directory

You need to install `v`, `xorriso`, `make` to build the project, and `qemu` to boot the ISO.
