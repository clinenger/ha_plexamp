#!/usr/bin/with-contenv bashio

# Read config from Home Assistant
CLAIM_TOKEN=$(bashio::config 'claim_token')
PLAYER_NAME=$(bashio::config 'player_name')

# Export environment variables for Plexamp
if [ -n "$CLAIM_TOKEN" ]; then
    export PLEXAMP_CLAIM_TOKEN="$CLAIM_TOKEN"
fi

export PLEXAMP_PLAYER_NAME="$PLAYER_NAME"

bashio::log.info "Starting Plexamp add-on..."

# IMPORTANT:
# We directly exec the container's real entrypoint
# because ghcr.io/anatosun/plexamp is NOT a Home Assistant base image

exec /init || exec plexamp || exec node /app/index.js
