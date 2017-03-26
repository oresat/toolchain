#!/bin/sh
exec arm-none-eabi-gdb -q $1 -x attach-ocd.cmd
