#!/usr/bin/env bash

BAT=$(find /sys/class/power_supply/ -maxdepth 1 -name "BAT*" 2>/dev/null | head -n1)

if [ -z "$BAT" ]; then
    echo '{ "alt": "no-battery", "class": "no-battery" }'
else
	echo '{ "alt": "battery", "class": "battery" }'
fi