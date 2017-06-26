#!/bin/bash
echo "Starting test prep"
grep -q -F 'testpassword' ./secrets/test || echo 'testpassword' >> ./secrets/test

#Test 2: Run a single script to perform all steps to retrieve a password
echo "Test 2"
(./get-secret.sh test | grep 'testpassword') || echo "Failed Test 2" && exit 1
