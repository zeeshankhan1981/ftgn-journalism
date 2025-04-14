#!/bin/bash

# Script to force rebuild the site clearing caches
# This ensures Hugo properly recognizes all front matter changes

echo "Stopping all Hugo servers..."
./scripts/stop-servers.sh

echo "Removing resources..."
rm -rf resources 

echo "Removing public directory..."
rm -rf public

echo "Clearing Hugo cache..."
rm -f .hugo_build.lock

echo "Building site..."
hugo --cleanDestinationDir

echo "Starting Hugo server..."
nohup hugo server -D > hugo.log 2>&1 &

echo "Waiting for server to start..."
sleep 3

echo "Server started at:"
grep "Web Server" hugo.log

echo "Site rebuild complete. Please refresh your browser."