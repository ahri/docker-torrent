#!/bin/bash
exec /sbin/setuser docker-user \
    /usr/bin/transmission-daemon \
    --foreground \
    >> /var/log/transmission 2>&1
