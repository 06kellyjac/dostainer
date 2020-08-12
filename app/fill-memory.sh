#!/usr/bin/env sh

free_kbytes=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')
/app/allocate-memory "$free_kbytes" 5
