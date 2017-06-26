#!/bin/bash

# Start server
node /home/sean/me/secrets-server/secrets-server.js &

x=0
# Check when port is available
while ! (curl localhost:9455/ping -s || ((x > 50)) ); do
  sleep 0.1
  ((x++))
done
# return secret
curl -s localhost:9455/$1
pkill -f "node /home/sean/me/secrets-server/secrets-server.js"
