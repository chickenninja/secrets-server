#!/bin/bash

#Setup: ensure a test password is in the directory
echo "Starting test prep"
grep -q -F 'testpassword' ./secrets/test || echo 'testpassword' >> ./secrets/test

#Test 1: Start the server, wait for it to be up, retrieve a password
echo "Starting server"
node secrets-server.js &
echo "Waiting..."
sleep 2
echo "Requesting secret"
(curl localhost:9455/test | grep 'testpassword') || echo "Failed Test 1" && exit 1

