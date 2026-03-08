#!/bin/bash

date1=$(date | awk '{print $2}')
date2=$(date | awk '{print $3}')

echo $date1 $date2
