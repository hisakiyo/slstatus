#!/bin/sh

cat /tmp/newsupdate 2>/dev/null || echo "$(newsboat -x print-unread | awk '{ print "📰 " $1}' | sed 's/^📰 0$//g')$(cat ${XDG_CONFIG_HOME:-$HOME/.config}/newsboat/.update 2>/dev/null)"
