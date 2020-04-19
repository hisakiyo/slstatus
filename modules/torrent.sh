#!/bin/sh

transmission-remote -l | grep % |
	sed " # This first sed command is to ensure a desirable order with sort
	s/.*Stopped.*/A/g;
	s/.*Seeding.*/Z/g;
	s/.*100%.*/N/g;
	s/.*Idle.*/B/g;
	s/.*Uploading.*/L/g;
	s/.*%.*/M/g" |
		sort -h | uniq -c | sed " # Now we replace the standin letters with icons.
				s/A/🛑/g;
				s/B/⌛️/g;
				s/L/🔼/g;
				s/M/🔽/g;
				s/N/✅/g;
				s/Z/🌱/g" | awk '{print $2, $1}' | sed -e "s/ $//g" | tr '\n' ' '

case $BLOCK_BUTTON in
    1) $TERMINAL -e transmission-remote-cli ;;
    3) notify-send "Torrent module" "🛑: paused
⏳: idle (seeds needed)
🔼: uploading (unfinished)
🔽: downloading
✅: done
🌱: done and seeding" ;;
esac
