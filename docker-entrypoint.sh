#!/bin/sh
set -e

echo "[entrypoint] Starting poll server on port ${PORT:-3032}..."
node /poll-server/server.js &
POLL_PID=$!

echo "[entrypoint] Starting Caddy..."
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
