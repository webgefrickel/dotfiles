#!/usr/bin/env zsh
TMPFILE=$(mktemp)

tt --no-color status &> $TMPFILE
local current=$(cat $TMPFILE)

if [[ $current = 'You have been working on '* ]]; then
  local currTemp=${current:s/You have been working on //}
  local project=$(echo $currTemp | head -n1 | cut -d " " -f1)
  echo " $project"
fi
