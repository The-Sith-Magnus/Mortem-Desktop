#!/bin/bash
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{print $2}' | awk '{print $1}' | tr -d '%')

icon() {
    if [ "$volume" -eq 0 ]; then
        echo ""
    elif [ "$volume" -le 50 ]; then
        echo ""
    elif [ "$volume" -le 100 ]; then
        echo ""
    elif [ "$volume" -ge 100 ]; then 
         echo ""    
    fi
}

[ "$1" = icon ] && icon && exit
[ "$1" = percentage ] && echo "$volume" && exit