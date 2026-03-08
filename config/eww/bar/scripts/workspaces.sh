#!/bin/bash
tot_ws=$(hyprctl workspaces | grep "workspace ID" | awk '{print($3)}')
sel_ws=$(hyprctl activeworkspace | awk '{for(i=1;i<=NF;i++) if ($i == "ID") print($(i+1))}')

if echo "$tot_ws" | grep -q -- "-98"; then
    # special workspace present
    echo "$tot_ws" \
    | tr ' ' '\n' \
    | sort -n \
    | tr '\n' ' ' \
    | sed "s/\b$sel_ws\b//g" \
    | sed "s/-98//g" \
    | sed "s/[0-9]//g" \
    | tr ' ' '\n'
else
    # normal behaviour (your original)
    echo "$tot_ws" \
    | tr ' ' '\n' \
    | sort -n \
    | tr '\n' ' ' \
    | sed "s/\b$sel_ws\b//g" \
    | sed "s/[0-9]//g" \
    | tr ' ' '\n'
fi
