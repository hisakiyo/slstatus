#!/bin/sh

mpc status | sed "/^volume:/d" | tac | sed -e "s/\\&/&amp;/g;s/\\[paused\\].*/⏸️/g;s/\\[playing\\].*/▶g" | tr -d '\n' | sed -e "s/$/\n/g"

