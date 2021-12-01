#!/bin/bash
TOR_PASSWORD="\"password\""

while :
do
 # Create a new circuit
 (echo "authenticate $TOR_PASSWORD"; echo signal newnym; echo quit) | nc 127.0.0.1 9051

 # Sleep for 13 seconds
 sleep 13
done