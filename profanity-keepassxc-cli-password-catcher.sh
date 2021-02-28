#!/usr/bin/env bash

db=$1
path=$2

pinentry-curses --ttyname "$(tty)" << EOF \
  | grep D \
  | cut -d' ' -f2 \
  | keepassxc-cli show "${db}" "${path}" --quiet -sa Password
SETPROMPT Master password:
GETPIN
EOF
