# Toolchain
This repo has all OreSat's firmware toolchain, like gcc, debugging tools, simulators, etc.

## Installation instructions
<details><summary>Debian/Ubuntu</summary><p>

The Debian/Ubuntu versions of the `arm-none-eabi-gcc (4.9.3)`  and `openocd (0.9.0)`  packages haven't been
updated in a while, but the current (old) versions should work. To get the bleeding
edge see the "Manually" section below.

```
sudo apt install gcc-arm-none-eabi gdb-arm-none-eabi openocd ninja-build
```

</p></details>
<details><summary>Arch</summary><p>

```
pacman -S arm-none-eabi-gcc arm-none-eabi-gdb openocd ninja
```

</p></details>
<details><summary>Manually</summary><p>

### arm-none-eabi-gcc
GCC 6.3.1 is the current latest, provided in the 2017q1 update.
Follow the download instructions [here](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)

### openocd
Openocd 0.10.0 is the current latest.
Follow the download instructions [here](https://github.com/gnuarmeclipse/openocd/releases)

### ninja
Ninja is typically up to date in package managers and shouldn't be needed to be installed manually.
That said, you can find the latest version [here](https://github.com/ninja-build/ninja/releases)

</p></details>

## Usage

This project is intended to be used as a submodule of other projects. `toolchain.ninja` should be included in the projects own `build.ninja` and with a minimum of configuration (see comments in `toolchain.ninja`) provides two targets to the project. Assuming the project intends to compile an executable called `binary`:
  * `ninja [binary]` to build
  * `ninja write` to flash `binary` to the microcontroller
  
`gdb.sh <binary>` will launch gdb with openocd as a debug server targeting the MCU. 

See `hello_world` in the examples directory for the intended use and give it a try! It's set up for a Nucleo-32 dev board, so once one is attached via USB: 

```
ninja
ninja write
```

From the main directory of this project issue:

```
./gdb.sh examples/hello_world/main
```

Once GDB comes up you should be able to issue the `continue` command (or just `c`) and it will begin printing out the following as fast as it can (which admittedly is pretty slow):

```
Hello world 0
Hello world 1
Hello world 2
...
```

## Porting

### To other Cortex-M0s:  
A new copy of the linker memory layout script and openocd board config will need to be made
  * `STM32F0*.ld`: Needs the memory size changed. Address should typically remain the same.
  * `*.cfg`: Needs debugger, MCU name, and memory size changed

### To other ARM cores: 
In addition to above, `startup.S` may need to be modified with a different interrupt vector table. Additionally the openocd config will need a different MCU target.
