#!/bin/sh

CONFIG_FILE="$HOME/.gnupg/gpg-agent.conf"
MAX_TTL="max-cache-ttl 604800"
DEFAULT_TTL="default-cache-ttl 604800"

if [ ! -d $HOME/.gnupg ]; then mkdir $HOME/.gnupg; fi
if [ ! -f $CONFIG_FILE ]; then touch $CONFIG_FILE; fi

if ! grep -q "^max-cache-ttl" "$CONFIG_FILE"; then
    echo "$MAX_TTL" >> "$CONFIG_FILE"
    echo "setup max-cache-ttl to 7 days"
fi

if ! grep -q "^default-cache-ttl" "$CONFIG_FILE"; then
    echo "$DEFAULT_TTL" >> "$CONFIG_FILE"
    echo "setup default-cache-ttl to 7 days"
fi
