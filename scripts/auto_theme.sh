#!/bin/bash

set_dark () {
    scheme=$(gsettings get org.gnome.desktop.interface color-scheme)
    if [ "$scheme" != "'prefer-dark'" ]; then
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    fi
}

set_default () {
    scheme=$(gsettings get org.gnome.desktop.interface color-scheme)
    if [ "$scheme" != "'default'" ]; then
        gsettings set org.gnome.desktop.interface color-scheme 'default'
    fi
}

hour_of_day=$(date +%H)
if [ $hour_of_day -ge 6 ] && [ $hour_of_day -le 18 ]; then
    set_default
else
    set_dark
fi