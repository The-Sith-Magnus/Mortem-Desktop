#!/bin/bash
tbactive=$(eww active-windows | grep "toolbar" | awk '{print $2}')
echo $tbactive
if [[ "$tbactive" == "toolbar" ]]; then 
    eww close toolbar
else 
    eww open toolbar
fi