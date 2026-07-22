#!/usr/bin/env bash

BAT=$(find /sys/class/power_supply/ -maxdepth 1 -name "BAT*" 2>/dev/null | head -n1)

if [ -z "$BAT" ]; then
    echo "\udb81\udea5"
fi