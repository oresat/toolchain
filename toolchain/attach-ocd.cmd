target remote | openocd -s toolchain -f nucleo-32.cfg -c "gdb_port pipe"
monitor reset halt
monitor arm semihosting enable
