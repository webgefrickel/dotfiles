#!/usr/bin/env zsh

trap 'exit 0' 2 # traps Ctrl-C (signal 2)
qlmanage -p $1 >& /dev/null
