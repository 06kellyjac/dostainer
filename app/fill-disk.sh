#!/usr/bin/env sh

bytes=$(df --output=avail / | tail -n 1)

kbytes="$(( ${bytes%% *} * 1024))"

fallocate -l "$kbytes" /full
