#!/usr/bin/env bash

# Define commands for each action
shutdown_cmd="systemctl poweroff > /dev/null 2>&1 &"
restart_cmd="systemctl reboot > /dev/null 2>&1 &"
lock_cmd="hyprlock > /dev/null 2>&1 &"
sleep_cmd="$lock_cmd systemctl suspend > /dev/null 2>&1"
hibernate_cmd="$lock_cmd systemctl hibernate > /dev/null 2>&1"
logout_cmd="uwsm stop > /dev/null 2>&1 &"

# Check the selected option
case "$@" in
    "Shutdown")
        eval "$shutdown_cmd"
        exit 0
        ;;
    "Restart")
        eval "$restart_cmd"
        exit 0
        ;;
    "Sleep")
        eval "$sleep_cmd"
        exit 0
        ;;
    "Hibernate")
        eval "$hibernate_cmd"
        exit 0
        ;;
    "Lock Screen")
        eval "$lock_cmd"
        exit 0
        ;;
    "Logout")
        eval "$logout_cmd"
        exit 0
        ;;
    *)
        # Display menu options
        echo "Shutdown"
        echo "Restart"
        echo "Sleep"
        echo "Hibernate"
        echo "Lock Screen"
        echo "Logout"
        ;;
esac