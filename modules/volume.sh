#!/bin/sh

# Prints the current volume or 🔇 if muted. Uses PulseAudio by default,
# uncomment the ALSA lines if you remove PulseAudio.

volstat="$(amixer get Master)" # ALSA only equivalent.

echo "$volstat" | grep "\[off\]" >/dev/null && printf "🔇\\n" && exit # ALSA

vol=$(echo "$volstat" | grep -o "\[[0-9]\+%\]" | sed "s/[^0-9]*//g;1q") # ALSA

if [ "$vol" -gt "70" ]; then
	icon="🔊"
elif [ "$vol" -lt "30" ]; then
	icon="🔈"
else
	icon="🔉"
fi

printf "%s %s%%\\n" "$icon" "$vol"
