#!/bin/bash

# Stop any running Hugo server
pkill -f "hugo server" 2>/dev/null || true

# Start Hugo development server in background, write log
nohup hugo server -D --logLevel info > hugo-dev.log 2>&1 &
echo "Hugo server started in background. Log: hugo-dev.log"