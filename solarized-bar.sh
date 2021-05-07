#!/usr/bin/bash

# Define the clock
Clock() {
        DATETIME=$(date "+%a %b %d, %r")

        echo -n "$DATETIME"
}

Battery() {

        STATE=$(awk '/state:/ {print $2}' <(upower -i /org/freedesktop/UPower/devices/battery_BAT0))

        BATPERC=$(acpi --battery | cut -d, -f2)

        if [[ $STATE = discharging ]]
        then
                echo "$BATPERC"
        elif [[ $STATE = charging ]]
        then
                echo "$BATPERC Charging"
        elif [[ $BATPERC = 100% || $STATE = fully-charged ]]
        then
                echo " Battery Full"
        else 
                echo " Something's Fishy"
        fi
}

Workspace() {
        WORK=$(xprop -root _NET_CURRENT_DESKTOP | sed -e 's/_NET_CURRENT_DESKTOP(CARDINAL) = //')
        echo "$(($WORK + 1))"
}

# Volume() {
# 
#         MUTE=$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))
#         VALUE=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
# 
#         if [[ $MUTE = off ]]        
#         then
#                 MUTED=" Muted"
#                 echo "$VALUE$MUTED"
#         else
#                 VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
#                 echo "$VALUE"
#         fi
# }

# Volume for Arch Linux
Volume() {
	MUTE=$(pacmd list-sinks | awk '/muted/ { print $2 }')
	VALUE=$(awk -F"[][]" '/Mono:/ { print $2 }' <(amixer sget Master))

	if [[ $MUTE = yes ]]
	then
		MUTED=" Muted"
		echo "$VALUE$MUTED"
	else
		echo "$VALUE"
	fi
}

# Print the clock

while true; do
        echo "%{c}%{F#FDF6E3}%{B#002B36} $(Workspace) | $(Clock) | Volume: $(Volume) | Capacity:$(Battery) %{F-}%{B-}"
        sleep 1
done


