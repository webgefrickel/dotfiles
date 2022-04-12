#!/usr/bin/env zsh
#
current=$(bartib current)
lines=$(echo "$current" | wc -l)

if [ "$lines" -gt 1 ]; then
  line=$(bartib current | sed -n 3p)
  words=(`echo $line | sed 's/ /\n/g'`)
  echo " $words[-2]"
fi
