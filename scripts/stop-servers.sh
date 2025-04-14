#!/bin/bash

# Kill Python HTTP servers
pkill -f "python3 -m http.server"

# Kill Node.js servers
pkill -f "node"

# Kill any remaining HTTP servers on common ports
for port in 8000 8080 3000 5000; do
    lsof -ti :$port | xargs kill -9 2>/dev/null || true
done

echo "All servers have been stopped"
