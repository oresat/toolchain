#!/bin/sh
openocd --version 2>&1 | grep -q "0.9.0"

BINARY=$1
OCDCFG=${2:-toolchain/nucleo-32.cfg}

if [ $? -eq 0 ] ; then
	pgrep openocd > /dev/null
	if [ $? -eq 1 ] ; then
		echo "Please start openocd in another terminal with the command:"
		echo "    openocd -f $OCDCFG"
		echo "and then re-run this script"
		exit
	fi
	exec arm-none-eabi-gdb -q $BINARY -x toolchain/attach-ocd-9.gdb
else
	exec arm-none-eabi-gdb -q $BINARY -ex "target remote | openocd -f $OCDCFG -c \"gdb_port pipe\"" -x toolchain/attach-ocd-10.gdb
fi
