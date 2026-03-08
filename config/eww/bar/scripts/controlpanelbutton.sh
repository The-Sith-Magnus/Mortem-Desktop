#!/bin/bash

openclose() {
    state=$(eww get ctrlpanelopen)

    if [ "$state" = "false" ]; then
        eww update ctrlpanelopen=true
        eww open ctrlpanel
    else
        eww update ctrlpanelopen=false
        eww close ctrlpanel
    fi
}

symbol() {
    state=$(eww get ctrlpanelopen)

    if [ "$state" = "false" ]; then
        echo "<"
    else
        echo ">"
    fi
}

case "$1" in
  openclose) openclose ;;
  symbol)    symbol ;;
esac
