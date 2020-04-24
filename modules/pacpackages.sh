#!/bin/sh

pacman -Qu | grep -cv "\[ignored\]" | sed "s/^/📦/;s/^📦0$//g"
