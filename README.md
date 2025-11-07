# Limine V Template

This repository will demonstrate how to set up a basic x86-64 kernel in V using Limine.

## Notes

Fetch `limine` dependency:

```bash
v install https://github.com/wenxuanjun/v-limine
```

## Build

**The build system is simplified:**

- Can only build ISO image
- Assets (limine and OVMF) are not fetched from the internet

**Available targets:**
- `make`: Build the ISO image
- `make run`: Run the ISO image in QEMU
- `make clean`: Remove the build directory

You need to install `v`, `xorriso`, `make` to build the project, and `qemu` to boot the ISO.

## License

This project is licensed under the [0BSD License](LICENSE).

It includes binary components from the [Limine project](https://github.com/limine-bootloader/limine), which are licensed under the BSD 2-Clause License.
