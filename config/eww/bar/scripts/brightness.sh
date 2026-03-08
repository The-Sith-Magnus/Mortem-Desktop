#!/bin/bash
br_val=$(brightnessctl | awk /'Current brightness'/ | awk '{for(i=1;i<=NR;i++) if ($i=="Current") print($(i+3))}' | tr -d '()%')
[ -z "$br_val" ] && br_val=0

symbol(){
case $br_val in
    [0-9]|1[0-9]|20) echo "" ;;
    2[1-9]|3[0-9]|40) echo "󰽥" ;;
    4[1-9]|5[0-9]|60) echo "󰽣" ;;
    6[1-9]|7[0-9]|80) echo "󰽦" ;;
    8[1-9]|9[0-9]|100) echo "" ;;
esac
}

slider() {
    case "$1" in
        get)
            echo "$br_val"
            ;;
        set)
            brightnessctl set "$2"% >/dev/null
            ;;
    esac
}

[ "$1" = "symbol" ] && symbol && exit
[ "$1" = "value" ] && echo $br_val && exit
[ "$1" = "slider" ] && shift && slider "$@" && exit
