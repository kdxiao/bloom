#!/bin/sh
echo -ne '\033c\033]0;Bloom\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/index.x86_64" "$@"