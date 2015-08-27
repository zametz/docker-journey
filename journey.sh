#!/bin/bash

[ -f "/data/config.json" ] || (cp /journey/config.json /data/config.json)
[ -d "/data/built-in" ] || (cp -r /journey/built-in /data/built-in)
[ -d "/data/content" ] || (cp -r /journey/content /data/content)

/journey/journey -custom-path="/data" -http-port=$JOURNEY_HTTP_PORT
