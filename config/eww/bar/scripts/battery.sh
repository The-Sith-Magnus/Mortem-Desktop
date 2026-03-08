#!/bin/bash

bat=/sys/class/power_supply/BAT0
charge=$(cat "$bat/capacity")
stat=$(cat "$bat/status")

# Charging icon
symbol() { 
if [ "$stat" = "Charging" ]; then
    echo "󱟦"
    exit
fi

# Send warning once when low
if [ "$charge" -le 20 ] && [ "$charge" -gt 0 ]; then
    notify-send -u critical "Battery Low!!" "Connect Charger!!"
fi

# Icon table (index = charge / 10)
icons=(
    "󰂃"  # 0
    "󰂃"  # 1 (1–10)
    "󰁻"  # 2 (11–20)
    "󰁼"  # 3
    "󰁽"  # 4
    "󰁿"  # 5
    "󰂀"  # 6
    "󰂁"  # 7
    "󰂂"  # 8
    "󱈏"  # 9–10
)

idx=$(( charge / 10 ))
[ "$idx" -gt 9 ] && idx=9

echo "${icons[$idx]}"
}

percentage(){
    echo "$charge"
}

[ "$1" = "icon" ] && symbol && exit
[ "$1" = "charge" ] && percentage && exit