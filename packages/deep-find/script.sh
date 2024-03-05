#!/bin/bash

set -euo pipefail

d=$(fd --type directory | fzf) 
[[ -n "$d" ]] && cd "$d"