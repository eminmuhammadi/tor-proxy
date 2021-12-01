#!/bin/bash
TOR_PASSWORD="\"password\""
(echo "authenticate $TOR_PASSWORD"; echo signal newnym; echo quit) | nc 127.0.0.1 9051