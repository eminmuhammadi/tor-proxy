#!/bin/bash

BASE_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TORRC_FILE="$BASE_FOLDER/torrc"
CLEAN_TORRC_FILE="$TORRC_FILE.env"

TOR_SOCKS_PORT="9050"         # Tor SOCKS port
TOR_CONTROL_PORT="9051"       # Control Port
TOR_PASSWORD="password"       # Password for Control Port

export TOR_CONTROL_PORT=$TOR_CONTROL_PORT
export TOR_SOCKS_PORT=$TOR_SOCKS_PORT

mkdir -p $BASE_FOLDER/data
export TOR_PROJECT_DATA_FOLDER=$BASE_FOLDER/data

mkdir -p $BASE_FOLDER/logs
export TOR_PROJECT_LOGS_FOLDER=$BASE_FOLDER/logs

TOR_PROJECT_PASSWORD_HASH=`$(echo tor --hash-password "$TOR_PASSWORD")`
export TOR_PROJECT_PASSWORD_HASH=$TOR_PROJECT_PASSWORD_HASH

# Generate torrc file
envsubst < $TORRC_FILE > $CLEAN_TORRC_FILE

# Tor process
printf "Tor service starting...\n"
tor -f $CLEAN_TORRC_FILE