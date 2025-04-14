#!/bin/bash

# Stop any existing servers first
./scripts/stop-servers.sh

# Build and serve
echo "Building site..."
make html || { echo "Build failed"; exit 1; }

# Start server
echo "Starting server..."
cd public && python3 -m http.server 8000 &
SERVER_PID=$!

# Wait a moment for the server to start
sleep 2

# Check if server is running
if ps -p $SERVER_PID > /dev/null; then
    echo "Server is running at http://localhost:8000"
    # Open in browser
    open http://localhost:8000
else
    echo "Server failed to start"
    exit 1
fi
