#!/bin/sh
set -e
if [ -z "$SUPABASE_URL" ] || [ -z "$SUPABASE_KEY" ]; then
    echo "Error: Missing SUPABASE_URL or SUPABASE_KEY"
    exit 1
fi
echo "Starting Chatle AI Agent..."
exec python api.py
