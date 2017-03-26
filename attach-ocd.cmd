target remote | openocd -f nucleo-32.cfg -c "gdb_port pipe"
monitor reset halt
monitor arm semihosting enable
