# Toolchain
This repo has all OreSat's firmware toolchain, like gcc, debugging tools, simulators, etc.

### Installation instructions
<details><summary>Debian/Ubuntu</summary><p>

The Debian/Ubuntu versions of the `arm-none-eabi-gcc (4.9.3)`  and `openocd (0.9.0)`  packages haven't been
updated in a while, but the current (old) versions should work. To get the bleeding
edge see the "Manually" section below.

```
sudo apt install arm-none-eabi-gcc arm-none-eabi-gdb openocd ninja-build
```

</p></details>
<details><summary>Arch</summary><p>

```
pacman -S arm-none-eabi-gcc arm-none-eabi-gdb openocd ninja
```

</p></details>
<details><summary>Manually</summary><p>

### arm-none-eabi-gcc
GCC 6.3.0 is the current latest, provided in the 2017q1 update.
Follow the download instructions [here](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)

### openocd
Openocd 0.10.0 is the current latest.
Follow the download instructions [here](https://github.com/gnuarmeclipse/openocd/releases)

### ninja
Ninja is typically up to date in package managers and shouldn't be needed to be installed manually.
That said, you can find the latest version [here](https://github.com/ninja-build/ninja/releases)

</p></details>
