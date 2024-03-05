#!/bin/bash

result=$(rg --ignore-case --color=always --line-number --no-heading "${@}" | \
    fzf --ansi \
        --color 'hl:-1:underline,hl+:-1:underline:reverse' \
        --delimiter ':' \
        --preview "bat --color=always {1} --theme='Solarized (light)' --highlight-line {2}" \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3')

if [ -n "$result" ]; then
    ${EDITOR} "$(echo "$result" | cut -d':' -f1)"
fi