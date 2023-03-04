#!/usr/bin/env sh

iverilog -o $2 $1
vvp $2
