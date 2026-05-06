#!/usr/bin/with-contenv bashio

# Read Home Assistant options
CLAIM_TOKEN=$(bashio::config 'claim_token')
PLAYER_NAME=$(bashio::config 'player_name')

# Export for Plexamp process
if [ -n "$CLAIM_TOKEN" ]; then
    export PLEXAMP_CLAIM_TOKEN="$CLAIM_TOKEN"
fi

export PLEXAMP_PLAYER_NAME="$PLAYER_NAME"

bashio::log.info "Starting Plexamp add-on..."
bashio::log.info "Player name: ${PLAYER_NAME}"

# IMPORTANT:
# Do NOT override ENTRYPOINT.
# Just exec the container's default command.
exec node /js/index.js
